Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A741369BB
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136681; cv=none; b=fYEUFPcjQ09dOwLn6HRquwtOI6G85e3lFu7Fi+1YZcR6G9QzVP75+K4iepNwkwA91OO2yvD038kUVJ1jnHASvvZy/Pdh3M2387QtQMJhmDwxWbh1F3keXkIH0dVq1MG1gsVao8tGYsKLlk7F6OTpTiV2WPMtKJgxEnLby58kNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136681; c=relaxed/simple;
	bh=ksuiznIoJxFzb1RHAvr0zISxppTJtV786zLmv8pdFSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHDmfcS9K4iHwrY/stgecBY3Zz+N89hZdjGunV9J1mGtPrGNEoqupDvwyYZj0cW/CvgqzML556mq02RZEFXUQoZOX9030F95YOvYZB+7HyfBJcG+K6H0CscyKyYSNRDW3xRPQQ+BGxGRT+Avl0c7MD6GMuJ4YlXYnWtpuCgW8fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAUoyOHA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAUoyOHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136679; x=1743672679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksuiznIoJxFzb1RHAvr0zISxppTJtV786zLmv8pdFSg=;
  b=OAUoyOHAXofa7aAg6GFBnxWraxZThQ8nCoTg5mx0tokrEDnyAoQf5KeH
   XMOEJlmUpiOFaQDHsqRRO/LH6LiIdN34I2s040jM+xmqH0gekUqeLV4qr
   J3uO5n4Exp2fpsN80Vs1xh9Dqa/yrWCXj+fAetYAVlyF9LtoAU9r0AyBQ
   z7mGW7qv1Uddm7GlOOH8JJNprWaf4KdG8TqJbNjUAgsxIVdug31zh+zMs
   vvKJ9wljyGF4a3JfB9suM9P/Ugkd3R5e2QyAHzt3lrMkKKImj8qA3yTfn
   BbBPQgy7zKDqNOz5uFpuaN4ZKAuB+OtVY6hFpNcs+VdAoOkFnK1NWHTs/
   A==;
X-CSE-ConnectionGUID: Vxlm28CXTICrEIL1wFb8Lw==
X-CSE-MsgGUID: qRQR10sJRS+CRMYDDcEozA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218692"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218692"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:19 -0700
X-CSE-ConnectionGUID: cbNBmSYVTeiNkya1WpL43w==
X-CSE-MsgGUID: a+mdaRImQ++pyxrELfMr2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797542"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:17 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 03/10] ASoC: Intel: avs: hdaudio: Constify probing_link
Date: Wed,  3 Apr 2024 11:31:38 +0200
Message-Id: <20240403093145.3375857-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

probing_link is passed to devm_kmemdup, and is never modified, may as
well mark it const.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 2de703b909c30..4433175814f80 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -155,7 +155,7 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 	return 0;
 }
 
-static struct snd_soc_dai_link probing_link = {
+static const struct snd_soc_dai_link probing_link = {
 	.name = "probing-LINK",
 	.id = -1,
 	.nonatomic = 1,
-- 
2.34.1

