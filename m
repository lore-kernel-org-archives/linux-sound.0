Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD2136E3F
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136692; cv=none; b=PFpuUnD2zA37Za6qgeIePV/KY9u3O/CaqHD4qvfV+J2faPUamFWtGW2s8cPX2owuMYFgdTiv0esuQ8EqW12YiFeWGvnDMTC7m6PQLT4Z3Kbqg2OsC2nWQJZcU0lRYYx3KxIFQdmKoGQ/JdlbDQBaiWsIVStPrAUiUkXEdseGKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136692; c=relaxed/simple;
	bh=H1VHHLIXeX8Omn5DQfAV7IkeGysf9C0vnaXxHYuscy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHkuxbPGem9rNX/gRq30xnfdRSU3VQD7tytMD1VHY6TI431t50fbBU6WiZ67Y0UzofV8reT6HFDv1HRrKz6VfcrUZv9ONgyH2LTFkbZqYvqFjKEfPE2JGVFHITK2azfBTZhO4bNECpwdg7qhfdyHwUraoHOlSX98SQy1WGuwZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZJISdFT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZJISdFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136691; x=1743672691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H1VHHLIXeX8Omn5DQfAV7IkeGysf9C0vnaXxHYuscy8=;
  b=VZJISdFTSfSRRRQK6Ld8jHAQEK3b29CEMAXNLpBzTjliisILq4x/6Xu6
   lTP7P8NTgkWt+Fx/w7dWhAWicevHW/o2RXFjl2aLNXVpc9Z9maFrj1EVS
   uxcZyypvnt90b80Nk7lMX/lD+hu2zV1qH/WVvY4JicdVYq2rtJCCAhHNr
   OBGeJGnnleegkJzaQwkc+cDOTM3WIP6PFmFjf59fzeyWsqqJo3xmOVrPn
   yy0a1n7gjRj/uARqDOQBoCKfp7nDEDKgcagf8MEDphn/EuQsBzY2xCSWL
   JlH0PQB7ZVQYUKi2+3VGmxcqL9Rj0LKrcNS0+gsr/BJC2Lnq/QkkBU1uU
   A==;
X-CSE-ConnectionGUID: rY0l3oMjRNWuHa7tk6OyIg==
X-CSE-MsgGUID: 0hPPA8WQSyW8D7Nvpu8ZdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218737"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:31 -0700
X-CSE-ConnectionGUID: cid7SUMdRQ+Lf/Kd5Gi0hQ==
X-CSE-MsgGUID: lPy6wLiwQIOWYrKYk2NbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797576"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:29 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 09/10] ASoC: Intel: avs: rt5663: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:44 +0200
Message-Id: <20240403093145.3375857-10-amadeuszx.slawinski@linux.intel.com>
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

card_headset_pins is never modified, mark it const.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt5663.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 1880c315cc4d1..ba8c42d026da2 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -43,7 +43,7 @@ static const struct snd_soc_dapm_route card_routes[] = {
 	{ "IN1N", NULL, "Headset Mic" },
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

