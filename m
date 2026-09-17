Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD2243DEA2;
	Thu, 17 Sep 2026 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685491; cv=none; b=FbZJ19eKUsaByaj70XtMaBlg+Tyo/jXziQqVkRgvec9c0K6tM4hBImZPE7UblvTnRNsqbdXP48eJADnqFXity70L4FUXVd/s3VFIZltEP0kyiEgwfRMtBpmBHNtZRLIDJ9KD8uH1a0upTnl+z9p0gsuCR7SxVnkactmg48A26O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685491; c=relaxed/simple;
	bh=uvqh92Xe5DAXsKtJK59VIxL0PId03+Lt2/jmPzZf/ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPJ0dw4MUiclKHP2EYusUa76LwTLCXQc61xq0/LElI9DuWl/VHKnicwnlxlC42063l+2kaqxj0S5JE1tMNx2F53/9OBBPSiwFSc8fk8z/cTQWWX+nCtE9qNA09suXpagzvCYAbhh1hSCetBwkXu/dubzsGYEKj1Efvv9F65RAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cycpC/OI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cycpC/OI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E631D1F00893;
	Thu, 17 Sep 2026 22:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685489;
	bh=FAa29gK/8UULocx5cuSPBO0a1jW8IQmG8IjVqHN4WGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cycpC/OIPtCn+gwmTarKk0X/xbH3xdmLB60TVTN+70Vt8MELpFw+57gJhOaqKBckK
	 p+ErTHpUptiFzSpC2mGtT5m3NUlcJI83014iD9UkhhdSaWYNzuiArfLD25JKWQspH3
	 QU95Wp8ujbE/MTZKYQDNhOfeFJKO1o2fqFkaLuvKza4vbCq491ZznLvfxIi8KYVkFM
	 ym/1AQ4waKW68e6w1rAoie0PDHq0xWGoA80WshCoJXpS+Mmfrbnqxziwvim2KFVieO
	 y2gLTi2yffUXdbllMaGF+ZMAyI0wbTl2zzQ2ZnEHZenvkvTvRAtPJrsOHhcWDBwqAA
	 z7GJvWNZvwP+A==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:05 +0200
Subject: [PATCH v2 7/9] ARM: dts: ux500: Convert HREF audio to
 audio-graph-card2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-7-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Describe the HREF500 and HREF520 sound hardware with two-link audio
graph cards in their PMIC-specific HREF DTSIs, and name the card
HREF-500. Connect MSP1 to codec DAI 0 for playback and MSP3 to codec
DAI 1 for capture.

Describe the DSP_A format, codec-provided bit and frame clocks,
16-by-16-bit TDM frame and active slots on the graph endpoints. Keep the
clocks running continuously, matching the legacy machine driver's normal
one- and two-channel mode.

Keep each complete card, including its endpoint graph, connector
widgets and routes, in the existing PMIC-specific HREF DTSI. The AB8500
variant exposes six digital microphone endpoints. AB8505 has neither
the digital microphone interface nor its VDMIC regulator, so leave
these endpoints out of HREF520 and remove its stale regulator and pin
configuration nodes.

Select ULPCLK as the fixed parent of the codec audio clock in the
HREF-specific codec DTSIs. This replaces the machine driver clock
control with declarative board policy.

Fixes: 4ecae2ae9535 ("ARM: dts: ux500-href: Switch HREF520 to AB8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ab8500.dtsi      |   6 --
 arch/arm/boot/dts/st/ste-ab8505.dtsi      |   6 --
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi      |   5 --
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi | 104 ++++++++++++++++++++++++++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi | 118 +++++++++++++++++++++++-------
 5 files changed, 196 insertions(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/ste-ab8500.dtsi
index 8bf083addd66..c8c8521516e4 100644
--- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
@@ -365,12 +365,6 @@ ab8500_ldo_ana_reg: ab8500_ldo_ana {
 			};
 		};
 
-		sound {
-			stericsson,audio-codec = <&codec>;
-			clocks = <&prcmu_clk PRCMU_SYSCLK>, <&ab8500_clock AB8500_SYSCLK_ULP>, <&ab8500_clock AB8500_SYSCLK_INT>;
-			clock-names = "sysclk", "ulpclk", "intclk";
-		};
-
 		mcde@a0350000 {
 			vana-supply = <&ab8500_ldo_ana_reg>;
 
diff --git a/arch/arm/boot/dts/st/ste-ab8505.dtsi b/arch/arm/boot/dts/st/ste-ab8505.dtsi
index e61beb8b5ac3..0bf85b12808d 100644
--- a/arch/arm/boot/dts/st/ste-ab8505.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8505.dtsi
@@ -302,12 +302,6 @@ ab8500_ldo_ana_reg: ab8500_ldo_ana {
 			};
 		};
 
-		sound {
-			stericsson,audio-codec = <&codec>;
-			clocks = <&prcmu_clk PRCMU_SYSCLK>, <&ab8500_clock AB8500_SYSCLK_ULP>, <&ab8500_clock AB8500_SYSCLK_INT>;
-			clock-names = "sysclk", "ulpclk", "intclk";
-		};
-
 		mcde@a0350000 {
 			vana-supply = <&ab8500_ldo_ana_reg>;
 
diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index e6585eeb4553..912d2505318e 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -1071,11 +1071,6 @@ mmc@80008000 {
 			status = "disabled";
 		};
 
-		sound {
-			compatible = "stericsson,snd-soc-mop500";
-			stericsson,cpu-dai = <&msp1 &msp3>;
-		};
-
 		msp0: msp@80123000 {
 			compatible = "stericsson,ux500-msp-i2s";
 			#sound-dai-cells = <0>;
diff --git a/arch/arm/boot/dts/st/ste-href-ab8500.dtsi b/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
index 5eeb44c5e932..ff72f5f6d652 100644
--- a/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
@@ -6,6 +6,48 @@
 #include "ste-ab8500.dtsi"
 
 / {
+	href_sound: sound {
+		compatible = "audio-graph-card2";
+		label = "HREF-500";
+		widgets =
+			"Headphone", "Headset",
+			"Speaker", "Earpiece Speaker",
+			"Speaker", "Loudspeaker",
+			"Line", "Line Out",
+			"Speaker", "Vibra 1 Motor",
+			"Speaker", "Vibra 2 Motor",
+			"Microphone", "Mic 1 Jack",
+			"Microphone", "Mic 2 Jack",
+			"Line", "Line In",
+			"Microphone", "Digital Mic 1",
+			"Microphone", "Digital Mic 2",
+			"Microphone", "Digital Mic 3",
+			"Microphone", "Digital Mic 4",
+			"Microphone", "Digital Mic 5",
+			"Microphone", "Digital Mic 6";
+		routing =
+			"Headset", "Headset Left",
+			"Headset", "Headset Right",
+			"Earpiece Speaker", "Earpiece",
+			"Loudspeaker", "Speaker Left",
+			"Loudspeaker", "Speaker Right",
+			"Line Out", "LineOut Left",
+			"Line Out", "LineOut Right",
+			"Vibra 1 Motor", "Vibra 1",
+			"Vibra 2 Motor", "Vibra 2",
+			"Mic 1", "Mic 1 Jack",
+			"Mic 2", "Mic 2 Jack",
+			"LineIn Left", "Line In",
+			"LineIn Right", "Line In",
+			"DMic 1", "Digital Mic 1",
+			"DMic 2", "Digital Mic 2",
+			"DMic 3", "Digital Mic 3",
+			"DMic 4", "Digital Mic 4",
+			"DMic 5", "Digital Mic 5",
+			"DMic 6", "Digital Mic 6";
+		links = <&href_msp1_port &href_msp3_port>;
+	};
+
 	soc {
 		prcmu@80157000 {
 			ab8500 {
@@ -488,3 +530,65 @@ ab8500_chargalg {
 		};
 	};
 };
+
+&codec {
+	assigned-clocks = <&ab8500_clock AB8500_SYSCLK_INT>;
+	assigned-clock-parents = <&ab8500_clock AB8500_SYSCLK_ULP>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			href_codec_playback: endpoint {
+				remote-endpoint = <&href_msp1_endpoint>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <0 1 0 1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			href_codec_capture: endpoint {
+				remote-endpoint = <&href_msp3_endpoint>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+		};
+	};
+};
+
+&msp1 {
+	href_msp1_port: port {
+		href_msp1_endpoint: endpoint {
+			continuous-clock;
+			remote-endpoint = <&href_codec_playback>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-num = <16>;
+			dai-tdm-slot-width = <16>;
+			dai-tdm-slot-tx-mask = <0 1 0 1>;
+		};
+	};
+};
+
+&msp3 {
+	href_msp3_port: port {
+		href_msp3_endpoint: endpoint {
+			continuous-clock;
+			remote-endpoint = <&href_codec_capture>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-num = <16>;
+			dai-tdm-slot-width = <16>;
+			dai-tdm-slot-rx-mask = <1>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/st/ste-href-ab8505.dtsi b/arch/arm/boot/dts/st/ste-href-ab8505.dtsi
index 268db68ccf87..eba6f674c691 100644
--- a/arch/arm/boot/dts/st/ste-href-ab8505.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-ab8505.dtsi
@@ -6,6 +6,36 @@
 #include "ste-ab8505.dtsi"
 
 / {
+	href_sound: sound {
+		compatible = "audio-graph-card2";
+		label = "HREF-500";
+		widgets =
+			"Headphone", "Headset",
+			"Speaker", "Earpiece Speaker",
+			"Speaker", "Loudspeaker",
+			"Line", "Line Out",
+			"Speaker", "Vibra 1 Motor",
+			"Speaker", "Vibra 2 Motor",
+			"Microphone", "Mic 1 Jack",
+			"Microphone", "Mic 2 Jack",
+			"Line", "Line In";
+		routing =
+			"Headset", "Headset Left",
+			"Headset", "Headset Right",
+			"Earpiece Speaker", "Earpiece",
+			"Loudspeaker", "Speaker Left",
+			"Loudspeaker", "Speaker Right",
+			"Line Out", "LineOut Left",
+			"Line Out", "LineOut Right",
+			"Vibra 1 Motor", "Vibra 1",
+			"Vibra 2 Motor", "Vibra 2",
+			"Mic 1", "Mic 1 Jack",
+			"Mic 2", "Mic 2 Jack",
+			"LineIn Left", "Line In",
+			"LineIn Right", "Line In";
+		links = <&href_msp1_port &href_msp3_port>;
+	};
+
 	soc {
 		prcmu@80157000 {
 			ab8505 {
@@ -48,10 +78,6 @@ ab8500_ldo_anamic2_reg: ab8500_ldo_anamic2 {
 						regulator-name = "V-AMIC2";
 					};
 
-					ab8500_ldo_dmic_reg: ab8500_ldo_dmic {
-						regulator-name = "V-DMIC";
-					};
-
 					ab8500_ldo_ana_reg: ab8500_ldo_ana {
 						regulator-name = "V-CSI/DSI";
 					};
@@ -80,7 +106,6 @@ gpio {
 						    <&pwm_default_mode>,
 						    <&adi1_default_mode>,
 						    <&usbuicc_default_mode>,
-						    <&dmic_default_mode>,
 						    <&extcpena_default_mode>,
 						    <&modsclsda_default_mode>;
 
@@ -365,27 +390,6 @@ default_cfg {
 							};
 						};
 					};
-					/* This sets up the microphone pins */
-					dmic {
-						dmic_default_mode: dmic_default {
-							default_mux {
-								function = "dmic";
-								groups = "dmic12_d_1",
-									 "dmic34_d_1",
-									 "dmic56_d_1";
-							};
-							default_cfg {
-								pins = "GPIO27_J6",
-									 "GPIO28_K6",
-									 "GPIO29_G6",
-									 "GPIO30_H6",
-									 "GPIO31_F5",
-									 "GPIO32_G5";
-								input-enable;
-								bias-pull-down;
-							};
-						};
-					};
 					extcpena {
 						extcpena_default_mode: extcpena_default {
 							default_mux {
@@ -488,3 +492,65 @@ ab8500_chargalg {
 		};
 	};
 };
+
+&codec {
+	assigned-clocks = <&ab8500_clock AB8500_SYSCLK_INT>;
+	assigned-clock-parents = <&ab8500_clock AB8500_SYSCLK_ULP>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			href_codec_playback: endpoint {
+				remote-endpoint = <&href_msp1_endpoint>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <0 1 0 1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			href_codec_capture: endpoint {
+				remote-endpoint = <&href_msp3_endpoint>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+		};
+	};
+};
+
+&msp1 {
+	href_msp1_port: port {
+		href_msp1_endpoint: endpoint {
+			continuous-clock;
+			remote-endpoint = <&href_codec_playback>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-num = <16>;
+			dai-tdm-slot-width = <16>;
+			dai-tdm-slot-tx-mask = <0 1 0 1>;
+		};
+	};
+};
+
+&msp3 {
+	href_msp3_port: port {
+		href_msp3_endpoint: endpoint {
+			continuous-clock;
+			remote-endpoint = <&href_codec_capture>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-num = <16>;
+			dai-tdm-slot-width = <16>;
+			dai-tdm-slot-rx-mask = <1>;
+		};
+	};
+};

-- 
2.55.0

