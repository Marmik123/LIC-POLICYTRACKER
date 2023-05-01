POLICY TRACKER
  
  <img src="https://github.com/Marmik123/LIC-POLICYTRACKER/blob/marmik/assets/policy_tracker.png" width="128"/>
  

I developed this app using FLUTTER for my uncle who is working as an LIC Policy Advisor for 15 years. Since, he is working in LIC for such a long time he have a large number of policies and client data associated with him. He was maitaining the clients and their policies details inside the VM PRO software in his PC.

So, to make that data portable and handy made this app for him.
NOTE: THERE IS NO LINK WITH APIs or with LIC database.

Using only local database by converting his entire VM PRO data consisting of approximately 4500 policiy details into a .db file (1.23 MB).

⁍ This mobile app is developed in Flutter.
⁍ It fetches the data from db file stored in internal storage of the mobile using DQL commands.
⁍ Sqflite package was integrated for executing the SQL queries.
⁍ Mobile app contains Policy Details, SB Policy Details, and client details with whom that policies are associated. 
⁍ Obviously, a search button for searching the policy on policy number, policy holder name or policy group name.
⁍ UI design is basic and simple with no complexity, and completely designed according to the target user usability.

Flutter packages used :
1) sqflite - https://pub.dev/packages/sqflite
2) flutter_launch_icons - https://pub.dev/packages/flutter_launcher_icons
3) flutter_native_splash- https://pub.dev/packages?q=flutter+native+splash
