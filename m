Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA816078C
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838572; cv=none; b=Yk69P2q2TZDsDkFAkBttUPwuODaL9R/GMbBgUH8w5fXppG9cKyFXtUoA4Aa8z+VRmWFoUVPFDnjTos9rLWyDoFOqn0pKFd3I1cYhXO1A5BdN4FGRMmY2N/w0g5jwdWDXVoFLxzREsaSy+PnXHFDIreZThpZsWp5nMGh5Z8VKDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838572; c=relaxed/simple;
	bh=e/LHQnLLC8ZkQM3sl9or4MpWdmenS3A2f/+pElCHaCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/FKbI9GUpLgm+eWja/YHin0adWDg1O6FaUTzEnRDkgARXVetZCeptucmypjpfC7eyfpjWkCAQJ6B4tD8VsukoNyZ8H9Wq2uTuGAERpWLgIiT/qyENXeDIZL+KNLzKsPTGw2AlB3Ui2YyIHapFCXpx7iuFqSUaCieBIJWJwfNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0nvw8yZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0nvw8yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838571; x=1748374571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e/LHQnLLC8ZkQM3sl9or4MpWdmenS3A2f/+pElCHaCY=;
  b=Y0nvw8yZUDfKOHfe94gWLyRlVIYgvZiiIqzag674wD1jRpb9lptEJDe4
   TDSxuUbVebIqmhfMt6IX4x2X++xiu4OeIKOdL6ln/6wslqnr1zWNtOCpt
   o7a1L208atRiIz9pxj2dBfltR2HGf5ZRg04UMofhKPUh7Thq9bayb9D8n
   ha+y8pFjMx3r+CvN5lI7Sqcae/QKp7DBp3YMR4+dpk8Kjg9dQJ7eWmoEt
   tNbRxjIUHahmP0GjIlLNnNA8RsGRtJwE3rB/cbcsB337Ajr0QPRH7P//e
   +IwHZq4jkM8vNaArm+ZGIO6aWN1Pkes/L4jfJloPVae7tywgDZEGeLrhV
   w==;
X-CSE-ConnectionGUID: 0KTm7cbRTHicpCUOoBU7XQ==
X-CSE-MsgGUID: 4wnI6l2dR6Ca2O/SqwjkYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339319"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:10 -0700
X-CSE-ConnectionGUID: w2+WP+uwTbefPwzVVWdOFQ==
X-CSE-MsgGUID: AY/MPoRWTWCFt1uK1ZgW5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029755"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/18] ASoC: Intel: sof_sdw_rt711: use dai parameter
Date: Mon, 27 May 2024 14:35:36 -0500
Message-ID: <20240527193552.165567-3-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_rt711.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index d49e5aa786c3..60ff4d88e2dc 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -59,24 +59,15 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"rt711"
-};
-
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
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
 					  "%s hs:rt711",
 					  card->components);
-- 
2.43.0

