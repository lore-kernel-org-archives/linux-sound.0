Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFFE13C9CA
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483522; cv=none; b=qYtsj5XJ5oPG9kBbkLYc/F0cRVAPShG7JYwXquJ1zRnPDFF4ot+koKbjH6musK89L9O5lvKHGhGzAh9Sq4jkH5/ZEZWnd9t1MsJ0qpzQlB3cHeA2RUW9U4ww/LPhinpOkhBbmmO6hQpIE7uhP/veVF0bSzkkg5utVQ0oYKskmRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483522; c=relaxed/simple;
	bh=TRfbs6tOEaK/do77yThChQst8aG6N6RDwTxuk2T94MA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5jgaWXEOqWjOhZjYl5kuqbJOWiyU7Dshq/Y1k/bw/5C9aEWyHRT1xBzgpEt3rfGLsJzW2Yl6BRrhcAArKq3ys+I9Dcg9QJoIZcb7JLHNRZgrje6VJFYoAON73LKaCzvXP4UlgfKhsa7gKCxXpdBIgGhc6Z1zHhPb7PQyC/caw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZd9UKPk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZd9UKPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483521; x=1751019521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TRfbs6tOEaK/do77yThChQst8aG6N6RDwTxuk2T94MA=;
  b=dZd9UKPk2vXsJr+fz5xyufMuTdvfLHAlZtSQrxkmCR3t0zQxIoAuYocK
   slbD0sjfW6auodbOKAfaHluXRwSPe/50KQXt8c93bThUcwj3lnTv6eSLn
   d6RuGFC5AleqTCKNrBSd7Ni21n3RcMz/G5QYoJxZpwEqqmldPS+yVQsGq
   skXtLZtQ9+cxUm7spD1DEH2Sk/Q+sWPCmnf9++i0OmtuEfm3b6PBkvL2D
   QaOWrXtfKI7Hjp5XYHjHlXFqpp3LSFUh6xD2A7M5oHQWM3TXcR+KJuPxw
   OVKIizVZph2dQpe5TgxBtl0e9/z/qFq+3jsPrjkZoQ1HcbI9lq+8yB/k+
   g==;
X-CSE-ConnectionGUID: Fzlgrw+fTCyiReRBxbdJTQ==
X-CSE-MsgGUID: YJ6iwZH/T4SgeZu8jPP2Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487633"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487633"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:41 -0700
X-CSE-ConnectionGUID: 3ktgrOA2QvWHYa1z6Ad01Q==
X-CSE-MsgGUID: LYwgNeKGQXWJfK1H3ZLtvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080026"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:39 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 13/13] ASoC: topology: Unify code for creating standalone and widget enum control
Date: Thu, 27 Jun 2024 12:18:50 +0200
Message-Id: <20240627101850.2191513-14-amadeuszx.slawinski@linux.intel.com>
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

Code used to create standalone and widget enum control is same, with
exception that in standalone case dynamic object needs to be registered
and control created directly.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 86 +++++-----------------------------------
 1 file changed, 9 insertions(+), 77 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 5fde448082467..af5d42b57be7e 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -943,46 +943,21 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 
 static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 {
-	struct snd_soc_tplg_enum_control *ec;
+	struct snd_kcontrol_new kc = {0};
 	struct soc_enum *se;
-	struct snd_kcontrol_new kc;
-	int ret = 0;
+	int ret;
 
 	if (soc_tplg_check_elem_count(tplg,
 				      sizeof(struct snd_soc_tplg_enum_control),
 				      1, size, "enums"))
 		return -EINVAL;
 
-	ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
-
-	/* validate kcontrol */
-	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-		return -EINVAL;
-
-	se = devm_kzalloc(tplg->dev, (sizeof(*se)), GFP_KERNEL);
-	if (se == NULL)
-		return -ENOMEM;
-
-	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
-		      le32_to_cpu(ec->priv.size));
-
-	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n",
-		ec->hdr.name, ec->items);
-
-	memset(&kc, 0, sizeof(kc));
-	kc.name = ec->hdr.name;
-	kc.private_value = (long)se;
-	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kc.access = le32_to_cpu(ec->hdr.access);
-
-	se->reg = tplg_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-	se->shift_l = tplg_chan_get_shift(tplg, ec->channel,
-		SNDRV_CHMAP_FL);
-	se->shift_r = tplg_chan_get_shift(tplg, ec->channel,
-		SNDRV_CHMAP_FR);
+	ret = soc_tplg_control_denum_create(tplg, &kc);
+	if (ret)
+		return ret;
 
-	se->mask = le32_to_cpu(ec->mask);
+	/* register dynamic object */
+	se = (struct soc_enum *)kc.private_value;
 
 	INIT_LIST_HEAD(&se->dobj.list);
 	se->dobj.type = SND_SOC_DOBJ_ENUM;
@@ -990,56 +965,13 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	if (tplg->ops)
 		se->dobj.unload = tplg->ops->control_unload;
 
-	switch (le32_to_cpu(ec->hdr.ops.info)) {
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-	case SND_SOC_TPLG_CTL_ENUM_VALUE:
-		ret = soc_tplg_denum_create_values(tplg, se, ec);
-		if (ret < 0) {
-			dev_err(tplg->dev,
-				"ASoC: could not create values for %s\n",
-				ec->hdr.name);
-			goto err;
-		}
-		fallthrough;
-	case SND_SOC_TPLG_CTL_ENUM:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-		ret = soc_tplg_denum_create_texts(tplg, se, ec);
-		if (ret < 0) {
-			dev_err(tplg->dev,
-				"ASoC: could not create texts for %s\n",
-				ec->hdr.name);
-			goto err;
-		}
-		break;
-	default:
-		ret = -EINVAL;
-		dev_err(tplg->dev,
-			"ASoC: invalid enum control type %d for %s\n",
-			ec->hdr.ops.info, ec->hdr.name);
-		goto err;
-	}
-
-	/* map io handlers */
-	ret = soc_tplg_kcontrol_bind_io(&ec->hdr, &kc, tplg);
-	if (ret) {
-		soc_control_err(tplg, &ec->hdr, ec->hdr.name);
-		goto err;
-	}
-
-	/* pass control to driver for optional further init */
-	ret = soc_tplg_control_load(tplg, &kc, &ec->hdr);
-	if (ret < 0)
-		goto err;
-
-	/* register control here */
+	/* create control directly */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &se->dobj.control.kcontrol);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	list_add(&se->dobj.list, &tplg->comp->dobj_list);
 
-err:
 	return ret;
 }
 
-- 
2.34.1

