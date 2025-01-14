Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09F236A91
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858650; cv=none; b=ct679PFX26GG+7xwraTkAYMdPcefDq+bvEKvI0AwgA7OOfh9wop6hYLRxEs8bH2N3lrUo9b+cfQVcIJv4D7U4ozIuekq/v89XhVHfPflYBVYh5zthYf7j373dO2Ra7ERhGwKIaUwdqEIFGBBqhptYncwLkqJh0R8U8RhNruSzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858650; c=relaxed/simple;
	bh=4v2KPlXzL6HgBPrlfIKAcJn8DZWA5FfyfHYr01iVa+k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iXJXmPuL0TmPm9NteQS/WZOW4hKkhEA5Vrh+K0x62RDTVKVg8hI8/oXjUISzLiqdfSTEuewrXBRH4s6664sa1bZ9d2nRkj9etgHJLKkLhuQ0arQyC8Dmw9h+WYTOhb+n+YD5iX1q2sYznC4zjrw7JUhOwUmjFxKMs5bhQEUqxf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjvDFk8T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjvDFk8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736858649; x=1768394649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4v2KPlXzL6HgBPrlfIKAcJn8DZWA5FfyfHYr01iVa+k=;
  b=EjvDFk8TKFCscSlq8utrySFW9ZZ7JboXxzsyi9EBKZqkxyqaShUv0ZEx
   4RFvG9Atp5fo7R9ByN5VVFtneEeUEGqYP0UYwOACQxcwvnO66Ke0+n9an
   xjGn5Qsn9hq1e+egjZZD/pAQHTBO/ZB7J1EkqXbIeoUGr0n+fmG/MDzGO
   uP+lWTUPFCJ3Is9+Vx4ShXvMM78BQz+8PG//zIiBkDuzCB2J43KH3Mz/8
   0yZIeNceLtcYbXL+JrxiRKdyttS5dW4DBCqQxRgBeFDXkQLpEVtopV+YU
   3hOdVfl1lNw77u2H31LUdYmPM6WTYTZ79LrcEpOwodNLrZpMdgpMDrb09
   A==;
X-CSE-ConnectionGUID: pkA78BKgTVynxueMaaE6uQ==
X-CSE-MsgGUID: jup9+gksS/+zxyEZ1vXVbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48559587"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48559587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 04:44:08 -0800
X-CSE-ConnectionGUID: EXJKHAB3QfiDJGyFV5oKnw==
X-CSE-MsgGUID: FJlAD66UTGet0gU4wBcVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="109779377"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa004.jf.intel.com with ESMTP; 14 Jan 2025 04:44:06 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3] ALSA: hda: Transfer firmware in two chunks
Date: Tue, 14 Jan 2025 13:58:13 +0100
Message-Id: <20250114125813.11567-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per specification, SDxLVI shall be at least 1 i.e.: two chunks to
perform a valid transfer. This is true for the PCM transfer code but
not firmware-transfer one.

Technical background:
- the LVI > 0 rule shall be obeyed in PCM transfer
- HW permits LVI == 0 when transfer is SW-controlled (SPIB)
- FW download is not a PCM transfer and is SW-controlled (SPIB)

The above is the fundament which AudioDSP firmware loading functions
have been built upon and worked since 2016. The presented changes are to
align the loading flows and avoid rising more questions in the future.

Achieve the goal by splitting snd_hdac_stream_setup_periods() into
substream-dependent and -independent part. Let snd_hdac_dsp_prepare()
utilize the latter so that both DSP-loading and PCM flows utilize same
BLDE setup loop which already takes care of cutting the buffer based on
azx_dev->period_bytes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h |  2 ++
 sound/hda/hdac_stream.c | 64 ++++++++++++++++++++++++-----------------
 2 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index b098ceadbe74..3a3cfb832ddc 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -577,6 +577,8 @@ struct hdac_stream *snd_hdac_get_stream(struct hdac_bus *bus,
 
 int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading);
 void snd_hdac_stream_cleanup(struct hdac_stream *azx_dev);
+int snd_hdac_stream_setup_bdle(struct hdac_stream *azx_dev, struct snd_dma_buffer *dmab,
+			       struct snd_pcm_runtime *runtime);
 int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev);
 int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 				unsigned int format_val);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 2670792f43b4..da6c48eaf29c 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -492,32 +492,21 @@ static int setup_bdle(struct hdac_bus *bus,
 }
 
 /**
- * snd_hdac_stream_setup_periods - set up BDL entries
+ * snd_hdac_stream_setup_bdle - set up BDL entries
  * @azx_dev: HD-audio core stream to set up
+ * @dmab: allocated DMA buffer
+ * @runtime: substream runtime, optional
  *
  * Set up the buffer descriptor table of the given stream based on the
  * period and buffer sizes of the assigned PCM substream.
  */
-int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
+int snd_hdac_stream_setup_bdle(struct hdac_stream *azx_dev, struct snd_dma_buffer *dmab,
+			       struct snd_pcm_runtime *runtime)
 {
 	struct hdac_bus *bus = azx_dev->bus;
-	struct snd_pcm_substream *substream = azx_dev->substream;
-	struct snd_compr_stream *cstream = azx_dev->cstream;
-	struct snd_pcm_runtime *runtime = NULL;
-	struct snd_dma_buffer *dmab;
-	__le32 *bdl;
 	int i, ofs, periods, period_bytes;
 	int pos_adj, pos_align;
-
-	if (substream) {
-		runtime = substream->runtime;
-		dmab = snd_pcm_get_dma_buf(substream);
-	} else if (cstream) {
-		dmab = snd_pcm_get_dma_buf(cstream);
-	} else {
-		WARN(1, "No substream or cstream assigned\n");
-		return -EINVAL;
-	}
+	__le32 *bdl;
 
 	/* reset BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
@@ -571,6 +560,34 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 		azx_dev->bufsize, period_bytes);
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(snd_hdac_stream_setup_bdle);
+
+/**
+ * snd_hdac_stream_setup_periods - set up BDL entries
+ * @azx_dev: HD-audio core stream to set up
+ *
+ * Set up the buffer descriptor table of the given stream based on the
+ * period and buffer sizes of the assigned PCM substream.
+ */
+int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
+{
+	struct snd_pcm_substream *substream = azx_dev->substream;
+	struct snd_compr_stream *cstream = azx_dev->cstream;
+	struct snd_pcm_runtime *runtime = NULL;
+	struct snd_dma_buffer *dmab;
+
+	if (substream) {
+		runtime = substream->runtime;
+		dmab = snd_pcm_get_dma_buf(substream);
+	} else if (cstream) {
+		dmab = snd_pcm_get_dma_buf(cstream);
+	} else {
+		WARN(1, "No substream or cstream assigned\n");
+		return -EINVAL;
+	}
+
+	return snd_hdac_stream_setup_bdle(azx_dev, dmab, runtime);
+}
 EXPORT_SYMBOL_GPL(snd_hdac_stream_setup_periods);
 
 /**
@@ -923,7 +940,6 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 			 unsigned int byte_size, struct snd_dma_buffer *bufp)
 {
 	struct hdac_bus *bus = azx_dev->bus;
-	__le32 *bdl;
 	int err;
 
 	snd_hdac_dsp_lock(azx_dev);
@@ -943,18 +959,14 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 
 	azx_dev->substream = NULL;
 	azx_dev->bufsize = byte_size;
-	azx_dev->period_bytes = byte_size;
+	/* It is recommended to transfer the firmware in two or more chunks. */
+	azx_dev->period_bytes = byte_size / 2;
 	azx_dev->format_val = format;
+	azx_dev->no_period_wakeup = 1;
 
 	snd_hdac_stream_reset(azx_dev);
 
-	/* reset BDL address */
-	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
-	snd_hdac_stream_writel(azx_dev, SD_BDLPU, 0);
-
-	azx_dev->frags = 0;
-	bdl = (__le32 *)azx_dev->bdl.area;
-	err = setup_bdle(bus, bufp, azx_dev, &bdl, 0, byte_size, 0);
+	err = snd_hdac_stream_setup_bdle(azx_dev, bufp, NULL);
 	if (err < 0)
 		goto error;
 
-- 
2.25.1

