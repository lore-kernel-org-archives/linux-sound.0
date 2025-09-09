Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB629D297
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410017; cv=none; b=IC7qlC7itBpyA9dLP1Ww5dkeUgCshKzUiM9kRp6plCXsdelMSdo1S+cCdvGtTkU6ovpP6Bp54SNVzn+pPHWnUUlT9cY9bpQuX31Q4J6UUuCcNHQv+IQdEwJfPtDzf+kDp+a+EyheqdQhiGZLkgrOvF6/4lXwsELKRzSyZDsPvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410017; c=relaxed/simple;
	bh=v9T+Dpaf1gAdQxGMw0cXPCgPGKa4Xg7molr69TEo2sQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qkUVMjPjS1bVuMny78Ksfrt/MDg/SF2uVQxPkDbhaZYZGU4tYbfDYKWtNdlSZXtkdGVvZPX+6e+5a+96uLYHFFOOjlT7/Ryj5lmljCqJOLLXPlfKOd/Hi4372asJStEek+TEFqbI2f8GMyH/dh3k3398quGLMWCA3f80uGG2e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hpbrx0zJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hpbrx0zJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757410016; x=1788946016;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v9T+Dpaf1gAdQxGMw0cXPCgPGKa4Xg7molr69TEo2sQ=;
  b=Hpbrx0zJ+MkrbvwjI0lXHsdFgojpz5W75DOe94rHhhEAc4RXhuxPNrhv
   l3wYQY6gYrZPv1x9MxlsyM9gnQgH3hBX0FYNhjk5G5balR13Z7Sd20HHR
   fxw+gwo/BoFD4UT93I+vTEPVemYFikW8zaxuj0fzWfT01Ndixr1oKfGUj
   WeB3ENT3pSJJN7seT+rHOmyWWIUwzTVR9acpPQftpxkwMki736UHcm5vQ
   i2LNGXidvFa755XiYSoW70tWv4DLrTZ1WQjz3f40PWLmq6WCzTJ+YNgB5
   GS/h66zo7iz4Xp7KMzRLsp+VacHYqs+epNWrsDZDvI4YjM3ABclqAI51Q
   Q==;
X-CSE-ConnectionGUID: zA+UfMSARfe8eG13K8ugew==
X-CSE-MsgGUID: Gt4zJCNARdKMBDD9tJDl8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59381323"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59381323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:26:55 -0700
X-CSE-ConnectionGUID: tFt+rA9tSFucUAw1bZxNNw==
X-CSE-MsgGUID: e+CoxqgeSeWeWfTNPUJzWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="178255131"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa005.jf.intel.com with ESMTP; 09 Sep 2025 02:26:53 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: catpt: Expose correct bit depth to userspace
Date: Tue,  9 Sep 2025 11:28:29 +0200
Message-Id: <20250909092829.375953-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently wrong bit depth is exposed in hw params, causing clipped
volume during playback. Expose correct parameters.

Fixes: a126750fc865 ("ASoC: Intel: catpt: PCM operations")
Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Tested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/catpt/pcm.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 46acb7fdc547d..bf734c69c4e09 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -568,8 +568,9 @@ static const struct snd_pcm_hardware catpt_pcm_hardware = {
 				  SNDRV_PCM_INFO_RESUME |
 				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+	.subformats		= SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	.period_bytes_min	= PAGE_SIZE,
 	.period_bytes_max	= CATPT_BUFFER_MAX_SIZE / CATPT_PCM_PERIODS_MIN,
 	.periods_min		= CATPT_PCM_PERIODS_MIN,
@@ -698,14 +699,18 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			      SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 	.capture = {
 		.stream_name = "Analog Capture",
 		.channels_min = 2,
 		.channels_max = 4,
 		.rates = SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			      SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 },
 {
@@ -717,7 +722,9 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			      SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 },
 {
@@ -729,7 +736,9 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			      SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 },
 {
@@ -741,7 +750,9 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			      SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 },
 {
-- 
2.34.1

