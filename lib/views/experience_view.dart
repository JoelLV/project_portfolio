import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_portfolio/classes/filterable_experience_model.dart';
import 'package:project_portfolio/models/project.dart';
import 'package:project_portfolio/models/technology.dart';
import 'package:project_portfolio/models/work.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'experience_view.g.dart';

final searchBarInputProvider = StateProvider((ref) => '');

const screenTypeThreshold = 800;

@riverpod
class TechCheckbox extends _$TechCheckbox {
  @override
  Map<String, bool> build() {
    return Technology.allTechnologies.fold({}, (previousValue, element) {
      previousValue.putIfAbsent(element.name, () => false);
      return previousValue;
    });
  }

  void toggleCheckbox(String keyChanged) {
    state = state.map(
      (key, value) => MapEntry(key, keyChanged == key ? !value : value),
    );
  }

  void clearSelections() {
    state = state.map((key, value) => MapEntry(key, false));
  }
}

class ExperiencePage extends ConsumerWidget {
  const ExperiencePage({super.key});

  bool checkboxesAreNotEmpty(Map<String, bool> checkboxMap) {
    return checkboxMap.containsValue(true);
  }

  List<T> getFilteredExperienceModels<T extends FilterableExperienceModel>(
    List<T> models,
    String searchBarInput,
    Map<String, bool> checkboxMap,
  ) {
    return models.where((experience) {
      if (checkboxesAreNotEmpty(checkboxMap)) {
        var keep = false;
        for (var tech in experience.techStack) {
          if (checkboxMap[tech.name] ?? false) {
            keep = true;
            break;
          }
        }
        if (!keep) {
          return keep;
        }
      }
      if (searchBarInput.isNotEmpty) {
        return experience.name
            .toLowerCase()
            .contains(searchBarInput.toLowerCase());
      } else {
        return true;
      }
    }).toList();
  }

  Widget getEmptyListPlaceholder() {
    return const SizedBox(
      height: 60,
      child: Center(
        child: Text('Nothing to see here...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchTextInput = ref.watch(searchBarInputProvider);
    var techCheckBoxMap = ref.watch(techCheckboxProvider);

    var filteredWorkList = getFilteredExperienceModels(
      Work.workExperiences,
      searchTextInput,
      techCheckBoxMap,
    );
    var filteredProjectList = getFilteredExperienceModels(
      Project.projects,
      searchTextInput,
      techCheckBoxMap,
    );
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.06,
              right: screenWidth * 0.06,
            ),
            child: const _ExperienceFilter(),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                left: screenWidth * 0.06,
                right: screenWidth * 0.06,
                bottom: 80,
              ),
              children: [
                const _Subheader(content: 'Most relevant work experience:'),
                ...filteredWorkList.isEmpty
                    ? [getEmptyListPlaceholder()]
                    : filteredWorkList.map((work) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: _WorkExperienceBox(workModel: work),
                        );
                      }).toList(),
                const SizedBox(
                  height: 30,
                ),
                const _Subheader(content: 'Project Portfolio:'),
                ...filteredProjectList.isEmpty
                    ? [getEmptyListPlaceholder()]
                    : getFilteredExperienceModels(
                        Project.projects,
                        searchTextInput,
                        techCheckBoxMap,
                      )
                        .mapIndexed(
                          (index, project) => Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: _ProjectPreview(
                              project: project,
                              reversed: (index + 1) % 2 == 0,
                            ),
                          ),
                        )
                        .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Subheader extends StatelessWidget {
  const _Subheader({required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    var desktopView = MediaQuery.of(context).size.width >= screenTypeThreshold;

    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: SelectableText(
        content,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: desktopView ? 28 : 22,
        ),
      ),
    );
  }
}

class _WorkExperienceBox extends StatelessWidget {
  const _WorkExperienceBox({
    required this.workModel,
  });

  final Work workModel;

  Widget getWorkExperienceContentWidget(bool desktopView) {
    var child = Builder(
      builder: (context) {
        var primaryColor = Theme.of(context).primaryColor;
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 400),
          child: Flex(
            direction: desktopView ? Axis.horizontal : Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: desktopView
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    workModel.name,
                    style: TextStyle(
                      fontSize: desktopView ? 25 : 18,
                      color: primaryColor,
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SelectableText(
                    workModel.timePeriod,
                    style: TextStyle(
                      fontSize: desktopView ? 15 : 12,
                      color: primaryColor,
                      height: 1,
                    ),
                  ),
                  if (workModel.url != null)
                    IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse(workModel.url!));
                      },
                      icon: const Icon(
                        Icons.info_outline,
                      ),
                      tooltip: 'Go to company\'s website.',
                    ),
                ],
              ),
              if (desktopView)
                VerticalDivider(
                  color: primaryColor,
                  thickness: 0.4,
                  width: 30,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: _TechStackScrollableWidget(
                        technologyList: workModel.techStack,
                      ),
                    ),
                    Expanded(
                      child: SelectableText(
                        workModel.description,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: desktopView ? 14 : 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    if (desktopView) {
      return IntrinsicHeight(
        child: child,
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    var desktopView = MediaQuery.of(context).size.width >= screenTypeThreshold;

    return PhysicalModel(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(
          left: desktopView ? 45 : 25,
          right: desktopView ? 45 : 25,
          top: 25,
          bottom: 25,
        ),
        child: IntrinsicHeight(
          child: getWorkExperienceContentWidget(desktopView),
        ),
      ),
    );
  }
}

class _TechStackScrollableWidget extends StatelessWidget {
  _TechStackScrollableWidget({
    required this.technologyList,
  });

  final ScrollController _techStackScrollableController = ScrollController();
  final List<Technology> technologyList;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _techStackScrollableController,
      thickness: 4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _techStackScrollableController,
        child: Row(
          children: technologyList
              .map(
                (tech) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Center(
                    child: _TechBadge(
                      color: tech.bannerColor,
                      content: tech.name,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  const _TechBadge({required this.content, required this.color});

  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Badge(
      largeSize: 37,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      backgroundColor: color,
      textStyle: const TextStyle(fontSize: 12),
      label: Text(content),
    );
  }
}

class _ProjectPreview extends StatelessWidget {
  const _ProjectPreview({
    required this.project,
    this.reversed = false,
  });

  final Project project;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    var desktopView = MediaQuery.of(context).size.width >= screenTypeThreshold;

    return Container(
      height: desktopView ? 250 : 500,
      margin: const EdgeInsets.only(bottom: 60),
      child: Flex(
        direction: desktopView ? Axis.horizontal : Axis.vertical,
        textDirection: reversed ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Padding(
            padding: desktopView
                ? (reversed
                    ? const EdgeInsets.only(left: 50)
                    : const EdgeInsets.only(right: 50))
                : const EdgeInsets.only(left: 0, right: 0),
            child: PhysicalModel(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              elevation: 5,
              child: Container(
                width: 250,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      project.pictureName ??
                          'assets/images/profile_picture.jpg',
                      height: 140,
                    ),
                    SelectableText(
                      project.name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (project.moreInformationRoute != null)
                          IconButton(
                            onPressed: () {
                              context.go(project.moreInformationRoute!);
                            },
                            icon: const Icon(Icons.info_outline),
                          ),
                        if (project.demoLink != null)
                          IconButton(
                            tooltip: 'See project in action.',
                            onPressed: () => launchUrl(project.demoLink!),
                            icon: const Icon(Icons.link),
                          ),
                        IconButton(
                          tooltip: 'Visit github repository.',
                          onPressed: () => launchUrl(project.repoLink),
                          icon: const ImageIcon(
                            AssetImage('assets/images/github-mark.png'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!desktopView)
            const SizedBox(
              height: 15,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: desktopView
                  ? (reversed
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start)
                  : CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(child: SelectableText(project.description)),
                ),
                Align(
                  alignment: desktopView
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    height: 30,
                    child: _TechStackScrollableWidget(
                      technologyList: project.techStack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceFilter extends ConsumerWidget {
  const _ExperienceFilter();

  Widget getTechFilterDialog() {
    return Consumer(
      builder: (context, ref, _) {
        var techCheckboxMap = ref.watch(techCheckboxProvider);
        return SimpleDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text('Filter by technology used.'),
          children: [
            SizedBox(
              width: 500,
              height: 400,
              child: SingleChildScrollView(
                child: Wrap(
                  children: Technology.allTechnologies
                      .map(
                        (tech) => SizedBox(
                          width: 200,
                          height: 50,
                          child: ListTile(
                            leading: Checkbox(
                              value: techCheckboxMap[tech.name],
                              onChanged: (value) {
                                ref
                                    .read(techCheckboxProvider.notifier)
                                    .toggleCheckbox(tech.name);
                              },
                            ),
                            title: Text(tech.name),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(techCheckboxProvider.notifier).clearSelections();
                  },
                  child: const Text('Clear Selection'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenWidth = MediaQuery.of(context).size.width;
    var desktopView = screenWidth >= screenTypeThreshold;

    return SizedBox(
      height: 80,
      child: Row(
        children: [
          SizedBox(
            width: desktopView ? 400 : screenWidth * 0.5,
            height: 50,
            child: TextField(
              onChanged: (value) =>
                  ref.read(searchBarInputProvider.notifier).state = value,
              style: const TextStyle(fontSize: 15),
              cursorHeight: 17,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: 'Search',
              ),
            ),
          ),
          desktopView
              ? const SizedBox(
                  width: 50,
                )
              : const Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.15,
                  ),
                ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => getTechFilterDialog(),
              );
            },
            icon: const Icon(Icons.code),
            tooltip: 'Filter by technology used',
          ),
        ],
      ),
    );
  }
}
