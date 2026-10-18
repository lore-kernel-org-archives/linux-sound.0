Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F83BBFD5
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303028; cv=none; b=n7nhzDMsjaFhgVgraRxtcBDxGpLISTIswQo8XrVAa+yp7ON62M/hSuAb0qF8iywGRnU6LrDE7Kaxqs9pTXVvHg8jV6tVHqypt6vHKW8tklJzi4gcUW1h/ovGxz3vt88PB7jEMEG0zFYZSUwD38Ad2bseG8xO+gZsOwUkOnYDH2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303028; c=relaxed/simple;
	bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQIeE491chPg9d5P+HW6wN3fMB6WSBbElu1s1JqIpkX22XYd1CAetLd1cn3kaaqo57oL02xhWjEEr8wNRqMTkI4r4uEoFlUYSwIkbVgRmgYV5I2TF1y1Hk2Q4YCxO5tjxdwokL/00aFD8euX1LXQVt2oUnRZGVDKvRVwEmPbnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY1nyBB7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY1nyBB7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so786719a91.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303027; x=1792907827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=aY1nyBB7Az1Snc04SUBkW8P6rAZ6Ic+o05ABNkciyRjwDWkz1KqzpIMgp1T8YTsvYJ
         qilTpmr0zhFJB0IJmH59zZm20oqyA05f9b6pD2nnPH4cmHK6j5S65Pn4/nXw8ZDDQYnm
         Tp9SpXXZO0AzxGNfZar3mwwD0szbCjp9ISOSvr7O8gal0VvthCmTZVjCTWtQqvn7bCv+
         /Rp1fmnJIrs7oMFfqUAV0zlsVZMndXvfssfP9ZIwJqBgVlJfNm56XQRzGSyGCxiql5aA
         rTIXcM6028JM0TsmXJI9PT3tfi2gt4809ajQpFsvlR5NT2mtFekRS/1wv+ZBixzvJVYx
         b4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303027; x=1792907827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=A6dupRWKndaiA7qZU0btGILzv3kgpezUaIqrJ+Pha3Rmt769Bsdlfr0+oeOipTB4yK
         pJ17jHoc6hJZymt3ATGdZhocegzCsQ18vsIammHfqNBgDday1IWTWH6e0z+mJdg03cXZ
         8iLIt0ifbXWKzE1JF4Ewa/mHzC5UpZwOvn5PYAOp+Q9qmaltIF+4JuSmQtJzD30T1wze
         kwv0uM+ZloyhLlQ9UbahLrkihp9qf9Z0XPZVxbbQasGrqMB4IjzC6DWqOq1cBp9runNd
         dDBLcNT81SAORZAJZ3gcuWHAZNsbeUBlP6O2FNHQpbhll3TOgLPjWHBocUYMFv2RE+XA
         7Stg==
X-Forwarded-Encrypted: i=1; AKwUvBwhGohMEa3R66bsuOxZjBJBasSmgi8MpZqVOZgEpme+5WpWanhvHohhI33zEgQBXk0miTU0TyOmB746pA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzVF7va0zZKMtyD6SJgMjWrPKkaD4zpwT40bnd2L4q+XgdGRYs
	aQHT+BWCTO8//xk8b9v3LhKbk4Y3gYbhO33eoH2WUOuNpNozIiP3hZnY
X-Gm-Gg: AYBFou1eIyi3ESvKATN5EpvBl4IJCiCKLuMf0ksiqf10ZivSUC1PwH0lRCIkvhSlxro
	vosztKNalLOI5KARoTQ8zt3AcZsyvabZuR9esdJgyxSek0FSaamxJY0p9qa9C93wyxAOwRBu8/o
	3kYVyAUiXujAOaA47o5nKy1u3eG0iwBq1ztrDunXKYu3YkPb5BznTyUfQbWbaxPYkkQwqn6vokj
	PfVHNUgeo7URF14aoYdaOM03jWn9IJ4ggRpvaIMsbS80ARhzJvW1EMFk+3m29b6gf0Ks5ut/LOP
	4w1UGMTG6gUGEUhfSjz1b6O+mTiPTeCo28abg2o4YKYSMRvyIIGAoVTKdzc6seSTYvrfEO+KN6z
	0243tXPX1xqfE66KOotTJ+tojbhGSEGMqANk0bMhsMB4Idfx63QpduOOdXA/XPsC0dVPl9JpOqZ
	f0JUkzDaqpHYO0Z47a1mVs2CQEbTDpyqNEgFJHgsO1tL/pWwmLlPSvnkhI990SKHhhrCkRgrTlC
	kW+1qBhK+EZx8Q42tyorez1H0/982tEusCViO5ZNFZpnV7SBuI/YwfOT7Y3Vex1Czy7RmGrrYi6
	XNaYsDlQkBpmq49ONQRIkT0HghkbjzJqiYW3SX5lilOuhg==
X-Received: by 2002:a17:90b:574b:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3acef1455e2mr2608414a91.21.1792303026863;
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:10 +1000
Subject: [PATCH v3 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-16-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vk0WW5rpj6bePiVjcsp16Lfqzil65TuCy+bap0h8
 FSdsZW/YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVR9xn+Z0QrbdPOTf875YKM+dsJj+conv81Y/chW//Ml2FFBrda2hj+J3+ffyc
 oeWGv1wFtZbaWyhtMj7/sNUw98ZvN44//Moe5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0

