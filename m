Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E1033ADAA
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724196; cv=none; b=bB6tYIsgdT4C7EjxHCV4m0gdEIoM5Q5X12BJwmfeUkO3KtVlLTzECqdKK4hmct2rISdFhOBY0k5hDT6+4pb/dA7z2dHpz0ZQPK+Uv4SnjxFbIM30MVtiPxbemL3+xQz149OQF/CDRec3Cn2y4dnWNMvoAR5RKRcgTDMOPgUflss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724196; c=relaxed/simple;
	bh=khpzvROO7nxd+yiGWO3LymUxPInRZRNpY24InMPVmUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+Tbc7X+CDm1/hmbq7P1BBTyqlZnfZQqOIL5Z+q3DObWbKlCWX9Yc7c3P/qE0VRcksEjYhrV3VP58TAKhFxE4+j50lMBhGXMtCcYDWHn+9tMhjRuWGK2FVTYLLO8/ZR75HuGQFFsziifJIqTADzlDSpadzvmTFPzYYadM4rNsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nf8xCtZt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nf8xCtZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724194; x=1795260194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=khpzvROO7nxd+yiGWO3LymUxPInRZRNpY24InMPVmUQ=;
  b=Nf8xCtZtdYBYGZCMpaAPKMMNDvNHo/2b4RMumMHcy3Mkq+2dQ500piw0
   5M3xI1m/jOGA1Fj0XF0asca54omzrIzhf9GzLoR3wk4dC2Ah9q9aQZ+pT
   +qJ/VySOGII9V5fGHB3MvL7nASh705jsrZoCffZbWiycYJGOsQo3Ld6/p
   IYJWZv7Z8pg6QagSheMCWLoCut9P4PhsskB1PVeVsEUMTZra1idzJRgJI
   XDxyZL12E1V2r7OnqOBxXfnTA/Z3t4QVClYQnbkn+0hkuJE7xGA0CCLrB
   75D8ktlwYl7WBr30AcnXhQ3sxBFyXnGKp+kQOfmH+x/3VQ9pKyEEN0iHg
   Q==;
X-CSE-ConnectionGUID: bbH6CYcHRlaK5Q26GfRJiw==
X-CSE-MsgGUID: zSJx340ORfmaBURmq5wCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845916"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845916"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:14 -0800
X-CSE-ConnectionGUID: 3pMDjp4ORJep98nvdbDkpg==
X-CSE-MsgGUID: rVpjJFY9SCOa5D3sfZM3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462836"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:12 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/6] ASoC: Intel: catpt: Fix error path in hw_params()
Date: Fri, 21 Nov 2025 12:43:27 +0100
Message-Id: <20251121114331.3841335-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121114331.3841335-1-cezary.rojewski@intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leave any resources hanging on the DSP side if applying user
settings fails.

Fixes: 768a3a3b327d ("ASoC: Intel: catpt: Optimize applying user settings")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index f15385683d9c..9baaad13a273 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -417,8 +417,10 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 		return CATPT_IPC_ERROR(ret);
 
 	ret = catpt_dai_apply_usettings(dai, stream);
-	if (ret)
+	if (ret) {
+		catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
 		return ret;
+	}
 
 	stream->allocated = true;
 	return 0;
-- 
2.25.1

