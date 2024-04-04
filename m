Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C33130A45
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 18:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256901; cv=none; b=GunN+VqLlV7VULcjza/w7RxqQoIkYTiKXg/lrCxi596D5nsT6nxg5zryrmZMrOwp1P1zdjIXEAhcIgI7ev9P91TZfKzhHpS2lUmB9b2aHHncYGxwQSTncMb7oNBjr7iKFJvG+GxlQjtT5+ewJr02oZwA6rkSsYD/QduG7ztgds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256901; c=relaxed/simple;
	bh=jR0hXVnSlMm9VAI0MUqukd1eQ7JKzhltn4ryJuf8Cqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ioe5iYdZOhIBLsHxRnhusJNdb3eyivt22Uat8Jt/LY8hyCFU7ZYr3jJFhpMkETfY2AY6G71MU1CAOgzhEYX6d+bvoBj1DzikNNz6XqYHoaQCnOsoB22zkuh81R4tHJ1Y2Ob8kSjnVnxab778ArZz+4VnMo517Icd9osAqicmZr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laiSitXq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laiSitXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256900; x=1743792900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jR0hXVnSlMm9VAI0MUqukd1eQ7JKzhltn4ryJuf8Cqs=;
  b=laiSitXqIEc25/OsD+Db8+LM33gggBJ7zh83VBblxazWO1GmaSe18rDX
   QgnxoQejE4bnJcZq0EDKWXgBhhkUaGhJnylKJheCEKwMTC4oRJ0nXCRBk
   0/LR4IZI9fSqjEl5+lxdK34/u0YHbl+NjeByLzmsHmQ8ceuuAEYbPryal
   w5p3Sr4JNgc96QmcMVSjiUkDXacnCj13ee4WRkgftctIc2shY11TfEKXe
   Eq/HxLHIIMn0IlUsgCxiBFBo6V5ll/PsTUPggECi38wk1lcRx/1jIYGdq
   WMSE9k+5VpEOhv4+YVqRpzqSwpVl7NXo5gYetYFpJ+/YJ8SWehfHDtLQF
   g==;
X-CSE-ConnectionGUID: GKICZDZ2RzCgtXX7X3uizg==
X-CSE-MsgGUID: q0aK9ee6QoCyj5qh8l/6mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432793"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7432793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:54:59 -0700
X-CSE-ConnectionGUID: haT0D51HR5SMYnS+TL5msA==
X-CSE-MsgGUID: 5zJ9sduNQ96WS7UoRFKKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23574622"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:54:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
Date: Thu,  4 Apr 2024 13:54:45 -0500
Message-Id: <20240404185448.136157-2-pierre-louis.bossart@linux.intel.com>
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

The existing code conflates capture stream and ICCMAX stream. This
isn't going to be true any longer when we add support for SDW BPT RX
streams. Add a boolean tag to flag ICCMAX streams.

No functionality change, only future-proofing change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 10 +++++-----
 sound/soc/sof/intel/hda.h        |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d5b9209beb5a..dafb6b3ebb20 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -46,7 +46,7 @@ static void hda_ssp_set_cbp_cfp(struct snd_sof_dev *sdev)
 
 struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 					      unsigned int size, struct snd_dma_buffer *dmab,
-					      int direction)
+					      int direction, bool is_iccmax)
 {
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
@@ -73,7 +73,7 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
 	hstream->format_val = format;
 	hstream->bufsize = size;
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+	if (is_iccmax) {
 		ret = hda_dsp_iccmax_stream_hw_params(sdev, hext_stream, dmab, NULL);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: iccmax stream prepare failed: %d\n", ret);
@@ -335,7 +335,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * the data, so use a buffer of PAGE_SIZE for receiving.
 	 */
 	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, PAGE_SIZE,
-					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
+					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE, true);
 	if (IS_ERR(iccmax_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
 		return PTR_ERR(iccmax_stream);
@@ -421,7 +421,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	/* prepare DMA for code loader stream */
 	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
 					    stripped_firmware.size,
-					    &dmab, SNDRV_PCM_STREAM_PLAYBACK);
+					    &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
 		return PTR_ERR(hext_stream);
@@ -538,7 +538,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	/* prepare DMA for code loader stream */
 	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
 					    stripped_firmware.size,
-					    &dmab, SNDRV_PCM_STREAM_PLAYBACK);
+					    &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "%s: DMA prepare failed\n", __func__);
 		return PTR_ERR(hext_stream);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 16140ae22c90..30a185d4c7ab 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -705,7 +705,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
 int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream);
 struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 					      unsigned int size, struct snd_dma_buffer *dmab,
-					      int direction);
+					      int direction, bool is_iccmax);
 int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		   struct hdac_ext_stream *hext_stream);
 int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
-- 
2.40.1

