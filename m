Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42A15624B
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962287; cv=none; b=Ta1wC8X6Qm4SbKaqjob7I36tjKN7K7aJNiLswntFd1Me5Z3llIPLr7p25Vc8ztP8HXJwxSRfwUXqjpOf0kSXyrovJ076OGqjBM3MbwBUrWZIRRQJsGm47S+iazLPyCBZ1gkaZ6ubJgZ/1nvIz+DNrEapjuz6Ou2Fqr0w4DmRiAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962287; c=relaxed/simple;
	bh=6U1sMgIAneBnxyIBANSsIrANJ/cGK15fXwv5rJIFRPY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eBZjM1gUMfQwbG8sdyPMBDwj7zoxCC5QixoTQ3zzaLYuatV6I5jNi4QjlucZb4p3VM/obz+l5rYY1y9nwUcVRxYGEWsjh6pmeq6jy2D8HhRmOH6otNPRcXPhHCVa5R8rwf31S8ygAnSQFOC5Ckwn03sb9D6YS5VPBNCWFpqKjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6s+mrEI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6s+mrEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748962286; x=1780498286;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6U1sMgIAneBnxyIBANSsIrANJ/cGK15fXwv5rJIFRPY=;
  b=M6s+mrEIzTogzwUHsN5iNfXRbGtmaczzR9Ua0129Hp6xCM66hTLwAQl9
   KyMvCH7RM94FLa5/Kx2PY6OJPTNazkb2uU+qXBNXf/oZhPUE8fexn9i6g
   QjjMJ8YM22jiucxxDQsmEEtEXoQXK/p5beD0lmz94ZZLaufpMUVqi0UiP
   Kl4rmtbWX4b6r9UeyfkoVj2SwfUiAOC9E+8Fh5oYhjufSZ06w515OLGlA
   ytiOgi/io4nf/XeKIvNglV4kb5KiGSDB+ReR+3bJ+S7RLthu/FUIv/UyN
   cR07ExNzX4cHFaKIhITxnyfmwNAlrd4rErDWsy4z77k9ztcDUEVkHVaL/
   g==;
X-CSE-ConnectionGUID: /RSyXzG9RdqIbpJ/PZ0AFw==
X-CSE-MsgGUID: FkpzrruzRfKqeX+Ouc68lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51077653"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="51077653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 07:51:25 -0700
X-CSE-ConnectionGUID: svBuqR5ISOiWNbfabb8zRQ==
X-CSE-MsgGUID: GVDARnClQa6Zs/7GYC5ZJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="148728933"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jun 2025 07:51:23 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: boards: Fix rt5663 front end name
Date: Tue,  3 Jun 2025 16:52:44 +0200
Message-Id: <20250603145244.871239-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix copy paste mistake in board name.

Fixes: f1e282c333ac ("ASoC: Intel: avs: boards: Change rt5663 card name")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt5663.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 122b6c48fd807..51648801710af 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -228,7 +228,7 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 		card->name = "avs_rt5663";
 	} else {
 		card->driver_name = "avs_rt5663";
-		card->long_name = card->name = "AVS I2S ALC5640";
+		card->long_name = card->name = "AVS I2S ALC5663";
 	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-- 
2.34.1

