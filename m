Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA813C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483503; cv=none; b=mxeno5kZS/yU4ZOJWfd6ZbD6TPl8BrA9JFEVMiiqJY9kHrDjN/YByeKGwy6dVOOIPl0/aa/KBYIJVFehMbmapSYYyAnJ/o7t4YZDtLOiLHJ81qV5LFOvqpqOn9whru4oDBlLsUEMIjyu5Tw0KVHULrN0HuHl8RfKs9TGFUO4R88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483503; c=relaxed/simple;
	bh=plj2VxixQDsHaludgtkK9C3QWSXWXsi6xLU+EB9hz4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljOgNO4gxW/tdR2G5n/egkJdPrHYJ3jHoaOnwkI1cuSKanYYFAGZJP+kn755yGDoUHFgwuYTawsnw0XYTW/4OiP3liy8vyKM1TWuR26bcDwUeaVH5Dy+qTzgjEry82pP2nmtBS0cX0hsjLWhNzmn75lJRcfJINjFgEGjcUyY7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhCI3EMR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhCI3EMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483501; x=1751019501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=plj2VxixQDsHaludgtkK9C3QWSXWXsi6xLU+EB9hz4c=;
  b=AhCI3EMRzSDWqfnW/fu0UdSeKHcWhFskm4ipCgA3EdczjNFI1Q6kJ3bO
   4ZN0NGiqKNHsFZVdvIreAw5T6PfMZiojO19GmhucoEwmHp58BYpQV3JZ/
   3EF3gJKq3BJUbAlsCBY2YRUeTeyIF5wTpqAy1gqBO8V01aprtIURKW3sH
   VbA1BmGmp4fbBryx5nCobb3armNR9wcum5H3eTjJrM2kdk8kiIM8BqRXo
   DPP2ItYCAu3gt4YG7METPeRazSNVW5h+8+/dYhn17qOBqtZED562Lz35P
   Wf6ptyt0BVDD6HNS9/AKGeH8h+TbXR5FUv7cX9fCATkq4XlkiruLwL1IG
   Q==;
X-CSE-ConnectionGUID: 0hxmdazZSSiQqUGJhGRN9A==
X-CSE-MsgGUID: 7ROjYX6MSaKtjl0lQu5C9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487586"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:21 -0700
X-CSE-ConnectionGUID: m9ypiWyIS+OrEEE+jeLiMA==
X-CSE-MsgGUID: HuHkn05+SuiVT7fKBf6vfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45079986"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:19 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 04/13] ASoC: topology: Cleanup soc_tplg_dapm_widget_dbytes_create
Date: Thu, 27 Jun 2024 12:18:41 +0200
Message-Id: <20240627101850.2191513-5-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/soc-topology.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 15c006c47d804..73e1279758223 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1249,25 +1249,22 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
 	be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
 
 	/* validate kcontrol */
-	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 		return -EINVAL;
 
 	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
 	if (!sbe)
 		return -ENOMEM;
 
-	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
-		      le32_to_cpu(be->priv.size));
+	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) + le32_to_cpu(be->priv.size));
 
-	dev_dbg(tplg->dev,
-		"ASoC: adding bytes kcontrol %s with access 0x%x\n",
+	dev_dbg(tplg->dev, "ASoC: adding bytes kcontrol %s with access 0x%x\n",
 		be->hdr.name, be->hdr.access);
 
-	kc->private_value = (long)sbe;
 	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
 	if (!kc->name)
 		return -ENOMEM;
+	kc->private_value = (long)sbe;
 	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	kc->access = le32_to_cpu(be->hdr.access);
 
@@ -1281,11 +1278,7 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_control_load(tplg, kc, &be->hdr);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return soc_tplg_control_load(tplg, kc, &be->hdr);
 }
 
 static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
-- 
2.34.1

