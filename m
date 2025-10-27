Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3A26F29C
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561636; cv=none; b=I3CQPg3vJZPAaba+RQ4GcY2BRmwJ8xJ8pg7sdcpaSNvHdn+DRKf42U/x6+XW3OWAdE0zdY5pNIjb042CAtBH0kuhBGWkK8IImSapZuspdtJFf/bHGGBfF8/L1CVW81/acoHnUgGo42ef+9x0q5sDvgyfxwh/UuWGcmOdlgN9odw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561636; c=relaxed/simple;
	bh=YPXiFPv1zm+SKQfPdg3ruFFLpnrW5FgVh2SLIx+eZVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CBr+0h7s2mpZDn8kglSaT9ogJLcFMBvNwCex+Pk4aI8dj1wA2Hq+A+bM5EO+9agdoKcXkYPkE72eR2G3DRTGHV3HDbqtzRJ1hiZB7evh6KB3/POUvuMPvO94iemV06qM1guEqXxh5GtpA8Y8nIPczH0CmI16R0irzEtrv3ENMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lok9byT0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lok9byT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761561635; x=1793097635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YPXiFPv1zm+SKQfPdg3ruFFLpnrW5FgVh2SLIx+eZVc=;
  b=lok9byT0ZE1Vi0tr5yvmg00JZwzXZ0ZEAqAeUDRJ9UbIClW55t4IVa3r
   mkRcbQ9gV0Bk5UNXkSOheO3JcXiK6+tWu7uNNt99MfqfiM7zATY699kDU
   xgcPxjUFuy+GMzZbkZvEkBKTxNSiiWIOUljzNg50YyTXWwsCG57sBGCnz
   99kVvAliABSwtKInwSlK0b4dPLexlJ3gyZYqDobcOcnJSg6wKHnuvTgzs
   o3U55h/HbQIdrPbp3VfQtBf+Ds2IR0j8WuPBN9fDXntcwbrgw+4G2G9Gm
   MCQ6/3TY15SW4J3KBWxQ2FkPBSa+diLVZcvovy+xax66B6Fm4Mu4gKGe9
   g==;
X-CSE-ConnectionGUID: p3uhTewHRJmNZgsWKodD9A==
X-CSE-MsgGUID: Y5xc0W7dTmuiJp3dNVsYfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63672083"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63672083"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 03:40:35 -0700
X-CSE-ConnectionGUID: dDSVwBjbT1auYQWsXPGZcg==
X-CSE-MsgGUID: KyE30TX7RWubRJwB7ccJMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189051586"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2025 03:40:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/3] ASoC: Intel: avs: Unprepare a stream when XRUN occurs
Date: Mon, 27 Oct 2025 12:01:04 +0100
Message-Id: <20251027110106.3157415-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251027110106.3157415-1-cezary.rojewski@intel.com>
References: <20251027110106.3157415-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pcm->prepare() function may be called multiple times in a row by the
userspace, as mentioned in the documentation. The driver shall take that
into account and prevent redundancy. However, the exact same function is
called during XRUNs and in such case, the particular stream shall be
reset and setup anew.

Fixes: 9114700b496c ("ASoC: Intel: avs: Generic PCM FE operations")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d31058e2de5b..501466bd1f7f 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -754,6 +754,8 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	host_stream = data->host_stream;
 
+	if (runtime->state == SNDRV_PCM_STATE_XRUN)
+		hdac_stream(host_stream)->prepared = false;
 	if (hdac_stream(host_stream)->prepared)
 		return 0;
 
-- 
2.25.1

