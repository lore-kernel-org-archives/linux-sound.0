Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E737BE64
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302991; cv=none; b=miuNAki55ntouM6a6odzkAVRqtttUqEGDFPd07PJ89sZaVzExPqUzT2ifRHGAqXmT8qaJras+/37tpiPrXUEmLiVIr8MWiL6mP20FC6hQgCh2P3QAz9D68taLYM5miftemj0Km6tVpw/5Dnm7aILY94+FJH96D0ESBDG5RTvlgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302991; c=relaxed/simple;
	bh=c4pOMeYRPHNd56Heby+nLsdCOiGFtaCe6E8JAhxsVKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvGS0ObF2H/wp4IkwBhSeRjy0J7byjoPvQEcAqRjkuaioLX617fkH7blDtIUW2ejXXlanjQIKNzAH5oUrBemrKnNMpoe7kr9IPUPO+VFMvGvQxWYVXk2iD1yAqx1C8hqAHPvc88nVk+rcg7Cq38mJF6vQjwUldYwHdaVubFlP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZPQN0Z3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZPQN0Z3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so709448a91.2
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302989; x=1792907789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMAvukaRhIvNfRDcaKZkT8BhbpfgN9KgcwyWQPsSqzs=;
        b=QZPQN0Z300s7OhpJjcoMQOBEC0J6hyTR8tBz3wWIt1QLLRMVDTOYkXFBy8Oc0DRVFk
         jmysX1OwbE3RZv2ISMhhH+MPG5CUP0GabwmAsgKPeU6ufDQHAYXEEYGoMPS+RZ3CUJie
         aaDQV8TjZ4cxTBL4vF7mgvB44RjIpdwvqB2Km0U3zAk3WQCQ42A6hZGdNHuZptDoG2tJ
         qQ6BhSAgo+JRBqTWIDOzUn8bm4sIYct6Yv0RMBYGZ1JziK1egEJ9khl3mljFgd2BSbj3
         XaTNS7X2eTuVf2V7b8OfyUmNTU8+FBdAYjOEN1JqjtDGWOYCVYnSZEnEZwiLBAaJKUlb
         aEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302989; x=1792907789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMAvukaRhIvNfRDcaKZkT8BhbpfgN9KgcwyWQPsSqzs=;
        b=tkvNnKisZfuZvxU0SmgC6r7tWKGm+Uzjxmg9Bir1iBWlvDsgzhEH0dgiNr4Gb/Uejg
         zAqwAjP98mx3p0eoRPXM+Eoue11Iac9D9hem1Q9kZGx2pPJewZxWWGrEegqFBplzWInR
         8tvokBxEo+tPNw48TIGCLaayTHPW/hKmA3IZuFwZD6Op61hBS5ur0RXZjvOq+pEa+wyz
         c6A4Bh2CjxwCwccv5EawoJzOVJL8/20UV353GqT8HRNjvlPn7jBWrVinrJWCkAqEmCCq
         ibZvXM05KtgiRVyA7cWd/+2tdNVRjIv62RK6uDlU1xbnuMfpdbRiiiUaFyATacmx4euS
         a5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrzHg2G2pBYSSzKBpiqLaoFUj27PdRJHlvcf5Vis6ceUK3Ina+ZrG4ZUIjXGE+YuQGMvsxscBCnFoa0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5LCzqH9RqeuQi+Zuisuym3x4Ve+USQw80cOLzLKXZQYEM4Dhv
	lO2Chq2FG4FRZ9w2f6lToaK/OCo7v3+WeADijUY5tlFs+aROS7FG9vZN
X-Gm-Gg: AYBFou3l7zNOIMQRACXw5+vGjB4SiMq7VZtw/2kyokqMqtbdrCiy7DZjbSnDcSvJ5LI
	HX8RwzXMeNS3p2yFKC1r2l4Bxvi+1xSU2uaBO75X2MXW2RRdnl3294BWB/LmdKBN5qhIgQZNWkJ
	UezWwTFi60bQgT+faZ2EDBjrmM3op0TksCUatVTes6b9+HQUyNAZVQfeqqRxp/z3SUBIY7VWPea
	qnl1WzHCDZc678Ur8ry+DAZH2JeTC7jyW/7f1ndhCCHCbI3pIXbGTQWeEr+1HvI3XnP5UBgG9E+
	4fvOo5sqnWTw/OKkXYtyIGqx9z+qLDDDsWeLwXRx3OQNLwv0RqCgwFLd/bJPHorgNbE0hz8X26O
	iCc58b+JTBFDiuBBi4Lpjziq9tPo+kcqqMKBp/RZBdaVN2w1okC595GECaVcMA4Ag07VJ0mzcV6
	pDZ1KrsK+9bvHOghDZf3X3kSJjhaISO92Z+dyjLvrtQK1kbIK23gPZWoySwfEAbFakHTSeVl+C2
	P81xyZsQT2thjuJ5Vx7/6Ox42dUwgF4PgwDmT2NGlXSz1WZ+BSEgQbcJl65pvjcPGD2DOEyAZqP
	vw8JVamD1oeU0KiqtO+0z6wSdXbxFrIXPKVSffCAQIj4Kw==
X-Received: by 2002:a17:90b:1805:b0:3ac:aa8d:19d8 with SMTP id 98e67ed59e1d1-3acef29cf14mr3792642a91.38.1792302988848;
        Sat, 17 Oct 2026 22:56:28 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:06 +1000
Subject: [PATCH v3 12/21] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-12-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3395;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=c4pOMeYRPHNd56Heby+nLsdCOiGFtaCe6E8JAhxsVKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnvLXed9mPfNOGEF0eOGOvLS8zz+vw8bK9GvdFSJ
 h93TZbqjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFS/1WZkeHxxxsXblQHl92JZ+qveH6qq+PzjVbHtmruHpXdxS8vMPsXI0LRupuY
 Fdv6IDCbnFV/dCxVeHtOofvfxRfciP8Ubc3tPMwIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 116 +++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..7d4907cefca9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,121 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
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
+		compatible = "ti,tas5770l";
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
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
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
+		compatible = "ti,tas5770l";
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
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
2.56.0

