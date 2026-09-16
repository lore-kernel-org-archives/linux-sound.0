Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7AE493D2D
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560234; cv=none; b=CuyZDEGm3IVp2Gkd4m70zq0OQw7JalHc6uJmLYrEmWL0oxdpqZgImQPz3vLkv88L3zQoMRSSClB4juFT3ZbVhp00JFqR03x/59ZgYlzPis58U9iZ0vbhUSJgqWC6/fzQHDgXlieHxDJMAY/CnqrBPHCJKR8xiG5VEHTcpUn6jwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560234; c=relaxed/simple;
	bh=sl1wjSeZ4tWMtIsKbkuVNDS/IGCWT0sOgECjhh26zWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dd1cIESfja0uZglevnq/eUOm8Admx9M4LI5XIyUg1QQT5UxS0pClQt1cTsRDqPnW9/FwJKd/jNMXtvJRNt8z6/RDnip+IrfsZ59nNgeosIv5p4TkpeEvELB7DunzoSEWRpAOn0ubqUylRNlmUKx2lUFa1+EAvA4ZIg2OaHAfFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCw8BTaA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCw8BTaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560227; x=1821096227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sl1wjSeZ4tWMtIsKbkuVNDS/IGCWT0sOgECjhh26zWk=;
  b=OCw8BTaAWmqk5fkSIbhkHZmdG9SI1RlHj8zPo20G4KS5JdRbruMOKMOR
   qSfFlOxuITo4m8icQmL7OIiBfyKxgdbhpgow75dKqWrltp/gSqoSHHbyx
   joR+NtRreL8qIIJMKz0RYc/kIx3AgmzDaqwL9M3OA67V0dJ+aroNv6+J7
   CvMk+VdAFNAd3FBmvCoi3vbBdFzvIu0eV+r78aMjdio7iSO8s3/OLB87A
   FAYxGP4qW8wOH6KQF1AX6qTKVFAkoFvpTHlrfks7eSuYSJXYCFCpVbPRf
   48EbNyYJpXwH5xCjJW1vRaNg7GxLO1Aa3yFxmQjayhlgR8B3quMdnjUus
   Q==;
X-CSE-ConnectionGUID: 3mAJpcZERaWscZxYtHZzqQ==
X-CSE-MsgGUID: Zp8GwxCiRWixw9LxViVU7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496327"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:39 -0700
X-CSE-ConnectionGUID: Bz9QldfMTCG6W84NALDcRg==
X-CSE-MsgGUID: TiILH0GnRseZZqyRbu7fHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293382"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:36 -0700
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
Subject: [PATCH v4 09/26] ASoC: SOF: sof-audio: Fix the pipeline_list population
Date: Wed, 16 Sep 2026 15:03:03 +0300
Message-ID: <20260916120320.18318-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two issues with the way sof_set_up_widgets_in_path() adds a pipeline to
the list of pipelines to be triggered:

The count is incremented before the array entry is written, so the last
entry of the list is NULL for a short window. A concurrent user of the
list, like sof_ipc4_trigger_pipelines(), can see the incremented count
with the entry still unset.

A widget which is not part of a pipeline has no spipe, but it is still
added to the list, resulting in a NULL entry within the count.

Store the entry before incrementing the count and skip the widgets
without a pipeline.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d244e90a734b..850eb2bc2b44 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -629,6 +629,10 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 		if (!pipeline_list->pipelines)
 			goto sink_setup;
 
+		/* a widget which is not part of a pipeline has nothing to trigger */
+		if (!swidget->spipe)
+			goto sink_setup;
+
 		/*
 		 * Add the widget's pipe_widget to the list of pipelines to be triggered if not
 		 * already in the list. This will result in the pipelines getting added in the
@@ -641,8 +645,8 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 		}
 
 		if (i == pipeline_list->count) {
-			pipeline_list->count++;
 			pipeline_list->pipelines[i] = swidget->spipe;
+			pipeline_list->count++;
 		}
 	}
 
-- 
2.55.0

