package org.chiquileague.fixture;

public class FixtureFactory {
    public FixtureGenerator getGenerator(String type) {
        return switch (type) {
            case "DOUBLE_ROUND_ROBIN" -> new DoubleRoundRobinGenerator();
            case "DOUBLE_ROUND_ROBIN_PLAYOFFS" -> new DoubleRoundRobinPlayoffsGenerator();
            case "GROUP_KNOCKOUT" -> new GroupKnockoutGenerator();
            case "KNOCKOUT" -> new KnockoutGenerator();
            default -> throw new IllegalArgumentException("Competition format unsupported");
        };
    }
}
