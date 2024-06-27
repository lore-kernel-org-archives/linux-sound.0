Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65F139D0A
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483499; cv=none; b=QGAOOyagPl6tL5dP2A94yj3cm2QlkOnj2jA3JlZBVfzKWX+okSz/Rw5EDdDGIVd1VIdUjiGnQIBDNtWePRvXtmL948P+czJM6LOkb+OFjhuq8f48VRHxby6glWkRcc/371dz1hUKhw0i2SClGQvSJ4UZ2AYLg5z/cWTwGNojtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483499; c=relaxed/simple;
	bh=sZ1HP9Nhuz6+cIYRvSAKLNHESTSDtRQH13w1tRwp2bY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhmIDEVweb0/E9fHHNWul7QzsemBedlOTc3nvQ8W0o0jwLkX/84eCokgIb+urqVIMGK9XHB1/pctLCeZSYn4RKyxSRrxNba4wrPdcZmp5HGOvdyVNb+bVnpYrM6o6hg4UrxRy5VENZ5VU+u4E8+wCRDMgrVBn2AG3WorSBahDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ax3vhFIV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ax3vhFIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483497; x=1751019497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sZ1HP9Nhuz6+cIYRvSAKLNHESTSDtRQH13w1tRwp2bY=;
  b=ax3vhFIV9P9Dbzww4yJWm/N4C59nNphAEQ+MgEax/Z1X90xx7YlFw1vr
   15r3CvwDOy6xX12yRxTmirGcXLAZ5nMWJ/PKezrtr4fG2yrx87fqzBL7B
   /wI/hvfbCLWw5ztX/HS2LmTbCQesy+L+vCcHMcTI8HlPJbrT/nkUpO68Y
   ATt9MBoterO1ZPbv4gr1PFp55qyRq1Qgu+lfjU7jMhPmCDwm2VEP2Rmwp
   lVzC9iJy5ONvFglV1Bu7EXyHpQWi/C4p7x12szy4XD4LeQDLSChrSUm6A
   qaC2UufzpiKckiBWBlmZ0JfDANSFECJS64e8xOONpGHpPGJaXBMsBqPzX
   Q==;
X-CSE-ConnectionGUID: C95k6x1TRzuLGOkDMYG92A==
X-CSE-MsgGUID: AUAKQgwVSuG5mIGhSTwM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487574"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487574"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:16 -0700
X-CSE-ConnectionGUID: Vs0BjLs+TeiaQ4q7Q3BapA==
X-CSE-MsgGUID: X/5kV8sCTiyUXtRMroWPUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45079969"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:15 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 02/13] ASoC: topology: Do not do unnecessary dobj management
Date: Thu, 27 Jun 2024 12:18:39 +0200
Message-Id: <20240627101850.2191513-3-amadeuszx.slawinski@linux.intel.com>
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

Widget kcontrols do not need to be managed as topology dynamic objects
with an index and a linked list. As they are always associated with a
widget which is already a topology dynamic object, thus all
addition/removals of a widget will by design manage the kcontrol.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index dff83d49a8f61..bd29b40acb991 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1134,8 +1134,6 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 	sm->min = le32_to_cpu(mc->min);
 	sm->invert = le32_to_cpu(mc->invert);
 	sm->platform_max = le32_to_cpu(mc->platform_max);
-	sm->dobj.index = tplg->index;
-	INIT_LIST_HEAD(&sm->dobj.list);
 
 	/* map io handlers */
 	err = soc_tplg_kcontrol_bind_io(&mc->hdr, kc, tplg);
@@ -1198,7 +1196,6 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 
 	se->items = le32_to_cpu(ec->items);
 	se->mask = le32_to_cpu(ec->mask);
-	se->dobj.index = tplg->index;
 
 	switch (le32_to_cpu(ec->hdr.ops.info)) {
 	case SND_SOC_TPLG_CTL_ENUM_VALUE:
@@ -1273,7 +1270,6 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
 	kc->access = le32_to_cpu(be->hdr.access);
 
 	sbe->max = le32_to_cpu(be->max);
-	INIT_LIST_HEAD(&sbe->dobj.list);
 
 	/* map standard io handlers and check for external handlers */
 	err = soc_tplg_kcontrol_bind_io(&be->hdr, kc, tplg);
-- 
2.34.1

