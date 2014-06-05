From: Bo Shen <voice.shen@atmel.com>
Date: Thu, 05 Jun 2014 10:19:31 +0000
Subject: [PATCH 4/5] ARM: atmel: sama5d3xek: switch sound to CCF
Message-Id: <1401963572-10953-5-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1401963572-10953-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1401963572-10953-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org
Cc: boris.brezillon@free-electrons.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, nicolas.ferre@atmel.com, linux-sound@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, linux-arm-kernel@lists.infradead.org

As the sama5d3xek board has switch to CCF, so add clock for wm8904

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
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

