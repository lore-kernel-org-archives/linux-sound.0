Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFFE3BBFD5
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303009; cv=none; b=pIBhX2AODT7yEX6LpekzbLH33D7et88SnKjogMzumqrHXwSdbFMq649rydAKW34qr5thr5ardhmskCBizGZI8aOp9nW3Rz68yV0EzGfykr9u+6+LxOHBb0aVHhYVGBvkJGWYX6ObDvCLqmKmH+O7Eqauac0cZ5Sv+wxqEcog5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303009; c=relaxed/simple;
	bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ja4ZbrJTBzwYZf7v/u6CYIP0vqvNDaepM378g4447xFtBz81c2dkYzDi0FaAqfL4vGlMmssB2mfV4m6fxLXEMPD0Rm2W0X1dSkVl4sRNSRSsKk5J4eqQBCnD1FAuHTX7Tq4Bo12OyamiJb/AxuPTSH0QPALL6Ep3xgKEdPLwVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEicspo2; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEicspo2"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso573809a91.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303008; x=1792907808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=EEicspo2rgR1NztvjJpioz9w57b+aW2EjfGySDcin0m3aQtmsU2Cv0TqOCurKOJ3/B
         IraSR8de4RbFSKRPbjzpcL7GO7NVj5M6uTci6WOhesJGpOx4V2vieYJbhaQ3YRxNwv4E
         5oN+JtYb4YdeBmgdtKpdCY6orLM64uJ8+KssA+TQd5m1V1cbrcvkftop+8nOH1feRTG2
         mZaQ1rkan8iI76fdKhEJoEBRrK7pupEwfrVe8xdo0R5QftVv3Hr25t7x+BDc8V3m1R2R
         eLcJJlASuo4ABvS9/PZFk40wG3X+osvY3PbYHRggunTH8JO9YhzqvUWteo4mI/QmGI2D
         IYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303008; x=1792907808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=KhLmQPN+sE8LKcLegLbn5x3HhOGfjkJoECjOvfaR3kguBdfFl0QI4p4z0YckgxSxTp
         VGl/aullC81W0eXdzGjWLSacotE7IgWuhMaRxSZR0mc0dQYTghJJupnuzElkZ1Jyoszi
         5WB/fByNL5h2bZioWbDBmKraGGU8kC/KjQH2quFjlcy4PXp983fDTOpX3/X4NfDrEd7K
         zcX5F7OmWp3F0m1bKMdxoDWdMMQ8bfYG48Nib0bsyTU8Qur/MT6DJ3DmWO2Z/clWSZLU
         SG9UKRC+jUzaOOrmGPA6VywCykY0Xq++nLUpLVeksw03wV+Wqi44pgn/OJ07592THEed
         f4lg==
X-Forwarded-Encrypted: i=1; AKwUvBzh/HdvM79Dp6Fty2SzaI5L7JII0IMki/nqRqcbN4MXl5FPvZO8eMEVqjbtzSSQtvaurspLh2WO4nlSDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKNWwBVpwxEkePD2qWlmUnH5KkaizSe+QzhTe5eMcO12szkNfG
	cHiQ+mMkBXERLTJjgLNUVV8lJgyA38u/LtoFTLPvbxWB8YU67XeWfnJe
X-Gm-Gg: AYBFou0zxouZ9KtYgaWcHv2toxmhHdfOaemLqvGnUXK/jx22pkCvfHtkmLHfHpHlmru
	X+GYs2e4o8nvgvTixlIILdgGzBBgXe+FqM7G4Jn9lS7JdvsKGMD2cmUMushBmQEV1zffVYsT4j0
	xsZV9XCGFC90tyaJDCS8AJgAw9scLKhbuD7d9kTX9IHVvSCVrdr63etEXt7pijbTHSgLrTNsY7Z
	4w0I8yJXjCQ6AikMkUiE3TEbMsRFX1NKPc8CfKQCE9Ockzs0tHqEoH6uh5gVs0ntegcyX0JzaWC
	hM6WCZnd1A3CjDMMJSrU5oN69lRwjyf4H/YONCZvqBn7PjfG8MCvBbKjIlHtF+vj3td6qcCkqsc
	1XdoHJ7ZLWrC6ZT18LaCi2dfmubYrhY2S8D7Nm7h+nR6pZc+MF4WneWZYF3Y1tdhV7KFZT8DegW
	bPytB0cT9Aqf2D3ruSARJUDJc6H8vE/YqjNWfTbbDuP4vtz3Ew04vWap7f8wTTt+y+H3AlANgF9
	j490x4bkHqtMksPAkv3Efl2wMgT2HMxzFoL+VO4oITYBrSYdeVcifrFV26eOa+xTv2yz2NpGSCb
	ku3vz3H7UHxQ2zIlFU0BCvSwmJxzygHwvKZOW/cltPFdbJy6c2kfpz9K
X-Received: by 2002:a17:90b:4403:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3acee277aeamr3445331a91.6.1792303007868;
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:08 +1000
Subject: [PATCH v3 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-14-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnX+KUfj5e7JO+wvi9ik+yT2s6vbRGh+W23BDaIG
 +asTJDtmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWiLoZ/ig92rPZILWu+eLD3r0WNtXlBwxeHvskr01arqft61ZxmZPgr37v++BT
 3oCslcj7OK65N4/1zwb1w89sT0VenrF4msHIlMwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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

-- 
2.56.0

