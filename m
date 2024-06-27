Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3913C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483509; cv=none; b=bMzH7Mu+ItGsSL0353ScaDTzhEIKGsJiaj9uny987kwdbwFDvYVeBDAPDHspbnPRAHFVyiqCk5Job1mm1SBD5hHjZers32Tm49WZawiXoXw3j+0UxtB720fCHZeLV9jOyJ90GQ/+QzpKH3jsxhyoRfs+MrRYjS4oxUDSNorjS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483509; c=relaxed/simple;
	bh=RQytEy+q9wC+KnpjaBM5dhyhv1wUSTFdqwetEaUm9Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=byu9T/L29Xq1NAUL4fhhaFihQ1o5SdI7tuvc6ZTfB6luicr42/Q+H4X9Oa3wWdxYKd3C2/HPF0ptkrymvxyf91allRmuCq1Gkn4lVfgmKCAE6uErIQsCB8ufphK8RWsIU7t7LtlwMGEYp5CP4mU+SVMirKlBbsJZd8nr50uyPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsmo/fE6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsmo/fE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483508; x=1751019508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RQytEy+q9wC+KnpjaBM5dhyhv1wUSTFdqwetEaUm9Ls=;
  b=fsmo/fE6NaF8bl4oVL+feaWnCh6GUTvCmCf2tLa94Kln5b/vgNT/j701
   l1HWaB+qZ0Ku66XAJTAzslsd+lelyVqTt4ewuLlTS/3hAUiZOAsiU5Imf
   xz2SvsX+FN9DxAflicjOYu3YsLc9kzkGHGFmv+hae6/22Rs7CDd2IjKzO
   oUAWCo/8RB8mr/enodG60Vv0TfPux42WRd7S5MFXC5onMRcuMQpOcPvoD
   Ai3MwWaxqf/FS7YICbtbNw4tcefORaaWnP8fSftPpaFacyBRa8Se2E6w2
   v22rDVj0+4nFySVIJQS+LyKsNHBcFNnqXuf2cmUGMbeZkR+tVvf3jJs30
   Q==;
X-CSE-ConnectionGUID: wRGeHpc/SG28RgN0BvPStw==
X-CSE-MsgGUID: cqXNq88DRQKrfppwDUDSDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487600"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:27 -0700
X-CSE-ConnectionGUID: F6/CWkPsTJyi4dQ+z87wEQ==
X-CSE-MsgGUID: 43k+PNLzT8yApO3SvAki5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080003"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:26 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 07/13] ASoC: topology: Correctly set shift_r in soc_tplg_denum_create()
Date: Thu, 27 Jun 2024 12:18:44 +0200
Message-Id: <20240627101850.2191513-8-amadeuszx.slawinski@linux.intel.com>
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

This aligns soc_tplg_denum_create() with
soc_tplg_dapm_widget_denum_create(), as there is no reason for
difference in behavior.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6a2a8249903d3..e6eb514de5697 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -891,7 +891,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	se->shift_l = tplg_chan_get_shift(tplg, ec->channel,
 		SNDRV_CHMAP_FL);
 	se->shift_r = tplg_chan_get_shift(tplg, ec->channel,
-		SNDRV_CHMAP_FL);
+		SNDRV_CHMAP_FR);
 
 	se->mask = le32_to_cpu(ec->mask);
 	se->dobj.index = tplg->index;
-- 
2.34.1

