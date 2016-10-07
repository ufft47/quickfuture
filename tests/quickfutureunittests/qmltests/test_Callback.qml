import QtQuick 2.0
import Testable 1.0
import Future 1.0

TestableCase {

    name: "CallbackTests";

    function test_onFinished() {
        var called = false;
        var result;

        Future.onFinished(Actor.read("a-file-not-existed"), function(value) {
            called = true;
            result = value;
        });
        wait(1000);
        compare(called, true);
        compare(result, "");
    }

    function test_onFinished_void() {
        var called = false;
        var result;

        Future.onFinished(Actor.dummy(), function(value) {
            called = true;
            result = value;
        });
        wait(1000);
        compare(called, true);
        compare(result, undefined);
    }

    function test_alreadyFinished() {
        var called = false;

        Future.onFinished(Actor.dummy(), function(value) {
            called = true;
        });
        compare(called, false);
        wait(10);
        compare(called, true);
    }


}
