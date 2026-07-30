Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494D735C180;
	Thu, 30 Jul 2026 01:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785374737; cv=none; b=plwRFMn/jeV3p2sEPtbpougi6stjRJXNZhLf13xDBxd8wp8NqrSm7Dt8Q2lMvZvnfbgO+aDDb8XPlAjisjyA2wueecVKKuK2aJPKCd0je7Qs+846d6FVPBRdRZ6jyZifJlDNLhJR3RgXtSQn6YlOWAMx7kQ1bSnT81MMbSgMb7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785374737; c=relaxed/simple;
	bh=zMG/w8h6nCtPlW3R2ZKJ9BqEcnbZSgc64ujTTpCPmAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kc2Xw7ih3WrvIUO7hP2xoTQgX8kdnQZKotonpEUFOfmt20hmg+hGA80MFUBkiDJzEt4Vz6knwfZES4d5mGQjxhaBvAYUO6fF/RIK+kFUeLWsBS4L/SS5AzUCJR0fgH/n83cONqo5wP76qI2kQ0TqmQRWHai4P9czBQFxggRZxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K401WyQ4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K401WyQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785374728; x=1816910728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zMG/w8h6nCtPlW3R2ZKJ9BqEcnbZSgc64ujTTpCPmAM=;
  b=K401WyQ4x9LymqVcAEa3cx8EbRYCl5h9xDY8pbXL/FyW1PYYF0WB6x3j
   gv+lfjWAFCOxV+RiZUf0X7TwyWmrTTZ0s3cwtCBDG/UMO6EYuYnxV+uBU
   rucyeO+bog39hhtcoYb7Z/a0uenO+S1caj5p+U3k3/V1WyUpD7GuVZB0g
   yJw5I5WGS4wdK1T6uHbDCc7WP1OB3SvtLd5URCeuAZE+Xd+9px63x7l2w
   FZqz5isA/ewnCujCJjkxp9MO8YzRoQ8B/2Qb2QkzZd0RefiMqdkeNZYN4
   s6QoGlsAdQqtOjEsoC3i8lGzYNSHKhyzdzp1buSbeqwBrX8ekrjoOY/QN
   A==;
X-CSE-ConnectionGUID: mvwqPN+1QcGURobpt+l4ew==
X-CSE-MsgGUID: 5TfkMfc5Szi9GUvpXTknuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103528567"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103528567"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 18:25:27 -0700
X-CSE-ConnectionGUID: G9zoxL6DRa+3/Wg/qouGqw==
X-CSE-MsgGUID: awPG5f2SS9SNVs5uNiEDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="255847259"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 18:25:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	tiwai@suse.de,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] ASoC/soundwire: Intel: reset the PCMSyCM registers in hda_sdw_bpt_close
Date: Thu, 30 Jul 2026 09:25:18 +0800
Message-ID: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resetting the PCMSyCM registers is required for Intel SoundWire stream. The
same procedure is done in sdw_hda_dai_hw_params() for the normal
SoundWire stream, too.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
Mark/Vinod,

The change is mainly on the ASoC tree. Can we go via the ASoC tree?

---
 drivers/soundwire/intel_ace2x.c   |  4 +++-
 include/sound/hda-sdw-bpt.h       |  5 +++--
 sound/soc/sof/intel/hda-sdw-bpt.c | 31 ++++++++++++++++++++++++++++---
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index b37933efac5d..63f131d5682b 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -261,6 +261,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		__func__, str_read_write(command), ret);
 
 	ret1 = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
+				 sdw->instance,
 				 sdw->bpt_ctx.bpt_tx_stream, &sdw->bpt_ctx.dmab_tx_bdl,
 				 sdw->bpt_ctx.bpt_rx_stream, &sdw->bpt_ctx.dmab_rx_bdl);
 	if (ret1 < 0)
@@ -295,7 +296,8 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 	struct sdw_cdns *cdns = &sdw->cdns;
 	int ret;
 
-	ret = hda_sdw_bpt_close(cdns->dev->parent /* PCI device */, sdw->bpt_ctx.bpt_tx_stream,
+	ret = hda_sdw_bpt_close(cdns->dev->parent /* PCI device */, sdw->instance,
+				sdw->bpt_ctx.bpt_tx_stream,
 				&sdw->bpt_ctx.dmab_tx_bdl, sdw->bpt_ctx.bpt_rx_stream,
 				&sdw->bpt_ctx.dmab_rx_bdl);
 	if (ret < 0)
diff --git a/include/sound/hda-sdw-bpt.h b/include/sound/hda-sdw-bpt.h
index 9b654c31829a..e24a549f7d49 100644
--- a/include/sound/hda-sdw-bpt.h
+++ b/include/sound/hda-sdw-bpt.h
@@ -27,7 +27,7 @@ int hda_sdw_bpt_send_async(struct device *dev, struct hdac_ext_stream *bpt_tx_st
 int hda_sdw_bpt_wait(struct device *dev, struct hdac_ext_stream *bpt_tx_stream,
 		     struct hdac_ext_stream *bpt_rx_stream);
 
-int hda_sdw_bpt_close(struct device *dev, struct hdac_ext_stream *bpt_tx_stream,
+int hda_sdw_bpt_close(struct device *dev, int link_id, struct hdac_ext_stream *bpt_tx_stream,
 		      struct snd_dma_buffer *dmab_tx_bdl, struct hdac_ext_stream *bpt_rx_stream,
 		      struct snd_dma_buffer *dmab_rx_bdl);
 
@@ -58,7 +58,8 @@ static inline int hda_sdw_bpt_wait(struct device *dev, struct hdac_ext_stream *b
 	return -EOPNOTSUPP;
 }
 
-static inline int hda_sdw_bpt_close(struct device *dev, struct hdac_ext_stream *bpt_tx_stream,
+static inline int hda_sdw_bpt_close(struct device *dev, int link_id,
+				    struct hdac_ext_stream *bpt_tx_stream,
 				    struct snd_dma_buffer *dmab_tx_bdl,
 				    struct hdac_ext_stream *bpt_rx_stream,
 				    struct snd_dma_buffer *dmab_rx_bdl)
diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
index c10648f56f23..ba9fbd662b85 100644
--- a/sound/soc/sof/intel/hda-sdw-bpt.c
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -322,7 +322,8 @@ int hda_sdw_bpt_open(struct device *dev, int link_id, struct hdac_ext_stream **b
 		__func__, ret);
 
 close:
-	ret1 = hda_sdw_bpt_close(dev, *bpt_tx_stream, dmab_tx_bdl, *bpt_rx_stream, dmab_rx_bdl);
+	ret1 = hda_sdw_bpt_close(dev, link_id, *bpt_tx_stream, dmab_tx_bdl,
+				 *bpt_rx_stream, dmab_rx_bdl);
 	if (ret1 < 0)
 		dev_err(dev, "%s: hda_sdw_bpt_close failed: %d\n",
 			__func__, ret1);
@@ -447,14 +448,38 @@ int hda_sdw_bpt_wait(struct device *dev, struct hdac_ext_stream *bpt_tx_stream,
 }
 EXPORT_SYMBOL_NS(hda_sdw_bpt_wait, "SND_SOC_SOF_INTEL_HDA_SDW_BPT");
 
-int hda_sdw_bpt_close(struct device *dev, struct hdac_ext_stream *bpt_tx_stream,
+int hda_sdw_bpt_close(struct device *dev, int link_id, struct hdac_ext_stream *bpt_tx_stream,
 		      struct snd_dma_buffer *dmab_tx_bdl, struct hdac_ext_stream *bpt_rx_stream,
 		      struct snd_dma_buffer *dmab_rx_bdl)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	int ret;
 	int ret1;
 
-	ret = hda_sdw_bpt_dma_deprepare(dev, bpt_rx_stream, dmab_rx_bdl);
+	/*
+	 * In the case of SoundWire we need to reset the PCMSyCM registers.
+	 * Need to continue depreparing the DMA buffers even if this fails.
+	 */
+	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id,
+					     0, /* PDI0 */
+					     0, 0, SNDRV_PCM_STREAM_PLAYBACK);
+	if (ret < 0)
+		dev_err(dev, "%s: hdac_bus_eml_sdw_map_stream_ch failed %d for PDI0\n",
+			__func__, ret);
+
+	ret1 = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id,
+					      1, /* PDI1 */
+					      0, 0, SNDRV_PCM_STREAM_CAPTURE);
+	if (ret1 < 0) {
+		dev_err(dev, "%s: hdac_bus_eml_sdw_map_stream_ch failed %d for PDI1\n",
+			__func__, ret1);
+		if (!ret)
+			ret = ret1;
+	}
+
+	ret1 = hda_sdw_bpt_dma_deprepare(dev, bpt_rx_stream, dmab_rx_bdl);
+	if (!ret)
+		ret = ret1;
 
 	ret1 = hda_sdw_bpt_dma_deprepare(dev, bpt_tx_stream, dmab_tx_bdl);
 	if (!ret)
-- 
2.43.0

