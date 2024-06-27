Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39813C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483507; cv=none; b=FIJ/A2fiASABcJsTWfd9iKVjDY2rGMJNA6iNId4uYhWMsCrv+jglUeuW/LyEsA8PEM7YFWKu1pyHMADnWx7GtP+XhC+dqFK7ptMSJNGfA79TQSQXQpoMYpJwelMb6Rf3klEuqui2winc23rX3mtG3/gqK0WieYOabLy2qKkvfzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483507; c=relaxed/simple;
	bh=0WW7+/n9KOypjkZa8h7NHcqIFmK1fLlycdpTYjfcuEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQQE5aGZIci9xoUb4Mv008YHy4uMR1e/NDVE2My9xf7EBgufYBjvDWd5SOkBWJwz/KTnXPbeYXlpHjECsA0PUgLkQpaxs1D3gD+y9/vAadU18lTcjZ2cB7kCXS3RxIkLMs/3TjcoL8lv4eW+5HVFr3tzAuj3fbcJwO4VKn21fk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bl76sPg3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bl76sPg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483506; x=1751019506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0WW7+/n9KOypjkZa8h7NHcqIFmK1fLlycdpTYjfcuEo=;
  b=bl76sPg3rXgFyZZnZ4/W0e+Sr289P5huccUsquvP07Aia6UEE1pkpU3b
   JU2cwqeMQXaWvhUbJU7XqBfh2uJUy1tmfo6QVP6pF933xwoM7g63SGcjV
   wyiFcIZ+dfbZHB7TchYFLksgiaFQJc078bkSmNbWUz2Is/o4pEcL1To8/
   c/eqGxEj0RElUWK226JqrJvVPJzOQeeuhvs8zaSBbAZqqVK8A3rIsCClS
   5LPeDICisOzlxv8m1awXwZSy3dP2PdSmI1jqJg/txNo0A4+8xruhNKyWu
   42Mq3+5hHOtFKJ3qWmS4VzVQ7C49mLy3VlAK+pJTcRXi61WRoleCrD8t0
   Q==;
X-CSE-ConnectionGUID: lFuXP5YkQ4qrtSKJJdZiUg==
X-CSE-MsgGUID: Cq/OqEpARsiu5jqCv1LFkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487596"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487596"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:25 -0700
X-CSE-ConnectionGUID: gcrRgtXXTjKw4Vgmn8Hxfg==
X-CSE-MsgGUID: Z+tU92ydS+SNGIQprOQabQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080000"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:23 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 06/13] ASoC: topology: Cleanup soc_tplg_dapm_widget_denum_create
Date: Thu, 27 Jun 2024 12:18:43 +0200
Message-Id: <20240627101850.2191513-7-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/soc-topology.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 242d8b9c2f03d..6a2a8249903d3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1156,36 +1156,31 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	int err;
 
 	ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
+
 	/* validate kcontrol */
-	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 		return -EINVAL;
 
 	se = devm_kzalloc(tplg->dev, sizeof(*se), GFP_KERNEL);
 	if (!se)
 		return -ENOMEM;
 
-	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
-		      le32_to_cpu(ec->priv.size));
+	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) + le32_to_cpu(ec->priv.size));
 
-	dev_dbg(tplg->dev, " adding DAPM widget enum control %s\n",
-		ec->hdr.name);
+	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n", ec->hdr.name, ec->items);
 
-	kc->private_value = (long)se;
 	kc->name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
 	if (!kc->name)
 		return -ENOMEM;
+	kc->private_value = (long)se;
 	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	kc->access = le32_to_cpu(ec->hdr.access);
 
 	/* we only support FL/FR channel mapping atm */
 	se->reg = tplg_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-	se->shift_l = tplg_chan_get_shift(tplg, ec->channel,
-					  SNDRV_CHMAP_FL);
-	se->shift_r = tplg_chan_get_shift(tplg, ec->channel,
-					  SNDRV_CHMAP_FR);
+	se->shift_l = tplg_chan_get_shift(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_r = tplg_chan_get_shift(tplg, ec->channel, SNDRV_CHMAP_FR);
 
-	se->items = le32_to_cpu(ec->items);
 	se->mask = le32_to_cpu(ec->mask);
 
 	switch (le32_to_cpu(ec->hdr.ops.info)) {
@@ -1193,8 +1188,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
 		err = soc_tplg_denum_create_values(tplg, se, ec);
 		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: could not create values for %s\n",
-				ec->hdr.name);
+			dev_err(tplg->dev, "ASoC: could not create values for %s\n", ec->hdr.name);
 			return err;
 		}
 		fallthrough;
@@ -1203,8 +1197,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
 		err = soc_tplg_denum_create_texts(tplg, se, ec);
 		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: could not create texts for %s\n",
-				ec->hdr.name);
+			dev_err(tplg->dev, "ASoC: could not create texts for %s\n", ec->hdr.name);
 			return err;
 		}
 		break;
@@ -1222,11 +1215,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_control_load(tplg, kc, &ec->hdr);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return soc_tplg_control_load(tplg, kc, &ec->hdr);
 }
 
 static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
-- 
2.34.1

