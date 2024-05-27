Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C711607B7
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838575; cv=none; b=Hhvgjic5L1XziRuVtlAn542EH05VeyQ/Htu+PZrNboKP0iGzWviBLbO/KqxIBVgPAS/sR9InbbdxcFFJr0UPohjSvocTebBCENytIocKWTR/odyfRuUaZKP01C7nhMrValvc4v3EqNXAEqU/emIQdFEg7dBJW9SoqP9EhCGoZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838575; c=relaxed/simple;
	bh=YUZRQX2mKZ5gfIkh+Vr07Pz1IYqZFFFZgqwYlxYqv4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxDJzvx55IxIJIxLpQCcvfvKbfW3PJ6rEnotdz4IZO9p/+SDodmFIHOa+UVggJ1jtmTehzIv9M/wzFYsvzK0wsggQueyDqs5f2Qe9dJs/0RXb1C408YNATlrIC+USd4ojYDTIZCs6Vzf9fxxoLfwCNHOs4YjT6qFDzhBtAbmuGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjtpGtdN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjtpGtdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838574; x=1748374574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YUZRQX2mKZ5gfIkh+Vr07Pz1IYqZFFFZgqwYlxYqv4I=;
  b=IjtpGtdN1ibATbb8gcLp/eaQ76t2KRnDumc4MZJWloCeSshKN4TZVYhC
   QElJC16bxkICb4tHBczSciCQpJfF5h28CvAZM1x8kMDbbTtmXILRj1/DI
   F4vMRedVs7SP1vZLIpLu9zKxvDPtFadwz/BgoR17pClvmIY4Ry2k3i+xY
   qFuyJ3wHgLSnDw9LT2UIE1X/I0OlIBl9BVwY8HGy4AnTSVc8fSx7IzbWB
   FvHhONFEz1jYFlvrNYg1iW/CcIsSObLPHvmmby8WtDCSv2kT+XXQ6XXLb
   Cg6otmDDN4aX9prM0MsPWlYGIycqPYBX4XEaw3/k+dhuB5PSjeyhFR/EY
   w==;
X-CSE-ConnectionGUID: QG1KCO9fT6mnzQQ68CTc+Q==
X-CSE-MsgGUID: cTTOar4kTxyDEsI5ueOJ2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339337"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339337"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:13 -0700
X-CSE-ConnectionGUID: KixdqEyuTE+4jttLsMiIPA==
X-CSE-MsgGUID: dfQbgSOwRL+qeAcre3UfFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029762"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
Date: Mon, 27 May 2024 14:35:40 -0500
Message-ID: <20240527193552.165567-7-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 012195c50519..4254e30ee4c3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -74,10 +74,6 @@ static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"rt711", "rt712", "rt713", "rt722"
-};
-
 /*
  * The sdca suffix is required for rt711 since there are two generations of the same chip.
  * RT713 is an SDCA device but the sdca suffix is required for backwards-compatibility with
@@ -91,17 +87,12 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *d
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 	int i;
 
-	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:%s",
 					  card->components, component->name_prefix);
-- 
2.43.0

