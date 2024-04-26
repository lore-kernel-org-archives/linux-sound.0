Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5514036A
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125418; cv=none; b=WEjMgNlgTV866xOtS9KXOmZFeH93k6VrIiEjcgkzk0Gu2U0IhjZlyiMZOT/VHBJBVs61bLETa4xaW9kF8pALfqZC/xEVshDP+GRN952H/eR8kicPq+WO4vp9NPB3JeseUvxUqrbmRXT0S80aDqhecdrD9NeyhmL8xuAPEymN5V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125418; c=relaxed/simple;
	bh=T4nHsF9OKK9PpS+tpyMCag09I+TatdAfIymTICQ28jw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XR7xnagTqlIwT8Y8inGppJS5ifdvtHQiFFqmXkqiz1iMKJ/6c3RU+mbVjA4wejz0zan8CL7N6QcOks/WO0r7qPMQKjM06WTJsjqD5ikN65oYQYA9WoNZs3iTJ50NFcvF34Er6ZsdGu3Q+bWuARueiFIN3We/SJEccBchVMoJ230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mv2a2Z5V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mv2a2Z5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125418; x=1745661418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4nHsF9OKK9PpS+tpyMCag09I+TatdAfIymTICQ28jw=;
  b=Mv2a2Z5VmvGzbA+JDTnA0yXY3DFi9OeZffhAwdYoJBFo8k4GNmkI1Epg
   UFoN7fe4eSSPcCFiSaeoPMBUgoNNgRFIhAZgZ03Iru0uV9W+ogGE3kaZb
   8oPIe0YtfTYy0KR+Voki/A42zb8BF9RszD2ollRGbj/6ppe1uLgbGMHZe
   MqhPGB5+2rjH2cVUGH7Hhr8K/XXhzDbYuOHJq6iAayRoLnvtbVJtA4Roq
   6LfrJHpjwFbaJiBSlCNsCQxaB1Dy/akuD6T35BRzdYc5Yi7lfkPtQ+s5r
   x4Xjjdtbx9RCRrRecbZC42FtaQqDeN0twROua9CSL1UKkiBua4+r6H+y0
   w==;
X-CSE-ConnectionGUID: BPA1fkkjSkGE98MQUdKimg==
X-CSE-MsgGUID: txsMBF3LTk2eG7QJlDjBHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409202"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:56:57 -0700
X-CSE-ConnectionGUID: eGWsMj9aTv2AUPXSi/+nxw==
X-CSE-MsgGUID: 29Vqh8b6StOyno+65ujRbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460588"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/8] ASoC: Intel: avs: Store pointer to adev in DAI dma_data
Date: Fri, 26 Apr 2024 11:57:29 +0200
Message-Id: <20240426095733.3946951-5-cezary.rojewski@intel.com>
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

Reduce the number of to_avs_dev() casts by storing the driver context in
DAI's dma_data.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 23f7e0fae817..a3a04115216c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -22,6 +22,7 @@
 struct avs_dma_data {
 	struct avs_tplg_path_template *template;
 	struct avs_path *path;
+	struct avs_dev *adev;
 	/*
 	 * link stream is stored within substream's runtime
 	 * private_data to fulfill the needs of codec BE path
@@ -60,7 +61,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 			   const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct avs_dev *adev = to_avs_dev(dai->component->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
 
@@ -77,6 +78,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 
 	data->substream = substream;
 	data->template = template;
+	data->adev = adev;
 	snd_soc_dai_set_dma_data(dai, substream, data);
 
 	if (rtd->dai_link->ignore_suspend)
@@ -88,13 +90,12 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
 	if (rtd->dai_link->ignore_suspend)
-		adev->num_lp_paths--;
+		data->adev->num_lp_paths--;
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	kfree(data);
@@ -107,7 +108,6 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct avs_dma_data *data;
 	struct avs_path *path;
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	int ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
@@ -124,7 +124,7 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 		params_rate(be_hw_params), params_channels(be_hw_params),
 		params_width(be_hw_params), params_physical_width(be_hw_params));
 
-	path = avs_path_create(adev, dma_id, data->template, fe_hw_params, be_hw_params);
+	path = avs_path_create(data->adev, dma_id, data->template, fe_hw_params, be_hw_params);
 	if (IS_ERR(path)) {
 		ret = PTR_ERR(path);
 		dev_err(dai->dev, "create path failed: %d\n", ret);
@@ -505,8 +505,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct avs_dma_data *data;
-	struct avs_dev *adev = to_avs_dev(dai->dev);
-	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_bus *bus;
 	struct hdac_ext_stream *host_stream;
 	int ret;
 
@@ -515,6 +514,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 		return ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
+	bus = &data->adev->base.core;
 
 	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
 	if (!host_stream) {
@@ -655,7 +655,6 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
 	struct hdac_bus *bus;
@@ -685,7 +684,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = avs_dai_prepare(adev, substream, dai);
+	ret = avs_dai_prepare(data->adev, substream, dai);
 	if (ret)
 		return ret;
 
-- 
2.25.1

