Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866513C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483504; cv=none; b=e0nSjzKI5YZljlzElR/dv2eHo2G7hO1FmVCg8j+TVPOjfjz4H3mhkCu+wc1ApVK1dCK4Yw2P1Mkudd56lTUFiPPU8dDupkQ53VCGzoYRdsvjdaqxNOGiadtdKbxLKy4xNYPCBPvNiwIPshb7MvGByNaZu5qaTV63RHEqPPfugFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483504; c=relaxed/simple;
	bh=MFCt6tH0KGIBBZ8/lzYm5PggqPJ6uRF2WwAFwEKM9Lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WlywnCkCaKczSvPjL4WY918K3lVBD9lUN0NXqvUktuctnWn6iBozxNS0LNK1ZQXn5jJbG/BmTh0WclGT8CeqVE+/Y0GzQWY4pKBf9hfzZ1/WT+UnPys2/g71gSLitw3oopzOzDXAcXj+c6X/RyFMarp457/FyJvI1xuoQjrozik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAKLC+dM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAKLC+dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483503; x=1751019503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MFCt6tH0KGIBBZ8/lzYm5PggqPJ6uRF2WwAFwEKM9Lc=;
  b=lAKLC+dMTQ7C2porPoIpxSbny5aApVWEE/K+puNwln5yqWqsJ18m1mVn
   LRC4WcXhgd+t87HIrc/DzRtiHiAY6+Doj3SHVDsi+1RA5uI28YU7lKkUZ
   wg8ymdUG3ad0UJEN8hdV7IJOmscjQ37fshYdKrNmEhSE3sdDb0dIMBoiM
   CNcF2NwfSgivmHjxj5TMxW6ALpOF5svYIj3jPIOiK2kMnYCZaXIinwbux
   3R7HEwxjot+A6DZRs3FLlJum3Q0Ci+LCzHY1+RLCMVqt2xDkobFc7tQey
   4vsicrVbJ6ui4DuTScserV4HCBIJnEQi0HQ+JtY4dqLcssmFov9Z7ruV7
   g==;
X-CSE-ConnectionGUID: vSuLJU9IRVqXoW/YgBqeSA==
X-CSE-MsgGUID: qUpZgXhDSICiwSgct+jnrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487591"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487591"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:23 -0700
X-CSE-ConnectionGUID: MZwQdxUpQbi8O+d82AS6+g==
X-CSE-MsgGUID: DLqgjPDYQemyIPCCpNjiKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45079991"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:21 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 05/13] ASoC: topology: Cleanup soc_tplg_dapm_widget_dmixer_create
Date: Thu, 27 Jun 2024 12:18:42 +0200
Message-Id: <20240627101850.2191513-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
References: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor cleanups to increase readability.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 73e1279758223..242d8b9c2f03d 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1094,43 +1094,37 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 
 static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
-	struct soc_mixer_control *sm;
 	struct snd_soc_tplg_mixer_control *mc;
+	struct soc_mixer_control *sm;
 	int err;
 
 	mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
 
 	/* validate kcontrol */
-	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 		return -EINVAL;
 
 	sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
 	if (!sm)
 		return -ENOMEM;
 
-	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) +
-		le32_to_cpu(mc->priv.size);
+	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) + le32_to_cpu(mc->priv.size);
 
-	dev_dbg(tplg->dev, " adding DAPM widget mixer control %s\n",
-		mc->hdr.name);
+	dev_dbg(tplg->dev, "ASoC: adding mixer kcontrol %s with access 0x%x\n",
+		mc->hdr.name, mc->hdr.access);
 
-	kc->private_value = (long)sm;
 	kc->name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
 	if (!kc->name)
 		return -ENOMEM;
+	kc->private_value = (long)sm;
 	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	kc->access = le32_to_cpu(mc->hdr.access);
 
 	/* we only support FL/FR channel mapping atm */
-	sm->reg = tplg_chan_get_reg(tplg, mc->channel,
-				    SNDRV_CHMAP_FL);
-	sm->rreg = tplg_chan_get_reg(tplg, mc->channel,
-				     SNDRV_CHMAP_FR);
-	sm->shift = tplg_chan_get_shift(tplg, mc->channel,
-					SNDRV_CHMAP_FL);
-	sm->rshift = tplg_chan_get_shift(tplg, mc->channel,
-					 SNDRV_CHMAP_FR);
+	sm->reg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rreg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
+	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
 
 	sm->max = le32_to_cpu(mc->max);
 	sm->min = le32_to_cpu(mc->min);
@@ -1147,17 +1141,12 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 	/* create any TLV data */
 	err = soc_tplg_create_tlv(tplg, kc, &mc->hdr);
 	if (err < 0) {
-		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
-			mc->hdr.name);
+		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n", mc->hdr.name);
 		return err;
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_control_load(tplg, kc, &mc->hdr);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return soc_tplg_control_load(tplg, kc, &mc->hdr);
 }
 
 static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
-- 
2.34.1

