Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCgfeTzH"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0041AB
	for <linux-sound@vger.kernel.org>; Wed, 13 Dec 2023 23:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702538955; x=1734074955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lcvCre1DF2hN3a83RWVYUxX6OuZmu7YtpP6AV3LB6WU=;
  b=GCgfeTzHozBHd8pPOB3huk0WxNNfmBwvukNznU/vs6zsEvKjjvSbltld
   qhaFq7YpMc67X68QAmjtudIULZMOohDGlEP6jCn+AmlUgazfjC7tK2wK6
   hyQ6Mixjj9+km+CbpVMhTsiowJdacFmKl/oWu1R1708Uz4c2cs+A2YomL
   8poq6oo+1XTY4OalhuVtKa5Lepu0CLaGrXdU+APOSk9GFSWe5318PRTB6
   2X8hmJc+xRUt6r0dy4oKRn929rK6hpz51AtO15WC2QLj+fKgHfeMc7Mf6
   /U5h37d3m3QpSH55fVpNfWgSg7uLx6PbFCINiZZdgjXEKzS8A5K5Tkwex
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2235819"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="2235819"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 23:29:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="892342273"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="892342273"
Received: from eborisov-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.34.72])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 23:29:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	kamil.duljas@gmail.com
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel..com
Subject: [PATCH] Revert "ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage"
Date: Thu, 14 Dec 2023 09:29:54 +0200
Message-ID: <20231214072954.3963-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 8c91ca76f44804868d12aed20ebdbc2f89aa7d60.

The offending patch introduces memory leak when there is no error, the
memory allocated for the temporary storage is not freed up.

As I have commented, the original code was correct and cleaner to
follow but it was not obvious from the patch that it will introduce
regression.

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

