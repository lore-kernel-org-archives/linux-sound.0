Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110DA3D1CA7
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880285; cv=none; b=MdpSOT0nCBI/x0khLmD2xtFdZ97Vg78Y/QPDTdjyhPDeTGQ1FFGld/OwT3FIb8YDDwE9LQ7uvESBft36E6X4AND/7XgA+j2WanrDWbtjeBMcsB6tHzEmT3Yxx6UJX2MGyWiVlBwONudI3568XDW7Oa/EAprcSLfXMibifA7t+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880285; c=relaxed/simple;
	bh=+B+jPv7EkmgtOQeTinSPKUZXk0Lm8pE7GSzX4ECkQug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5j3oUocVD6k+q0NSBwaw9pq6A2j5nLAK3scX/Uc5xnQQcDiahTXKMARO39zv9D5AiGDbynZ7E3UeDrZB5MhI81rD7WgNb/hqspAk2PKHZlhxJNhb3lMAEILpZlfBWjwJTk+NEbD0KNveSIY0RL06LgoPtj2h57maQiN4yMBymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvzERpDo; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvzERpDo"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso19130725ad.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880283; x=1790485083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=;
        b=VvzERpDowPqll675WXvr0HQrESTi89CV/S+aw3aZzT5kqlgAKEuysmRGm4W3lgjypn
         +D/5htbPsZIn5i21+YfycrYScSlRb/GrtzsyorcCEjY6us0OtSYXPwCuMubtQar7wNfx
         BHC4csOYsrezQcJexKUiihaG9lONgNwKNKKoMWHX1DCfHApFknw/uYXqRz3baZsJhjuO
         TGbptJNpmCpnpYvCYvhfs1ExKpvhExwh93jBSqs39fHwC6huf1NNT7ZfHzCSbSp5IMXZ
         JJI6F/GMaATHqZZmlyzDe6gArw+dlTLnnTrSSoowokSTNxsLN5RVEOKWUb/DdT+CkG7r
         xRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880283; x=1790485083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=;
        b=dbzmi/AtUOOSuBWX2SGHfQlOXQEBhekoF2RNOb5zBfTrloROXuFINCcOTe8wYtEEQH
         jf3z5mudUENVe9538EMTgHj2ZtErprCfB4iBETCcF9mm58/X4pe1k0iv8tCXr8RaydDO
         R0Ycz/udNH/rzv1b787xREtEsuO3RZoGu3endp4aSkrTyCcjeNWawtL1J/eEKZB6+bUm
         MlAwBisi+3MQwxpvDgFRrYjQBN5WwLjUfmwrqa8wJwxWgK7ssgjcO3wKe62yc3agSs3x
         Ovv4LYJZWctYtVY+ui3aQ1FK9xJOVutWMihPq44ud7IRoGDXQnOi3xI0jCKvgJnQE0VP
         WOeA==
X-Forwarded-Encrypted: i=1; AKwUvBzCRxvelX2/9yL+V1+m9wEclLoZL4xlJY2R+qbgj6zS3/AnZmxR8zz3fxCqBXJwgseby9CfVVL671oSTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l1znCJ8PlxwJs1/01a2VcKyCTgdt7htzMF9+uxhB9uMRo4Trkf
	dh+T9UksgRtstZbHzBIoC4EVAfftaoO91g+iClhCag0Aur8qWa2iyow/
X-Gm-Gg: AYBFou3yDFyixKyu7irw17iDVCPSI3iSZAdH8fDrPzEN49+oQU0xQ8foeYodnMkX1aV
	rGWEeAvQd6dGn5fa/1hJt60lwCWyNY9IZAI6VV3lWRhQNt4vhXiTkQYaRCcK+85ppI2sir80pUL
	rNwTkUzw4+t7zkV8Sv8wAotLtffgQRrjmx+Mly5OrPk+NiESU+eliydu7zHcpFZEyWtEF/B9Qtf
	2Zw9cXyTP0/0VBoWdaTCxGBHPWaHLZyzkHtl2PB4LijHQfh3QoaGP2ESrqHok64ShyDR9yrUzLB
	NRiq6wQr2KsA1ugKFvCbPNVEkJHBIOSqf9+VLKtV1zwYVTVM5vwaY2B89Tk7CYusWxPxdp2A7XC
	589VZ04yjXkz34XOZ3A5lRwLFIvIdUGw7y20LCXHbSO+0R+xK2ZGxfddZE3g1zGpw/ZsiWaENJS
	FoxigAlkV20xMT8RFyFFUUKij/id/duDpsJA6sr1Ouo0BCiv4KaueBI/wPgLGeMn4SN2Te8kV8h
	qPuG0MjUG6OxOqkW3KDQH23Dlge86bXlgZRPOh8ERGkOA5/A8BGzinvqlzonWhyAyLtJGgRK54b
	WvXPc43yTs/DRLgAe2qsjk+Md3BeT83SbTT6NyCN+C4+ApMx
X-Received: by 2002:a17:902:e746:b0:2d9:54:fc69 with SMTP id d9443c01a7336-2ddb1af4f8emr115717635ad.7.1789880283230;
        Sat, 19 Sep 2026 21:58:03 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:58 +1000
Subject: [PATCH 19/28] arm64: dts: apple: t8103-j293: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-19-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+B+jPv7EkmgtOQeTinSPKUZXk0Lm8pE7GSzX4ECkQug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbFkxPfyYrYbfLomRP9IdrIjNM0s6zFdY/2R7Ku
 91jud3DjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSndjD84RTiVi2ZW7NbRnPp9WfFuqxsqkuO5j7i7t8hoHrx6ry2SQz/veWyws5
 f/XDwe6ZMEef9l/O/VSwW2V4xdZbzxF3FHRy3eQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 104 +++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..24d0b512fac4 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,109 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio", "apple,macaudio";
+		model = "MacBook Pro J293";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.55.0

