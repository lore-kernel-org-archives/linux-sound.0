Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B424A11
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819190; cv=none; b=cc6V7Wz+yBmRt5ULGHeFh8NUjQEEsdVP7JFNVGozCgpxiLlFLEfwBsOJhVManToBp8cVHkpAp9W0+fsNKVvDTFsqAivHcYDNrj3UaLxBgPVpqfAo2XMEZif+dzTQ8Ean0Xa5QJq87qUJk+W+fqNt8HcWofWDv3fn7lz73rIi5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819190; c=relaxed/simple;
	bh=r3LW1SeSq3s+f24iZYpQJsA6chFr2xZzNQlDYKJ3dfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUiRDO7TJ3d48PZotA3HMz8E3aDK7b+P07P1nYqWvApEq5p0+bA3xNG92Q0fKrR6t6LJ4nEZJITTVqUl59XrcqWnVFqEsh7bLoQuQk4AStAiwoMS0uAXGbeJOoGIFMMuv7zVg+ZlHMcXr6sRFrV67miW7dFNH13cxb6zVahm5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3mhQnLI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3mhQnLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819189; x=1739355189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3LW1SeSq3s+f24iZYpQJsA6chFr2xZzNQlDYKJ3dfs=;
  b=m3mhQnLIBzTKCV2/0hM2NoyztnZFRWEVJf+YaeqM633vlpg/nkCSLFhb
   zwaWoRwsUUtqIQbDLvh6q84JPNF6wp11EWXh1LBcAqvuMnNOMwvB7RUG4
   psYsHgFzrE1HcgVqEduFGLH9yDqiBxBMSf9sCKQ7rgeO0yuV2f+Uzizas
   Al1HcX4aCIwNNj1id90z1lqif3bvGkCyqvIgDyVeYin0GMPjIjWN89oJb
   2mn+WntD9CDDZr0eZMRmTrMyfLyTMTjzNxtSybASLVvFjgst6xfLkNF6W
   rigOCRJj7IHlwYg5Tzrgbi2FeaLNTt7riB+p34UPjC3/eLIKRWCq45UOe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260191"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498099"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:06 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 12/15] ASoC: SOF: Intel: hda-dai-ops: use dai_type
Date: Tue, 13 Feb 2024 12:12:44 +0200
Message-ID: <20240213101247.28887-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Now that we have the dai_type we can remove any dependencies on
copiers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index f58539d2f937..5a5ef93858be 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -633,12 +633,11 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 	{
 		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
-		struct sof_ipc4_copier *ipc4_copier = sdai->private;
 		const struct sof_intel_dsp_desc *chip;
 
 		chip = get_chip_info(sdev->pdata);
 
-		switch (ipc4_copier->dai_type) {
+		switch (sdai->type) {
 		case SOF_DAI_INTEL_HDA:
 			if (pipeline->use_chain_dma)
 				return &hda_ipc4_chain_dma_ops;
-- 
2.43.0

