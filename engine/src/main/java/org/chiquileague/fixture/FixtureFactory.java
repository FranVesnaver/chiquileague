package org.chiquileague.fixture;

public class FixtureFactory {
    public static FixtureGenerator getGenerator(String type) {
        switch (type) {
            case "DOUBLE_ROUND_ROBIN": return new DoubleRoundRobinGenerator();
            case "DOUBLE_ROUND_ROBIN_PLAYOFFS": return new DoubleRoundRobinPlayoffsGenerator();
            case "GROUP_KNOCKOUT": return new GroupKnockoutGenerator();
            case "KNOCKOUT": return new KnockoutGenerator();
            default: throw new IllegalArgumentException("Competition format unsupported");
        }
    }
}
