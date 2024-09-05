Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4BB19755E
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527257; cv=none; b=hDmgpG1m3SIXe2/JVBDVQ0EP6jJd0AYMv7FiuLYfYSZE0Li7nngOxGFqdCDbKQ54JaQpmyR72QJkX3NBqxWsbzEmDnvLozRjo7zfiInX0lifIRiDgCphmGTuY86XAbAtG4gQED85H++J7CDGITC+AVpMcr1RbYJYrHgeh3XZsxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527257; c=relaxed/simple;
	bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErrKJHwH9H5IXiCoXqCs4o4DW8Ut6c1T2OOGvsrtAACg3JXjM4zn9CiVVvIAxuxby0kiTOXAcqQ9EIKN3ahLVIE6v09IgOQ43MtNcXPTi4eeaZhohHUudBPFHV190EjF8wMvY7dH2Rx+WcBa6yvF3rfFbo8KM3SdcNrrbo7RoDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ceTS+Kad; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ceTS+Kad"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-535be093a43so614838e87.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Sep 2024 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527253; x=1726132053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=ceTS+Kad/Hug7D1y3EauHJuZUZeTa0trfFs6o4e8n/S3Qjt83udFcau9cFkp9nV6sd
         yp9cfCSq66GNXoSCc+YVLnQ0PGz/O30oMMvFFs8ddM5RDfqtzTUk6JqR3RA3Si/DZ31s
         cXjC7WagcAHs+548pO1cKVZiCOuLxV01PlzpyIBPAIlsmvjg3RNKg6OTgLCDZ8c1IBqy
         VbcwBJeQ6Y5/Q5l5l2PX8srZhboTB7o4C4px+tNSbV1SwSkElhRV95QkM+oVrmupXMA6
         mo3/5RYR4hrIc4LyIZFWz9sZ6544VdadYhNurH5ltpoVcJKeVgaKVZFZDJSvk3jKk6K0
         nryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527253; x=1726132053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=rlZtzDtZ4CWyf3GIyAPS32TxzKraZJo/Vm0GOk0VonGPRjpcsa4ld1MrLnwv1qGeH+
         6rd83RnLgRbsgT8HISks1f44wQ9G6T+qzZb57A+bYIgnZuXGx/MTroEzLtdUMvW+eWlU
         E30RxvLvDsrWK7HypETul0HyG/Eedn8BpDCeniiktxHvgU5eLFXdCz1wnEs6nBVNzf5y
         s3nHCtwYJETw/oCapvLy9MJCy19oLD7MafKX/zXgryL/NAwewU+tNP/z9za4HE6rwIaI
         C52IFXYeHEv4JT5zsWZwWH0wdd9SBbeKSPhktK925nH2aUXDpZyL96N2ogfu+XIfBaun
         othA==
X-Forwarded-Encrypted: i=1; AJvYcCXWnw51JM5JyiVg1YfpS8w/Ng4BcS+LtN/p30Kjvy7Wg4BK3P9ERHWaqINsIJRslH4KnIjRGfcXGCGRew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWyaFTXNm6vmvyh4FV61UyPjvgLXBVjsAy7pd+z/RwOAGVcPA
	lR+jZxOWFrb3Ls9RhkxR78v3qHErxlvvkieqhpFOqN31xdzkp6xdh5MP8sg2pUo=
X-Google-Smtp-Source: AGHT+IHUWKL+n+aiFePs4KzsKogKpO5HOL8lwDtIY5ZJCkwGzqAj0Zb5pk1kh5ZSvt9j8riN5kXVJA==
X-Received: by 2002:a05:6512:1043:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-53546b93f60mr13156897e87.40.1725527253365;
        Thu, 05 Sep 2024 02:07:33 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:06:59 +0200
Subject: [PATCH v8 2/5] ASoC: mediatek: Add MT8365 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v8-2-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTOF6LibJjBVJ0Mak7b6zJc2UIL1Q3Y4UZZbXqc
 enhjEwyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURboWD/
 9iL3VX1TG8/wPmhbnzb23RJymY0ctV1TF9XW5qW+DpmtYy+Fn12ijWcAcP/1m2jDCoTaHUMzqoQtaM
 PCd1PxmHLubIUpVyynAzHyuUBEb0+2ee2Y7sorWs04g1yQvQaWGtwYd3SmTeImXQ2ZttJTyMcu+aqq
 L1zVk3Ll+zMefprEcVicTt7crtY22HSS/yT3m/nxyiM7HjTv1c7EJMdlBmrpFa3ui3osM2IPhwNd7b
 pGAZGyqZxjjBQuXAz2OZKK6VunOSgFgYWUWbo73Qw3gF4QStKafcUgDxlftZbnYzNFHl3KtYeqAzs3
 37nnwatWubylC2gK7uHUn1Khnson1gqnkGseoosC5gWAliwN2WHbCewJ0WwYWrlrC5ye/FHUTjSlv0
 Q58wqvvBH/A2YWiRunc6iVAPGbybr6gFnJ6mICGGTh1tR0lHiJ1SN/mMXdMkH+iz2Xk2JTCAp1bGZ5
 zAJjQ02YeORd1+pEDbfEqlE2YjzfRrhKETjcb6NghsfTN/n75/Th9ptavVpvBfTR0NxnMnXBW3GPSr
 bWy79yPi0Fzpu72GxEg+JHtjszZBDTekMqKDwFEj4Wt7eR3RV4IAJV96xI824j4M94aot549UwpnLo
 GCNYYDcnV30g8FxJ0r2AUpPVhb3pQzOFxuP2ZdzH49YfrMeeF0FKkzVQE1Qg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

- Add specific config to enable:
  - MT8365 sound support
  - MT6357 audio codec support
- Add the mt8365 directory and all drivers under it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..e6f7a5a49794 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for MediaTek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for MediaTek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for MediaTek MT8365
+	  boards with the MT6357 PMIC codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 3938e7f75c2e..4b55434f2168 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
 obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
+obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
diff --git a/sound/soc/mediatek/mt8365/Makefile b/sound/soc/mediatek/mt8365/Makefile
new file mode 100644
index 000000000000..52ba45a8498a
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# MTK Platform driver
+snd-soc-mt8365-pcm-objs := \
+	mt8365-afe-clk.o \
+	mt8365-afe-pcm.o \
+	mt8365-dai-adda.o \
+	mt8365-dai-dmic.o \
+	mt8365-dai-i2s.o \
+	mt8365-dai-pcm.o
+
+obj-$(CONFIG_SND_SOC_MT8365) += snd-soc-mt8365-pcm.o
+
+# Machine driver
+obj-$(CONFIG_SND_SOC_MT8365_MT6357) += mt8365-mt6357.o

-- 
2.25.1

