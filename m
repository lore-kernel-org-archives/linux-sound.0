Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8494455173
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363047; cv=none; b=ZTPoJOmP3NaakkLbGKkafS6BdeNnqufFSaWS4pvSRbaiFsHysTr+sNhYlxfJUL2qsH1Py0Pdd/kRPdZMbcxpmZqsqKXM1bS/ResXoM587HEczG7U1Rpq0JBHwd+Nz3PkKbXuminmXkK36ZYUVBbLdSKAwYaZqUE43tyi9peuWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363047; c=relaxed/simple;
	bh=08QWOBvoMS8FhJrQ2n0415AUzsUr3Iw1Kwk4j32qLAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsSNioVu/v4jKANQ5J/sra0jg86dhnqjsuFXddn7qBFNnnyFxBn3rA5EUSZ4LQTwDeDLjFaOAf6fN6NZpSuvD2MtEMA22a5YuhG9OttEmCzbMDsYXoyDSj99PHfa6xMbmnlYqIfUZ9SnyxjFLJlvUShsuj9FosSybXpqq+Z0ysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kogM9o00; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kogM9o00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363047; x=1822899047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=08QWOBvoMS8FhJrQ2n0415AUzsUr3Iw1Kwk4j32qLAY=;
  b=kogM9o00ppI9RWgoyjjGVAVuayfcjgOhkAfKvO7mJRDQmQ1yuAtCzvSM
   oheyrzQFJE09GfYc4tjXoI/pSjveRoP7A+THmvyPkCiinU1TlxzBXOAXj
   eWkJ/cCQoCR4OvSqJlWM5dVOcRz1BrICBkI1lLiT7MAWN/x4WUzzwjbW3
   uq85RR74HsORUibPYA7zQdNB5KW865SUS8VPxa/kfYbTqSYN6Hf5a46JS
   4Lk6hqUssDcrEpAICVZ+F1PlyK11RpMg+nz8nUG9B9Zq7acNebjtkCzr1
   K3CTFNFJrjBJIjLiII0qsdePd32fNu3hqoRPCVcxFloNNitFauktX1m/7
   Q==;
X-CSE-ConnectionGUID: YI1CsLbzQkKqM4KpePOaNA==
X-CSE-MsgGUID: zLelBDSbSs+kIUioCPXRqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114055"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114055"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:47 -0700
X-CSE-ConnectionGUID: QT8YEVEoTReJsUfvfYC/Rg==
X-CSE-MsgGUID: nIoZ33+VRhOMCLamAH1cEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670809"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 23/28] ASoC: SOF: Check that the audio buffer fits into the page table
Date: Wed,  7 Oct 2026 11:49:50 +0300
Message-ID: <20261007084955.1256-24-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page table describing the audio buffer for the firmware is a single
PAGE_SIZE allocation, but snd_sof_create_page_table() writes the
compressed PFNs into it without checking that they fit.

The PFNs are stored in 2.5 bytes each and the last one is written with a
32 bit access, so with 4K pages the table can hold 1638 PFNs, which is a
buffer of 6.4MB. A larger buffer corrupts memory past the end of the
page table.

The PCM path is not affected as the maximum buffer size is specified by
the topology, but the compressed streams can ask for larger buffers.

Pass the page table buffer to snd_sof_create_page_table() instead of only
its address and verify that the buffer can be described by it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c |  2 +-
 sound/soc/sof/pcm.c         |  2 +-
 sound/soc/sof/sof-audio.c   |  2 +-
 sound/soc/sof/sof-utils.c   | 12 ++++++++++--
 sound/soc/sof/sof-utils.h   | 11 ++++++++++-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 22053357731a..e8c998c09dc3 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -534,7 +534,7 @@ static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 
 	/* create compressed page table for audio firmware */
 	ret = snd_sof_create_page_table(sdev->dev, &priv->dmatb,
-					priv->dmatp.area, priv->dmatb.bytes);
+					&priv->dmatp, priv->dmatb.bytes);
 	if (ret < 0)
 		goto table_err;
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 42738f12fa33..b4305dc43d61 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -194,7 +194,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 		struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
 
 		ret = snd_sof_create_page_table(component->dev, dmab,
-				spcm->stream[substream->stream].page_table.area,
+				&spcm->stream[substream->stream].page_table,
 				runtime->dma_bytes);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9f9f18b3c935..8cbeca471542 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1132,6 +1132,6 @@ int snd_sof_compr_create_page_table(struct snd_soc_component *component,
 		return -EINVAL;
 
 	return snd_sof_create_page_table(component->dev, dmab,
-					 spcm->stream[dir].page_table.area, size);
+					 &spcm->stream[dir].page_table, size);
 }
 #endif
diff --git a/sound/soc/sof/sof-utils.c b/sound/soc/sof/sof-utils.c
index f70089317b8c..59dc10196958 100644
--- a/sound/soc/sof/sof-utils.c
+++ b/sound/soc/sof/sof-utils.c
@@ -24,12 +24,20 @@
 
 int snd_sof_create_page_table(struct device *dev,
 			      struct snd_dma_buffer *dmab,
-			      unsigned char *page_table, size_t size)
+			      struct snd_dma_buffer *page_table, size_t size)
 {
 	int i, pages;
 
 	pages = snd_sgbuf_aligned_pages(size);
 
+	if (pages < 1 || page_table->bytes < sizeof(u32) ||
+	    pages > SOF_PAGE_TABLE_MAX_PFNS(page_table->bytes)) {
+		dev_err(dev,
+			"Can not store %d pages in a %zu bytes page table\n",
+			pages, page_table->bytes);
+		return -EINVAL;
+	}
+
 	dev_dbg(dev, "generating page table for %p size 0x%zx pages %d\n",
 		dmab->area, size, pages);
 
@@ -45,7 +53,7 @@ int snd_sof_create_page_table(struct device *dev,
 		u32 pfn = snd_sgbuf_get_addr(dmab, i * PAGE_SIZE) >> PAGE_SHIFT;
 		u8 *pg_table;
 
-		pg_table = (u8 *)(page_table + idx);
+		pg_table = (u8 *)(page_table->area + idx);
 
 		/*
 		 * pagetable compression:
diff --git a/sound/soc/sof/sof-utils.h b/sound/soc/sof/sof-utils.h
index 9ac6de9a6d6a..58e5822a63f0 100644
--- a/sound/soc/sof/sof-utils.h
+++ b/sound/soc/sof/sof-utils.h
@@ -12,8 +12,17 @@
 struct snd_dma_buffer;
 struct device;
 
+/*
+ * Number of PFNs which can be stored in a page table of @bytes size.
+ * The PFNs are compressed to 2.5 bytes each but they are written with 32 bit
+ * accesses, therefore the last PFN can reach up to 3 bytes past the space it
+ * needs for itself.
+ */
+#define SOF_PAGE_TABLE_MAX_PFNS(bytes)	\
+	(((((bytes) - sizeof(u32)) << 1) + 1) / 5 + 1)
+
 int snd_sof_create_page_table(struct device *dev,
 			      struct snd_dma_buffer *dmab,
-			      unsigned char *page_table, size_t size);
+			      struct snd_dma_buffer *page_table, size_t size);
 
 #endif
-- 
2.56.0

