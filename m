Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61C313552
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948256; cv=none; b=FUFE6BT48v6LxbhpSFMSVY+403eHXOQ8Q3DAvln9eJ5PdNDZSKRY87+W7eqtH+5zyLL9qUpHQTvSisYbRa6ykAnKQzQrTV0Kaf5C7eZzFnMYAxDJDDz03B2P6yC89ZLA5a994jkP23fcwwW2xaDp3RfezmAjqTHmpLdVKrY+au0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948256; c=relaxed/simple;
	bh=1dIW/dH5OLgpT8FFSX7Tb4xLqENvR5Gqmc3ZUoo9ul8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o2G3FVzWvDrxJle6Z1OO8IIaBQ2mZBmnmQpHwMbHZEhDEMuQABrS4mYkBsZ6mm9TMv/E3TGy1OCfPheorgOUVU3Tm/FpNMP2ecDrY0UqG5aKO+cSJRe3iQTbFd76aWLeYFszLiUyQG8tIs/4QXSWPMgv93cwdJcXDDmmY083BE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cF7FnXA9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF7FnXA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948254; x=1794484254;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1dIW/dH5OLgpT8FFSX7Tb4xLqENvR5Gqmc3ZUoo9ul8=;
  b=cF7FnXA9U3A8pOLRnst33J92KnsDodrCeaFsTBU2ZQyowhihzlyjLDPU
   a8qDOsmJpNV7L6RrG0/W49n4khreCmbbFkz+OJeOTKbEUvVXteZq66mZw
   IQlT/GbR3F1Nj2B7SaZX7pDg3wbAteMGWHQ7TahAg9CgTS7tUZYJ/Dmtb
   bNyQdNO8m55X6flyHneGcLeSJEKXboRSbAPEN97nH4RFR69osZASBPjVY
   c87qJyHuHPofk/FzfTad6LNvY+tJsPwg2m+GfGKrBtwcN0JLUzphSaHt6
   ECpBuErOfMvs6AFSLJ/UmDp5iiA7B/J4u+qwM2Nyk3fXoz/dlFDmGBbQe
   Q==;
X-CSE-ConnectionGUID: +LNw77f8RvuHxkasXoksmw==
X-CSE-MsgGUID: de+lLltnRsuHjVJ89Xu1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75314619"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75314619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:50:54 -0800
X-CSE-ConnectionGUID: DUnPbSQeRiaKCmvoXWFm5Q==
X-CSE-MsgGUID: 5dTAG7n4Tem7jDYyonJzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="219863302"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:50:53 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: boards: fix HDMI playback lookup when HDMI-In capture used
Date: Wed, 12 Nov 2025 19:50:45 +0800
Message-ID: <20251112115045.337062-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

In boards like adl_lt6911_hdmi_ssp/mtl_lt6911_hdmi_ssp/rpl_lt6911_hdmi_ssp,
HDMI is supported both for playback via normal HDA display codec,
as well as PCM capture from HDMI-In over I2S.

The common board driver function hda_dsp_hdmi_pcm_handle() has an
invalid assumption that "HDMI" is only used to identify playback HDMI
PCMs on the card. This will result in failures if HDMI-In PCMs are
defined in topology using the string "HDMI", and they are registered
before the playback PCMs.

Fix the issue by explicitly looking for FE playback PCMs.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/hda_dsp_common.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 86e541a2c204..328ffff336a8 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -15,7 +15,7 @@
 
 /*
  * Search card topology and return PCM device number
- * matching Nth HDMI device (zero-based index).
+ * matching Nth playback HDMI device (zero-based index).
  */
 static struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
 					       int hdmi_idx)
@@ -25,8 +25,17 @@ static struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
 	int i = 0;
 
 	for_each_card_rtds(card, rtd) {
-		spcm = rtd->pcm ?
-			rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].pcm : NULL;
+		/* ignore BE PCMs */
+		if (rtd->dai_link && rtd->dai_link->no_pcm)
+			continue;
+
+		spcm = rtd->pcm;
+
+		/* ignore PCMs with no playback streams */
+		if (!spcm || !spcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
+			continue;
+
+		/* look for FE PCMs with name "HDMI x" */
 		if (spcm && strstr(spcm->id, "HDMI")) {
 			if (i == hdmi_idx)
 				return rtd->pcm;
-- 
2.43.0

