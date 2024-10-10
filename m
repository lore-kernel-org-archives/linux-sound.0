Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9012433CD2
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559162; cv=none; b=lJVHO0LIADABtQ3x+gv8f8btCzA7SViAcJjL/Xs7HCykG8j8kAEu8kjyfW2Z0ycy5RqHUDgzrRa6RLqkSRzE7HD8EQXlrUtI2BqtgyCFQ7xpF07USrpVQm5oZdkj1wmrn98sFNA+wTVZLGYGf8xU+HVmWSJhI2SzTnB62x3mvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559162; c=relaxed/simple;
	bh=nz0iWSSKmy53/ggtFZ71B5LhtR0c5iT4D8YlE06f2II=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OyOEgx/oEmNP2Ux7zQUEKlfwrLBMQnev3rhQTydWiC0aVUc+rwmK+t6eAeuDYyXDLQZuGNAZ+Nl4Gp7RtR71NzH7i4hbo0Tb+Cc4EGsUEyTxKttKlp739OAx+2zrJsg3RpOeeRmiFk4cwK4RoDhLtGGPj14g6+SbmvVM651HPPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9c545MV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9c545MV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728559162; x=1760095162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nz0iWSSKmy53/ggtFZ71B5LhtR0c5iT4D8YlE06f2II=;
  b=J9c545MVH65Y24BTJL2+3a83SUC6XRstHdO78AuqIyMJJnBsNVZ+JEhi
   tMuVuaBg3lfWuauffRVcPHrcIslfZhczq+VFoZSJcY9Z2Q9MHiLttoOSe
   HElg21r+Vfqn7naRRJ60l66dQDlQ8b0rVNzEhpukPISSA5xM+M+cFA2sD
   j0oqF1DOEhfyf2sv7N9cz4kMC2S8mHKrbJ7vYlK8dhZJffZD4KCGo5U64
   GHI8KzLNyYh2WA95bakhUVw74GC4HUFh1APQjqQc9vMvhYKCnQXdRY3DS
   25FrLKN+IHmqUxAaOGFvgHcBjYn0SY6v3LVPlqpl5rKGk7FPXE3r95pgb
   A==;
X-CSE-ConnectionGUID: i0X1Ft/NSMmQJTlR9H2HIw==
X-CSE-MsgGUID: 5XXLrVqmShOsrGQjeBkSmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31608268"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="31608268"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 04:19:21 -0700
X-CSE-ConnectionGUID: +WQDeznlS62dQoIRFBZsWg==
X-CSE-MsgGUID: 6Sx8qr/iRFCvKieE6tStAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76559665"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2024 04:19:19 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix return status of avs_pcm_hw_constraints_init()
Date: Thu, 10 Oct 2024 13:20:08 +0200
Message-Id: <20241010112008.545526-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Check for return code from avs_pcm_hw_constraints_init() in
avs_dai_fe_startup() only checks if value is different from 0. Currently
function can return positive value, change it to return 0 on success.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
--

I've observed KASAN on our setups and while patch itself is correct
regardless. Problem seems to be caused by recent changes to rates, as
this started happening after recent patchsets and doesn't reproduce with
those reverted
https://lore.kernel.org/linux-sound/20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com/
https://lore.kernel.org/linux-sound/20240911135756.24434-1-tiwai@suse.de/
I've tested using Mark tree, where they are both applied and for some
reason snd_pcm_hw_constraint_minmax() started returning positive value,
while previously it returned 0. I'm bit worried if it signals some
potential deeper problem regarding constraints with above changes.

---
 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 4af8115803568..945f9c0a6a545 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -509,7 +509,7 @@ static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
 			    SNDRV_PCM_HW_PARAM_RATE, -1);
 
-	return ret;
+	return 0;
 }
 
 static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-- 
2.34.1

