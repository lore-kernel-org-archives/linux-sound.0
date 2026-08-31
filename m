Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815B4A3D50
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194331; cv=none; b=PmJQpBWrvBLyUlpx8TnqSnZNjkDi40qjVVJqX4iMidH4AYhksmB2m1CrXDFT8AWlMB20NWxMwWb6QVGF4JmyzSd0vHF4ZsQrYcJfj42SnbgREOgNT/wZDsJwRSrfErLoSdSIPNzQBagnV0+0MBlMFfEvBFksAqz/nzogoZq0/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194331; c=relaxed/simple;
	bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZBP3hIrBrOSRQpZzsP9vwZFDKZXoFyXgBhMTBVs/1TnGlG7mRFw4e6AktAJRtu3tN7y1JnvU+v8oHy0B0bAHISCCjmjcQBfTeR5MuzW53ULiB34XdnLdqKYG7zPyaPD5mW9zWiALC4WDWcxGf8NlZZra8Z38HArqSre1LrwU2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeIJzDk2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeIJzDk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194330; x=1819730330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGunQbOgPSfsFFCjeLeKafRdJhRxD0pG1NnhY5oXKZM=;
  b=eeIJzDk2Uv+J+mrZQ2ixGPvlNxFuN6enLvr+1ZSFtM44M/BsCZxmkksb
   z3uooFJR4rRi0nMAXmZGusdXpAzbdqjP2vvjSNzBP69foQf4xuRt8Rd8B
   FSYe+jnQS+1b20LJAgZ0qb5/rDF8ux7DTdjVM4Q+rW5dR4UX/RRixQ+SS
   TFVeT8djIBAXG+5L8Dna2XgJ18/OpMb2/AkSsIalf5SSvyw1y+VM+4W0g
   eX+I6+XQNW8RpuWih4PN9DTe/7ffJflMibkes8nq82cjQAU20WtpCS535
   /qZy+ZnMtVW2mxq/Kh9eQ5BPO/LoAba173ja7Xxs8TRnYO1YEzg6WJUO2
   A==;
X-CSE-ConnectionGUID: GVboXCiETEaTQEqAvh+7UA==
X-CSE-MsgGUID: uEgOHY6QSIKXR2zRIekQOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379774"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:49 -0700
X-CSE-ConnectionGUID: lZ923VTpSPCFfCoStU03eQ==
X-CSE-MsgGUID: w7Q4x87lS8+omHrh39+xSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111912"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 10/10] ASoC: Intel: avs: hda: Constrain MSBs on startup
Date: Mon, 31 Aug 2026 18:42:33 +0200
Message-Id: <20260831164233.1487766-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

