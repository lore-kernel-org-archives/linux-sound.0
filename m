Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E45277818
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 05:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525194; cv=none; b=W4Ph6JV7wU8EDNqTh3QH3nCCzttOz3NOY5JqV+fpstxEak7NWQTuWPe5TCMP0IhPBzEJ3hHt0DkoQnPhkbMbZ3eZ7jmbyhCmfzs119hBAZUX2AOM2qatFdKfpskAfPZIsbH40i8mlCj7NvkFDU0bwPPQPxAIlLliTeOSwsb7sCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525194; c=relaxed/simple;
	bh=kn8o9Xny6EkFavYSuEhixgsPPNLSIaJEZjT74JOh/fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QOpkT2W9xN88CINg9XrW3BpTZpQtYWyM8ACjP4uh6l1UDjpJuzDA9FX0SEsRaPH7kvBiLDcv6e/D8Q/jPqvRgAUNInNdJH/HX0pzG/neqsTNXvjUkqkuy8rVnKIm6daMNFH+sHPbyCzBjw0apCMFlD3LlJIqxxbIG6pb6/YFhxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvSvlNPi; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvSvlNPi"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e08baf860so7273337a91.2
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 22:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525192; x=1785129992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaLypST4vYbwf1OTn5lOAvWr6BZgnAgmJzuQeo8TE7Y=;
        b=pvSvlNPiI/rMmKy06Wk+6WWFx4rUs69xcugcICKm9gNCkZ7PB1ZIWBZtZHp7CZz25X
         EpPwbh4eBRnX0dna3J085sHH3ZCNHqSY3mig1Tz7jjwJk/cxCkdI5sAL7qp1wQ7Om5ZT
         o+4PMSD8zmXc9BZQZZOI4ODZSLsFWalkEVbKs7feJlrvTY8mpUKAAMS2C9QiAlrud3HZ
         e1o4UF1RHswDv7mjWoiBeh5iWR2H1fP5xLeVMtspU5I3LFZcpZE0Ui2IWpifB4sn1vBL
         Gd3MlMQFArlL/GCGbdq2t0TpLNXvVhVcsIbPKC3sq36Rw26XC1zyLuBI3kINb6bJnuUy
         ILDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525192; x=1785129992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OaLypST4vYbwf1OTn5lOAvWr6BZgnAgmJzuQeo8TE7Y=;
        b=LXL+M6keM4O4YYshNkmYPMaxKhEI4bFUHwr4mrdlRe6NDVXk9YpeacPt73PHynTM39
         5hSnH91Mv7xqhEXROubcV5MLEylhZEiNnDRVgWdKZm1TQYugVuT2XrFrugfePPjXLtq/
         TQK+ebcNHuaXt5EmkgDjNtuWUShJ5BjqsgObMIZ6d+OHGX1yKOavymC8ldmXv/mXviDt
         J00eqGUjpFPUlzvevN11aPkdbNMKSEQBKR+7JXeF35lpXu5i0cu76n+jXzB2Pby6Du47
         xTum+oY4S8H6mb2bT8QwNdId/B25yQVXRq+1YXoyECE+/vl9Gdl7QHMEUtu3eg9v9mhe
         iy6g==
X-Forwarded-Encrypted: i=1; AHgh+RqrpgFVAKCMdgPZinKe44+gsdjTYMykwSHyfniJieHoKCBl6L7LcU1KdSE7waKe/WwN2bwsW84YlLR2uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYawnj2OSHYOuN8gbVAFoJ1fnvfOJZzqew/mWbyWK1ewY7+N3
	pwlgXaupnnTVKeuYbL29Dqdq5+xoU66Ix4qiHFaWTZ9zs3G6zqdE2Sor
X-Gm-Gg: AfdE7cm7mhjwjDaL5DKKKQAHkBoQz590bpwlFLwWb1habzpGsf9WEQXyR2p6XjvAyWc
	UExWdOjS3cRKMNa4RDbkma3y0ToWS+BhtMZzkXh4erJeAziQlGxFVgsPqLglu0RLf+HS3Jod950
	962YarlzQlFjnWgTOanj9usO1kGsDMBW1K42GZruRhzMrg5ZvTLQYFTiSLA2MVslGQGwsDu9HkS
	vZuN7We51aV69WkPhlVOMgglAcCnUs9lszScCKXSZkKypV5gud9AO1vG+LgLr9HgH78CCcZVcBa
	DMmy4P7Hqol6FNIqKc7aFvMGTGAEG8CxyOyvFApKy9CIOhxVixdmNrg3M6x7OW6Wbymj30Oym3P
	8OLQCUtpWAiD6CPbf/gLjczqSkLWKjOAeg8w0XMKEdtNuXMgUi27O5ndp1YScS0Q5Fj6JKYMoG2
	Hu3EBB6ZdV30quLNfRWiOgl1AoqcPKZgoGfgln
X-Received: by 2002:a17:90b:2f85:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38e4b4227b8mr11488380a91.7.1784525191633;
        Sun, 19 Jul 2026 22:26:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm6973502a91.5.2026.07.19.22.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:26:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly
Date: Mon, 20 Jul 2026 12:26:18 +0700
Message-ID: <20260720052618.64849-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Update the commit message and title.
 - Refine DMA channel request failure handling to match the
   dma_request_chan() implementation.

 sound/soc/soc-generic-dmaengine-pcm.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 467426d2b5e4..7ed698314573 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -3,6 +3,7 @@
 //  Copyright (C) 2013, Analog Devices Inc.
 //	Author: Lars-Peter Clausen <lars@metafoo.de>
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/dmaengine.h>
@@ -395,6 +396,28 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			 */
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
+
+			bool has_fw_node = dev->of_node || is_acpi_device_node(dev->fwnode);
+			bool has_legacy_config = config->chan_names[i];
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
+			if (has_fw_node && !name_exists_in_fw && has_legacy_config)
+				dev_warn(dev, "DTS/ACPI name '%s' not found, legacy failed (%ld)\n",
+					 name, PTR_ERR(chan));
+
+			if (!has_fw_node && has_legacy_config)
+				dev_warn(dev, "Legacy DMA channel '%s' request failed (%ld)\n",
+					 name, PTR_ERR(chan));
+
 			pcm->chan[i] = NULL;
 		} else {
 			pcm->chan[i] = chan;
@@ -406,6 +429,12 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
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

