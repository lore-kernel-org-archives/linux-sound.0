Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C113168EE
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880276; cv=none; b=IV+tuFPSQA3FmamCyW6wU0iwLil7RU/vOpzuK+CGVY4CoDDeG9muoZKUMIp6xdd59WAqLsNkBsxTU+x/fXDLyVBfiNQn+bC5iLBZY9mB89P8sc6Ah/KTqLvq3tVykn7lLlGV54R88akL9943wazALHxmqHgVGZjNGOh9SZ13EB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880276; c=relaxed/simple;
	bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYWJUe1Wpv71HiRptDcoqzqsHuhGfZquGg1w0IwcfIk4dxaPhPyxk2TxIQ1QZ2EEGOfXm2oc3Kva7gokyuHiOUnCFrhKBYUrOWnnOj9fl0xf7kjzTX7b+AgoTd1dY/i0c3swmjzk4Qk5QRjqLtVEJ9gLAVF9RvtjnsGf0VCYql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT47P8Zd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT47P8Zd"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so12422905ad.2
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880274; x=1790485074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=FT47P8ZdXqNLrA1/YaDL7kkmG7C6kBgTfcwFi561e98X7/F8ENMY1CZBbiqWMILDkL
         eKL2X3Zbd3vCcFAFN3+sVpj/cthPDj1hF9jRZo6q2z4HpeLF0sir7IxoWE1KbdYCSV2L
         hoiyUWt+nxijYVqTtTHjLQ/PHVcYPN2Q0XkzhQnDUHvyj+KV0EW6nu/tQZ1Y2fV+o8pM
         WmKM++7kEEZndFj29XYQv84xFHVmzFbb85cWhMVUFapcUn8u4Of10xeg6sPjteSnuH5g
         TLBt89vwCBinyTTmxRge5C5/FibdKFJNhU67CeID44AkhT2o3Ga46imaBXPf/yFp+wRr
         LPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880274; x=1790485074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=GEUXZlCZzU8Vqv9U0bjOmswsN9fWkt+MO+6Wv8b3X3PhtjuVBP3VsDTsuNRg9ivv1H
         HnWflmaI2lXLM6lr+z47Ci/kEODDrfSWp0LwumawNdHfsbWHsYRlglIoGdCRRvwqZVm4
         BrBjfr8xOJ4+BlAfd57VoFG99qFMvcdyCtIo7DESKIqn+sZ4pZpyMKexfU4fRQ6f8Y7G
         PWj4cgYgXlO6oNNyaKOscVCtycxFNZ+5Z15OPGGCtb9MfdacClQU1Y9es7SXNTGMkGqJ
         GszNWG63MXd95NE54rVkGKg4qSzfnm/KJXe0faXFMFtxuGDJ7mQzzNO6J4MskDIb4GDU
         qzuw==
X-Forwarded-Encrypted: i=1; AKwUvBxIIu73feZvor+Es2nrnzH0jWeDj9HVSBNObjd04zhQHJGwh2oSzTsiM1JXr2cjfeF4RcpacOlgG1lMWA==@vger.kernel.org
X-Gm-Message-State: AFuF++m9N5nRUTs1xpDASghJvOgZ0A3CZA3hdKd4OwE8ARHXbFwpbLLF
	GS6SfhtncshOd2iViNfqXdf2Cz4MJeqs1ysPyF0VWcOI3meAVSancsKl
X-Gm-Gg: AYBFou0NiGdljf7YFsTM+hZoriGyNYbGDBWHWGLNQVsJf2TrgMLSkkv6vpcGuQ97o/z
	JOCZgVbMZaJfmGhdarSEie0fsV81mGSflWYZ5H/UuwsIht1rchtmwuaJjc7x+MgU6r2AQYaI5MP
	Sdt6ZBvFw3UZ3J2IqR+cCsBQX3fQyuumgdXYE6PPyOvErD0KCze/LUKqJFkMZbYZ73vs2ojFJ9B
	PHrEp5EHP9fZjP2zn8556jVTA8rtRI/1rRWT9eBC42QUNapxcOw/7ZBR1bgaVMW5ig2CYj0eP9p
	Ru13nhouE19cL5rkiX7LWwBZjrIxKLIja59BTi7yDq+wxpVpD7RT6XhlAntycgV5qWZMrOSWed+
	fC2WkAWr70Xv02hpvAA0buBr38u++DbIhHfwbqFjNJuHR0/aCVNG907LhQDTOqvVbwc58yQ1F6s
	wG6VX6Ty3fgQzoROxJaSwdGVvffhl9c1hQapw8VR6z5X1tyNqHYBf3HD8/2XEwHw0fNOnZykSvc
	GuNkXf0jXx/bsH3xwZxuseGjswTdOgMr8QE6cKVtRVPDajUIK5usNChLjWT2TCIPXeqWgrzfYdX
	qmCxD/oNyvVzw2EOy2E8URRL6LK0Sn89pyJJdoTzu9SwKgs=
X-Received: by 2002:a17:903:1a0f:b0:2dd:c053:82ef with SMTP id d9443c01a7336-2ddc0538401mr56050135ad.38.1789880274403;
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:57 +1000
Subject: [PATCH 18/28] arm64: dts: apple: t8103-j313: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-18-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWb21c66G3M4JvHv35y8tKklc9PTDVZ/u9cp9Se1
 TM7LBnEOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPNLMTIMOnKCZnG5Qc/2M6KzS1409PptySZccGOP+mzG6/GRCytbmVk2J6X9P9
 4R3Mos7D4tdcO8pv3FzRPULvT+sC76gqvaqwXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 75 +++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..514dd56bc9f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,79 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
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
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio", "apple,macaudio";
+		model = "MacBook Air J313";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
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

