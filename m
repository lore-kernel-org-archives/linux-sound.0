Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFC471261
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836314; cv=none; b=YLtOWD9xtev2ox2yEmIgdQi1x9m/mHaICigwVd2cqYnRhTmlvx+13yjkPwWYzPVD8OSTAR3YzjDghVDchPH49SAfDhE8z4zHLZBQSxaj0hjhG7f4bXH9FCWwk0w06XJQbsyvK2ER/6x5HMty0UkOih32p3NTkWEYE5ETzMPK5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836314; c=relaxed/simple;
	bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3dDiVT1Mt0xOYEg8ZYKB0t156yRNXZSIYad3NJrRt1lUgiWirdPT5VbJFHpb6t5MTizesgpxC3GBHqKrBWeTq9y/Q+3/dK3o0fVnQ9DdGNhteo6RYrmhWW1fJzyhOcHXcLanx1g2Nk0koTIU8i+N815hqNZ3YOFVH+06aAKSro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL8NI3Yw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL8NI3Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836306; x=1819372306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
  b=TL8NI3YwIPgX987s1wXR9p1X8eRYD2UrTYKEfSH1Plu5Qm7lTS26cRyo
   3rsjYlEDRtVwcQWTSaG8uZci8g1Ch4+UEYvj8+fGP5yk4DFUb6f8kOp6t
   J//ob+2f5hHQ9rWJUlgwpMFMsFb7cpX2AiwVCi5AbZdJm03m+KYU/SX83
   XyHXdALaTOHZn9hlZdJ3sMLj93R7hZbczmGVNKDdlzkExl+vNt00FtZMI
   LDDjELHm1tnukWnYiMHRWCIcDbMG1aeAE8/wWNriEySC4W9+37PIsRPVa
   QA4bhfxQmCPNc/+KPripBLA9gjf/iR/v9RuMBYuV/J9wyXx3iaH1TAnOO
   g==;
X-CSE-ConnectionGUID: AYbz9wKlQP6NQC0ehNiO8w==
X-CSE-MsgGUID: RYKkSUE8QPuJEb5kba98sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539100"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:11:07 -0700
X-CSE-ConnectionGUID: Np8ak7TLRuSaLRONkBaAeQ==
X-CSE-MsgGUID: bXmBLj7XRv+5HBgJ7yQdVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589373"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:11:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/10] ASoC: Intel: avs: hda: Constrain MSBs on startup
Date: Thu, 27 Aug 2026 15:15:10 +0200
Message-Id: <20260827131510.1014084-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
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

