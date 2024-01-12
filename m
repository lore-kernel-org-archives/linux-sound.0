Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7156BB57
	for <linux-sound@vger.kernel.org>; Fri, 12 Jan 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK2Z6qis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705066017; x=1736602017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=02f632ZE8ehuKmoE1ekxZiurkYrJTe3SK76DuXHBOYY=;
  b=OK2Z6qisejGHtL8R7L3ZZKBH4FHG4oO9Num1dKW3yrjBetVsSFYXkX3l
   FHFHwVqENrGGclfEmBw2e1yB4Q6e+ChsdTADMSoMdRHxyAbmAp5jO2n0V
   eWYG7TBwikCDDBY/RNCm1w1x1c2qxZXpos9fXKklPcyRhhEGwa4Fivl1D
   vZTGmS1HLdfjWxqZy+WGOEgU+Bx5MqctaeHnQW9iSRJYMyjPajpHqM7ra
   /qhXb7/wb7nH9k827SyTrPB+GKYTPVYm8oBfPYG6D9DXNCp4qgOVOQfj4
   MrXChDp9X90s10dNbHNK3P9HuQDnFWMRmXXs6lEGR6NsBz+xy8TyErA9q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="402939259"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="402939259"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 05:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="759130576"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="759130576"
Received: from jmamzax-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.38.3])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 05:26:54 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	kamil.duljas@gmail.com
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH v2] ASoC: SOF: icp3-dtrace: Revert "Fix wrong kfree() usage"
Date: Fri, 12 Jan 2024 15:27:49 +0200
Message-ID: <20240112132749.28970-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The offending patch introduces memory leak when there is no error, the
memory allocated for the temporary storage is not freed up.

As I have commented, the original code was correct and cleaner to
follow but it was not obvious from the patch that it will introduce
regression.

Fixes: 8c91ca76f448 ("ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage")
Link: https://lore.kernel.org/all/aec61f67-6b4f-49e6-b458-c332983a0ad6@linux.intel.com/
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 93b189c2d2ee..0dca139322f3 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -137,7 +137,6 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
 			dev_err(sdev->dev,
 				"Parsing filter entry '%s' failed with %d\n",
 				entry, entry_len);
-			kfree(*out);
 			return -EINVAL;
 		}
 	}
@@ -209,13 +208,13 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
 		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
 		if (ret < 0) {
 			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
-			kfree(elems);
 			goto error;
 		}
 	}
 	ret = count;
 error:
 	kfree(string);
+	kfree(elems);
 	return ret;
 }
 
-- 
2.43.0

