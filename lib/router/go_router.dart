//
//
// import 'package:flutter_common_demo/time_line_1_demo.dart';
// import 'package:go_router/go_router.dart';
//
// import '../glsl/glsl_main_page.dart';
// import '../glsl/octagrams_shader_page.dart';
//
// //顶级路由必须已 / 开头
// var glslPage = "/glsl";
// //二级路由不需要 / 开头
// var octagramPage = "octagram";
//
// var goRouter = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) {
//           return const MyHomePage();
//         },
//       ),
//       GoRoute(
//           path: glslPage,
//           builder: (context, state) {
//             return const GLSLMainPage();
//           },
//           routes: [
//             GoRoute(
//               path: octagramPage,
//               builder: (context, state) {
//                 return const OctagramsShaderPage();
//               },
//             ),
//           ]
//       ),
//     ]
// );
