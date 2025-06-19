Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951E21ABDD
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329968; cv=none; b=AnAk+bzgZ3L0n6UzZzwqDg7h4FVlq21miExn00hpqSlXzH+pWI0uYghvTfnE24cL6+9rbEcHOCJDl6Jlc67vCKM7ogk6BtEX6tw3mUefKbmliqRf2T+SySMHLwDf9zWT7Z6IQIlk5SNsk0BXg/27W+1Tyb8DWPFePgG7czk+5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329968; c=relaxed/simple;
	bh=dQoenzMX4tVljL4J8wZjMUUYvKfrToh+G7fpO6mFnss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QO8QSYOMqrOXg+Y28Plbg4GM1FF5Ay7JVJ+8XO/JK0u3u8/fKKcgKD7RdcCE6ulH+5E2nYE7hOUMKzQsKbWun7uVGDE/AWB2zY9mP1OoIUnQx29BIbVhc1j3AFu03fZHimJU9iZUKePjW7pO3Nqf1IhTlT3NZ61XrLj4QJ3EN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJjPjW6g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJjPjW6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750329967; x=1781865967;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dQoenzMX4tVljL4J8wZjMUUYvKfrToh+G7fpO6mFnss=;
  b=fJjPjW6gHWATccU35xD29LyWgoNUquv1ViVdDRcgWRAGstIlUnud2ixA
   jl1t62WSuUMPI7Ah939MrcRSG99B1ILgUORyqZbASNw5mL9GxqnFgmPba
   OsvQp5HOUI5txnNnc5FgwtuSEbFx/gnhEmEvyiXa6wyLc7J9sH6bDvVSc
   bOzX9KuTTFneGq4mxYCB/Iw6nZ2t/UI6dgKEET2QFksuwxrMb8iRNk5UC
   Tmgw4tCVjlyQYqlTrnFrRadL1ajsQNUNjwVy3OPhtylL2yjRRDxlMzU4V
   /ojqRE1Y8Hp32MRON4q5XxXoFpdZ2WdMNuK2zvOoGg9cMix0trYxa8WxR
   g==;
X-CSE-ConnectionGUID: 5wbu42twRFqKtOugEayy5g==
X-CSE-MsgGUID: 7uZsNdQYTlSUk3Kz36+pgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52547805"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52547805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:46:05 -0700
X-CSE-ConnectionGUID: GcgTWw8WRsKsQ+lf0aApmg==
X-CSE-MsgGUID: whEKPC+wQzCKABzBHACdJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154879399"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:46:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: pcm: Remove local create_page_table() wrapper function
Date: Thu, 19 Jun 2025 13:46:08 +0300
Message-ID: <20250619104608.25947-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The create_page_table() can be dropped and replaced with a direct call to
snd_sof_create_page_table().

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index deeb1fd8392a..090ea3a76892 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -20,24 +20,6 @@
 #include "sof-utils.h"
 #include "ops.h"
 
-/* Create DMA buffer page table for DSP */
-static int create_page_table(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream,
-			     unsigned char *dma_area, size_t size)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_sof_pcm *spcm;
-	struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
-	int stream = substream->stream;
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm)
-		return -EINVAL;
-
-	return snd_sof_create_page_table(component->dev, dmab,
-		spcm->stream[stream].page_table.area, size);
-}
-
 /*
  * sof pcm period elapse work
  */
@@ -168,9 +150,11 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	/* create compressed page table for audio firmware */
 	if (runtime->buffer_changed) {
-		ret = create_page_table(component, substream, runtime->dma_area,
-					runtime->dma_bytes);
+		struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
 
+		ret = snd_sof_create_page_table(component->dev, dmab,
+				spcm->stream[substream->stream].page_table.area,
+				runtime->dma_bytes);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.49.0

