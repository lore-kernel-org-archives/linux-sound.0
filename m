Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A5313C9CA
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483520; cv=none; b=VBNc7MpMQDOHQvxC4aUneg7UgDHAWJhb91QyZSCbVD1coTWJYU19IwCHRuZKkAZxR7iY73qxOtK/4mmqbOAhyCR0+jTAD1FJ/rYZc94oNoknNBBEoltHFnWzLOvNFYKeiI5jW5fOMSeylXx0WLJ/hhG/8zOYmbNuSzwPKkt7BT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483520; c=relaxed/simple;
	bh=t1XJ5w4SobJyrTf45CYol5GsS11FIxdu+98QxmxPPFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVwtTmeaSMMd115wc2dNgD6aoowgSgFaXzLk5dJOzB1KxqKQ3Gvpd5O1rWtaslKGDx25Fv5ZpPwqiLoJCagkRWG4ZXAk22f/ZSJcVOV7uW9P0CPv1Z4Krr48WIO1qrrojlAl1R6Gc7iZydIgkQmdeZW/taoazU8ZpxNbaigcUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ggp6f7SZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ggp6f7SZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483519; x=1751019519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t1XJ5w4SobJyrTf45CYol5GsS11FIxdu+98QxmxPPFg=;
  b=Ggp6f7SZdT9Gu6vM785VAu59l61UQAEZH4cCKoU26ep6/k4JXyWc+E3j
   p7f1iw/7xG8xmiQvJZDEx8ymXFp81QifnzUjMbiQBHbwR5xiCRC0AkdgF
   LwnpVFKgBDD2pUOmrmI1BhxwK56jTqNaVOxmtbmbVBf+se+3X3CcY5O1X
   nLOlSE4lhlgVkQX4GEycxWIyNl69B9QmyNcYukYE+IktA3g7JKHVoCfIk
   ZA8Bt+Zq02S8LJ+rqtWsrtXO5xBh8I1e0oTUbnzKDmMuXA2x8WYcFnSzm
   dGR4PL5REyJ6y1IJ50mL6bcrDqaaiHWLDECvdSnXHzX3+EpT5VActiyVS
   g==;
X-CSE-ConnectionGUID: oobKEpFlQ7KErgaAlYM8tg==
X-CSE-MsgGUID: bT8DyRDnSvWiE1v90p3Elg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487627"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:39 -0700
X-CSE-ConnectionGUID: KfxSmJAgTtqP3L9IGSFroA==
X-CSE-MsgGUID: xLSL77ErT2GA16Capnx4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080022"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:37 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 12/13] ASoC: topology: Unify code for creating standalone and widget mixer control
Date: Thu, 27 Jun 2024 12:18:49 +0200
Message-Id: <20240627101850.2191513-13-amadeuszx.slawinski@linux.intel.com>
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

Code used to create standalone and widget mixer control is same, with
exception that in standalone case dynamic object needs to be registered
and control created directly.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 66 ++++++----------------------------------
 1 file changed, 9 insertions(+), 57 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b10a6be8f75b3..5fde448082467 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -909,49 +909,21 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 
 static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 {
-	struct snd_soc_tplg_mixer_control *mc;
+	struct snd_kcontrol_new kc = {0};
 	struct soc_mixer_control *sm;
-	struct snd_kcontrol_new kc;
-	int ret = 0;
+	int ret;
 
 	if (soc_tplg_check_elem_count(tplg,
 				      sizeof(struct snd_soc_tplg_mixer_control),
 				      1, size, "mixers"))
 		return -EINVAL;
 
-	mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
-
-	/* validate kcontrol */
-	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-		return -EINVAL;
-
-	sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
-	if (sm == NULL)
-		return -ENOMEM;
-	tplg->pos += (sizeof(struct snd_soc_tplg_mixer_control) +
-		      le32_to_cpu(mc->priv.size));
-
-	dev_dbg(tplg->dev,
-		"ASoC: adding mixer kcontrol %s with access 0x%x\n",
-		mc->hdr.name, mc->hdr.access);
-
-	memset(&kc, 0, sizeof(kc));
-	kc.name = mc->hdr.name;
-	kc.private_value = (long)sm;
-	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kc.access = le32_to_cpu(mc->hdr.access);
-
-	/* we only support FL/FR channel mapping atm */
-	sm->reg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
-	sm->rreg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
-	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
-	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
+	ret = soc_tplg_control_dmixer_create(tplg, &kc);
+	if (ret)
+		return ret;
 
-	sm->max = le32_to_cpu(mc->max);
-	sm->min = le32_to_cpu(mc->min);
-	sm->invert = le32_to_cpu(mc->invert);
-	sm->platform_max = le32_to_cpu(mc->platform_max);
+	/* register dynamic object */
+	sm = (struct soc_mixer_control *)&kc.private_value;
 
 	INIT_LIST_HEAD(&sm->dobj.list);
 	sm->dobj.type = SND_SOC_DOBJ_MIXER;
@@ -959,33 +931,13 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	if (tplg->ops)
 		sm->dobj.unload = tplg->ops->control_unload;
 
-	/* map io handlers */
-	ret = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc, tplg);
-	if (ret) {
-		soc_control_err(tplg, &mc->hdr, mc->hdr.name);
-		goto err;
-	}
-
-	/* create any TLV data */
-	ret = soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n", mc->hdr.name);
-		goto err;
-	}
-
-	/* pass control to driver for optional further init */
-	ret = soc_tplg_control_load(tplg, &kc, &mc->hdr);
-	if (ret < 0)
-		goto err;
-
-	/* register control here */
+	/* create control directly */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &sm->dobj.control.kcontrol);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	list_add(&sm->dobj.list, &tplg->comp->dobj_list);
 
-err:
 	return ret;
 }
 
-- 
2.34.1

