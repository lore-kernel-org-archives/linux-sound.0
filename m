Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSQOueBK"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FB6BA
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988225; x=1733524225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ulUlrZZ4AfI+dQihV8j5v/94fgvK1AWBTFChWA/nHU=;
  b=bSQOueBKj6K2uZo5XqBJ4NVB8hFA3ayPjY9tcbbmkgJmv2+HRvsmKNkp
   Od+22qOv7gpdrt+21D8BnnZO2LpayIjsVwaMVz2vruYWp+tjMLa8fHb1p
   m2FnFVc0HShKi+lmeMqDJ4bi7k10c92cUnE55+tPmSpihfXjU0DhrsbbO
   oZogm++vD/oAJonKiI/lgrCxQECDZqNBRM1mLDmUm16/zTxjoDXmhubsW
   oyKItcJzxywbi1kvERh7+9d3lm5A8DWixFu8sEf1irT7rNkgP7S6jc/57
   GBKHio/nEmIK5mwXfbWQGKDVFsCO+S+Ivqv4VelL2Zj/BoOARKRRbAlZP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516691"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480516691"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307512"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895307512"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 14/16] soundwire: intel_ace2x: add BPT open/close/send_async/wait
Date: Thu,  7 Dec 2023 16:29:42 -0600
Message-Id: <20231207222944.663893-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for BTP API using Cadence and hda-sdw-bpt helpers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 377 ++++++++++++++++++++++++++++++++
 1 file changed, 377 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index fb64c6d37ab0..f2f5dd503572 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -12,12 +12,383 @@
 #include <linux/soundwire/sdw_intel.h>
 #include <sound/hdaudio.h>
 #include <sound/hda-mlink.h>
+#include <sound/hda-sdw-bpt.h>
 #include <sound/hda_register.h>
 #include <sound/pcm_params.h>
 #include "cadence_master.h"
 #include "bus.h"
 #include "intel.h"
 
+static int sdw_slave_bpt_stream_add(struct sdw_slave *slave,
+				    struct sdw_stream_runtime *stream)
+{
+	struct sdw_stream_config sconfig = {0};
+	struct sdw_port_config pconfig = {0};
+	int ret;
+
+	/* arbitrary configuration */
+	sconfig.frame_rate = 16000;
+	sconfig.ch_count = 1;
+	sconfig.bps = 32; /* this is required for BPT/BRA */
+	sconfig.direction = SDW_DATA_DIR_RX;
+	sconfig.type = SDW_STREAM_BPT;
+
+	pconfig.num = 0;
+	pconfig.ch_mask = BIT(0);
+
+	ret = sdw_stream_add_slave(slave, &sconfig,
+				   &pconfig, 1, stream);
+	if (ret) {
+		dev_err(&slave->dev, "%s: failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw,
+				       struct sdw_slave *slave,
+				       enum sdw_bpt_type mode,
+				       struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = &sdw->cdns;
+	struct sdw_bus *bus = &cdns->bus;
+	struct sdw_master_prop *prop = &bus->prop;
+	struct sdw_stream_runtime *stream;
+	struct sdw_stream_config sconfig;
+	struct sdw_port_config *pconfig;
+	unsigned int pdi0_buffer_size;
+	unsigned int tx_dma_bandwidth;
+	unsigned int pdi1_buffer_size;
+	unsigned int rx_dma_bandwidth;
+	unsigned int num_frames;
+	unsigned int data_per_frame;
+	unsigned int tx_total_bytes;
+	struct sdw_cdns_pdi *pdi0;
+	struct sdw_cdns_pdi *pdi1;
+	const int ch = 1;
+	const int num_pdi = 2;
+	int command;
+	int ret1;
+	int ret;
+	int dir;
+	int i;
+
+	if (mode != SDW_BRA)
+		return -EINVAL;
+
+	stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
+	if (!stream)
+		return -ENOMEM;
+	cdns->bus.bpt_stream = stream;
+
+	ret = sdw_slave_bpt_stream_add(slave, stream);
+	if (ret < 0)
+		goto release_stream;
+
+	/* handle PDI0 first */
+	dir = SDW_DATA_DIR_TX;
+
+	pdi0 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch,  dir, 0);
+	if (!pdi0) {
+		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
+		ret = -EINVAL;
+		goto remove_slave;
+	}
+
+	sdw_cdns_config_stream(cdns, ch, dir, pdi0);
+
+	/* handle PDI1  */
+	dir = SDW_DATA_DIR_RX;
+
+	pdi1 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch,  dir, 1);
+	if (!pdi1) {
+		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
+		ret = -EINVAL;
+		goto remove_slave;
+	}
+
+	sdw_cdns_config_stream(cdns, ch, dir, pdi1);
+
+	/*
+	 * the port config direction, number of channels and frame
+	 * rate is totally arbitrary
+	 */
+	sconfig.direction = dir;
+	sconfig.ch_count = ch;
+	sconfig.frame_rate = 16000;
+	sconfig.type = SDW_STREAM_BPT;
+	sconfig.bps = 32; /* this is required for BPT/BRA */
+
+	/* Port configuration */
+	pconfig = kcalloc(num_pdi, sizeof(*pconfig), GFP_KERNEL);
+	if (!pconfig) {
+		ret =  -ENOMEM;
+		goto remove_slave;
+	}
+
+	for (i = 0; i < num_pdi; i++) {
+		pconfig[i].num = i;
+		pconfig[i].ch_mask = ch;
+	}
+
+	ret = sdw_stream_add_master(&cdns->bus, &sconfig,
+				    pconfig, num_pdi, stream);
+	kfree(pconfig);
+
+	if (ret < 0) {
+		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
+		goto remove_slave;
+	}
+
+	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
+	if (ret < 0)
+		goto remove_master;
+
+	command = (msg->flags & SDW_MSG_FLAG_WRITE) ? 0 : 1;
+
+	ret = sdw_cdns_bpt_find_buffer_sizes(command,
+					     cdns->bus.params.row,
+					     cdns->bus.params.col,
+					     msg->len,
+					     SDW_BPT_MSG_MAX_BYTES,
+					     &data_per_frame,
+					     &pdi0_buffer_size,
+					     &pdi1_buffer_size,
+					     &num_frames);
+	if (ret < 0)
+		goto deprepare_stream;
+
+	sdw->bpt_ctx.pdi0_buffer_size = pdi0_buffer_size;
+	sdw->bpt_ctx.pdi1_buffer_size = pdi1_buffer_size;
+	sdw->bpt_ctx.num_frames = num_frames;
+	sdw->bpt_ctx.data_per_frame = data_per_frame;
+	tx_dma_bandwidth = div_u64((u64)pdi0_buffer_size * 8 * (u64)prop->default_frame_rate,
+				   num_frames);
+	rx_dma_bandwidth = div_u64((u64)pdi1_buffer_size * 8 * (u64)prop->default_frame_rate,
+				   num_frames);
+
+	dev_dbg(cdns->dev, "Message len %d transferred in %d frames (%d per frame)\n",
+		msg->len, num_frames, data_per_frame);
+	dev_dbg(cdns->dev, "sizes pdi0 %d pdi1 %d tx_bandwidth %d rx_bandwidth %d\n",
+		pdi0_buffer_size, pdi1_buffer_size,
+		tx_dma_bandwidth,
+		rx_dma_bandwidth);
+
+	ret = hda_sdw_bpt_open(cdns->dev->parent, /* PCI device */
+			       sdw->instance,
+			       &sdw->bpt_ctx.bpt_tx_stream,
+			       &sdw->bpt_ctx.dmab_tx_bdl,
+			       pdi0_buffer_size,
+			       tx_dma_bandwidth,
+			       &sdw->bpt_ctx.bpt_rx_stream,
+			       &sdw->bpt_ctx.dmab_rx_bdl,
+			       pdi1_buffer_size,
+			       rx_dma_bandwidth);
+	if (ret < 0) {
+		dev_err(cdns->dev, "%s: hda_sdw_bpt_open failed %d\n", __func__, ret);
+		goto deprepare_stream;
+	}
+
+	if (!command) {
+		ret = sdw_cdns_prepare_write_dma_buffer(
+			msg->dev_num, msg->addr,
+			msg->buf, msg->len,
+			data_per_frame,
+			sdw->bpt_ctx.dmab_tx_bdl.area,
+			pdi0_buffer_size,
+			&tx_total_bytes);
+	} else {
+		ret = sdw_cdns_prepare_read_dma_buffer(
+			msg->dev_num, msg->addr,
+			msg->len,
+			data_per_frame,
+			sdw->bpt_ctx.dmab_tx_bdl.area,
+			pdi0_buffer_size,
+			&tx_total_bytes);
+
+	}
+	if (ret < 0) {
+		dev_err(cdns->dev, "%s: sdw_prepare_%s_dma_buffer failed %d\n",
+			__func__, command ? "read" : "write", ret);
+		goto bpt_close;
+	}
+
+	return 0;
+
+bpt_close:
+	ret1 = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
+				 sdw->bpt_ctx.bpt_tx_stream,
+				 &sdw->bpt_ctx.dmab_tx_bdl,
+				 sdw->bpt_ctx.bpt_rx_stream,
+				 &sdw->bpt_ctx.dmab_rx_bdl);
+	if (ret1 < 0)
+		dev_err(cdns->dev, "%s:  hda_sdw_bpt_close failed: ret %d\n",
+			__func__, ret1);
+
+deprepare_stream:
+	sdw_deprepare_stream(cdns->bus.bpt_stream);
+
+remove_master:
+	ret1 = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
+	if (ret1 < 0)
+		dev_err(cdns->dev, "%s: remove master failed: %d\n",
+			__func__, ret1);
+
+remove_slave:
+	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
+	if (ret1 < 0)
+		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
+			__func__, ret1);
+
+release_stream:
+	sdw_release_stream(cdns->bus.bpt_stream);
+	cdns->bus.bpt_stream = NULL;
+
+	return ret;
+}
+
+static int intel_ace2x_bpt_close_stream(struct sdw_intel *sdw,
+					struct sdw_slave *slave,
+					enum sdw_bpt_type mode,
+					struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = &sdw->cdns;
+	int ret1;
+	int ret;
+
+	if (mode != SDW_BRA)
+		return -EINVAL;
+
+	ret = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
+				sdw->bpt_ctx.bpt_tx_stream,
+				&sdw->bpt_ctx.dmab_tx_bdl,
+				sdw->bpt_ctx.bpt_rx_stream,
+				&sdw->bpt_ctx.dmab_rx_bdl);
+	if (ret < 0)
+		dev_err(cdns->dev, "%s:  hda_sdw_bpt_close failed: ret %d\n",
+			__func__, ret);
+
+	ret1 = sdw_deprepare_stream(cdns->bus.bpt_stream);
+	if (ret1 < 0) {
+		dev_err(cdns->dev, "%s: sdw_deprepare_stream failed: ret %d\n",
+			__func__, ret1);
+		if (!ret)
+			ret = ret1;
+	}
+
+	ret1 = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
+	if (ret1 < 0) {
+		dev_err(cdns->dev, "%s: remove master failed: %d\n",
+			__func__, ret1);
+		if (!ret)
+			ret = ret1;
+	}
+
+	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
+	if (ret1 < 0) {
+		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
+			__func__, ret1);
+		if (!ret)
+			ret = ret1;
+	}
+
+	cdns->bus.bpt_stream = NULL;
+
+	return ret;
+}
+
+static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw,
+				      struct sdw_slave *slave,
+				      struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = &sdw->cdns;
+	int ret;
+
+	dev_dbg(cdns->dev, "BPT Transfer start\n");
+
+	ret = hda_sdw_bpt_send_async(cdns->dev->parent, /* PCI device */
+				     sdw->bpt_ctx.bpt_tx_stream,
+				     sdw->bpt_ctx.bpt_rx_stream);
+	if (ret < 0)
+		return ret;
+
+	ret = sdw_enable_stream(cdns->bus.bpt_stream);
+	if (ret < 0) {
+		dev_err(cdns->dev, "%s: sdw_stream_enable failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	dev_info(cdns->dev, "%s: done\n", __func__);
+
+	return 0;
+}
+
+static int intel_ace2x_bpt_wait(struct sdw_intel *sdw,
+				struct sdw_slave *slave,
+				struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = &sdw->cdns;
+	int ret;
+
+	dev_dbg(cdns->dev, "BTP Transfer wait\n");
+
+	ret = hda_sdw_bpt_wait(cdns->dev->parent, /* PCI device */
+			       sdw->bpt_ctx.bpt_tx_stream,
+			       sdw->bpt_ctx.bpt_rx_stream);
+	if (ret < 0)
+		dev_err(cdns->dev, "%s: hda_sdw_bpt_wait failed: %d\n", __func__, ret);
+
+	ret = sdw_disable_stream(cdns->bus.bpt_stream);
+	if (ret < 0) {
+		dev_err(cdns->dev, "%s: sdw_stream_enable failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (0) {
+		/* dump DMA TX buffer */
+		print_hex_dump_debug("DMA out: ", DUMP_PREFIX_OFFSET,
+				     4, 4,
+				     sdw->bpt_ctx.dmab_tx_bdl.area,
+				     sdw->bpt_ctx.pdi0_buffer_size,
+				     false);
+
+		print_hex_dump_debug("DMA in: ", DUMP_PREFIX_OFFSET,
+				     4, 4,
+				     sdw->bpt_ctx.dmab_rx_bdl.area,
+				     sdw->bpt_ctx.pdi1_buffer_size,
+				     false);
+	}
+
+	if (msg->flags & SDW_MSG_FLAG_WRITE) {
+		ret = sdw_cdns_check_write_response(cdns->dev,
+						    sdw->bpt_ctx.dmab_rx_bdl.area,
+						    sdw->bpt_ctx.pdi1_buffer_size,
+						    sdw->bpt_ctx.num_frames);
+		if (ret < 0) {
+			dev_err(cdns->dev, "%s: BPT Write failed %d\n", __func__, ret);
+			return ret;
+		}
+	} else {
+		ret = sdw_cdns_check_read_response(cdns->dev,
+						   sdw->bpt_ctx.dmab_rx_bdl.area,
+						   sdw->bpt_ctx.pdi1_buffer_size,
+						   msg->buf, msg->len,
+						   sdw->bpt_ctx.num_frames,
+						   sdw->bpt_ctx.data_per_frame);
+		if (ret < 0) {
+			dev_err(cdns->dev, "%s: BPT Read failed %d\n", __func__, ret);
+			return ret;
+		}
+	}
+
+	dev_dbg(cdns->dev, "BPT Transfer done\n");
+
+	return 0;
+}
+
 /*
  * shim vendor-specific (vs) ops
  */
@@ -692,7 +1063,13 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.sync_check_cmdsync_unlocked = intel_check_cmdsync_unlocked,
 
 	.program_sdi = intel_program_sdi,
+
+	.bpt_open_stream = intel_ace2x_bpt_open_stream,
+	.bpt_close_stream = intel_ace2x_bpt_close_stream,
+	.bpt_send_async = intel_ace2x_bpt_send_async,
+	.bpt_wait = intel_ace2x_bpt_wait,
 };
 EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_SDW_BPT);
-- 
2.39.2

