Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935683D3302
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880323; cv=none; b=pJU1cECEsLJjB0IIk79GYg3a+w/E0fBBm2lwtkHCMx0ztuHvwr5qtTVmc5B/ZdDogtA/kwrJyKokxQB5NGLIbRYkb++dzm1FGPUHEu0Wo/0z2NdVrZWj20lsXaUNmeWuT8qrFBOtrct381SlMIVRETbX6OWvPTCy1nDVCa2pi1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880323; c=relaxed/simple;
	bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkNwAZttdhDn9kNu2Lcg8yDHZtstzcmr/Dn3Sl7ery44dmTzTFiRZ0nENFLnd4par/ybZsLFG1BjNUy9l+enA9QZvMw3PzrOVWP9Iz9vu7lI5hOEALTuUiAeUvshP8e3IO341fHU08bS4OBJ2kCl24wJolZ79gKcHszJ+bB+t7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9nfcVp2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9nfcVp2"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so19907845ad.3
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880320; x=1790485120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=i9nfcVp2Dry3qKRflYmMIdXL6MjoEVFxvL2T7tgECLVqB8PX8p2VLC2wlMFhEdv2EQ
         zBxHlQVRAjgGQ+xmUg9yKpDgg1Sf5LonBpgvbvC9BMhOfM3rKuenvECpxiWS0/NAuoci
         QutVICTSOo9pMgUt9kZpZqJL2SOh8DWdYC5VS5sgJwtEAgWGRG2Eep9eGMXdIk7yZizx
         hlBe4knhiLaFEx8mtTceQ88RRJLoxmxJWKMkDhO3ZlqQV2QgLT7m3LLUtZOXHcIQnKmz
         0GB/3KFq/OzJSixTB5GVnWFeM+Crisz66sI/8WFUJpPJ+i0r/ua7HTZ257BTMyLZw9qf
         +pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880320; x=1790485120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=x0aThhqlpKAwknISVlQcVJ9VkZ2UgvP5QsDwgtvsKuRGu9A+7TKSZET65Sheb7XJ07
         8PIZcxfVWKqPnny6/NnWKg6xYMW8OEiqXXvCO94z6yg8vE7oCFH7vp9UXs5a8ANgUjm+
         J2IbLYgxZc6FNwxs2lDJrCAvPa9c7gxiKOBJQIR27jAcPOEp1GHwqOT4MkngPicJ3+qU
         OcoSO9LAnA5zVgkG2n8p/qS8/A9+ca25iE1MXr2Ly8i0dgTHZEWSHPTNika1+/p7QFuU
         5PYONBcbS8pIjdL7kMnHDnjNyMbFjMkxMukclhf92jlDPGbls7F0Zp/a61QRrE90Yt4l
         dE2Q==
X-Forwarded-Encrypted: i=1; AKwUvBydS/TLuOtUJN64/Ky9UvMhgSlSJf/7aivI6IkbPANVozY/5vPMxzZHjmMwuZhvBES7D3LzlLPU53SgCg==@vger.kernel.org
X-Gm-Message-State: AFuF++m/9/LZDmO7zy0q0DNDiB0RFMobpglwZehEOPT7IzyZKWXdL8J6
	A11Lysmh/xHsLDorMOVez9g8w3AZp+zjQh/BQHWTP+PB13uXsdiNJuV9
X-Gm-Gg: AYBFou3QfvOlDwA1y+5uUH+mdWTBvpYOPLK4f0cyVuDk7Qj2HBER3vGMKFZtXdrRYZo
	qGAxroIrleSDaoxepU7l0uP+OMjHNjkobUjH6FLp9LnNN+mYxFAaAYGKBY1X21xu03FXLUqD/fg
	I6mosMz/VlQu6RbyWRG5T0l99n/znSa1eOq+Cl7zIcdFypCvc+XrAhRZZGj8JFMrxyiRbY2Klgz
	foNIs0mLQzOAxFHiIN/Ittw5r/q/+0ZS/zNm+MPg0RnOo6IiBHJLjFWoWxsCOsNob/kEhCOMbQ6
	e39xXK3wYoEqnR+LHVGBeq8GLC8gipIvKNYw6Uo+6t2ItCfxFsQ5ORbsZ0bQi2WGUksjli7XOxH
	fp9EpQWKxRx5FpHiMRBVMcC/j2jOAC6JWZmd5N0NyfzNW+F2woYQfSbMfYgnDQWml1QLkL5JiKH
	7oRIjpTm7ydrxljfH3FpS8GI3Hyn8CZAckYReV6BLnrudAyOOxGZcPtj4LrixhROjhDxKqWILY7
	Bruk7fall9ywUfSSbE7I8324L2r24JxfmXkpXMyR2PShivxrjhq4PyAFLZiwlkoRGUTQ4ykiI3x
	+JDmExbRvQOWAIkh4iWPiM/hQ+3sYCEurc8hVl9Ty54h+v8=
X-Received: by 2002:a17:902:728c:b0:2dd:ad74:ac1f with SMTP id d9443c01a7336-2ddb1bb26e7mr76373875ad.26.1789880319821;
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:02 +1000
Subject: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VcxLh0uAQ6FiSlzpQTeSvnrh373E/mvGIyzzXm2
 3z983M7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUz3rDsM/ZaXESME8nayVqaKSDUuiH7OXfN39fW9z/Qe1+UohogezGBmOzPm6p4P
 dwPaF7e1y78Xaonw8ektLpG0KnYNSTkqcXcYEAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..50088283f2e8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,59 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j473-macaudio", "apple,macaudio";
+		model = "Mac mini J473";
+
+		dai-link@0 {
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
2.55.0

