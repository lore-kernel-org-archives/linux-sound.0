From: Patricio Moreno <pm.pato@gmail.com>
Date: Mon, 18 Jul 2022 11:51:54 +0000
Subject: Usage of ads117x driver
Message-Id: <7d341a03-976a-32c6-8ba1-87b169408bfa@gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello everyone.

I'm trying to use the ads117x driver (sound/soc/codecs/ads117x.c) but I 
can't get any output on the I2S of the board I'm using  (a verdin imx8mm 
module mounted on a Toradex Verdin Development Board).

The ads117x is an ADC driver with a FRAME/SYNC interface, it's not a 
sound card. Now I'm doubting if I've understood correctly the I2S 
interface. I'm testing without connecting the ADC to the board, as I 
understand the I2S master should generate the BCLK and SYNC signals even 
if the adc is not connected (and these are what I'm trying to see with a 
logic analyzer).

I'm setting the following on the dts:

         adc: adc {
                 compatible = "simple-audio-card";
                 simple-audio-card,name = "ti-ads117x";
                 bitclock-master = <&ads117x_codec>;
                 frame-master = <&ads117x_codec>;
                 simple-audio-card,routing                          "Input1", "Capture",
                         "Input2", "Capture",
                         "Input3", "Capture",
                         "Input4", "Capture",
                         "Input5", "Capture",
                         "Input6", "Capture",
                         "Input7", "Capture",
                         "Input8", "Capture";

                 simple-audio-card,dai-link {
                         format = "left_j";
                         bitclock-master = <&ads117x_codec>;
                         frame-master = <&ads117x_codec>;

                         cpu {
                                 sound-dai = <&sai5>;
                                 dai-tdm-slot-num = <8>;
                                 dai-tdm-slot-width = <24>;
                         };

                         ads117x_codec: codec {
                                 sound-dai = <&ads117x 0>;
                                 clocks = <&clk IMX8MM_CLK_SAI5_ROOT>;
                         };
                 };
         };

         ads117x: codec-ads117x@0 {
                 compatible = "ti,ads117x";
                 #sound-dai-cells = <0>;
                 status = "okay";
         };

Could I get some indications if this is the correct path?

Thank you!

PS: the actual ADC is the ads1278, which is a drop-in replacement for 
the ads1178, but with 24 bit samples instead of 16 bit samples.

PS2: I've tried with the IIO subsystem, using SPI, but at 25 MHz it's 
impossible not to lose samples (without using some other approach I did 
not yet try).
