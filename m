Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74131812F
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534438; cv=none; b=MCZXQ3HJzKwkd5J92xRWOx0wJ3rN5dqJFWTQNUV3+7ftSB6to6eq6hWx3GkctAJdAQm1S+p+qZ1t25uliQbJKRQmC6bupladULVQ4Ub5xI52tirH622WqkJIP2SJyObIMT3uli19PSacjzPZmLfzw5zUmMHXjnTYhIsB7CnsEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534438; c=relaxed/simple;
	bh=q18ZQHX/5ZM08tY4SZoJn2GaM2J6ZaiU1aWzBH1bcwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3t/w5BJnhb2Ciaat8rwZcSdzynLoqNG+9z8b2nhh/nQgkbSfy/sABjx06E+9VxM4HGJftx/q+H3i8b1p99m97DaTiONBHRPtB8nU/RAJJG/+mI5Tf9YIjvESSrusmAhqheAVbchmyk72OWzuyuuaC2O0EF0bW3xHxsWyakJbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxKXUx3/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxKXUx3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765534437; x=1797070437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q18ZQHX/5ZM08tY4SZoJn2GaM2J6ZaiU1aWzBH1bcwg=;
  b=TxKXUx3/0ZMvi+u0p51jjLejzNz5r/n8tQqpDfEVGJgeDGAXqxQKT7hT
   j8Zl9rwcoB/B1WOBDorkjMThZKxX2Lvt+oRiIB6Rq15mTLHdnRlsqr2Y8
   YbA+zyvaglIdFBM/DRLTvokQq+fHNrD9r8kg42+LJheSarvciKuPL3Uhe
   ga0JG9jJvIJQ6PERAZD6coc1druCM/fQjfQ1LRBoU1Wkg8eCHZ+HeTEbZ
   w1VMeX9yvK0wNgUuVwQbeug6K3RDer42e3h00fUUlfalU5WWj88aSHCwQ
   OQw1Ka52any5OlkrgF4soRx65yGiCa3koUqPr0e2aLeeukh+aKs1iF4wv
   Q==;
X-CSE-ConnectionGUID: wZXNFGdwQpyUrOcYYNKxVg==
X-CSE-MsgGUID: RNNmJiJMRjiHS7mh9PPfaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78891339"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78891339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:13:56 -0800
X-CSE-ConnectionGUID: DGbEiIXQT72wjKHiJB/fUg==
X-CSE-MsgGUID: 1EBwiK2HSHq4ymdEkOdqWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234444927"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 02:13:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/5] ASoC: Intel: catpt: Simplify catpt_stream_read_position()
Date: Fri, 12 Dec 2025 11:38:56 +0100
Message-Id: <20251212103858.110701-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251212103858.110701-1-cezary.rojewski@intel.com>
References: <20251212103858.110701-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add position to the argument list to simplify the wrapper.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index cc43346f83af..cbb1c3942409 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -114,14 +114,10 @@ catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
 	return result;
 }
 
-static u32 catpt_stream_read_position(struct catpt_dev *cdev,
-				      struct catpt_stream_runtime *stream)
+static void catpt_stream_read_position(struct catpt_dev *cdev,
+				       struct catpt_stream_runtime *stream, u32 *pos)
 {
-	u32 pos;
-
-	memcpy_fromio(&pos, cdev->lpe_ba + stream->info.read_pos_regaddr,
-		      sizeof(pos));
-	return pos;
+	memcpy_fromio(pos, cdev->lpe_ba + stream->info.read_pos_regaddr, sizeof(*pos));
 }
 
 static u32 catpt_stream_volume(struct catpt_dev *cdev,
@@ -615,7 +611,7 @@ catpt_component_pointer(struct snd_soc_component *component,
 		return 0;
 
 	stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
-	pos = catpt_stream_read_position(cdev, stream);
+	catpt_stream_read_position(cdev, stream, &pos);
 
 	return bytes_to_frames(substream->runtime, pos);
 }
-- 
2.25.1

