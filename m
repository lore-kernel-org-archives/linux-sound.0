Received: from mail-pj2-f21.google.com (mail-pj2-f21.google.com [74.125.227.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D03D1CC6
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880303; cv=none; b=tW5PZIGQLp1qE/bIlgElhnAQbQiLgggSZ4+H6zMVbeUbW4HOuoKvyCKbIQThzwULvnjsW/FdsrUQuF6c9CMAWZtj3irAe3FzcVFFElqAp6rK9Mymt9jeOblbxIglWXECDLSGxeA+b7wtAckZv44xDJmlRp6iBpQB1y7XPvUOeJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880303; c=relaxed/simple;
	bh=cMTjWQ2NYQrAfPSCsxwJy6m7qzo21To+mIsntW6H2OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVUNB7n9bynyJ9dn868SR1itRd8LQ3aDYAgldkRlHPUqOMis5jutc4KncYUkuqSi8MOSkc/g/BH2SLDyNxJX/ukCF9hfELMaWAkFAzV5a4ge/w5P8QwP4ug/jyJrPpTQ/XUid5D3DWnxe6LH5HWFXJtKR1YQDY4d0U6Q4F4e8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BS9aduNT; arc=none smtp.client-ip=74.125.227.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BS9aduNT"
Received: by mail-pj2-f21.google.com with SMTP id d9443c01a7336-2d747f0b25dso21888785ad.2
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880301; x=1790485101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=;
        b=BS9aduNT8mnNBwO+VBmk3Iy159bBaECMKf0RuEqxPGYzvvGIzbFBW5xEbKe6MtAFzZ
         qqIcqS3psc3Lg69MBSYhH5xoW1Udo3DyS59sHgu/DBwkbxzI8hC9LXNF1QIBC4FWs6Uc
         lcwFl8Uf1dYiyhyZ4BCgPxxWYjJrwjoEN2J5SMpWRo6DLaTuqfVxWCcgrmXp5O2UJ4H6
         iZUvkRUu2R3BBmWgs2MvETkRYGieRPrkiDP3AWj8eFzoivF+/fO/pdt7fJGJmx12iXbg
         I3PXn+e57FE0VYrsNdFiwhhxO5EARxQQguWZvq5oqgKHWC6lCkzUgdLIORu8237O8pN1
         h1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880301; x=1790485101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=;
        b=CfW25ma+TVeYKvirZbC+pr+31ZW/LMcmP+QCUoEL/Kfvrhzokrqh+lZBoBthA0xbUM
         M1yn1CNDkejhVK0bcm3RsE9AUUNo6gr32jkVkMXFXjSUrkl5T9ns0DR/MKNsA8AQu9n8
         PQghI6kGE86xTJZSdZ5JiQ6HmLd63gKC+OtJkFcaAhGeKYhXcmUlcaIpLizs6gQGO2ZG
         lf3/WSKzyD1W7v0AcWvMl0cINN6vbNa4Bz+7DZbpPAjEi4nVYQkWlWtn/GdC11CmIhUj
         biDLlfAIosUuErEwLWK3M+QmoN+AT9lCt9B2LI055WuLvW+jM8FPjansRAWhV/F2seDS
         RR+g==
X-Forwarded-Encrypted: i=1; AKwUvBy6uFQqFZtL6xQe8Eu7MVqUjNfqakpOR4j3m9R0G4wkh/Tr1zu1R5sdxwV7HtMCfOww4/PdOHVTPIPR+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kyAjAwcqKTD99jgvj0YwwsTqtrB/nDU4Tv/O44/G46n7M25Y80
	pTObRWMbri0wfRKtw+TNumwpYg4lHAXTSRVKoYPURyUCuMrCBgQ5jssM
X-Gm-Gg: AYBFou0QmMLW0RlUfqUfC/gf+WzlMKvwZ2vh6isZtlGHRyJINFnvYra9DD6wOXOxcNq
	LRwUZN3MIPQXJDwqDNvEVsXXwW/Ae5hxPPP4ypUGGa7KkRwyYtgCXKnm9KfnGgWMvajF4WmLvTY
	jcDxZGOsiE6AxuJcgHdyVRmisctssiFVYYdT+yS7Cr/sOcip12Wu0sShJQA235fvdltsscP4heA
	Iyfe6WaO7fIIPGKH2wSk0BvvFd0vtEAZDOql1OUmRIl+aGf8XbibFCY0kNX2XXi02E9lMD6btVM
	ujRZJUL5X2l2+EuWmEwF9a5fAzgqC/CkVmbe7HC8LwasM4xSPPu7+rcKr+1eA0dNBo9vQbwbNj1
	Cjo4DrTm+qsBMm5LDJ+EYJq/EJmSUHcNmFyIDpgErYzPRX2Lit2oJvv+sy80Vuto+AzjQMQ7KYh
	q7vTpexD8kkVy5J+xVtU4n1NYMg5vJ+2rzfHuw8M2MOPucr7lVSmdJPEbqw467J6QVXdTs907HB
	JvdLWc2bT0TnmgnnavggghmTd/AsuAnJW+BpI2/1M3VceRvBnpAQsTaMo9n4KOcAg/1Q/t2CIRB
	TRqATgzYanvKMxe6amoh5VUZ13EPWdmcwySqt+VK+Nv+hkc=
X-Received: by 2002:a17:902:eccf:b0:2db:210f:c111 with SMTP id d9443c01a7336-2ddb1ab4ef6mr125516895ad.2.1789880301114;
        Sat, 19 Sep 2026 21:58:21 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:00 +1000
Subject: [PATCH 21/28] arm64: dts: apple: t8112-j413: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-21-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cMTjWQ2NYQrAfPSCsxwJy6m7qzo21To+mIsntW6H2OY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuP+DMftLnqRZtuGTlf3b/ValBqobdPzubNFVFO
 RcEp1/pmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPXWbYwMk/+Z3n3DFRUan37nVNuMtc4q8mc2s7MsW5H9P3H+FbdnWgx/xdtnmzw
 vucN5cprA1im5nl5GBpIXljl2/tp07eZyTZdgHgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..38d0e33c701c 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,105 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j413-macaudio", "apple,macaudio";
+		model = "MacBook Air J413";
+
+		dai-link@0 {
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

