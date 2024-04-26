Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6687140381
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125415; cv=none; b=DsaOEw+EQUiy1ihdqvLPFdJzXgUYFtKnOO75xwQFFpHKDI7YbYq4MrVIuAt1O/YspdrXdxoBeqjEc5ZIJqJhNgE/CmGiPKgIpiFbcBBYR1AmnPlGO0/cUKWR9Ca/kOwJaaUlNytAkv5lkb7UMRcbK2apRa9PZRrlT5TBCEewUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125415; c=relaxed/simple;
	bh=aT40F+YO05hp/H238joGV3KbhgSHr4J7qmCIqNioPjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E4KlsLN5pxNGvrO2+ZGzr9b7Tdz9tZM1xbNrSRQdlaY2YU2oYSB9snVWf7Mc1qVkO4hHc3di8HdA4G377WjFqFfC7ZeM7gV3+Oc5kAwbJ+yvengHzivNARh5t6pEULIhPqmPCpS5tEMrxY45bPEJm2ogf67XZ4RDpTP9AhsKl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qq7gAQgd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qq7gAQgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125414; x=1745661414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aT40F+YO05hp/H238joGV3KbhgSHr4J7qmCIqNioPjc=;
  b=Qq7gAQgdjXhn2Mp1YOwwfxa1QSYRhPp2Tt+C1a6LjG1avGo0Aqpx1Qjx
   JcvhbKFKZJNK74q2sIYqXeIUe1tnY5WbOabF0kcdOWPuJrLWjnGWqjZvU
   TJxu8txD87JHcEZcEgbZ5NjaycJcjXU9CHD94/PdoA5aoQlTAUQ81cUQo
   xAo8ZAKr4sR+BWEC6jT2+knLoCQxTX1NcgrC6K8rTF3DBnhAbp7y1vhXV
   4ixO5mPLby73h5wBytc3HMTbAlX1jHbPXgaPW2o981bsmZ8csw58fgb62
   Z8ZRSk8V2MnYmJM0p4j0PAW27wyyICQp+2o7DdBEGijBiRr2U7sHD28xO
   w==;
X-CSE-ConnectionGUID: oHlq2CfYQjykbQHlvUkbnQ==
X-CSE-MsgGUID: 4RlgCZdkTUGyiPnbmyXt7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409189"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409189"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:56:53 -0700
X-CSE-ConnectionGUID: MAMBGvDDSg2mnyUh2qhitw==
X-CSE-MsgGUID: STkHw4WIRxqxfl/tXNneag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460560"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/8] ASoC: Intel: avs: Relocate HDA BE DAI specific operations
Date: Fri, 26 Apr 2024 11:57:27 +0200
Message-Id: <20240426095733.3946951-3-cezary.rojewski@intel.com>
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

DAI's startup()/shutdown() shall deal with allocation and freeing of
resources needed to facilitate streaming over it. Currently for HDAudio
BE DAIs some of that task is done in component->open()/close(). Relocate
the relevant pieces to address that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 55 ++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 77a7e8f93951..f3cd54f355ef 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -277,12 +277,36 @@ static const struct snd_soc_dai_ops avs_dai_hda_be_ops;
 
 static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	return avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct hdac_ext_stream *link_stream;
+	struct hda_codec *codec;
+	int ret;
+
+	ret = avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
+	if (ret)
+		return ret;
+
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
+	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
+						 HDAC_EXT_STREAM_TYPE_LINK);
+	if (!link_stream) {
+		avs_dai_nonhda_be_shutdown(substream, dai);
+		return -EBUSY;
+	}
+
+	substream->runtime->private_data = link_stream;
+	return 0;
 }
 
 static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	return avs_dai_nonhda_be_shutdown(substream, dai);
+	struct hdac_ext_stream *link_stream;
+
+	link_stream = substream->runtime->private_data;
+	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	substream->runtime->private_data = NULL;
+
+	avs_dai_nonhda_be_shutdown(substream, dai);
 }
 
 static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
@@ -1576,8 +1600,6 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct hdac_ext_stream *link_stream;
-	struct hda_codec *codec;
 
 	if (!rtd->dai_link->no_pcm) {
 		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
@@ -1609,30 +1631,6 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream, &hwparams);
 	}
 
-	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
-	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
-					     HDAC_EXT_STREAM_TYPE_LINK);
-	if (!link_stream)
-		return -EBUSY;
-
-	substream->runtime->private_data = link_stream;
-	return 0;
-}
-
-static int avs_component_hda_close(struct snd_soc_component *component,
-				   struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct hdac_ext_stream *link_stream;
-
-	/* only BE DAI links are handled here */
-	if (!rtd->dai_link->no_pcm)
-		return 0;
-
-	link_stream = substream->runtime->private_data;
-	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
-	substream->runtime->private_data = NULL;
-
 	return 0;
 }
 
@@ -1643,7 +1641,6 @@ static const struct snd_soc_component_driver avs_hda_component_driver = {
 	.suspend		= avs_component_suspend,
 	.resume			= avs_component_resume,
 	.open			= avs_component_hda_open,
-	.close			= avs_component_hda_close,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
 	.pcm_construct		= avs_component_construct,
-- 
2.25.1

