Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD173F9F3C
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094038; cv=none; b=Kmson+hKQ1ufDZF8cqDawTmY6qcdgCfyxzhkz68QbZdTfNqrvYimRdZY0Uvt30jfWlqD64ONQwErGAa2mDIiJbU1jcoLf4nYQcNRjMStaugNKB1kXMUpBPg2uEckvWF1087D7I9997L7fmJB5ovJ3KhFaqp56sIsU2iVMyM47yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094038; c=relaxed/simple;
	bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFcyIXJpq+tqhTO/f/TSKVnhHIFCkyhGN4HujvOgyp3AJXsnJW8e+atD1/nExAjqfwGZ/9+IhNhGZoovp6dP1EXhV0RSuSkFpWuwF35I+fQV3+WFrB81SN/Osn8beJ/eM3Owtkxp5adA2mFfDccB6de86lIXZ4g2OSroYuTAIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzPnLf1U; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzPnLf1U"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a7d7287703so121555a91.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094036; x=1791698836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=hzPnLf1UAeUQh+tNxlKZP7VWMSTVYs4PhOeEg71KFKO7EHGgiAQW+tdBeBAZlXUbs+
         oQ6tst3fjTyiEYeAggWwkN9h3XbCw2g9WCsZ2IdqW+4ja3vPaCRcYVJ/Xdw1UnsB3y6f
         xmq68vLR1g0r1yr5ggJNZp8Xn+IGa31F22CU8mYe6gL2C8OFg+5HEwQ+7HJ715EXk+wC
         +sPRkpP9GaV5GTpQSeHYS3hli9/6WLoKA/RulhXx4g6xIILtbLGMjCSZN7afk73Ojm1V
         e8uLE9beH571ytRuULxMOwWKWp8+ZSRUF8nb6jCNHV1NknDD8Wf06BQNYSk6O2Vli4A/
         a55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094036; x=1791698836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=PfeCtHX2ums0r9E9iu9jcdz8VD+JjX9cCqRFS+y5kuhc6OQC5nkJ9ON1C/QYHkpftN
         qfC9f1rbHH2OREUp62EIz1muzwipdPv3BW7HK8xGwX1nHicm7TussFrRuvaj3MASW6my
         x/PCTK9WiCxbZFUd5+wM0/lkBkxhhyf0wivcine4vNXSUJ1t7sriTlhQKzoHG4dJdtrs
         zw9V79RV7YiIXm29N8JL9UQwyyqXeZEBpwnyhE/rGjwZZXIZrCikJSl/KX4yEjpZ3OB/
         ntofQFiWvmDnKXiNZr0ptn0bNcxtfB8mTZ7rcIfX2DIXcdT63tlwv1lJHC1H7dYwkDs2
         BeWw==
X-Forwarded-Encrypted: i=1; AKwUvBw/Gf+PcK9n82auc5iI4vB0LmLYPd2RSrrlBtACwTYT3UR2rgxSmE+L5g95aeUaROMO8I2HrPFi15ToEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK9b3Yo6YhbWt/Js8x45ZoGOVFbJFGMUoXJYJIl5b3Fpxn2oV6B
	Qq7kzhPNVqxdwaLP4o64U1V1Upmoh7ao4ySZeyIoGw6KNu65p2gkI0iG
X-Gm-Gg: AYBFou3nTBQm5KSKAKzXicN+Lk0q8UqjWhgkQwHqvj1pPlrfuKU2FTC7JNfLWu1z95c
	sq3+Ocxnhvgr4P89m0WNvmd1h8kZ9+jRqODu886Z75kbJbnvOEnQGBcKOcTl6WS0OJY+WXmY4eF
	0idkH1qJ16WGBMH6tXQOh3DA1dqPtucIlFk63piy+QmkerziDf2hV3GH7QwHuNvwU3CFXRfkxqc
	l/sh6DW4Hw4qw/OogQz7Mte3XmSog/fJMX28BenKuH2aKIIK+F6z5SfGbWO2mz43Hh6LkXp4LXt
	Bk7UcvPCef9ierprDUVeEgBr98oHnGpUHkDqVfPvv+RvhDnGiJukYGO/HkrjL6h2DTM/fpsKZu0
	e0REtCT2DK840FlozijXD8qtZXqoyxa8qEq/uX+7ywlnx8vpUA5J3RV/c8z5g+psjWuHm5lpXNb
	UG1P2FV2u0UNyX201G2cV11R5IkXRy6ERKucTuPW+xl7cvZwVUnx8qYQRxsP+tsOw/5Ddw5VGnR
	BwxdymIfrmUnXTh6WolooDcETiBbNoyZvOOs9sQyef0XPI9f9XVI/o5gxgknBkr1T1fcUzUmLBO
	Q+gzyUWZpborBh/QPzRWu6Mh5XlrZMSwqgZVRmfxF4b+gfo=
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2837779a91.39.1791094036003;
        Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:48 +1000
Subject: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rf2a8aUrExzb1QOepzh8zJfDu2xPAy/q8rvjbJZ
 8xfeqK1YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW/tzAyTH/13rXH33uWx1NR3gB53XwtpaUvo/kPyArq3Wd/sm35NEaGnR6/n6y
 /xiJSZzNZ7uVUVp0VBRsfaWW1plgdP7/06ZMTLAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..7b4c4ef471be 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0

