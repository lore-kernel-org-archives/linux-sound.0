Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD7D3D1AA4
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880340; cv=none; b=lEKIWvnoCXcFnwQ1sy5RVdN98DVpTZxNe7J+7tziyQsUqUSYGdCLA0hk1Iz+T/++uWyEpSNigW//UV4dpHKUAR+5NmRsPDYzQiJJDI+uMXi8vanrm0yq0izEmyJty92tcrDvR/2RZq1+J0dkOryYJ2Faw6Kdv64wOyP+ERyy88Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880340; c=relaxed/simple;
	bh=5Lv7LzgxsLDDIrEyhpz1IqbTrdKtgpeQE+Q25XVomZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0zEoDOLoYyLlPlsDHnjnoP5Uquqn0nzfcMGVYgqkgAxdrldo4Qvm1ctSob9xGjfPMcqjC5Sjrwo666DjRoZdEhPbZPLPw2PEsVEhixEkFIjZn/X2eCbR6JOu8P6WeLI6Fvmg601ihJ5sgknfj9M2EAQGaMjTnl01nyhKepa4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0MC5Fhb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0MC5Fhb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso22636995ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880338; x=1790485138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzkwdUu5IxbjyIkUJ7r1XGcuucPGN3hdyJMixCjr1T4=;
        b=m0MC5FhbWvGUM74BKYUt2wnBkkzh/03L9D2p1Y9L8jZa1FmL4F+0cgPLKrQZ5pnWjV
         xdxahQkWIOL3eAyju82P+s+lHsUsVuXk9KFt6VhVYfFBYeVEoI9V/Dn5Q0lOHEeveI7X
         I8NrlbIgnx25pFvWDFCmwtcP9SAhTReyt9mjCbgxEHQZocUBueqiiEowsqdyDFRpcD3N
         EybNLmbXvs6mCL2SvX0vHDKJo1AoTKQKSLU5w6XlSASjK54F0+Zem3OPaC3PL8PCU9Vt
         6SEqEOoNtL9DH78YQYCrycEEDTIsFL6Jit27xRWqs3atmxZqzCR7XGu9OY3V47czBUt8
         y4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880338; x=1790485138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzkwdUu5IxbjyIkUJ7r1XGcuucPGN3hdyJMixCjr1T4=;
        b=lXaE+kpjEmQm5HwP7xa8DKcPEwqSVJt3KO/1QCVEE6RKKECzfruHPwYttckvLM07YS
         8yaVfpznD1q0ZP9TjWr2PMsUt72Qcli1eG+uz6dMYeY2ozUW+cLQU06VoGrjX8mrT8kq
         HhJtNz9IqrYILMhrMbIeycuqL28uH2i2rOt6Z0k+htjrAL7GG3OceCyAsoexPve0e66/
         I1yPrZYRjMNQAyRK1ZyBs7gfbuDBUvrssFu51Dv/DbfLbz9gm8zzx7HH3htostnfSdXF
         S/iDSb4ToNH4Me3q+x6ySXXcaaDyDhxXPApIt0vj7cj0o0NQNEU+oB8Y2NTmeKolF/i6
         HL8g==
X-Forwarded-Encrypted: i=1; AKwUvBwT0YRdGi+gdsYD6oOMcKNfBZ97mdCQVy+nflBGS8d7PhPVyjFGUEDM49p4IQIAiTJHSYiFEiu+R3/XUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mKZ3MTCdA9z2yF8NAsjLyWxEVVcp166piHkw7dSCsRaceM5C2M
	VUguZlDUuYBivHhd1GCsW7p75wXIO+LzXKVqb2n+xwfAPu90ceT6l/Uo
X-Gm-Gg: AYBFou2c2Oh2trslPJHcGvXSpjLnhKIeVNXkWi76T2Oho9Z+ihMQPuMrF1Hul9QpiVZ
	9NBi07hpVFzLM7XLHHETVYTa+mtG9sZrdBKmJ5NlAiGZmpRqweIyVok8e5bznGYJ8VYP453peAK
	9R9rIOMIB5Hk/tm4bhvQxsXaZPDV6NIZOEyQBWv9+CUljVKTd1wnHjrOPmXfo5d1htjo1BQNufv
	ZJhYlB2K5p8lCOj+m6jmIKAOPwLsOjDl2NXTikHa+g/hjGQvo50Yk3TVHmafBqxL+48e6oZmAwc
	+eyVunccxqVhGZVsZb+lGqIeZ2hKxelFuZobyvagY1yrG6KUh8OemaHqHtKtwbQ3lDo2ymq+GXw
	kcamqkZlqsVl+Lcz/3BBV2GjbxotnHoibfp7/kftH5ahbKvIdpKhKT0ZT1oWtON6efr6zk9rxKi
	J2qj9gUtKwxoDc/+ve3gWcohQXq8cBK7mKjbMuMgOPyuJ0Y3Or30CZCzlHFhn9+nyc5FQIABQ/g
	XBrOaWQC0NWEqiVEZ6gdHeJqsMz5w4GZ/OOEk7QYoJFAZY1nCOgNQ6RkH7yS9nWnH6vvipnlieO
	6WchIztpfi6R1H53Ipj+5nG3nTRBFcKAswHgneVIsdqeb8oVaVCL2X62sd8=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr55120815ad.50.1789880338289;
        Sat, 19 Sep 2026 21:58:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:57 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:04 +1000
Subject: [PATCH 25/28] arm64: dts: apple: t600x-j31x: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-25-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6132;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5Lv7LzgxsLDDIrEyhpz1IqbTrdKtgpeQE+Q25XVomZU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05UedJzvjLnaydTZH/toSs9SlgNxTF8Oa15zWfRVS
 jzyAI9Qx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKoFaxn+e9gtnb2XpXqbovDFtn/1S67zcoXafjukxDLpcN6Kas3V3Ax/ZZ/N+PU
 mqGH74/nKOzVXZb9vnZ3b63P8x0v9DobOwnl9jAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6000-j314s.dts |   5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |   5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |   5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |   5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 128 +++++++++++++++++++++++++
 5 files changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index 1430b91ff1b1..dab8e99fa324 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index da0cbe7d9673..2cdfac3c40c8 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index c37097dcfdb3..7495698beb02 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 3bc6e0c3294c..6622b6e225a6 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..7afd385ce57d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_woof2: codec@39 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+
+	speaker_left_tweet: codec@3a {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_woof2: codec@3c {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	speaker_right_tweet: codec@3d {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+};
+
 &nco_clkref {
 	clock-frequency = <1068000000>;
 };
@@ -366,6 +454,46 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mode-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mode-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.55.0

