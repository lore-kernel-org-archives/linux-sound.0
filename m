Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD371465AC
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879329; cv=none; b=c1Bbo72CH1oqesPnSvK/Rb8GMRaVnvTEEHy+tXA4W+UeTl5HGeMSR+oJqOnsSDyPqUhAccsTNcdD6AZ7xHXv9x5QAPCASX5J1GTfwXtwZVa6xBSgkhARkj2lwan7xGv6VqQVl6EIkMljoZGa1Pv13eUBYYbM2Yy12NA7lek2E0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879329; c=relaxed/simple;
	bh=bhmSkQzSUCKkAJOmvA+eNC6faLeEASoTnOvF2DYF2/I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jgJ7AI2MQBxZzgghrTyyJ0JaSMZct0Y3r+uKLtSdRnSMaXXzpki+WamjmMsASBZZU0JbnByGzBmHy0jbev8vNsAFxZugII4pzTidfbz/rHKhS8bAoMskIvm8rpaiG8udrN/L6buq/Aa2B1MZhk7SvL/bs0SCx6s0Nm5HiLLME1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnCHHQj4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnCHHQj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736879328; x=1768415328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bhmSkQzSUCKkAJOmvA+eNC6faLeEASoTnOvF2DYF2/I=;
  b=hnCHHQj4hqhZ8dd4HTjuB87X1Tb1IIk085mDCYFaRvmXu8W4rHZAhcSy
   9ZgHrLfrp+bvvkm3H7WskgzD+YDOUMLOeRra2Z9z9pgO9FXllgZ0B2oso
   2kQvElZo930SOXwgx27wzFuCMuW/5HH6NtvqQ6ooj/P1PqXUNxB6H8UdN
   A4sEz0kcYit8oV6l5PJWT4pBhs9IJlCXClJvlYC9fFfwpbWzm6G7N6h6l
   wNqPUOB/l5ue26vaVJkQkMV2uWm959V3lZqTaYVOCuG/Y/cof4Pb22dB+
   LZPeEhp5CzbuD1PzUozm1laCsglzuXdUCiyr0kuqFOurgiPnzNPvwniTS
   A==;
X-CSE-ConnectionGUID: sv9jiJJCTA6H2R7goINWQA==
X-CSE-MsgGUID: k5UljZZ1RJ+WvH8VdserDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37346442"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="37346442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 10:28:47 -0800
X-CSE-ConnectionGUID: Z0D7YcmtSP+WIQYB3iQUAQ==
X-CSE-MsgGUID: wG8QsUp+TKqPYkGGeBdn4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="105061054"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2025 10:28:45 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4] ALSA: hda: Transfer firmware in two chunks
Date: Tue, 14 Jan 2025 19:42:39 +0100
Message-Id: <20250114184239.120002-1-cezary.rojewski@intel.com>
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

Changes in v4:
- made snd_hdac_stream_setup_bdle() as suggested by Takashi

Changes in v3:
- refactored the code entirely so that setup_bdle() is not updated in
  possibly harmful manner against a typical PCM-transfer

 sound/hda/hdac_stream.c | 63 ++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 2670792f43b4..4e85a838ad7e 100644
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
+static int snd_hdac_stream_setup_bdle(struct hdac_stream *azx_dev, struct snd_dma_buffer *dmab,
+				      struct snd_pcm_runtime *runtime)
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
@@ -571,6 +560,33 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 		azx_dev->bufsize, period_bytes);
 	return -EINVAL;
 }
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
@@ -923,7 +939,6 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 			 unsigned int byte_size, struct snd_dma_buffer *bufp)
 {
 	struct hdac_bus *bus = azx_dev->bus;
-	__le32 *bdl;
 	int err;
 
 	snd_hdac_dsp_lock(azx_dev);
@@ -943,18 +958,14 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 
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

