package de.fhg.iais.roberta.syntax.codegen.nxt;

import java.util.Arrays;
import java.util.Map;

import org.junit.Test;

import de.fhg.iais.roberta.components.Configuration;
import de.fhg.iais.roberta.components.ConfigurationComponent;
import de.fhg.iais.roberta.syntax.BlocklyConstants;
import de.fhg.iais.roberta.util.test.nxt.HelperNxtForXmlTest;

public class NxtActorTest {
    private final HelperNxtForXmlTest nxtHelper = new HelperNxtForXmlTest();

    private static Configuration makeOtherConsumerConfiguration() {
        Map<String, String> otherPowerConsumerproperties =
            HelperNxtForXmlTest.createMap("MOTOR_REGULATION", "FALSE", "MOTOR_REVERSE", "OFF", "MOTOR_DRIVE", "NONE");
        ConfigurationComponent otherPowerConsumer = new ConfigurationComponent("LARGE", true, "A", BlocklyConstants.NO_SLOT, "A", otherPowerConsumerproperties);

        final Configuration.Builder builder = new Configuration.Builder();
        builder.setTrackWidth(12f).setWheelDiameter(5.6f).addComponents(Arrays.asList(otherPowerConsumer));
        return builder.build();
    }

    @Test
    public void nxtOtherPowerConsumerTest() throws Exception {
        this.nxtHelper
            .compareExistingAndGeneratedNxcSource(
                "ast/actions/nxt_other_consumer_test.nxc",
                "/ast/actions/nxt_other_consumer_test.xml",
                makeOtherConsumerConfiguration());
    }
}
