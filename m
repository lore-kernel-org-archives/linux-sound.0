Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4E3C9EF3
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932439; cv=none; b=ZNWRsh7RhOKWt+t57SWjc1cNRbc+cdf5g0w7BbjhrUJrE754GGtX9JX12daQWOsaZMcXhwkhwnjO4id6dk9hsnjA/4XdInmhwQ5Q+xjr+nsVSaqSxWURxv46nutzEbvWZIxh55TLGoOPQ7NCi5LRPMQutiTMMx2infJYCcx//QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932439; c=relaxed/simple;
	bh=yxhLW4k0m/n41OCufu6mkA8fK95de5de+8e2BwZ6OPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JhW2qAltJfsE9lbJj8rLdNAWhFiSDM1wQoBd8X/s64He4qvdPeGZb0BuaxFDmIXunGma7xGcjZFEkrAoForABiqX4EDlg+m5gLbT8IMNDvbI898T+7VPhRV7zk22RYRROCxUF7k4XGWXEa///h4WMmFcrw0ykBXh9zGJdS272Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZuliXOm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZuliXOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783932437; x=1815468437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yxhLW4k0m/n41OCufu6mkA8fK95de5de+8e2BwZ6OPQ=;
  b=MZuliXOm4hjBMrDLH9/y2s285HH8DGgl2b7NqBDxC8Ot23k+MnVQ1/g6
   PwaaGwcwRqV7okP9nFzk6DlE9O1sNd3/pXIPqPd09trtRR1LcXNFRI42s
   W7MperFmTvBajxDp/z8xwWVMnjFlMbDfWUJviiRZW3bZnKX28EeDqHpY5
   vXx1ZZnVf8GpKSOg7qHSv1VoVXMLGE2KM+fENW06nAJ9H6yiJJ+er1J3Y
   kMdLPFyqd588Nc+xMopYR+hhOL76nhx7tGxvNw69E5elv0mYO+VP+TM70
   yHOkXHsiyHzrDQIwjwZOUMc/XjJkQre7DEjKqYIq0NMHqzyjpntCXoRxl
   g==;
X-CSE-ConnectionGUID: bQdVtj6nSl2P1e5FvI+/yg==
X-CSE-MsgGUID: tiCBQNP+RKG7pxZXvu4T1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84554481"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84554481"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:47:16 -0700
X-CSE-ConnectionGUID: nBsC+7lbSiqq+xj0qgIyqQ==
X-CSE-MsgGUID: nTYKr/CQSMaR/nxDtJEsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279905368"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:47:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 2/2] ASoC: SOF: Intel: Disable SPIB in non ICCMAX stream
Date: Mon, 13 Jul 2026 16:46:50 +0800
Message-ID: <20260713084650.4138172-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
References: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing code disable SPIB in the playback direction only because
previously the hda data stream is only used for SOF firmware download
and we prepare capture stream for ICCMAX and prepare playback stream
for non ICCMAX case. But now the hda data stream is also used for
SoundWire BPT which will use both directions. The SPIB is enabled in
non ICCMAX cases and we should disable in clean up.
Add a is_iccmax flag in the hda_data_stream_cleanup() function to align
with the hda_data_stream_prepare() function to enable/disable the SPIB.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c  | 11 ++++++-----
 sound/soc/sof/intel/hda-sdw-bpt.c |  2 +-
 sound/soc/sof/intel/hda-stream.c  |  8 +++++---
 sound/soc/sof/intel/hda.h         |  5 +++--
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 2b3abcf75d55..4347e71337f9 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -216,9 +216,10 @@ int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int
 EXPORT_SYMBOL_NS(hda_cl_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
-			  bool persistent_buffer, struct hdac_ext_stream *hext_stream)
+		   bool persistent_buffer, struct hdac_ext_stream *hext_stream, bool is_iccmax)
 {
-	return hda_data_stream_cleanup(dev, dmab, persistent_buffer, hext_stream, false);
+	return hda_data_stream_cleanup(dev, dmab, persistent_buffer, hext_stream,
+				       is_iccmax, false);
 }
 EXPORT_SYMBOL_NS(hda_cl_cleanup, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
@@ -302,7 +303,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * If the cleanup also fails, we return the initial error
 	 */
 	ret1 = hda_cl_cleanup(sdev->dev, &hda->iccmax_dmab,
-			      persistent_cl_buffer, iccmax_stream);
+			      persistent_cl_buffer, iccmax_stream, true);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: ICCMAX stream cleanup failed\n");
 
@@ -458,7 +459,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * If the cleanup also fails, we return the initial error
 	 */
 	ret1 = hda_cl_cleanup(sdev->dev, &hda->cl_dmab,
-			      persistent_cl_buffer, hext_stream);
+			      persistent_cl_buffer, hext_stream, false);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
@@ -587,7 +588,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 cleanup:
 	/* clean up even in case of error and return the first error */
 	ret1 = hda_cl_cleanup(sdev->dev, &hda->cl_dmab, persistent_cl_buffer,
-			      hext_stream);
+			      hext_stream, false);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "%s: Code loader DSP cleanup failed\n", __func__);
 
diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
index 728ffe7ae54d..c10648f56f23 100644
--- a/sound/soc/sof/intel/hda-sdw-bpt.c
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -163,7 +163,7 @@ static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream
 	u32 mask;
 	int ret;
 
-	ret = hda_data_stream_cleanup(sdev->dev, dmab_bdl, false, sdw_bpt_stream, true);
+	ret = hda_data_stream_cleanup(sdev->dev, dmab_bdl, false, sdw_bpt_stream, false, true);
 	if (ret < 0) {
 		dev_err(sdev->dev, "%s: SDW BPT DMA cleanup failed\n",
 			__func__);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 4a46e35c3eac..0778002e2bd6 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -1328,16 +1328,18 @@ hda_data_stream_prepare(struct device *dev, unsigned int format, unsigned int si
 EXPORT_SYMBOL_NS(hda_data_stream_prepare, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_data_stream_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
-			    bool persistent_buffer, struct hdac_ext_stream *hext_stream, bool pair)
+			    bool persistent_buffer, struct hdac_ext_stream *hext_stream,
+			    bool is_iccmax, bool pair)
 {
 	struct snd_sof_dev *sdev =  dev_get_drvdata(dev);
 	struct hdac_stream *hstream = hdac_stream(hext_stream);
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret = 0;
 
-	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (!is_iccmax)
 		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
-	else
+
+	if (hstream->direction == SNDRV_PCM_STREAM_CAPTURE)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 					SOF_HDA_SD_CTL_DMA_START, 0);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3f0966477ace..799e49539b4a 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -739,7 +739,7 @@ struct hdac_ext_stream *hda_cl_prepare(struct device *dev, unsigned int format,
 int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int cmd);
 
 int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
-		   bool persistent_buffer, struct hdac_ext_stream *hext_stream);
+		   bool persistent_buffer, struct hdac_ext_stream *hext_stream, bool is_iccmax);
 int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 #define HDA_CL_STREAM_FORMAT 0x40
 
@@ -911,7 +911,8 @@ hda_data_stream_prepare(struct device *dev, unsigned int format, unsigned int si
 			bool is_iccmax, bool pair);
 
 int hda_data_stream_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
-			    bool persistent_buffer, struct hdac_ext_stream *hext_stream, bool pair);
+			    bool persistent_buffer, struct hdac_ext_stream *hext_stream,
+			    bool is_iccmax, bool pair);
 
 /* common dai driver */
 extern struct snd_soc_dai_driver skl_dai[];
-- 
2.43.0

