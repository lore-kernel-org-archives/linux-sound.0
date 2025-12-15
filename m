Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F33B20E03F
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804045; cv=none; b=a4ouB0G5lEMFsO40WrhYE97ZE9J+CykxPULF+nNBnZJn6IT2tYly0so/u8asbMA66ZS24U7TndUiC/3EHRaqgh5rjuFRqlbo4GVIp2T970yJVPTyQ0uzwh6FedD0j0IRaiBuN9MzYhZYyq5xd9VSvhg4S8vrLCZxvXWrAJOA09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804045; c=relaxed/simple;
	bh=5gL0XCKNWre9uLxr3/MXMSEmAR2Cc6Fx34iW29rCQ/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eROiVMerSbv1dqZYuALrGeq6OUmjusIzq17BmGgzxdMrrjNC6kh//dYBrxYV0dS4NPqhg3Xhn7vbkMi9K+ABk7najOl1e7CIUJ93ibtf/FaRhQT/SIp/ZI4BAROXr+1o3chl0bI8W8G0siQhkUy15qSrYGRDVLRxZc355x70J3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAUpcUfq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAUpcUfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765804044; x=1797340044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5gL0XCKNWre9uLxr3/MXMSEmAR2Cc6Fx34iW29rCQ/A=;
  b=AAUpcUfqXenHogMKe9j9RiuK2hHB0n7lZ4v2juxhLt4QlxKmOe41d7y9
   vNa7AqB3neq7XLGar2DhtRWX4AqD0Eji/A/cNnO+gdDJXkWaGefqsL5YP
   Jop2jvmLbCIkrfIZZroTiveJwDxyPLUagJNg690CisfKtal1RRrEAHKGl
   AvFRfkyXWm6m804XFbyzkzh4erRhK6FRM7HHMe1tM88t0n8Fn1UNd/ZaE
   f/NUT5XQ6Wakg0R3SuZEPX1JgcLvYHSjfeJ7zNS6kym4wI7yTdH9NDUln
   v453TcGJ5ODPdgt4+yMmsFxrVEcuuhiEAVEPRDK0Q6KB4ctkCGjbqwL6L
   Q==;
X-CSE-ConnectionGUID: MERd92zITM2SPULsWHAZkg==
X-CSE-MsgGUID: IvGZO+OOQt2/j5Q1uHfESA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66691405"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66691405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:21 -0800
X-CSE-ConnectionGUID: ZTwF4mzMRPSAK5SnfHfHtQ==
X-CSE-MsgGUID: q9FiepJXR8WqmRfpqFFc1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="196803338"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: topology: Add context when sink or source widget is missing
Date: Mon, 15 Dec 2025 15:07:41 +0200
Message-ID: <20251215130741.31106-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some context to the error prints when sink or source widget is not
found by printing the name of the other side of the connection.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c1083ea4624a..6b09b8cdf1cb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2106,8 +2106,8 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	/* source component */
 	source_swidget = snd_sof_find_swidget(scomp, (char *)route->source);
 	if (!source_swidget) {
-		dev_err(scomp->dev, "error: source %s not found\n",
-			route->source);
+		dev_err(scomp->dev, "source %s for sink %s is not found\n",
+			route->source, route->sink);
 		ret = -EINVAL;
 		goto err;
 	}
@@ -2125,8 +2125,8 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	/* sink component */
 	sink_swidget = snd_sof_find_swidget(scomp, (char *)route->sink);
 	if (!sink_swidget) {
-		dev_err(scomp->dev, "error: sink %s not found\n",
-			route->sink);
+		dev_err(scomp->dev, "sink %s for source %s is not found\n",
+			route->sink, route->source);
 		ret = -EINVAL;
 		goto err;
 	}
-- 
2.52.0

