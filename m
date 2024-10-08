Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033DE1CCB35
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385764; cv=none; b=ch/zzfMJlQulwOF0ZVgOx7mmxcZZSaKH+IhXn/x95g/Hkmu8GZwJu5CeEuGI+w9f5zuUQhPlcTHk2E4+loiWfYwGfIr4pka+yx/gX8E/bIhy5czQaV0Fsb750fEjo2xCh+jDO/BuZyN04rdhJCnzIlBzTO2gbj497ulRNm3YDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385764; c=relaxed/simple;
	bh=IhOWAyJQc43/NtPkkiaxlj8VfhbTBJMPaNaJCvUxKTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmK5wFCsnoyf0Ial0PkKrdcfuF3x1o9ngz8OGH32uAknrdhj+6v98MzEpEZ/9+w/UHTaGhziomSs9Q7H2Ik94H/ZgnW1XCMw4sHCF44d6wKPSvH2M9Xgv6kN9/aR/uMqWNcjmv2H6z3MA5KjCfLqDQe+TVwLVob/15duDxX3exM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVJHYr5y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVJHYr5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385763; x=1759921763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IhOWAyJQc43/NtPkkiaxlj8VfhbTBJMPaNaJCvUxKTY=;
  b=jVJHYr5ylIZr+TASrmfAJSbhDMYnOUGwqta35cUoPL1+kepRq39R8Gwv
   0T5XFDnVa/I8pXokd/9NgaANea7E79vc56Ac+5vYfexWA5eu6B2M2061j
   3cdMoRLM33O6i9+grjLvYG9MGaYdz5C/xobWNW4wB21cXcgqLozyb3/+8
   CQIWk/vWFkADlPOs0rk5Xp8UmrJGGe06Bzp+WnApoOdc5UYkIiAm5Bk1c
   mNF4a1OqLWXAwmY7fe2W+yH6N8NLuPFI4pLleTdEzrTpeECnXDrviBS1d
   55W1gbFh1TVEI/czAj4nmN72URwm6y9hbXJ82ewId210WQyFHOUiyd9Mf
   w==;
X-CSE-ConnectionGUID: YCOzErzSQhm+nlJeeSvRfA==
X-CSE-MsgGUID: RR3Q29RiScGIiNovFS3mFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036991"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45036991"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:23 -0700
X-CSE-ConnectionGUID: KON8k0f5TJ6J/2gmr4PGzg==
X-CSE-MsgGUID: g5aGc7viQT2hftjYi2J67Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586700"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 3/8] ASoC: SOF: ipc4-topology: Remove redundant check in sof_ipc4_init_input_audio_fmt()
Date: Tue,  8 Oct 2024 14:09:31 +0300
Message-ID: <20241008110936.22534-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
References: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At label in_fmt the if (pin_fmts_size && i < pin_fmts_size) is guarantied
to be true all the time, drop the check completely.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index af5eea853745..1f10926921d5 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1320,16 +1320,14 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 
 in_fmt:
 	/* copy input format */
-	if (pin_fmts_size && i < pin_fmts_size) {
-		memcpy(&base_config->audio_fmt, &pin_fmts[i].audio_fmt,
-		       sizeof(struct sof_ipc4_audio_format));
+	memcpy(&base_config->audio_fmt, &pin_fmts[i].audio_fmt,
+	       sizeof(struct sof_ipc4_audio_format));
 
-		/* set base_cfg ibs/obs */
-		base_config->ibs = pin_fmts[i].buffer_size;
+	/* set base_cfg ibs/obs */
+	base_config->ibs = pin_fmts[i].buffer_size;
 
-		dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
-		sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
-	}
+	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
+	sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
 
 	return i;
 }
-- 
2.47.0

