import 'package:project_portfolio/classes/filterable_experience_model.dart';
import 'package:project_portfolio/models/technology.dart';

class Project implements FilterableExperienceModel {
  const Project({
    required this.name,
    required this.description,
    required this.repoLink,
    required this.techStack,
    this.demoLink,
    this.moreInformationRoute,
    this.pictureName,
  });

  @override
  final String name;
  @override
  final List<Technology> techStack;
  final String description;
  final Uri repoLink;
  final String? moreInformationRoute;
  final String? pictureName;
  final Uri? demoLink;

  static List<Project> get projects {
    return [
      Project(
        name: 'CPU Scheduling Visualizer',
        description:
            'The purpose for this project was to help people understand '
            'how an operating system virtualizes its workload in order to create the '
            'illusion of multiple CPU\'s in a computer. This project accomplishes this '
            'goal by creating a simple visualization of how the CPU selects different '
            'processes over time. Currently, this project supports two types of policies: '
            'FIFO, and Round Robin. A graph is used to demonstrate how the CPU behaves '
            'according to the policy selected, and a table is also given in order for '
            'the user to specify basic information for each process. The project is '
            'easily expandable in order to support other policies. Implementing MLFQ, however, '
            'will be difficult to implement because more complex policies that require '
            'more advanced visuals such as this policy are out of scope for this project.',
        repoLink: Uri.https('github.com', '/JoelLV/cpu-virtualization'),
        techStack: [
          Technology.html,
          Technology.css,
          Technology.typescript,
          Technology.reactJs
        ],
        demoLink: Uri.https('joellv.github.io', '/cpu-virtualization/'),
      ),
      Project(
        name: 'My Professional Portfolio',
        description:
            'As you know, this website is my software engineer portfolio. Unlike a normal '
            'portfolio where the person uses only HTML, CSS, and JavaScript, I wanted '
            'to use a frontend technology that allowed me to build beautiful web apps '
            'in the least amount of time. This is why I opted to use Flutter web as my '
            'framework of choice. Though I admit that this may be overkill and not as robust '
            'as the other thousands of JavaScript frameworks and libraries out there, '
            'I wanted to use Flutter because I wanted to learn Dart and Flutter, and also '
            'did not want to spend a lot of time making the portfolio pretty since I\'m '
            'a backend developer at heart and would rather spend my time building CLI tools '
            'and RESTful API\'s. This website (or web app?) contains a brief documentation of '
            'all my relevant projects and work experiences as well as important links '
            'such as my digital resume, LinkedIn page, and Github repository.',
        repoLink: Uri.https('github.com', '/JoelLV/project_portfolio'),
        techStack: [
          Technology.flutter,
          Technology.dart,
        ],
      ),
      Project(
        name: 'Nuclear Reactor Simulator',
        description:
            'This was the final project for my Advanced Web Programming class. It was '
            'a group project that required us to use ReactJS along with the MaterialUI '
            'library. This project allows the user to manage the different nuclear '
            'reactors that are exposed via a RESTful API provided by the instructor. '
            'The project tracks the temperature of each reactor as well as the average '
            'temperature of all reactors, allows pins to descent and ascend to control '
            'the reactions of each reactor, allows toggling of cooling, and lastly, it gives '
            'the user the ability to name each reactor. All of this functionality is accomplished '
            'via API requests to the server provided by the instructor.',
        repoLink: Uri.https('github.com', '/JoelLV/ReactorSimulator'),
        techStack: [
          Technology.html,
          Technology.css,
          Technology.javascript,
          Technology.reactJs,
        ],
      ),
      Project(
        name: 'Dos Multiplayer Card Game',
        description: 'To explore the '
            'theory behind TCP sockets in Networking, I created an implementation '
            'of the famous game Dos created by Mattel. The frontend application and the '
            'backend application was written in C# with .NET 6. The frontend application '
            'has a very basic UI: a listbox to display the players in the lobby along '
            'with the number of cards that each have and another one to display the cards '
            'that the player has, a container to display the card that is currently at the '
            'center, and numerous buttons to submit cards, call Dos, finish turn, etc. '
            'The frontend was developed using WPF, while the backend was developed using '
            'only the standard library (no ASP.NET) because I wanted to learn and use '
            'TCP sockets. Compared to other personal projects I\'ve created, this one '
            'is one of the biggest ones.',
        repoLink: Uri.https('github.com', 'JoelLV/multiplayer-dos-game'),
        techStack: [
          Technology.csharp,
          Technology.dotnet,
        ],
      ),
      Project(
        name: 'Apartment Management App',
        description:
            'This was my first C# application that I wrote. This project consists of '
            'a desktop application that is capable of managing apartments as well as '
            'the people that live in those apartments. The data is stored in a SQLite '
            'database in order to have access to the data even when offline. This project '
            'was also my first time that I worked with databases and ORMs. Though the UI '
            'is not as convenient as other apps out there, I was pretty happy that I was able '
            'to get it to work. The project follows the MVVM architecture and allows '
            'the user to see all the information stored in the tiny SQLite database '
            'through a datagrid. In this datagrid, the user can then add new data, modify '
            'existing data, and delete data by pressing the DELETE key.',
        repoLink: Uri.https('github.com', 'JoelLV/apartment-management-app-v1'),
        techStack: [
          Technology.csharp,
          Technology.dotnet,
          Technology.sqlite,
        ],
      ),
      Project(
        name: 'Backpacking Trip Planner API',
        description:
            'This project was an introduction to the world of RESTful APIs, my favorite '
            'subject. In this project I learned to use NestJS and Typescript. This API allows '
            'users to plan backpacking trips. Users can add trails to the database, lodging locations, '
            'types of transportation to get to the trail, and gear sets that the user is going '
            'to bring to the trail. Once the user has specified all the necessary information '
            'for their next trip by using the different endpoints of the api, the user '
            'can now submit its finished trip to the database. The API also implements '
            'basic authentication (api key authentication) and makes good use of the '
            'mikro-orm library.',
        repoLink:
            Uri.https('github.com', '/JoelLV/Backpacking-trip-planner-api/'),
        techStack: [
          Technology.typescript,
          Technology.nestJs,
          Technology.mySql,
        ],
      ),
      Project(
        name: 'Go Interpreter for Lox',
        description:
            'Using the guidelines provided by the book Crafting Interpreters, written by '
            'Robert Nystrom, I created an interpreter written in Go to interpret a '
            'made up language called Lox. The language is turing complete, dynamically '
            'typed, has a small standard library, and also has some extensions that the '
            'book does not go over, such as support for the integer type. Examples of the '
            'syntax can be found in the Tests folder of the project. This project was also '
            'my first project written in Go, and I really liked its simple, yet straightforward '
            'syntax. To see the book\'s website, go to: https://craftinginterpreters.com/. '
            'To interpret a lox script, the interpreter follows these steps. It '
            'first uses a scanner (or lexer) to turn the source code into an array '
            'tokens. These tokens can be either keywords, literals, or other characters '
            'reserved by the language, like parenthesis, double quotes, curly braces, etc. '
            'If this step is successful and no errors are found, the interpreter moves on '
            'to parsing the array of tokens that are provided by the scanner. The parser '
            'turns the array of tokens into an abstract syntax tree (AST) in order to handle '
            'operation precedence and also check correct syntax. If the parser does not '
            'find any syntax errors, the interpreter will use the AST provided by the '
            'parser to run the code.',
        repoLink: Uri.https('github.com', '/JoelLV/lox-go-interpreter'),
        techStack: [Technology.golang],
      ),
      Project(
        name: 'Python Interpreter for Lox',
        description: 'Very similar to the '
            'Go Interpreter, but instead of being written in Go, it was written in Python. '
            'This was the first version of the interpreter before moving on to another '
            'language that is faster. For more information regarding how the interpreter works, '
            'please see the description of the project "Go Interpreter for Lox". This '
            'interpreter was built using the guidelines provided by this book: '
            'https://craftinginterpreters.com/.',
        repoLink: Uri.https('github.com', '/JoelLV/Lox-Interpreter-Python'),
        techStack: [Technology.python],
      ),
      Project(
        name: 'Simple Tracker',
        description: 'This project was my introduction '
            'to python and desktop GUIs. As the name suggests, the functions of this project is '
            'to track whatever data the user gives to the program, as long as this data can '
            'be mapped in a 2D plane. The user can create several trackers and describe its '
            'X and Y attributes. After configuring the tracker, the user can then add '
            'data to the tracker, modify it, delete it, as well as see the data in '
            'tabular form and graphical form. This project was done before I knew anything '
            'about databases, so in order to store this data persistently, all the data of '
            'each tracker was stored in a folder as text files, which were later parsed before the '
            'GUI was shown and changed when the user exited the GUI. This project uses '
            'the Pyside2 library to render GUI components.',
        repoLink: Uri.https('github.com', '/JoelLV/simple-tracker'),
        techStack: [Technology.python],
      )
    ];
  }
}
