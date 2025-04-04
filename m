Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C81A725A
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756417; cv=none; b=KdTs8TMhPsEgIKnoKpPuJcf0z/N3/WusrXvJum6zZwZBJw/fg5QQyy5U7ELv+zoY897BpeBCq5knJ1r/EEc4eomrkEn/LQ06kiygYv7+nampl3skwkxdC8PwCCHXTadz5t4Y0HeE8jL4LBwp8LYkEEHLw2XEnX67h6o3a8gX4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756417; c=relaxed/simple;
	bh=esHqllad9d3bCX/up3Xg8psV9YgkubZmfpPpaB/uN2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9MxgjBKPWp2htFZbhRfFRjDp/56haF3mteZM/fAoV5neHDEH73Rpd2Da9Qg0Y/NGMEG9Smgiam8OsvUn5a0ZzMyZ6Gxtq4Xa6JLPq/ONnZ1dPYHrYow+OvxNHljZrQ+NARHX0mXGDgNJN6OMMSbwA+skI8KOth4o2Ds+u1BDpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/KRigKs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/KRigKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756416; x=1775292416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=esHqllad9d3bCX/up3Xg8psV9YgkubZmfpPpaB/uN2o=;
  b=i/KRigKsnRv0Mc448XWstxRbGFw0Bcqw+7qGHQfWFz6L3UpyoYeogOx7
   cLkVWI5zdBTkWMkm3pmNQbOjVp/PLIdt5jh5W7auWwp3KQkM9DIVr11Uh
   7I04pVJWSJJ2WO5J4RB2Nc0PAYbTEE0WBgLJNqvMySVKehiLUuuS0KFRd
   TvGOmfAcA7kd8BQvVwUWGaAd9kFfyPBWqqre8S/2cR+JlB+MzCEXMqDeJ
   uCzOrXkoOocZ08lQdMNZeFkLBer4TX9cDUQ2EzlVCMisv9iwPGP2UGZju
   +LtRPj7tU7bC99L4rWTiiL/zZiE5li19TANfXTxlEEG4qkLgTf7a369B7
   A==;
X-CSE-ConnectionGUID: Xu3GxxEDRgyk00zWKvN7AQ==
X-CSE-MsgGUID: Y+9i98cFQReZH7LGaqgygA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854586"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:52 -0700
X-CSE-ConnectionGUID: Bc9NlUoDTaiB35ky5iy8rw==
X-CSE-MsgGUID: UKqDNnR6STOW0kqNaZpGVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464245"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/8] ASoC: Intel: avs: Allow for 16 channels configuration
Date: Fri,  4 Apr 2025 11:03:33 +0200
Message-Id: <20250404090337.3564117-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add define representing maximum number of channels that are allowed by
HDAudio standard and as such supported by HW - 16 channels. With that
done, reflect the max in BE DAIs capabilities.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h | 1 +
 sound/soc/intel/avs/pcm.c      | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 673e4577df14..e27c7587be9d 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -699,6 +699,7 @@ enum avs_sample_type {
 
 #define AVS_COEFF_CHANNELS_MAX	8
 #define AVS_ALL_CHANNELS_MASK	UINT_MAX
+#define AVS_CHANNELS_MAX	16
 
 struct avs_audio_format {
 	u32 sampling_freq;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index dac463390da1..7d57a5735157 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1337,7 +1337,7 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 	.ops = &avs_dai_nonhda_be_ops,
 	.playback = {
 		.channels_min	= 1,
-		.channels_max	= 8,
+		.channels_max	= AVS_CHANNELS_MAX,
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
 				  SNDRV_PCM_RATE_12000 |
 				  SNDRV_PCM_RATE_24000 |
@@ -1350,7 +1350,7 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 	},
 	.capture = {
 		.channels_min	= 1,
-		.channels_max	= 8,
+		.channels_max	= AVS_CHANNELS_MAX,
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
 				  SNDRV_PCM_RATE_12000 |
 				  SNDRV_PCM_RATE_24000 |
@@ -1431,7 +1431,7 @@ static const struct snd_soc_dai_driver hda_cpu_dai = {
 	.ops = &avs_dai_hda_be_ops,
 	.playback = {
 		.channels_min	= 1,
-		.channels_max	= 8,
+		.channels_max	= AVS_CHANNELS_MAX,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
@@ -1441,7 +1441,7 @@ static const struct snd_soc_dai_driver hda_cpu_dai = {
 	},
 	.capture = {
 		.channels_min	= 1,
-		.channels_max	= 8,
+		.channels_max	= AVS_CHANNELS_MAX,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
-- 
2.25.1

