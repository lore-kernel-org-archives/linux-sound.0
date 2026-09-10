Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87358298CAF;
	Thu, 10 Sep 2026 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081449; cv=none; b=HSUyn9dfKZU+sKJsg7LJVTqOVtwx2uTCl2Ls3+zC2ge94+fmsxUiuMWxQ9PNsiAzubOXG2ybUzeYCI7WkVhzOze7twq74BEdN602kFNi6naI6YnEZ/Re7ZispKnX/jX4xaw+KWpDsJpLP3njlG3Il6Zr7eq1eV4I3YuF0UCw+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081449; c=relaxed/simple;
	bh=CDD2EUByhIAYBT9uPvNQ3mv/D1zeYZNQTSC9kd39KEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7hCtdvCyCYtfFU41OC/lVwcFM8i22BffxyCl99XK4LluREiDtjVqO67oiyqvTge6TV/ws2Epp/jAQ6601K4XG0U+32tEBLksreRExtNFYm0saUJ9ROvHo9F/WwUdvNEQfwPhc3MLsi+VXNbd7DeyouiTJHoiJ9Sja7bAWEi+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ob7NHvvB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ob7NHvvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF8F1F00893;
	Thu, 10 Sep 2026 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081447;
	bh=n41iWeSbcFnxam9oBnWPSHAo62DKw43PvCA17uAUix8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ob7NHvvBpjkaNPceZ358UbgdEeJKDv5kZZY4ZQgHkgvlYMfsTdngue2it4eOLaCul
	 ztgYOUrFZDTlVvXCn6U8XAl+SAACPHKjX8Hq6up6d3ibdI0QqZlXpKf1m8xcc0EL8O
	 Jiynbu+Mo966Fo/gh4vqBVTzrNfqnDBR7D0QF8Qe+iHp/8XM0Yt2BA4rJHd+cdIOkL
	 xKqLEgHeMsPSH5ANdkMBvFv2cMvOIp7BJ5VUkT9pobcKywMfecSD2bmb6KdR/QZ1Qw
	 JRZAmxNX0pxJo0mALU4wW/furBOWOXb9ZdqMMj5u+LdCH3RtWA9dNOTmvTdFkRXP3s
	 VcOxACBiq6xXA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:49 +0200
Subject: [PATCH 6/9] ARM: dts: ux500: Convert HREF audio card to
 simple-card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-6-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Describe the HREF500 and HREF520 sound hardware with two-link simple
audio cards in their PMIC-specific HREF DTSIs, and name the card
HREF-500. MSP1 drives codec playback while MSP3 receives codec capture
on the shared DB8500 v2 interface.

Describe the DSP_A format, codec-provided clocks, 16-by-16-bit TDM
frame and active slots directly in the links.

Keep each complete card, including its links, connector widgets, routes
and pin switches, in the existing PMIC-specific HREF DTSI. The AB8500
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
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi |  96 ++++++++++++++++++++++++++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi | 108 +++++++++++++++++++++++-------
 5 files changed, 178 insertions(+), 43 deletions(-)

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
index 5eeb44c5e932..747510c21204 100644
--- a/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
@@ -6,6 +6,97 @@
 #include "ste-ab8500.dtsi"
 
 / {
+	href_sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HREF-500";
+		simple-audio-card,widgets =
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
+		simple-audio-card,routing =
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
+		simple-audio-card,pin-switches =
+			"Headset", "Earpiece Speaker", "Loudspeaker",
+			"Line Out", "Vibra 1 Motor", "Vibra 2 Motor",
+			"Mic 1 Jack", "Mic 2 Jack", "Line In",
+			"Digital Mic 1", "Digital Mic 2", "Digital Mic 3",
+			"Digital Mic 4", "Digital Mic 5", "Digital Mic 6";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "dsp_a";
+			bitclock-master = <&codec_playback>;
+			frame-master = <&codec_playback>;
+
+			cpu {
+				sound-dai = <&msp1>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <0 1 0 1>;
+			};
+
+			codec_playback: codec {
+				sound-dai = <&codec 0>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <0 1 0 1>;
+			};
+		};
+
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+			format = "dsp_a";
+			bitclock-master = <&codec_capture>;
+			frame-master = <&codec_capture>;
+
+			cpu {
+				sound-dai = <&msp3>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+
+			codec_capture: codec {
+				sound-dai = <&codec 1>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+		};
+	};
+
 	soc {
 		prcmu@80157000 {
 			ab8500 {
@@ -488,3 +579,8 @@ ab8500_chargalg {
 		};
 	};
 };
+
+&codec {
+	assigned-clocks = <&ab8500_clock AB8500_SYSCLK_INT>;
+	assigned-clock-parents = <&ab8500_clock AB8500_SYSCLK_ULP>;
+};
diff --git a/arch/arm/boot/dts/st/ste-href-ab8505.dtsi b/arch/arm/boot/dts/st/ste-href-ab8505.dtsi
index 268db68ccf87..dc1f3b068354 100644
--- a/arch/arm/boot/dts/st/ste-href-ab8505.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-ab8505.dtsi
@@ -6,6 +6,83 @@
 #include "ste-ab8505.dtsi"
 
 / {
+	href_sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HREF-500";
+		simple-audio-card,widgets =
+			"Headphone", "Headset",
+			"Speaker", "Earpiece Speaker",
+			"Speaker", "Loudspeaker",
+			"Line", "Line Out",
+			"Speaker", "Vibra 1 Motor",
+			"Speaker", "Vibra 2 Motor",
+			"Microphone", "Mic 1 Jack",
+			"Microphone", "Mic 2 Jack",
+			"Line", "Line In";
+		simple-audio-card,routing =
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
+		simple-audio-card,pin-switches =
+			"Headset", "Earpiece Speaker", "Loudspeaker",
+			"Line Out", "Vibra 1 Motor", "Vibra 2 Motor",
+			"Mic 1 Jack", "Mic 2 Jack", "Line In";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "dsp_a";
+			bitclock-master = <&codec_playback>;
+			frame-master = <&codec_playback>;
+
+			cpu {
+				sound-dai = <&msp1>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <0 1 0 1>;
+			};
+
+			codec_playback: codec {
+				sound-dai = <&codec 0>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <0 1 0 1>;
+			};
+		};
+
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+			format = "dsp_a";
+			bitclock-master = <&codec_capture>;
+			frame-master = <&codec_capture>;
+
+			cpu {
+				sound-dai = <&msp3>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+
+			codec_capture: codec {
+				sound-dai = <&codec 1>;
+				dai-tdm-slot-num = <16>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+		};
+	};
+
 	soc {
 		prcmu@80157000 {
 			ab8505 {
@@ -48,10 +125,6 @@ ab8500_ldo_anamic2_reg: ab8500_ldo_anamic2 {
 						regulator-name = "V-AMIC2";
 					};
 
-					ab8500_ldo_dmic_reg: ab8500_ldo_dmic {
-						regulator-name = "V-DMIC";
-					};
-
 					ab8500_ldo_ana_reg: ab8500_ldo_ana {
 						regulator-name = "V-CSI/DSI";
 					};
@@ -80,7 +153,6 @@ gpio {
 						    <&pwm_default_mode>,
 						    <&adi1_default_mode>,
 						    <&usbuicc_default_mode>,
-						    <&dmic_default_mode>,
 						    <&extcpena_default_mode>,
 						    <&modsclsda_default_mode>;
 
@@ -365,27 +437,6 @@ default_cfg {
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
@@ -488,3 +539,8 @@ ab8500_chargalg {
 		};
 	};
 };
+
+&codec {
+	assigned-clocks = <&ab8500_clock AB8500_SYSCLK_INT>;
+	assigned-clock-parents = <&ab8500_clock AB8500_SYSCLK_ULP>;
+};

-- 
2.55.0

