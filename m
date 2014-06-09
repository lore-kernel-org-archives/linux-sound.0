From: Bo Shen <voice.shen@atmel.com>
Date: Mon, 09 Jun 2014 03:31:46 +0000
Subject: [PATCH v2 4/5] ARM: atmel: sama5d3xek: switch sound to CCF
Message-Id: <1402284707-23354-5-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1402284707-23354-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1402284707-23354-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Bo Shen <voice.shen@atmel.com>

As the sama5d3xek board has switch to CCF, so add clock for wm8904

Signed-off-by: Bo Shen <voice.shen@atmel.com>
Reviwed-by: Mark Brown <broonie@linaro.org>
---
Changes in v2:
  - None

 arch/arm/boot/dts/sama5d3xmb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
index 306eef0..b8c6f20 100644
--- a/arch/arm/boot/dts/sama5d3xmb.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
@@ -45,6 +45,8 @@
 				wm8904: wm8904@1a {
 					compatible = "wm8904";
 					reg = <0x1a>;
+					clocks = <&pck0>;
+					clock-names = "mclk";
 				};
 			};
 
-- 
1.8.5.2

