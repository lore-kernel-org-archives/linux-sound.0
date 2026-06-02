Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17983B961B
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387981; cv=none; b=SRn2KQqngIZfFr/uw4fSwTrElxAu77OyGBk+rD4Cp8WdNXMJM1h+V1UgerXLFzlfUWRlsTyVspB8Wn0+GRu8h3jVqnCHGuj238xoOt2l8+WNjxDSW/9XfzveLGGkXvjEBMeHJx4gU0VOhc+PG2CYqFwq8AttMJP/SBOxxLv/17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387981; c=relaxed/simple;
	bh=ufzAQ5ZMBZH2DmJBprPZovjTuvKJAvdx/NTwhHCeo2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1JfCy4nogproZY8AFAmtBo7YNNk7pZ5LWNkDjq9q2CtRXGE9p9rYsEadLuA2MzFeXwbcj5fp7/bKWmkhCL/tHeSnfYBrlmM6dDRJioDLmnR049KBp5TX3X68o5IFpQ80CIOWC87GpbKPesOnVFwq9HmQqhsRsQEWvsT+HWsKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVsvSUnX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVsvSUnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387980; x=1811923980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ufzAQ5ZMBZH2DmJBprPZovjTuvKJAvdx/NTwhHCeo2M=;
  b=QVsvSUnX9LuZKtvfw7SZboLXOj8jCUf2f3vX6/5rjos5XUYdBQgtPUXw
   dnChrNvVHr4d1Cw/6BUqq6YgDKtk+A/O+MD3yQPw0foV7h9ytyITNBibB
   MkK5RHyBEoEhRz5g4f3xT0WD2vh5ORjsmC2qflznbjiRBULabqbnrk0sB
   /ywRXazxeSYT5sbZtTF5dbBB3vmSsP4yE5uBarvqrDMPngUxGIUyztMWv
   1tWklDNRn0q07XYxhQaB9qzIdyVk2i31/05GtgT7HQNNy9QEcj5hmO1i0
   /qEdt5OcWhpwBAvVngboy9Vea+m2rkGmzYy2xiVKKDXg7gXD9QTnl8HRH
   Q==;
X-CSE-ConnectionGUID: xWdn0VLUS263VauVFP9g4g==
X-CSE-MsgGUID: nZnP6AWlQgeCIQEF5k5RxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742899"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:13:00 -0700
X-CSE-ConnectionGUID: iuUiM85uT5eaUoW++d0gwQ==
X-CSE-MsgGUID: ECGFa4z1RmSjpyV2xi+3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949945"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:12:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
Date: Tue,  2 Jun 2026 10:13:47 +0200
Message-Id: <20260602081350.1752773-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602081350.1752773-1-cezary.rojewski@intel.com>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code line reduction and more transparent variable naming.
No functional changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 7b2bab12c707..deb76eb79d18 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -99,19 +99,14 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
 }
 
 /* Caller responsible for holding ->stream_mutex. */
-struct catpt_stream_runtime *
-catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
+struct catpt_stream_runtime *catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
 {
-	struct catpt_stream_runtime *pos, *result = NULL;
+	struct catpt_stream_runtime *stream;
 
-	list_for_each_entry(pos, &cdev->stream_list, node) {
-		if (pos->info.stream_hw_id == stream_hw_id) {
-			result = pos;
-			break;
-		}
-	}
-
-	return result;
+	list_for_each_entry(stream, &cdev->stream_list, node)
+		if (stream->info.stream_hw_id == stream_hw_id)
+			return stream;
+	return NULL;
 }
 
 /* Caller responsible for holding ->stream_mutex. */
-- 
2.34.1

