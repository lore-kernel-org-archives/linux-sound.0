Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62997409272
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094007; cv=none; b=YZ80yKobiLflloSmZcLCCERxfH1fDo4pdlkYkr4SBbOdvUtCHmohwwhQZEPhaQFnlkHYM9+hWWwMPGrdjsVlJjMy3807thFmhQlIzCTrjLv2s1AAfZNNk62OVjNnICNq6hR7sBAGMs9cbIVqzMm+BwQnB+P2mQFoGlS0WpGpEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094007; c=relaxed/simple;
	bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POu2/Xt0KUpvBwwXixGq0xZBkTeARSIFEbKXAaVpYBOPPXGXR2syMH4T3sS5ryyC31n8SBfWgsARm7p8pr+iRIBvz74pxfllkOrw9EOH5MqgX69ZDBrmElXTJFGi6Ys1ZboVCH5XKquEKyh56Ka3/XkQRcPHWqelUJEo7e4Y1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkBowv4e; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkBowv4e"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso353520a91.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094005; x=1791698805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=EkBowv4eSx65ERaj4ah+n22Lbj36gFgmHNJaSxg13OBYJAlPVgDdq1GC3ICFydG1b5
         S2EQ6yq0aoG8YN9PvsiYVoKxQs4d6d6AueL1WeAhsLuGulkPM+DJrHgnEIQB0JU9FkZt
         vg+Y12hIEKRLN2TjiuuOv+jFNYtx5KASuXofLDBQzOmQH8Sm+PvfrdUASxq+8cPrD5ok
         UAiIwn7JXbm4/tr3z4L2klih9Akra2pkRxJ9md3yHO5c44sOoXWqZlLX2tdxrMV5/0Xp
         usLBBT+UplMIdX7a8CSWlPIv+AAik+FdAWvLZSaLLq7VQbXWSxbOuJhQwQXx0SqlHKBu
         FzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094005; x=1791698805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=zoArsGVsTheW79L0l2u/la0DAhOP7qi56hBYUlxlmmAfnCJg54IoYX/HydpAW48KV4
         vKkXj8N9ZXly5DyswHS5av+gFYw+JWOgSvAQ3XFCFra+PAqWpFSK05mIKJQ90gg447zu
         bABGIzFVDBFhg3JqWEGPwSnpnC8oZulFjEskSyCcrdypiRSbzwWj5p0tQrwTn/xGtVlr
         m0Hv/GlJX5zt4/Rpbb+gKXCT3jg6hCwO2TbD1OXstC/hqCaMDruKrVvqlAf8mWbxEDKL
         l/w3QvJ8lYcPbl6LBJDqmakCWRY1I9Behat3TZrJYfHjx3tB9zuTxahwx4s917YmoBrL
         nyKw==
X-Forwarded-Encrypted: i=1; AKwUvBwcpM7PZn6Sz1dyAHP2vxgxrYjVG+8KepuybFIVWPi0+WZlCjjvnOKP1dJpTRlrWsPxfWxMllOT925jlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0qpan8o4P+t2HlmVzC4XYeDRW31RwRAvsw4euL1vFlPwbvKTh
	gVOh2yp3v6OpHRjIa/kExfNryobPBXpmdOkBX/XHd1TMYiZKaff89DVL
X-Gm-Gg: AYBFou1vCFRloPDz5RufKycD5t5POk/Y+CauHSk6e4+Hb6cIYvJ9mTUdVSr4Tg/B3Au
	+/W3HIxX5PiSJ+1fTqqbMt1KTe9fAay2Hq1IRx/iqcdAFoUz4IkcjKZ0lErX0m9UHAwPsuxWQPP
	Q3JGC2PZ2zcvVKx1jMc1TR+Fdy81MNjpOVqLK3wtEcYo63M1OhJBs9fydVlTgzeb+lpdpsDc0xL
	n73wX/W+k06SgMM034PLE3pr6FuXMkIzwkIJNfEhOU0F/g/Gr6w0ybVCMbSyr70mFZIwjlFMnbd
	3W04aLFsZ9OaqcS4s8gFeS4Wzb/tL5GAFiVvVaxpxZQ9+egmgFArId9N3x8r79xHo3vWXQXKscF
	tiSCqKYz/mRU8SxPP3Locpzg+fzg3phxQyNrjDCUtxCWFxLAp5p3P9GbDnhaCXFW5sMf7pfl3+m
	VFdXA5XSq+jfJmGi1YyU3sNuhqCeint6HCJ9SgYmX8roPCnO6H2fIRgPhVZlBjGOQq9rJvf/Bj0
	9xc80W6NJgH8iOuKlvWxvnl4PhYcGPbISYfKByylWOfoUt/i66d8Odi362ljGmd4/xn9U2X3utU
	GuS+zqg1o2kOpzsyzOmVDf1ufUybifC3BTE20XqmYu+7JsY=
X-Received: by 2002:a17:90b:4a51:b0:3a7:cdf9:902f with SMTP id 98e67ed59e1d1-3a7ce18735emr442657a91.1.1791094005403;
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:44 +1000
Subject: [PATCH v2 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-17-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QxC34/UMd1dwtXfvSXfTwzpr185aO26s+XrVPWm
 cgpMvU0dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ60ntGhm8TvCI1f0Xfna2j67bCJVz39TzObS7lcwp2X/l+bndn2hNGho+S6RV
 5T+59vpkwscoqvlzc+5X27klWLgu/LQmd//ryRgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
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
+			reg = <1>;
+
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

