Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC89131BDB
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256903; cv=none; b=MqdxdFXHLWMyXvXbcx7OzGxgcnicPQgdielL07d6xgU/l0PKV95a2MdZRuz1KF4hBSSCMkSIoYpzAJ7q7NNZ307DJ467syXDYr/gJ1rSz8E7kqXFm7SNaaBFoK22L3tPKckEomDee3LE1wOZKML5vGQdCPrTmjJSK/OAhUMZB88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256903; c=relaxed/simple;
	bh=ODRtjg2y6+4Go9UEHITSwLfxaSY3Ha8ohpfyvqr1CdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjZMdmryZF6PbuvxrnQ+RU+2RglT2HvaVfpMWCiru1ngQ2TmDEyeNADqs3Ziy5ptd4aNbgtdyvwc8OASvXJckseSdQPnnacz/wK1fXbBxYHei6cgZvTdp51eZyFarPco4kJSnuc7r9g1x95Z4AJCdt8UAi4T4kOPAQQLfDenFF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv3a574D; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv3a574D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256902; x=1743792902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ODRtjg2y6+4Go9UEHITSwLfxaSY3Ha8ohpfyvqr1CdY=;
  b=Hv3a574DiilLnhMXXKpKvmMQ6oC0RegpMbHMY3a2RsJHuFEhekPnrs2l
   OWlzNorAJZEH1e9csWnLXW46EHkZdJHc3YRtxNCV85NgCgFvTInuWUnac
   9GEmsVS3vesIYIjcxU33YK2M1GivzxTU6ABdznI6IUeskfCf3jkZQKkKi
   2ZQah0jwYambMbHyRm3z4QHO6C/Oj7AMYvkLc5CZQroSfHuIhnngYfKoT
   UpyTO9sYFMKDaoxHh+4iQQDcgOIfa2MVubmvoKssdnqNqzm7PyvH+gEVP
   0fuDxpRPcTurjF4s0PXKyl3gmdS+tQJkg8fHdRKQEnNsB1ogl/tYRVw33
   A==;
X-CSE-ConnectionGUID: zToOn+vKSTq3BoRrAT5ZIA==
X-CSE-MsgGUID: 9dwIPcToRvu/dCvGsrR6Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432804"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7432804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:55:00 -0700
X-CSE-ConnectionGUID: T0pV+aVoReqQchE8EOsKWw==
X-CSE-MsgGUID: Rq8RaG1MQ6uCiqZi61F+kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23574630"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:54:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
Date: Thu,  4 Apr 2024 13:54:47 -0500
Message-Id: <20240404185448.136157-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HDaudio stream interrupts are ignored unless the stream is PCM or
compressed audio. For alternate non-audio usages, such as code loader
or SoundWire BPT case, the IOC interrupt on the last buffer
transferred is silently ignored.

This patch adds a 'struct completion' for each HDaudio stream. This
capability helps detect if the non-audio data transfers
completed. There is no performance impact for audio streams.

In the code loader case, the code currently starts the DMA and
directly checks if the firmware status changes, without checking if
the DMA succeeded. With a first pass waiting for the DMA to complete,
system validation engineers can gather more precise timing information
on firmware boot time or root-cause boot failures more accurately.

A timeout of 500ms was selected for the code loader DMA. This is an
experimental value which should be more than enough - higher values
would certainly be problematic from a usage/latency perspective.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-stream.c | 22 +++++++++++++++++++---
 sound/soc/sof/intel/hda.h        |  2 ++
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 5716772a7a91..dc88b7ea599e 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -226,10 +226,15 @@ int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	struct sof_intel_hda_stream *hda_stream;
 
 	/* code loader is special case that reuses stream ops */
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
+		hda_stream = container_of(hext_stream, struct sof_intel_hda_stream,
+					  hext_stream);
+		reinit_completion(&hda_stream->ioc);
+
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
 					1 << hstream->index,
 					1 << hstream->index);
@@ -283,19 +288,38 @@ int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 }
 EXPORT_SYMBOL_NS(hda_cl_cleanup, SND_SOC_SOF_INTEL_HDA_COMMON);
 
+#define HDA_CL_DMA_IOC_TIMEOUT_MS 500
+
 int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
+	struct sof_intel_hda_stream *hda_stream;
+	unsigned long time_left;
 	unsigned int reg;
 	int ret, status;
 
+	hda_stream = container_of(hext_stream, struct sof_intel_hda_stream,
+				  hext_stream);
+
+	dev_dbg(sdev->dev, "Code loader DMA starting\n");
+
 	ret = hda_cl_trigger(sdev->dev, hext_stream, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger start failed\n");
 		return ret;
 	}
 
+	/* Wait for completion of transfer */
+	time_left = wait_for_completion_timeout(&hda_stream->ioc,
+						msecs_to_jiffies(HDA_CL_DMA_IOC_TIMEOUT_MS));
+
+	if (!time_left) {
+		dev_err(sdev->dev, "Code loader DMA did not complete\n");
+		return -ETIMEDOUT;
+	}
+	dev_dbg(sdev->dev, "Code loader DMA done, waiting for FW_ENTERED status\n");
+
 	status = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 					chip->rom_status_reg, reg,
 					(FSR_TO_STATE_CODE(reg) == FSR_STATE_FW_ENTERED),
@@ -311,6 +335,8 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 		dev_err(sdev->dev,
 			"%s: timeout with rom_status_reg (%#x) read\n",
 			__func__, chip->rom_status_reg);
+	} else {
+		dev_dbg(sdev->dev, "Code loader FW_ENTERED status\n");
 	}
 
 	ret = hda_cl_trigger(sdev->dev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
@@ -318,6 +344,8 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
 		if (!status)
 			status = ret;
+	} else {
+		dev_dbg(sdev->dev, "Code loader DMA stopped\n");
 	}
 
 	return status;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 0c189d3b19c1..76c33795ade4 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -765,10 +765,25 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 			writeb(sd_status, s->sd_addr + SOF_HDA_ADSP_REG_SD_STS);
 
 			active = true;
-			if ((!s->substream && !s->cstream) ||
-			    !s->running ||
-			    (sd_status & SOF_HDA_CL_DMA_SD_INT_COMPLETE) == 0)
+			if (!s->running)
 				continue;
+			if ((sd_status & SOF_HDA_CL_DMA_SD_INT_COMPLETE) == 0)
+				continue;
+			if (!s->substream && !s->cstream) {
+				/*
+				 * when no substream is found, the DMA may used for code loading
+				 * or data transfers which can rely on wait_for_completion()
+				 */
+				struct sof_intel_hda_stream *hda_stream;
+				struct hdac_ext_stream *hext_stream;
+
+				hext_stream = stream_to_hdac_ext_stream(s);
+				hda_stream = container_of(hext_stream, struct sof_intel_hda_stream,
+							  hext_stream);
+
+				complete(&hda_stream->ioc);
+				continue;
+			}
 
 			/* Inform ALSA only in case not do that with IPC */
 			if (s->substream && sof_hda->no_ipc_position) {
@@ -880,6 +895,7 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 			return -ENOMEM;
 
 		hda_stream->sdev = sdev;
+		init_completion(&hda_stream->ioc);
 
 		hext_stream = &hda_stream->hext_stream;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index b4b037758fcb..b59d1a572bce 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -11,6 +11,7 @@
 #ifndef __SOF_INTEL_HDA_H
 #define __SOF_INTEL_HDA_H
 
+#include <linux/completion.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
 #include <sound/compress_driver.h>
@@ -559,6 +560,7 @@ struct sof_intel_hda_stream {
 	struct sof_intel_stream sof_intel_stream;
 	int host_reserved; /* reserve host DMA channel */
 	u32 flags;
+	struct completion ioc;
 };
 
 #define hstream_to_sof_hda_stream(hstream) \
-- 
2.40.1

