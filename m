Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ADA3DB625
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168734; cv=none; b=O9D21PcdGLg+hIGT8PJu9UGwpxZC1kdPGCRdDhUy5WVrU0LimxE9D3V5iAMEMPfLWOP39iBhgQHiswz8nLXKRmD9imCX846G6xeR22ffJs6IBKkvG+M8PvcOFnIGeeaJ1Q5yiBN1iZH6WHS1p/g7/9DPZIgQGSZYHOw6GdpY8EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168734; c=relaxed/simple;
	bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ej1gzRRFhFYvp1g7UCDFpnFDG1Lv0c2Y4gRmvS1t/xqFSKiUzyBjme0hAjZqivP5BQ1IV/l7cZerq8uYKQQWe57KnvxjX4n/iis2L1RzmMhnO4YEDH+P5KjkDvBfZQG8xbjEm6dmAv2ehpID4hFafo/clOSyb/QuxugGFiHBiSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkbsW4Py; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkbsW4Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168732; x=1819704732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
  b=OkbsW4PyW7i1rcD8IuhVn+tbOZeEXbEyomRlwBl4EA0stOqcda5M5lZb
   AzSAOFcuE1bUnNQ/0lMWT5eY0A4IczCmxbH3kCHhHUgFarGf5wtYO+ovb
   Qk2YIKGYq6YRVJShAaR8PRrvoOpswUlZpy5UimeBlPrx/7+BX0gEUlcKA
   QESeEEoJOUdZSTTIg3CRQFeeh/L61WsjBmn1P4mjKSFxpRNbzMok5QhKP
   A5AKpeQgOo0w+hqzAvRiW1yT4V4FLxuEQyjHe+RCqZx50RdAE3ahEVQAC
   tWwJTvu53avjekx7Hz3+uefjcqCQ+JVWgNNOtCWRsHjeLWTVgvP1W0qw4
   A==;
X-CSE-ConnectionGUID: bV+1iMBdQhyIzehXnowT7w==
X-CSE-MsgGUID: UuuCm7+gRfCF5faHimXkuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88333066"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88333066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:12 -0700
X-CSE-ConnectionGUID: tPIngNwISC+jYZwJ57UzFA==
X-CSE-MsgGUID: AlseBcVlSzKFC8pEg2tgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265508091"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:32:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 11/11] ASoC: Intel: avs: hda: Constrain MSBs on startup
Date: Mon, 31 Aug 2026 11:36:15 +0200
Message-Id: <20260831093615.1117987-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Front-end DAI links are marked as dynamic for the card thus the
__soc_pcm_open() function never gets to soc_pcm_apply_msb() step which
performs MSBs-constraint rule. Do that on link startup instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 03cfd91202d3..2e15a293298d 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -15,6 +15,22 @@
 #include "../../../codecs/hda.h"
 #include "../utils.h"
 
+static int avs_link_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	const struct snd_soc_pcm_stream *stream_info;
+	struct snd_soc_dai *codec_dai;
+
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(codec_dai, substream->stream);
+
+	return snd_pcm_hw_constraint_msbits(substream->runtime, 0, 0, stream_info->sig_bits);
+}
+
+static const struct snd_soc_ops avs_link_ops = {
+	.startup = avs_link_startup,
+};
+
 static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int pcm_count,
 				struct snd_soc_dai_link **links)
 {
@@ -43,6 +59,7 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
+		dl[i].ops = &avs_link_ops;
 
 		dl[i].codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
 		dl[i].cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
-- 
2.34.1

