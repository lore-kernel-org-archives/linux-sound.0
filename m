Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42AC2DC76D
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805369; cv=none; b=p4lIqFdTvdVRt6C8qmfbmKec6mdVsKNCYHY9Q7ItJgzX2BYiClr0EgrjS+FpAHZN5XVE0CTCmsKcKkCQX61yWDZKYqxyIzGsvEDQFQL37PrDLHwbNG19q2jEV7/xg3uqdCjmsfxFoOc3gQpVOKyOvWBddxrluv3xeuld9jwyBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805369; c=relaxed/simple;
	bh=R6Ro6vWxJrXZy5eLqFHzHVpo9/V5Tbm62+tN9kyhsgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfqCBeXOZsUE14JsbPIltZNsil0V75PFy4VZaumGlUx7u1Eaa0cBiL3e82dnCFdjMfNvIpFWYwY1t/+mF2GmKVbtpCaWDWUNPsb0NQb2FCmdiC0m5fdM9M2/PMEWU3UR1rv2EDgfLqHo+Oz6P04FxAZSAwCsq029hdkzETC1Cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hg++Vq8T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hg++Vq8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805367; x=1797341367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6Ro6vWxJrXZy5eLqFHzHVpo9/V5Tbm62+tN9kyhsgQ=;
  b=Hg++Vq8TFZfWSW7xOFzwoDM6bFyhw8kqBuF1sWiRPaYSVUuK2p+2R1RP
   r8w8D4zeYywwShqHhbE3Ki2zqiDIAdBxnOCKJFMWQRQQq4tIGJ3x1fzte
   /xg8ow+Up/QX/RC0iwkF/k0nofNAKScfH9BY59EPjAxfHLMZIzuVLhrnv
   wqtgdKdBYQ/z6KZeRmqhQnWZWjapwe+0iySYlkE7pYE8jcuxtQ+Fd96QI
   aSwmkIgi64/PRVdnVpw43dmhqsJqaRsK8m9qYRiAh13NLXFIwtLSSjQQs
   osq8SMPfjgPIe7u0K7mZiycB2XnYxHhH7vFKQ1zRks4sKVY0pFONhV10f
   w==;
X-CSE-ConnectionGUID: jZvS5tkyQLWJMsbM6RSyZw==
X-CSE-MsgGUID: y3v4ZZGHQgueXf+zi+fvdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179462"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:27 -0800
X-CSE-ConnectionGUID: i3N0mg3RQ4OxtP0TfbXROA==
X-CSE-MsgGUID: ffixI6XvTYSr/5l3iAglTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228376968"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/8] ASoC: SOF: ipc4-loader: Remove redundant rpm resume_and_get from load_library
Date: Mon, 15 Dec 2025 15:29:39 +0200
Message-ID: <20251215132946.2155-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
References: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial library loading is happening during topology loading, which is
already protected with pm_runtime_resume_and_get() via pcm.c

The redundant rpm code can be dropped from sof_ipc4_load_library()

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-loader.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index b0d293f62d1c..07a78cb3c25c 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -175,7 +175,7 @@ static int sof_ipc4_load_library(struct snd_sof_dev *sdev, unsigned long lib_id,
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_fw_library *fw_lib;
 	ssize_t payload_offset;
-	int ret, i, err;
+	int ret, i;
 
 	if (!ipc4_data->load_library) {
 		dev_err(sdev->dev, "Library loading is not supported on this platform\n");
@@ -223,24 +223,7 @@ static int sof_ipc4_load_library(struct snd_sof_dev *sdev, unsigned long lib_id,
 	for (i = 0; i < fw_lib->num_modules; i++)
 		fw_lib->modules[i].man4_module_entry.id |= (lib_id << SOF_IPC4_MOD_LIB_ID_SHIFT);
 
-	/*
-	 * Make sure that the DSP is booted and stays up while attempting the
-	 * loading the library for the first time
-	 */
-	ret = pm_runtime_resume_and_get(sdev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		dev_err_ratelimited(sdev->dev, "%s: pm_runtime resume failed: %d\n",
-				    __func__, ret);
-		goto release;
-	}
-
 	ret = ipc4_data->load_library(sdev, fw_lib, false);
-
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev, "%s: pm_runtime idle failed: %d\n",
-				    __func__, err);
-
 	if (ret)
 		goto release;
 
-- 
2.52.0

