Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F673140386
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125417; cv=none; b=p2pTzkjJu68JFlsNoyq9r5DONgfixBfmvXKChRAV2EUYdHnCKAgqE37j4fIZvAqGewd+os8u6KVQfMXRRBC6hwH9KL9u7AK3hh+bqTAk81lUvrEhTGNwzLHQ3TD2oXpMU/HZUErMX5MEM3ERx2fI2IBp3qaqt+HZDmHbdKELEhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125417; c=relaxed/simple;
	bh=/OpGaXKLK/xKmfeJNxX3PuUmLBLHR9is3aONCN7HtOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lp1HwoGqfzm0BtRtxoIdE/ldNkbdxGY1FHMxfH1nzP0MgLQQJ8ARWk0uk5niMH+/eAT28Y/PO6lFSzm5v4kdVxqwoCewn7E2wP+p5NyaNsdBEn4zqWy6Bj3Zlc9NSNRAI3u45EBNbkbhCO8jdXU2cfNUrU/otVICsvaYtkX5RMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBp5A6ho; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBp5A6ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125415; x=1745661415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/OpGaXKLK/xKmfeJNxX3PuUmLBLHR9is3aONCN7HtOU=;
  b=iBp5A6hoxvhwcbTjF+IWtGkggP6xxZSjLhfgCHIubWTLdB0WYHoEc+bF
   CF474J+OJwnsyLnrke42x34Dl7Uo/51x7GVCo0kRcekQTp/z+pCvOE1MW
   HXOcJKX7Jm4IrTHyKrtO1Wi5lCbO5rWn9S931uxoXtL8cqYRQ73Bx1aiW
   M/ArRPaTQNmwWjHubsQ6JCxTGPCbms6BZsAVQZu5syG9I00hOo6m0MPjF
   IhE7LGPkAEkV9Lj/xf5iPxL9AYPP2w/ph07p6ObFn01YXftpEZdtWL3XZ
   zZGqIQTPdV2TWUlXYs+S5FVLM75qnUk4wNPlicppv5og9PXMl+ot7jeFy
   Q==;
X-CSE-ConnectionGUID: 9UdqRjXhTam7zKJxCbZ3MQ==
X-CSE-MsgGUID: jyH72M9+RUyVmV1mc6PqDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409197"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:56:55 -0700
X-CSE-ConnectionGUID: Ie1GZPzITB+CkM5Yut6EyA==
X-CSE-MsgGUID: l5cldLv6RrCbbDwW43KaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460573"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/8] ASoC: Intel: avs: Remove redundancy around DAI shutdown
Date: Fri, 26 Apr 2024 11:57:28 +0200
Message-Id: <20240426095733.3946951-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move avs_dai_nonhda_be_shutdown() to avs_dai_shutdown() as the function
is common for all transfer types, not just non-HDAudio ones. Use it
to simplify avs_dai_fe_shutdown().

While at it, fix explicit kfree(data) and use the destructor instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 44 +++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index f3cd54f355ef..23f7e0fae817 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -85,6 +85,21 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
+static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct avs_dma_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (rtd->dai_link->ignore_suspend)
+		adev->num_lp_paths--;
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(data);
+}
+
 static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *fe_hw_params,
 			     struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
@@ -166,21 +181,6 @@ static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct
 	return avs_dai_startup(substream, dai, false, &avs_dai_nonhda_be_ops);
 }
 
-static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
-	struct avs_dma_data *data;
-
-	if (rtd->dai_link->ignore_suspend)
-		adev->num_lp_paths--;
-
-	data = snd_soc_dai_get_dma_data(dai, substream);
-
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(data);
-}
-
 static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
@@ -266,7 +266,7 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 
 static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.startup = avs_dai_nonhda_be_startup,
-	.shutdown = avs_dai_nonhda_be_shutdown,
+	.shutdown = avs_dai_shutdown,
 	.hw_params = avs_dai_nonhda_be_hw_params,
 	.hw_free = avs_dai_nonhda_be_hw_free,
 	.prepare = avs_dai_nonhda_be_prepare,
@@ -290,7 +290,7 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
 						 HDAC_EXT_STREAM_TYPE_LINK);
 	if (!link_stream) {
-		avs_dai_nonhda_be_shutdown(substream, dai);
+		avs_dai_shutdown(substream, dai);
 		return -EBUSY;
 	}
 
@@ -306,7 +306,7 @@ static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct
 	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	substream->runtime->private_data = NULL;
 
-	avs_dai_nonhda_be_shutdown(substream, dai);
+	avs_dai_shutdown(substream, dai);
 }
 
 static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
@@ -558,18 +558,12 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
-	if (rtd->dai_link->ignore_suspend)
-		adev->num_lp_paths--;
-
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	snd_hdac_ext_stream_release(data->host_stream, HDAC_EXT_STREAM_TYPE_HOST);
-	kfree(data);
+	avs_dai_shutdown(substream, dai);
 }
 
 static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
-- 
2.25.1

