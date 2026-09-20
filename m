Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22634EEEE
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880366; cv=none; b=Uteg5omB6DeuBxohEZjM/j7EJqpfTGfrlbZSXkgzhdf930vCnnQg9MCWz/yNBy2BnnDWD10VUfbNPh85FpgR6mGXX8GxqhMbiFPjrAEmtEMTu7D4x3zsGzhdX9CWN8sZbMSmsbXMEwDM3+rAZcoEUf7/bQO2TzTnZbG0YHeGjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880366; c=relaxed/simple;
	bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B72prYraeYQxl3MadxFktlSglutf1/bBMoRg9p+/7oALax45tAzCJaiHMkLzfQTYsxhnNJU0T48LXUi7rwHzZmPAvfangPTl1eFMTLrK1uzV7Yuyzi0WPH7/myiye1cWQ8v+m14HzJJoHVzDW8Cnm+3U/aLqv6j/KP8P+XDaw40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7nND1Pj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7nND1Pj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso15050635ad.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880365; x=1790485165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=g7nND1PjQ9wD9XeWJspCo3QVuJmVc5fe2c7Npa0as0MJt3vkRwy9C4VwnmpHXsgI47
         nWfNSIz4XhQdCvOlX2FddeU0HDd5543UtxwRqn8yiwRrovNCK+tkHw377HBkFpP3j/Xa
         PDztO78pU7GjPN3xFZ7S666QbnBtKR3lAyXKsSlqrorEQ9C6nhcirJ4+1dGxTtyudJVf
         JZVQz7DCZXx9Rjs9aF9PJCOwxgKzTLpzdjLZD3K1TxSysAD9R8+gXRPpWZDDB5+8jYub
         ppbe7rtAfNd0Z0TqZvmKArYOOMgOIIiW1rFVe/FHaA1fkz3Po9zKWkSRNIDS4Gmeyo9v
         me4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880365; x=1790485165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=msRAibz2XW/59OAmLCp/sgfHkU1wdCOV6NOHQ1MQggAjZbmoSJ995mJBBt62LHDTX2
         kiEMsgEIqEhuqGhFa857xO+GlucBJ3kLM9QrzaOcSVbxRiN91Ltc+WF/w3Xh2pNT2va2
         LGn8hlkoGWIvAoVXEYSRjknNOdQd69TJt9asrNphNPtsq+vozJDa1xXFPfivShuQrfQ6
         C6YJD4uASB3ir+yajhjzQBWnpQCuU0Wz5RgDChcpvayItOmZEAtWPOhpPNwkc+fnrvjK
         DQ7EFvcVy4OA665VWS7fl3V8ZZRQjjLqhd9/wkVNN4FrXPGHDq3HgxlCAJ3/3Ctr/MoQ
         GEXA==
X-Forwarded-Encrypted: i=1; AKwUvByCtUyEM3yKhB6ZK6PdX2AmrnVn23sU6/yK3YUqHt0tEVX8ysSvzfKKVBhHR/hnSIAyGc2yuEy245DdDA==@vger.kernel.org
X-Gm-Message-State: AFuF++kt8hCBEFI9cYmj8K5SdCUroHUh/Hlw5ksARZ4NaiZs/7Y7Ml42
	qzP8EYBXw8l5dhHiVolOhCL63SC+NNC4Li2M3/pytvGvc5eGvPBNXQSS
X-Gm-Gg: AYBFou336FQkkRvVvsBU09GTpo6xXo4OQ+Hj4DZ79r/IyvR7C2u48Rz7MrftAHSSdjc
	SfVAQdrqbqiDQUMOJjKR/YJWD+/OPUBX2XMd4fiGHKKuhDpzQB9Fanec8Qh6sDHGg7dWC5mn6D2
	F+K+wq6ZZAmQqnTjn3djD4wXk8lGuYiRZmxuhgpfcd7wXr1O7qDiWaDWgKZuHZzcBcGC0gS8kl6
	J6zNOvb3uw3HfeZxgJOLm5YlXatrxIg4cabcIz4unkxy175/ElLcby2CRwOSoen8tPf7X2GMmnc
	PGDBaGWU5TUVTuIdh4pAF1q3RCramDmGSBTkOpGeZO4B9rk+rUOqVhgIjYU6+lvcn+hKI/gbkhT
	Qx0BuYVrTZoEcaqbjkFImGfbbtLsvlQ35GRRBq1i+0MjKPEnLhDJReaJpruNFjfHdeWwPF7eYAG
	2u0daWn9xYu4Kt2Ds/1Vxi9k5GmmbVrceVN57C2/CXgzMy+HuV/yRMagWaXZbAXq4EtUBq07FgL
	movXnoyLHti/6YcFb5LEhuPZ/7mwhLRjR3ChwUVx/+GivYZNdbMfckgf0qZfe6+/27TovJL9L+V
	53EavvCmh9gLlJ6FpS3oZLFLGLEwzh+6wQLmUe/PJy8VVyM=
X-Received: by 2002:a17:902:d4cb:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2ddc053e14amr57727015ad.38.1789880364897;
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:07 +1000
Subject: [PATCH 28/28] arm64: dts: apple: t602x-j47x: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-28-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VFbxtZ2sxO6rz5yvjZ5FtlffdnP/XfybTQ3vFf9
 vQgWa01HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlebcbIsNF/880JArN/VbEXGrKU3y9d/+feZy3e5XYinUf3PvpbEcvwv3o111H
 9zCXse1hj/pyY9fsPb83NyDkbHzH1O+07w70vhgkA
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
index e3c2635d84fa..e79315b15f11 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio", "apple,macaudio";
+	model = "Mac Studio J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..8aecd23e0ac3 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..91ba7c1d2612 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
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

