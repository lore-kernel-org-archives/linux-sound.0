Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C006137DE9D
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336864; cv=none; b=qrgA0fUc9IKFQAnyklFpKheIVk4tMHXk/6yZe2RsKu6DWN2eP6af/Tvq0B0z2MFnDKKD71D7jBTGJwSpEYWbnM6MCwxIW5/TwzI+jAZ1S+a28tfIffaMwtyV8pl7v2XVUuFOPZiV/v3M9vGz+2QCZQ7MW3wK1I28RB934h4HI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336864; c=relaxed/simple;
	bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V/JKukG6/O/N9l5a6AvOCJyt1ukoQbk0SmNQ4tYacc7uu/No2fvRv+jsM5MTf+gicHzEL1S7WOi7gAq7U1f5L25gUv2Eg7MGC1ah/VZHjvR849UrdHjt+6OqdZbSXVoSFxhRpgJaBWHN8zLSFCN12J9QI8/+fjXsdEtTNvmqyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqxfRG4H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqxfRG4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336862; x=1819872862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
  b=AqxfRG4HGH2sN/JJVFP/GunwoAWwaHfvZWOAWXirqQ8lWBjoTAL6EvMu
   NE+QgiMp64xfG2UkT66N7WsgtADjNa8BNuMNMZzEBdJ2KTBrlbYEPvqRF
   e9tK1P8lC4zOtkcIti9uTSy8atJ1RpA0FvyEHL5Me4tpsZRWyAWPIJoaF
   WaUyqkuiaL1JxJat91PmuctLc82vS0CNKpn8ytXzvw7UM4kszm1FDYfWA
   M/QZC0mrVJngEhdYLSXvNfl1hNdYKyYPWAhKDm7g7fiEWbzKY+mp6lMIC
   zvylHR9HHIWOIsOpjZtWVDMaxDkY7L0V1C0oBBuwM0SePKl62Vvkw1JqE
   w==;
X-CSE-ConnectionGUID: UwCplw/nR8iXeWSaBw0lkQ==
X-CSE-MsgGUID: bmaWR6hwSWSohdgM1WRPrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99121020"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99121020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:20 -0700
X-CSE-ConnectionGUID: g/IwJcZaQBKPsDFCTExIhQ==
X-CSE-MsgGUID: XUtFOCbBRaS0av7cSfnssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099094"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 10/10] ASoC: Intel: avs: hda: Constrain MSBs on startup
Date: Wed,  2 Sep 2026 10:18:14 +0200
Message-Id: <20260902081814.1590883-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
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

