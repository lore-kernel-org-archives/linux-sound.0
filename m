Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4827B4F7
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529707; cv=none; b=KWvyLywWqtpUNW0nB6E6WGjf20xZRM8XJ0ggMX3ysZQemZvOaTNVywy3/Twkxfaj+IMFQugeKcEkZsR9WSZdKRPqdrYDYUVn17rpPU1y7E/zp4nVTG9LP7Kc0fsSNN0mS0LJLTAqBWkoQbUjbmOwyR0KSXJN4Us9xx7J8KkZfE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529707; c=relaxed/simple;
	bh=T8EbNBllvdOLhv6HbF6jlwWUvLjpmPFrMR1LokHWYu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cE4WIjk6acbR6BtsTsPPtb2otdFHYdbgPcQx4ND5I78hr/WzGlKP117sQITcNXL7edT2J6vBNKBNjfcL9FxeLvPE5QdYTKjWa3CJEdiaBPR5j76vW4mqVKNjcT6rsqax/VAYVrjY3UaPkAgjHVv/EkmYInOyu6RaSW0UoT8T3nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYrqOZqf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYrqOZqf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso5925858a91.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784529705; x=1785134505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=elCYmb/Sg/JpLLjpyIpB3MPC/nkr3RkeAwjfLCjjezM=;
        b=RYrqOZqfiFENnmxBU7y4yX9R67UMZz0p9Bmbym6EWpymXSIh7nJcVFGhLseSXZwpQk
         PqCE5BEC/pl0+yyv0Z9RzowkjUtyPpVw8NaFFDd8e2omzSXCRd40TaBva+oIfuQJo7rU
         Hxev+l37iHALJf9XE2danzXV5cRrXQjRuAnQAecKs3PnqPd8hMfBAU/H6CfYwJvcq9TA
         yJJoYFRXNAYMW4G7ZJPMher0PTGHJkiHI31IpHJVmDkk8X+qexCdDkC11n0WHKjwr/r8
         9ZLiKXaoR5ve3PpJRAnutzZwsioDADpuqL/hUpZGkVIAQuhJuGKKYCHqA9djvMiKT8cZ
         6dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529705; x=1785134505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elCYmb/Sg/JpLLjpyIpB3MPC/nkr3RkeAwjfLCjjezM=;
        b=hxB32iOAkt8YipZMKNZ+aX7Ybc7X5pJE6VkZM3BeSrU296oCTn2U8AfZ2MhNLL8KkA
         JbPYMikitrrfSWFnsivp8HPiwpuwrmRQG/R/ha5px0n5WLOIRFM7BKiFe1vtL5XmwGUM
         v/5gRlvmrNEXsQ1dyEjpyWdQWPBMThLgFYVZhjignrnWIhDrXmqvX9ALnHnrRFxDDsv5
         GXlT65kM+/ZnqC3K8P7ozEwVrqrUxOQi+/XdWhgHdiCXg3aCndjtyFMqtYVb/FKA2UlQ
         vCKk3xVrsqqTbfep+rxu6Zn1ltZtLxyChop04f7DNbIlqvHeK11Y7E1wfeCpnm/OXM3u
         rtbQ==
X-Forwarded-Encrypted: i=1; AHgh+Roe6PXg/63JRIKVMmZ1iort3yDP558U/iuGLd5/coarnX+Xa6lY3xq/yh2RSzgqlscgat/ZqjGknwNhOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAJf7Z5U1Y9Fv0uzTcoVfdKtQ2NvTanOY3G7JkrvgvLBDLV5h
	aE7utYaco4U3vga23zu/VXjD0f8pThdvaO51RKvMKkxcHxzIn0UWvDT/
X-Gm-Gg: AfdE7cmsl5CAaa3mg1uDpbvdJehOwfTlMMoWYqeeMN+2xghDuSus825oGQmq/wVuzGN
	AG9FxwRgKkAvtpu9XvQftr9eeqHutqIKumUOcydKsx39RJO9xIz52M8KYUchzCoBD+/cstrvHeH
	Zx3FJaog3mRpGTWUEzHQz64Fd5JEsPgGE0ZEU29yE6PCZ/iUHp8DmvpzP7vGZc7MlJe45C7vfI2
	iTcSWg7MpgfGMd9e1fyVqSM8MYOhZV/5o6GlUGT5HmwH5tIqnQiKLTIBkXwKLhc3H2Hbzghoe+K
	QP/yjNtxlsYYEaSWfczWyBXNHjqCdyMK6tWEtZw69aVZUolbSt/zzJrQS8zRdG0+iUM6B7+l6qn
	I0Zz2X+OMRnpA+U9rLmFy5SGOfmqs67jcOD8v2riUVhaj+H0ZS23P09B2Bpx5oPoD399NTt9cIX
	25UxtSyD1IuXAZLc5jAmTsFPCtThHEQe42hsYSZbCa49CksP8=
X-Received: by 2002:a05:6a21:48f:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c3ad9afdb9mr13009241637.54.1784529705263;
        Sun, 19 Jul 2026 23:41:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519ae8684sm4046703a12.17.2026.07.19.23.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:41:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3] ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly
Date: Mon, 20 Jul 2026 13:41:31 +0700
Message-ID: <20260720064131.75156-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently any dma_request_chan() failure other than -EPROBE_DEFER is
silently ignored, since a missing channel is expected for devices that
only support one DMA direction.

Improve the handling of these failures by:
- reporting failures when a configured DMA channel cannot be requested;
- failing probe if neither playback nor capture obtains a DMA channel,
  since the PCM device would be unusable.

Devices that legitimately support only one DMA direction continue to
work as before.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Drop has_legacy_config, since config->chan_names[] only provides the
   requested channel name and does not indicate legacy DMA mapping.
Changes in v2:
 - Update the commit message and title.
 - Refine DMA channel request failure handling to match the
   dma_request_chan() implementation.

 sound/soc/soc-generic-dmaengine-pcm.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 467426d2b5e4..98ba9a836936 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -3,6 +3,7 @@
 //  Copyright (C) 2013, Analog Devices Inc.
 //	Author: Lars-Peter Clausen <lars@metafoo.de>
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/dmaengine.h>
@@ -395,6 +396,27 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			 */
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
+
+			bool has_fw_node = dev->of_node || is_acpi_device_node(dev->fwnode);
+			bool name_exists_in_fw = false;
+
+			if (has_fw_node)
+				name_exists_in_fw = device_property_match_string(dev,
+										 "dma-names",
+										 name) >= 0;
+
+			if (has_fw_node && name_exists_in_fw)
+				dev_warn(dev, "DTS/ACPI DMA channel '%s' request failed (%ld)\n",
+					 name, PTR_ERR(chan));
+
+			if (has_fw_node && !name_exists_in_fw)
+				dev_warn(dev, "DTS/ACPI name '%s' not found, legacy failed (%ld)\n",
+					 name, PTR_ERR(chan));
+
+			if (!has_fw_node)
+				dev_warn(dev, "Legacy DMA channel '%s' request failed (%ld)\n",
+					 name, PTR_ERR(chan));
+
 			pcm->chan[i] = NULL;
 		} else {
 			pcm->chan[i] = chan;
@@ -406,6 +428,12 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX)
 		pcm->chan[1] = pcm->chan[0];
 
+	if (!pcm->chan[0] &&
+	    !pcm->chan[1]) {
+		dev_err(dev, "no DMA channel found for either playback or capture\n");
+		return -ENODEV;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

