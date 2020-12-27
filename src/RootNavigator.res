open ReactNavigation
open RNIcons

module RootNavigator = {
    include BottomTabs.Make({
        type params = unit;
    })

    let screenOptions = ({route}: optionsProps) => {

        @react.component
        let selecter = ({color, size}: tabBarIconArgs): React.element => {
            let name = switch route.name {
                | "main" => #_iosHome
                | "second" => #_iosList
                | "third" => #_iosHeart
                | _ => #_iosInformationCircle
            }
            <Ionicons name color size />
        }

        options(
            ~tabBarIcon=selecter,
            (),
        )
    }

    let tabBarOptions = bottomTabBarOptions(
        ~activeTintColor="tomato",
        ~inactiveTintColor="gray",
        (),
    )

    @react.component
    let make = () => <>
        <Native.NavigationContainer>
            <Navigator
                screenOptions
                tabBarOptions
            >
                <Screen name="main" component=Home.make />
                <Screen name="second" component=Second.make />
                <Screen name="third" component=Third.make />
            </Navigator>
        </Native.NavigationContainer>
    </>
}
