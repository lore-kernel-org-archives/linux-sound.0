Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413512DD9F
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071120; cv=none; b=ZItnpClV7IxXXkwD5ge/p7yFZifHIZKN7EzP893s3ssiERJvunv8bxWANn6SmjZd/ldCuY6ybJI6n0iFhx4JOmmfZKAhQ6TQLAx8pJDoGN9dqFtgSDlq5PLZeleczNNrucxbuFUeXyQ71rEy+IDZCMOvlymg014xNBuEoyyrVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071120; c=relaxed/simple;
	bh=TJoW8RciH39owQNbgrWqj3szaoPdAAlBqErkph0omU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DISPbL+I63CP7VUSJUpOTvlARgfaQdSbZWnGkd0CeLfF/ziQU0ebKY00/F6QJ/L951wY/5wA+8cYLD6w2j1KczfvbUwwMS4sPJ9+vVpUMHAaFJR7p4CFBKFN0iAE9q02BavzSfSwiwaanL/XUuPUrnAIoVF2Z3phmIj5R+5RQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=El6Qqqov; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El6Qqqov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071119; x=1743607119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TJoW8RciH39owQNbgrWqj3szaoPdAAlBqErkph0omU8=;
  b=El6QqqovkDImegFSD6dPTdFpzfttrdB1dD5qxO8WJ0rnOF58Uu3PIcvn
   Lv4j054txrOwuT3IVww3b/SXL4pRtbOJFBvJ8VodZpuAS4TYGOhtZmwrO
   VLiRZxfwzkaa7PlgEYfqEaJk+kvaG1C8R7yPaCZhIq7Y6xP10YjdHuLkA
   tYI9ueJUFDCADXapi4KD+DX5ZwYxSB2fbjouH+n8oUNGcDaqeuXKw3pbU
   BD83ZxD2ZfMIx+PS/Nu6mAji6xiegoAv4RWe6hegKfNrG6YZh7a7fabrn
   aks9lftbrkHhfVjgfmNUhVRqqBzIezfkm+wNLuiORDyiqSPkHgPYFVlro
   Q==;
X-CSE-ConnectionGUID: xWWADeaDS7KOuD65oGDBgQ==
X-CSE-MsgGUID: PIaX9wpITlOUBuQX/k8FsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729929"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:38 -0700
X-CSE-ConnectionGUID: 8ljQWR7OReyzb5vEp2vXDg==
X-CSE-MsgGUID: TAOVqzxqShmDRYy/qgxO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796490"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/17] Revert "ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams for first CPU DAI"
Date: Tue,  2 Apr 2024 10:18:14 -0500
Message-Id: <20240402151828.175002-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This reverts commit f8ba62ac863c33fc0d8ac3f1270985c2b77f4377.

The SoundWire aggregated solution was to use one DMA on multiple links.
But, the solution changed to use one DMA for each link. It means that
we should assign HDaudio stream_tag for each cpu_dai.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index e17b83575e84..457144203999 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -146,17 +146,9 @@ static struct hdac_ext_stream *hda_assign_hext_stream(struct snd_sof_dev *sdev,
 						      struct snd_soc_dai *cpu_dai,
 						      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai;
 	struct hdac_ext_stream *hext_stream;
 
-	/* only allocate a stream_tag for the first DAI in the dailink */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-	if (dai == cpu_dai)
-		hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
-	else
-		hext_stream = snd_soc_dai_get_dma_data(dai, substream);
-
+	hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
 	if (!hext_stream)
 		return NULL;
 
@@ -169,14 +161,9 @@ static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai
 				    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai;
 
-	/* only release a stream_tag for the first DAI in the dailink */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-	if (dai == cpu_dai)
-		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
+	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 }
 
 static void hda_setup_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream,
-- 
2.40.1

