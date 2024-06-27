Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6713C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483511; cv=none; b=kxjb3CDhBlZEU1IEmfCHJyhvSwJAJ1UMWC7CIT3KFKgCPQ4tM5uLaq4pqvd3V+tCASKKvztjreXs4bvnKFiRyYCJ5h2CtGOTDZHuSuQ4cuch4fXcel69n9Q8SWjMyaCRzD5fCxOoxUHIXq1dkBbR8zypFVdaoc/++my8mcg1RFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483511; c=relaxed/simple;
	bh=0Tane6+zwwCopyy1Lp+QClQeNV+y1kY20pL2+Kk9anU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg87z+1HKnlJk/EJpv/FDhwlN/426hGc+ib4+MdSeDjJuCxSk93uNKYkYtxJrtnuYHn2UB80bWWE7xbsJxTb4lDUY9/0mkflOMOvqRoVoDNxuvKDPHd9KRUOWFdDnX+1Yjf3A7Wk05mcnXOaQp8hdNopwG6ePoIpl7u+ClCEPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVaYhuFJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVaYhuFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483510; x=1751019510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Tane6+zwwCopyy1Lp+QClQeNV+y1kY20pL2+Kk9anU=;
  b=fVaYhuFJCj87mDIjiYEELQ3dp3NemDQ9b7OmT0GlCnkdoVvws17+abKU
   /r2sFcQGKmOWMVgwe0hix8ui126/tyGpgzZoear10hgUjQYklHRfjOG7d
   0mpHBZbu1RFJinvO5Hl3eUp2LR6ebdb9/GzxcicAMjhZpgGmQzmQ2qCdn
   HuLpAnrdxIHCsL5wkoHGZxU8e3DzbNGkxzbUOQ8GlIBR7Tbq2zIiBaAD+
   O9OX94Txa+LjqSy2XDLfNFbR9jpkCtCsDzFoR4Kv6R8q6CrBolSP/Fe7p
   Nh0jha7R9kmstvONs+2BAzuwJ3m8iQvCrHvrrsRfbR96k1GUNiE7ESG9j
   g==;
X-CSE-ConnectionGUID: AADxrysCRpaH0JqlUYAI2w==
X-CSE-MsgGUID: A4yFuNIsTfmsbt3UA3SDFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487605"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487605"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:30 -0700
X-CSE-ConnectionGUID: qrHtzcFJSquj4c6mY6yM8g==
X-CSE-MsgGUID: VvPUZtS5T0WKhg5VE5O+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080007"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:28 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 08/13] ASoC: topology: Align dynamic object initialization for controls
Date: Thu, 27 Jun 2024 12:18:45 +0200
Message-Id: <20240627101850.2191513-9-amadeuszx.slawinski@linux.intel.com>
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

soc_tplg_dbytes_create() missed se->dobj.index initialization, so add it
there. Additionally separate dynamic object initialization into separate
logical block code.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e6eb514de5697..72bd3823a0154 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -677,10 +677,12 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 	kc.access = le32_to_cpu(be->hdr.access);
 
 	sbe->max = le32_to_cpu(be->max);
+
+	INIT_LIST_HEAD(&sbe->dobj.list);
 	sbe->dobj.type = SND_SOC_DOBJ_BYTES;
+	sbe->dobj.index = tplg->index;
 	if (tplg->ops)
 		sbe->dobj.unload = tplg->ops->control_unload;
-	INIT_LIST_HEAD(&sbe->dobj.list);
 
 	/* map io handlers */
 	ret = soc_tplg_kcontrol_bind_io(&be->hdr, &kc, tplg);
@@ -750,11 +752,12 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	sm->min = le32_to_cpu(mc->min);
 	sm->invert = le32_to_cpu(mc->invert);
 	sm->platform_max = le32_to_cpu(mc->platform_max);
-	sm->dobj.index = tplg->index;
+
+	INIT_LIST_HEAD(&sm->dobj.list);
 	sm->dobj.type = SND_SOC_DOBJ_MIXER;
+	sm->dobj.index = tplg->index;
 	if (tplg->ops)
 		sm->dobj.unload = tplg->ops->control_unload;
-	INIT_LIST_HEAD(&sm->dobj.list);
 
 	/* map io handlers */
 	ret = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc, tplg);
@@ -894,11 +897,12 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 		SNDRV_CHMAP_FR);
 
 	se->mask = le32_to_cpu(ec->mask);
-	se->dobj.index = tplg->index;
+
+	INIT_LIST_HEAD(&se->dobj.list);
 	se->dobj.type = SND_SOC_DOBJ_ENUM;
+	se->dobj.index = tplg->index;
 	if (tplg->ops)
 		se->dobj.unload = tplg->ops->control_unload;
-	INIT_LIST_HEAD(&se->dobj.list);
 
 	switch (le32_to_cpu(ec->hdr.ops.info)) {
 	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-- 
2.34.1

