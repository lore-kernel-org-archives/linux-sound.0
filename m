Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397F17727
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838573; cv=none; b=T9lqJ/jTEf5/liSi77Nxhdsr51DLZC+Akb65g10YKAYfM86O8AqvaoiemWvq2+hhqdvPsuQP27LryFtihypOO137+3sJ8IcxaVdCNI7CEpaoSzBuYosewpqS/omE4yYaBBSqQf0gzr/TUuxoe/tkhVOPJ2+yRY3dK9qjrzJV7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838573; c=relaxed/simple;
	bh=MgEHNB9167o7HxV9OUTCTOGMriG+s33CZ/6nsWsUPlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPx+YqFqI+8p3jaIlqJwyFXW5WavbtFmOOJ1UnOZvTUmH2Lckru8x+DItlJEnN8XVcH69YbyfBkzOE+FvOQKmTfZb8tjasyD8snXPmuSc9JtVnZL/itqeEpUmvMeh3E16NSZxFTV/NbMrvqG74DkYaR9Gn1xcBej/TqUriVgkZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqgwLeZH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqgwLeZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838572; x=1748374572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MgEHNB9167o7HxV9OUTCTOGMriG+s33CZ/6nsWsUPlU=;
  b=XqgwLeZHF9vdym+kOKCm3AhwkDBjlCVQxyxaM8Fu6GFDB0Ri9qfETx5+
   Cieh50MdFM7FL8D0uSXVNLIXk9Q8VlX/NwYLXgTyhkeIRPkmEuFVAoE/5
   9oum7G3zYgX9Z0FbHJrRm5/bEEGq1zXxO51QcYzEkQNodFpS4OAUsSJEn
   ncGsq9fV9Zu1FWaK3zWhltZ2Z/v11NPGer9RLTEpjVtigSNiNB46gBPxd
   vtDtp2kMKL00/InDsbkFOB5clIMM7CPsAScFGJJCpyV3ZMTa7dEEWp2nu
   06xfjPqlXfb+klp8kcaYbB+cynaNbZAnJGBAANgd6hG7GFMtgl+gU443C
   A==;
X-CSE-ConnectionGUID: MbtZ4ja9TLyOEkz6cLOaGw==
X-CSE-MsgGUID: pG/PZS9dR52vyiWuE5oIvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339323"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:11 -0700
X-CSE-ConnectionGUID: 737jNDigQuq3fEkVVgv1Ww==
X-CSE-MsgGUID: +TA6kQULRxyIigljJ+VYbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029758"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/18] ASoC: Intel: sof_sdw_rt5682: use dai parameter
Date: Mon, 27 May 2024 14:35:37 -0500
Message-ID: <20240527193552.165567-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai is passed from the parameter. We don't need to find the dai
by name.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt5682.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 96f193798540..67737815d016 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -35,24 +35,15 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"rt5682"
-};
-
 int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 
-	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:rt5682",
 					  card->components);
-- 
2.43.0

