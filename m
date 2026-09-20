Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30FD3D1CC6
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880313; cv=none; b=UIsglp6LS4MCP/+LLmA4KegdqjOhtcyUGV+AcK0j/kvwdzNLJLZ22mzCLcvdhR8PUFnYiJamnKslCnqmCpjix/jb+bIQeycaft4UZyT9xU3saRef3j7m6dMBmD05tzn7AgyaKBJsDTIT40dA6b41whKEIFzv9B9drAjqIyUptXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880313; c=relaxed/simple;
	bh=35yLsTXZt5swGMfuhMDygKEChMzE5kiCXJnWEUcydSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkZ8Aptb+FCtTGT1nf73fRiZeTH13fHEfdrtzXzbvVlfUeuqWxCsEP3CpSEQ4NP8/cgygHd7AkFlecyCvO80BTbvhQt91WmF11aQ3DwEDDZOxvB6ETYalJ+gXEWcdrocNsaTAaNCk02Wbn+YGqhR3MkXl4LVij59Lv+EgB1FDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRrRB/k1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRrRB/k1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so17948005ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880311; x=1790485111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=hRrRB/k1asjdt7lorcQPYKFw/uSEVSwZk/+VlA3vkfNmjh+E7w5USkUGDjs7H7wgJD
         trCu0YFI8Cn6YZ3/zuaqEt5CEEhA1AUP8vT6MGhDF7pExG+YUgFwiVLATp5Va91Ppz83
         mp6B6eckw4MCHJAx2Mfvm2RuQDdGRS3HBbyEtaZRTJ2n26HwYdj3LeGb7WMg3ciUZXSH
         W4v4qphAlYxt5d8EJZuU6IHaVu/7vZEGIgkiCyV7QcSP+AKY5++SQxc9/YXa7850oLeK
         Hqj63loJg+FkREweHtHdzvW3ySv7IzmmlMq1bRARbSUnxJheiiN0Qwe5CZmfPNUeujUB
         k31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880311; x=1790485111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=G7hoza60Rfy96wvzGPItucE24h8uGkgHmeuxQT67e13o1C8dAv1n2DlVS5h6Lx14tw
         QLaq1aPEQK3qtGk6clq5w6XEn4/vSinhNY4rgor22OxJaeUu0afJnl1Kln3NpypoCSwz
         WXjxMX8V9i+N19LTZNEVsqGnGOBMz+UssIOzLS8n/NIA0ncVIlSPWfXcsSmNtZJYl3+v
         QjPrRZuoKatXiYYg8SxORzD3StTLzoT3RD+fvmhzDsls6AlJFfVMwQEXZNzIZ6ysyLRY
         n7Lq4wmfWpgrfz9VMSTHXs9yrpjMZPNrL6HukCyGieK4EUNDFPev0QEBN9QPb1zko+t/
         EWiQ==
X-Forwarded-Encrypted: i=1; AKwUvByOc+MUVdOdvGZ4arFpUeAMXxZh2KwzbXX1ik+PtiLk9S3JN81XOWTSrF8Wm8pz4CQIqNsTSuWsqW1xtw==@vger.kernel.org
X-Gm-Message-State: AFuF++n8YIW3JTz/VG87gSk2Ce5laxlydTkKn2MqFdnYzSgirxgumiIk
	bgUCxNERX3tMecoyoTlEYRuG7nMM5YmKz42z/ZcMgHpNU9QePMqfaFNB
X-Gm-Gg: AYBFou3qtq+95ZfXtb6Ba5/ORICxJzsXybMvq1pryk1C5HusmTn0ndQgugyBpqA78lX
	6eqyHrJcYYyMJaMVgSmyNJ80aEW85+hdTvwN4nmv0euFelJNOssY9xHJc6XgJo7Ceu2CfabdRoc
	Acpn4UKp6HPr9CtkssVXyXRikpTBsBH+KDfPOwY3NKInltFsXbQBR5kdNRZh/2XGGb/Xobj+PbS
	eY+MVZ4yUz7jlZXlvUia+sq/O6GqWTm+fCg6lstKyiJ250gquVUf2GEU/Ofd62/gc1FqV8BqqGl
	EjttSrNf3GFu/CfbByuilXhaSvjYLiRvqe2lI3wMAGRuSZ8kgtk3Z3P08ND39W/sIifBMyJUJf9
	Jcp1rsntsHTSvU4nYlYu9TenKu7NbWZA6rZG5Q3ef25sZcgu/TAOOs3UJJf6Who2o+Ak3sWZ6+w
	W3zo6jro1Ov+0q8cfBEi7xkIjtfC+QkLfoiN0W6cnqDA7DQwtdy0mE38L8iIfCf6O42SvOTHPuI
	7YbK8+ncUs6fniOazkyeu3RHFYjef7RyVqqbNQ+f5TbbrhB6ROLfk7+RMw1hNmnannNz3O0Y5Tg
	Qr5D47vrxPrS5CYxU3m2gWDvx2gUYYrnea16FkIPXHM24eI=
X-Received: by 2002:a17:902:ce0c:b0:2df:336b:9c2a with SMTP id d9443c01a7336-2df336b9c5bmr36073685ad.70.1789880311051;
        Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:01 +1000
Subject: [PATCH 22/28] arm64: dts: apple: t8112-j415: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-22-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3974;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=35yLsTXZt5swGMfuhMDygKEChMzE5kiCXJnWEUcydSA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05WquSsFpwoUim+YWmBgy24j0P72fv6G5Q/nVsbZJ
 W/wZ17UMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOquNoafjJvYzyr9844pFNAM/iGur//4e1/lxXUnnHVSzdstmrwjGRmalJomLJf
 fYxJ7j81F7eX3p3b7nxjnnzqf2szswb5m5R5mAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 125 +++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..5f245ef1c4bf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,129 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweet";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j415-macaudio", "apple,macaudio";
+		model = "MacBook Air J415";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

