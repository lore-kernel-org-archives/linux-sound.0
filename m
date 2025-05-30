Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E421C9E4
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613242; cv=none; b=NiImquHlRsmehdPDeanbA0uGpnZkhgpbhLav9eunkGs/eCP0IhWxLNmwO33IbyHwZZsxf4bQp7t2ntGTEoQt5PeeGDwopCKSynvFp0Oz2KAce7Ua5AsGj0+9m+7D/ZZN5z2ZFslcF6OJJMrNf3mEa9g4ELx1xOkBN8aA2kZu1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613242; c=relaxed/simple;
	bh=fACqMk4FGxJnvl/rSUTvBnmkUpDS7v+lUJG/ZkX3Gd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+cG4+Eea/X6eubrlrZyeNkkb+4sKR9l3Oetv0EDLzma395UEKI7IG2XgSttWPIY9i4VKLntXN9bEHTF3QMwjUg1biRW8OfYUfem3mER1XxJJDwdb0FitwcXwUU2Lc29CKNdSAsvA8YLpRMBW0tKwg3ANaqSDKb6jnJKauxylLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFOrjs00; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFOrjs00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613240; x=1780149240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fACqMk4FGxJnvl/rSUTvBnmkUpDS7v+lUJG/ZkX3Gd0=;
  b=aFOrjs000ERwjzpBzuGkbomqLfGF1t31HeDi/bhdq2FC1qZN+LZEpY5h
   QyV/GvGH55Nvr543hfsA4hqj3VZ2kBrdFa6oznMPYUX/Dea9e8yXCgtFc
   oCL4hziavnnydnJWnL8FCVXlUHjffVMndoJoJ2sQNJ9+1lEQNYh5WnsL5
   M5mLrZOre4grfmjG5+yfnrXXkqr4JT5EOY17fsJJw1gPqIH+6GADBb6Xd
   twSuuBfOj+KeKmEHvdOBZFrve8EyPmpWGU+0rnC5VXzNq06O9vVO6MqaE
   paKVDGaBWr2UhrZpJjtVXG7RqOuUoUQcM7U3bbqE6GGcWjdas+UL5QeDV
   Q==;
X-CSE-ConnectionGUID: xvPcT+SEQgaFPN8IXviUZg==
X-CSE-MsgGUID: K9/paZIMTC2C9cYxGr4NLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256181"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256181"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:00 -0700
X-CSE-ConnectionGUID: ZHy9cHrIQAO1T8feCTIBCA==
X-CSE-MsgGUID: wcMJpXLpRweWpYT+jFy7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763364"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:53:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/9] ASoC: Intel: avs: Fix PPLCxFMT calculation
Date: Fri, 30 May 2025 16:10:19 +0200
Message-Id: <20250530141025.2942936-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HDAudio transfer types utilize SDxFMT for front-end (HOST) and PPLCxFMT
for back-end (LINK) side when setting up the stream. BE's
substream->runtime duplicates FE runtime so switch to using BE's
hw_params to address incorrect format values on the LINK side when FE
and BE formats differ.

The problem is introduced with commit d070002a20fc ("ASoC: Intel: avs:
HDA PCM BE operations") but the code has been shuffled around since then
so direct 'Fixes:' tag does not apply.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 405cfc1ab0cb..d1acc636add7 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -450,9 +450,10 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 
 static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
 	const struct snd_soc_pcm_stream *stream_info;
 	struct hdac_ext_stream *link_stream;
+	const struct snd_pcm_hw_params *p;
 	struct avs_dma_data *data;
 	unsigned int format_val;
 	unsigned int bits;
@@ -460,14 +461,15 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	link_stream = data->link_stream;
+	p = &be->dpcm[substream->stream].hw_params;
 
 	if (link_stream->link_prepared)
 		return 0;
 
 	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
-	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
+	bits = snd_hdac_stream_format_bits(params_format(p), params_subformat(p),
 					   stream_info->sig_bits);
-	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
+	format_val = snd_hdac_stream_format(params_channels(p), bits, params_rate(p));
 
 	snd_hdac_ext_stream_decouple(&data->adev->base.core, link_stream, true);
 	snd_hdac_ext_stream_reset(link_stream);
-- 
2.25.1

