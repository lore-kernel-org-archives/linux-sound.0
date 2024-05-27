Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F11EEF7
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838573; cv=none; b=S1Bq5Fxgaw87NW78kCqO3j9wVNlping0K2K7sWvc8lGGiXbM8E6GLJPQBwQhJwOYcm40nkR500C2hqgDeh7DYwLivOJ0OpnzFl9tXYkVomgJ8aZkluKw95gUxfYQQ2OnpVU3jmR+HK0zkQ28T1evOnb/eH+28CcViKF4ybVuB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838573; c=relaxed/simple;
	bh=ih6BwwZkBO8p6XkXeac4kg6IsIuNg8xO76PcQYXBbiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACdhNv0PAbNEJre7fxYE330J27a+eF/QYAjQTjVcG4lT0I6zLN2ALyecuz7O+vgn0PgUASa4vp2ehEkIOIUuXwCjBds/2NLMfYsHVQ7XJ7e0fbeMGpAKvaLVEh98AJkGX3NJjpz7xFiSKc+gI1So3myjxO2j05//o/Cvshc1K70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOzBcbQB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOzBcbQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838571; x=1748374571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ih6BwwZkBO8p6XkXeac4kg6IsIuNg8xO76PcQYXBbiM=;
  b=UOzBcbQBcdAnL9NUA3C6wYkR0c4H82IxnRUkTL4kmphcRv55mfYnBRiE
   ycwPJF8+vwV+7SQma+3Mfy7uJEu62PbNCZHvEeZgm5H0q75mWvMQM4H4h
   cJ8OUDWaWgrHMiVrmbZeSvspjVt6e/Tz0AIY0DOeQrqW4GWO4e9AUtDwx
   ax6UmTNGfTsmg5ODPnGuoUnXuOmZUV1WNFPSlDJ7AGCZwJJFERsledhXz
   eWRRKP4LLgfl6Q9BdPti1lrCOz1qPKcleU/K+kXM4fgDZtyz+IKJipMaS
   XbMS/BAdZCqK4XaHX3Xcxy9d4t/TKEX6piq8aSlXM2kBXXWt2FSNXR4zg
   Q==;
X-CSE-ConnectionGUID: CVd/P3/ZQgWSOAdBQUmUNQ==
X-CSE-MsgGUID: QHMq/Q7STWSEtRDtvgQSGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339314"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:09 -0700
X-CSE-ConnectionGUID: jcxOIgDSTH6Bp95YNKwlpQ==
X-CSE-MsgGUID: gJYznnWgS3mQERdT56hDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029753"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/18] ASoC: Intel: sof_sdw_cs42l42: use dai parameter
Date: Mon, 27 May 2024 14:35:35 -0500
Message-ID: <20240527193552.165567-2-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_cs42l42.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index fdb75fc71c26..fc18e4aa3dbe 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -36,24 +36,15 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"cs42l42"
-};
-
 int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
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
 					  "%s hs:cs42l42",
 					  card->components);
-- 
2.43.0

