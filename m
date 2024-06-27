Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E513C9CA
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483516; cv=none; b=K/Z4JEdhjYqJtrrMLkEnaLt/qYNL6OonzlzDbxvPSxA0htuLoFZGrgx/w4qIhLPV3SC8bGyVY3z71Zv5KydpztbS6HkoDMTSbF7yI6jm36NFg3TAoxw56zdRmnWeufvnndRKpuoEM3ZW5zQ0AUCG42mCuA5L5FRnZeEvaLk5bME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483516; c=relaxed/simple;
	bh=BiWqxlghZ1dI3jjoQgUdqkbb4nPuhdJq1pYX8zubO+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrHGDbl43kjHKKhZvZ1vlNrK08gYNzZtb8SDdFS+Wk44JofNErPbFTmMvxW2DXcRM/oO7vifOJrtpgTWh4ygVlfnaV+1bd3Knezs5+LXJL2wOlCCVYJua+7NOufQbl+iG4+VDCgkDSioxtRepfDk5WH30mMsDVgH/tOjxnwVmho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UT8qa1pq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UT8qa1pq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483515; x=1751019515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BiWqxlghZ1dI3jjoQgUdqkbb4nPuhdJq1pYX8zubO+Y=;
  b=UT8qa1pqYJAa95tvievvOKionkzvdoi1unVAm8586lA+Mc2QFys6ZJIh
   O8XXx6f/TemJ5i+E/7JR+dTfvthMGUYC79wYkaUxkW5uhI0oMnyRfbhan
   YSGzo91yUXhye+C932jlyWL2/+HoDRSvHp0wqMYduUpf38biwLejALpzO
   6xY/2bmFivJPjz5KfWwC1DhXayT+L099khTrd4/pXm2j1hsdk1OG805xx
   +nBGum9LM4E0rFwjJJX8JNSzRcJmRrxofp4J8TF6E5WMvYUB3jUZtdUqP
   xQrQwb36JbQGGQpp2w80IW8u8Wk32eyRVFLg4KTKjqqvDZww/MvMsXuuZ
   Q==;
X-CSE-ConnectionGUID: qT8Lqy10TP6kF4O2K4bB3Q==
X-CSE-MsgGUID: v3FVHKGMTUuZBoUz2al6Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487614"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:34 -0700
X-CSE-ConnectionGUID: CHCea0W+S9yBx8f2zR/+nw==
X-CSE-MsgGUID: ELzkdgOyQjWL6NviqY0ZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080015"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:32 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 10/13] ASoC: topology: Reshuffle function placement
Date: Thu, 27 Jun 2024 12:18:47 +0200
Message-Id: <20240627101850.2191513-11-amadeuszx.slawinski@linux.intel.com>
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

In preparation for following cleanups move functions around.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 466 +++++++++++++++++++--------------------
 1 file changed, 233 insertions(+), 233 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f85cf67f74b1e..5aab1df7e2606 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -640,6 +640,239 @@ static int soc_tplg_create_tlv(struct soc_tplg *tplg,
 	return 0;
 }
 
+static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
+{
+	struct snd_soc_tplg_mixer_control *mc;
+	struct soc_mixer_control *sm;
+	int err;
+
+	mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
+
+	/* validate kcontrol */
+	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
+
+	sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
+	if (!sm)
+		return -ENOMEM;
+
+	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) + le32_to_cpu(mc->priv.size);
+
+	dev_dbg(tplg->dev, "ASoC: adding mixer kcontrol %s with access 0x%x\n",
+		mc->hdr.name, mc->hdr.access);
+
+	kc->name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->private_value = (long)sm;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(mc->hdr.access);
+
+	/* we only support FL/FR channel mapping atm */
+	sm->reg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rreg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
+	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
+
+	sm->max = le32_to_cpu(mc->max);
+	sm->min = le32_to_cpu(mc->min);
+	sm->invert = le32_to_cpu(mc->invert);
+	sm->platform_max = le32_to_cpu(mc->platform_max);
+
+	/* map io handlers */
+	err = soc_tplg_kcontrol_bind_io(&mc->hdr, kc, tplg);
+	if (err) {
+		soc_control_err(tplg, &mc->hdr, mc->hdr.name);
+		return err;
+	}
+
+	/* create any TLV data */
+	err = soc_tplg_create_tlv(tplg, kc, &mc->hdr);
+	if (err < 0) {
+		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n", mc->hdr.name);
+		return err;
+	}
+
+	/* pass control to driver for optional further init */
+	return soc_tplg_control_load(tplg, kc, &mc->hdr);
+}
+
+static int soc_tplg_denum_create_texts(struct soc_tplg *tplg, struct soc_enum *se,
+				       struct snd_soc_tplg_enum_control *ec)
+{
+	int i, ret;
+
+	if (le32_to_cpu(ec->items) > ARRAY_SIZE(ec->texts))
+		return -EINVAL;
+
+	se->dobj.control.dtexts =
+		devm_kcalloc(tplg->dev, le32_to_cpu(ec->items), sizeof(char *), GFP_KERNEL);
+	if (se->dobj.control.dtexts == NULL)
+		return -ENOMEM;
+
+	for (i = 0; i < le32_to_cpu(ec->items); i++) {
+
+		if (strnlen(ec->texts[i], SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+			SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		se->dobj.control.dtexts[i] = devm_kstrdup(tplg->dev, ec->texts[i], GFP_KERNEL);
+		if (!se->dobj.control.dtexts[i]) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
+
+	se->items = le32_to_cpu(ec->items);
+	se->texts = (const char * const *)se->dobj.control.dtexts;
+	return 0;
+
+err:
+	return ret;
+}
+
+static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *se,
+					struct snd_soc_tplg_enum_control *ec)
+{
+	int i;
+
+	/*
+	 * Following "if" checks if we have at most SND_SOC_TPLG_NUM_TEXTS
+	 * values instead of using ARRAY_SIZE(ec->values) due to the fact that
+	 * it is oversized for its purpose. Additionally it is done so because
+	 * it is defined in UAPI header where it can't be easily changed.
+	 */
+	if (le32_to_cpu(ec->items) > SND_SOC_TPLG_NUM_TEXTS)
+		return -EINVAL;
+
+	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
+					   sizeof(*se->dobj.control.dvalues),
+					   GFP_KERNEL);
+	if (!se->dobj.control.dvalues)
+		return -ENOMEM;
+
+	/* convert from little-endian */
+	for (i = 0; i < le32_to_cpu(ec->items); i++) {
+		se->dobj.control.dvalues[i] = le32_to_cpu(ec->values[i]);
+	}
+
+	se->items = le32_to_cpu(ec->items);
+	se->values = (const unsigned int *)se->dobj.control.dvalues;
+	return 0;
+}
+
+static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
+{
+	struct snd_soc_tplg_enum_control *ec;
+	struct soc_enum *se;
+	int err;
+
+	ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
+
+	/* validate kcontrol */
+	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
+
+	se = devm_kzalloc(tplg->dev, sizeof(*se), GFP_KERNEL);
+	if (!se)
+		return -ENOMEM;
+
+	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) + le32_to_cpu(ec->priv.size));
+
+	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n", ec->hdr.name, ec->items);
+
+	kc->name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->private_value = (long)se;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(ec->hdr.access);
+
+	/* we only support FL/FR channel mapping atm */
+	se->reg = tplg_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_l = tplg_chan_get_shift(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_r = tplg_chan_get_shift(tplg, ec->channel, SNDRV_CHMAP_FR);
+
+	se->mask = le32_to_cpu(ec->mask);
+
+	switch (le32_to_cpu(ec->hdr.ops.info)) {
+	case SND_SOC_TPLG_CTL_ENUM_VALUE:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
+		err = soc_tplg_denum_create_values(tplg, se, ec);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: could not create values for %s\n", ec->hdr.name);
+			return err;
+		}
+		fallthrough;
+	case SND_SOC_TPLG_CTL_ENUM:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
+		err = soc_tplg_denum_create_texts(tplg, se, ec);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: could not create texts for %s\n", ec->hdr.name);
+			return err;
+		}
+		break;
+	default:
+		dev_err(tplg->dev, "ASoC: invalid enum control type %d for %s\n",
+			ec->hdr.ops.info, ec->hdr.name);
+		return -EINVAL;
+	}
+
+	/* map io handlers */
+	err = soc_tplg_kcontrol_bind_io(&ec->hdr, kc, tplg);
+	if (err) {
+		soc_control_err(tplg, &ec->hdr, ec->hdr.name);
+		return err;
+	}
+
+	/* pass control to driver for optional further init */
+	return soc_tplg_control_load(tplg, kc, &ec->hdr);
+}
+
+static int soc_tplg_control_dbytes_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
+{
+	struct snd_soc_tplg_bytes_control *be;
+	struct soc_bytes_ext *sbe;
+	int err;
+
+	be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
+
+	/* validate kcontrol */
+	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
+
+	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
+	if (!sbe)
+		return -ENOMEM;
+
+	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) + le32_to_cpu(be->priv.size));
+
+	dev_dbg(tplg->dev, "ASoC: adding bytes kcontrol %s with access 0x%x\n",
+		be->hdr.name, be->hdr.access);
+
+	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->private_value = (long)sbe;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(be->hdr.access);
+
+	sbe->max = le32_to_cpu(be->max);
+
+	/* map standard io handlers and check for external handlers */
+	err = soc_tplg_kcontrol_bind_io(&be->hdr, kc, tplg);
+	if (err) {
+		soc_control_err(tplg, &be->hdr, be->hdr.name);
+		return err;
+	}
+
+	/* pass control to driver for optional further init */
+	return soc_tplg_control_load(tplg, kc, &be->hdr);
+}
+
 static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 {
 	struct snd_soc_tplg_bytes_control *be;
@@ -789,72 +1022,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	return ret;
 }
 
-static int soc_tplg_denum_create_texts(struct soc_tplg *tplg, struct soc_enum *se,
-				       struct snd_soc_tplg_enum_control *ec)
-{
-	int i, ret;
-
-	if (le32_to_cpu(ec->items) > ARRAY_SIZE(ec->texts))
-		return -EINVAL;
-
-	se->dobj.control.dtexts =
-		devm_kcalloc(tplg->dev, le32_to_cpu(ec->items), sizeof(char *), GFP_KERNEL);
-	if (se->dobj.control.dtexts == NULL)
-		return -ENOMEM;
-
-	for (i = 0; i < le32_to_cpu(ec->items); i++) {
-
-		if (strnlen(ec->texts[i], SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
-			ret = -EINVAL;
-			goto err;
-		}
-
-		se->dobj.control.dtexts[i] = devm_kstrdup(tplg->dev, ec->texts[i], GFP_KERNEL);
-		if (!se->dobj.control.dtexts[i]) {
-			ret = -ENOMEM;
-			goto err;
-		}
-	}
-
-	se->items = le32_to_cpu(ec->items);
-	se->texts = (const char * const *)se->dobj.control.dtexts;
-	return 0;
-
-err:
-	return ret;
-}
-
-static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *se,
-					struct snd_soc_tplg_enum_control *ec)
-{
-	int i;
-
-	/*
-	 * Following "if" checks if we have at most SND_SOC_TPLG_NUM_TEXTS
-	 * values instead of using ARRAY_SIZE(ec->values) due to the fact that
-	 * it is oversized for its purpose. Additionally it is done so because
-	 * it is defined in UAPI header where it can't be easily changed.
-	 */
-	if (le32_to_cpu(ec->items) > SND_SOC_TPLG_NUM_TEXTS)
-		return -EINVAL;
-
-	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
-					   sizeof(*se->dobj.control.dvalues),
-					   GFP_KERNEL);
-	if (!se->dobj.control.dvalues)
-		return -ENOMEM;
-
-	/* convert from little-endian */
-	for (i = 0; i < le32_to_cpu(ec->items); i++) {
-		se->dobj.control.dvalues[i] = le32_to_cpu(ec->values[i]);
-	}
-
-	se->items = le32_to_cpu(ec->items);
-	se->values = (const unsigned int *)se->dobj.control.dvalues;
-	return 0;
-}
-
 static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 {
 	struct snd_soc_tplg_enum_control *ec;
@@ -1096,173 +1263,6 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	return ret;
 }
 
-static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
-{
-	struct snd_soc_tplg_mixer_control *mc;
-	struct soc_mixer_control *sm;
-	int err;
-
-	mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
-
-	/* validate kcontrol */
-	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-		return -EINVAL;
-
-	sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
-	if (!sm)
-		return -ENOMEM;
-
-	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) + le32_to_cpu(mc->priv.size);
-
-	dev_dbg(tplg->dev, "ASoC: adding mixer kcontrol %s with access 0x%x\n",
-		mc->hdr.name, mc->hdr.access);
-
-	kc->name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
-	if (!kc->name)
-		return -ENOMEM;
-	kc->private_value = (long)sm;
-	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kc->access = le32_to_cpu(mc->hdr.access);
-
-	/* we only support FL/FR channel mapping atm */
-	sm->reg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
-	sm->rreg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
-	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
-	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
-
-	sm->max = le32_to_cpu(mc->max);
-	sm->min = le32_to_cpu(mc->min);
-	sm->invert = le32_to_cpu(mc->invert);
-	sm->platform_max = le32_to_cpu(mc->platform_max);
-
-	/* map io handlers */
-	err = soc_tplg_kcontrol_bind_io(&mc->hdr, kc, tplg);
-	if (err) {
-		soc_control_err(tplg, &mc->hdr, mc->hdr.name);
-		return err;
-	}
-
-	/* create any TLV data */
-	err = soc_tplg_create_tlv(tplg, kc, &mc->hdr);
-	if (err < 0) {
-		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n", mc->hdr.name);
-		return err;
-	}
-
-	/* pass control to driver for optional further init */
-	return soc_tplg_control_load(tplg, kc, &mc->hdr);
-}
-
-static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
-{
-	struct snd_soc_tplg_enum_control *ec;
-	struct soc_enum *se;
-	int err;
-
-	ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
-
-	/* validate kcontrol */
-	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-		return -EINVAL;
-
-	se = devm_kzalloc(tplg->dev, sizeof(*se), GFP_KERNEL);
-	if (!se)
-		return -ENOMEM;
-
-	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) + le32_to_cpu(ec->priv.size));
-
-	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n", ec->hdr.name, ec->items);
-
-	kc->name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
-	if (!kc->name)
-		return -ENOMEM;
-	kc->private_value = (long)se;
-	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kc->access = le32_to_cpu(ec->hdr.access);
-
-	/* we only support FL/FR channel mapping atm */
-	se->reg = tplg_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-	se->shift_l = tplg_chan_get_shift(tplg, ec->channel, SNDRV_CHMAP_FL);
-	se->shift_r = tplg_chan_get_shift(tplg, ec->channel, SNDRV_CHMAP_FR);
-
-	se->mask = le32_to_cpu(ec->mask);
-
-	switch (le32_to_cpu(ec->hdr.ops.info)) {
-	case SND_SOC_TPLG_CTL_ENUM_VALUE:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-		err = soc_tplg_denum_create_values(tplg, se, ec);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: could not create values for %s\n", ec->hdr.name);
-			return err;
-		}
-		fallthrough;
-	case SND_SOC_TPLG_CTL_ENUM:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-		err = soc_tplg_denum_create_texts(tplg, se, ec);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: could not create texts for %s\n", ec->hdr.name);
-			return err;
-		}
-		break;
-	default:
-		dev_err(tplg->dev, "ASoC: invalid enum control type %d for %s\n",
-			ec->hdr.ops.info, ec->hdr.name);
-		return -EINVAL;
-	}
-
-	/* map io handlers */
-	err = soc_tplg_kcontrol_bind_io(&ec->hdr, kc, tplg);
-	if (err) {
-		soc_control_err(tplg, &ec->hdr, ec->hdr.name);
-		return err;
-	}
-
-	/* pass control to driver for optional further init */
-	return soc_tplg_control_load(tplg, kc, &ec->hdr);
-}
-
-static int soc_tplg_control_dbytes_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
-{
-	struct snd_soc_tplg_bytes_control *be;
-	struct soc_bytes_ext *sbe;
-	int err;
-
-	be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
-
-	/* validate kcontrol */
-	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-		return -EINVAL;
-
-	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
-	if (!sbe)
-		return -ENOMEM;
-
-	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) + le32_to_cpu(be->priv.size));
-
-	dev_dbg(tplg->dev, "ASoC: adding bytes kcontrol %s with access 0x%x\n",
-		be->hdr.name, be->hdr.access);
-
-	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
-	if (!kc->name)
-		return -ENOMEM;
-	kc->private_value = (long)sbe;
-	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kc->access = le32_to_cpu(be->hdr.access);
-
-	sbe->max = le32_to_cpu(be->max);
-
-	/* map standard io handlers and check for external handlers */
-	err = soc_tplg_kcontrol_bind_io(&be->hdr, kc, tplg);
-	if (err) {
-		soc_control_err(tplg, &be->hdr, be->hdr.name);
-		return err;
-	}
-
-	/* pass control to driver for optional further init */
-	return soc_tplg_control_load(tplg, kc, &be->hdr);
-}
-
 static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	struct snd_soc_tplg_dapm_widget *w)
 {
-- 
2.34.1

