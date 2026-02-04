Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251738B7D0
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193138; cv=none; b=nM5mCBAK6oqUhOBtk/sPX5a/OtvFEcgIdw+HeIcIlN8YOs8PShLX7NL2vxV9NM8BwZ98is0NjRjhE9pkN/uAF0rXcVRt8oypz1PnFgr5e+Amedcyh4fmHs5LRn17XGS4z/drlVGep5Uh4y1V7iSyNHU0IxEUMYqJuSJQFiJ/sFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193138; c=relaxed/simple;
	bh=VYbgNUmdxp2jtIW63GWSZN+8mAX7CYqjVZ/uPrTE8cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRTx5R5GC1uGQgKx+HDV892lmmvLkZZVW0BMa0nEHHGB1PTN6oXtUsltNGraF/kl9PcHL3ON8u9r1VO4Fxn7aDOEctusdSkYxV6qHsBKXaK+h5dwB/gL6diuUbHLMFiQOx/QlIWqCRcJg6Q6LwZqpnboL4hcbBaJkApyA4hWCVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjRBVqIN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjRBVqIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193139; x=1801729139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VYbgNUmdxp2jtIW63GWSZN+8mAX7CYqjVZ/uPrTE8cM=;
  b=jjRBVqINviYXNBnNLHbAqixeWHZMyB4b8ve5Xft1rcG/EL5TbQgqmbsJ
   RFS8yaHEpR+NDy9KdThIvxsgHM0vpxcyG0ZOFqZocU6Yh07p+No8siSwn
   dPBriQSfIatFpICM4Ux9RBMH4eaGfTQVW9f1S9to6G7bX0LkSYvwwwf6C
   TSjg/v9YDiVvSMjDaESRWhNRci2daUe8QFlVwH/zQqWsMz8pwZ2Ce3sfm
   RUptpmrcU/pwQxziMPTIr35t61RBocPUycHjR9YKV/pfarvGnpmkJw/82
   EJxyfCsGvm7N/t2BVNTav5LNK854mHExwyark/gx7PoLmTu73sgU91cXM
   Q==;
X-CSE-ConnectionGUID: 8VwrGCnQSemi/Q4/zFw07Q==
X-CSE-MsgGUID: Joj+DJ9wRbqRePVMe5v7VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028525"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028525"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:22 -0800
X-CSE-ConnectionGUID: 69nwReZkSp6uqSiPcgHxqw==
X-CSE-MsgGUID: joI+POTkR4iXBM+ktayaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893365"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 09/10] ASoC: SOF: Intel: hda: Fix NULL pointer dereference
Date: Wed,  4 Feb 2026 10:18:32 +0200
Message-ID: <20260204081833.16630-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

If there's a mismatch between the DAI links in the machine driver and
the topology, it is possible that the playback/capture widget is not
set, especially in the case of loopback capture for echo reference
where we use the dummy DAI link. Return the error when the widget is not
set to avoid a null pointer dereference like below when the topology is
broken.

RIP: 0010:hda_dai_get_ops.isra.0+0x14/0xa0 [snd_sof_intel_hda_common]

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Mateusz Redzynia <mateuszx.redzynia@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 883d0d3bae9e..3c742d535133 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -70,12 +70,22 @@ static const struct hda_dai_widget_dma_ops *
 hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
-	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_sof_widget *swidget;
 	struct snd_sof_dev *sdev;
 	struct snd_sof_dai *sdai;
 
-	sdev = widget_to_sdev(w);
+	/*
+	 * this is unlikely if the topology and the machine driver DAI links match.
+	 * But if there's a missing DAI link in topology, this will prevent a NULL pointer
+	 * dereference later on.
+	 */
+	if (!w) {
+		dev_err(cpu_dai->dev, "%s: widget is NULL\n", __func__);
+		return NULL;
+	}
 
+	sdev = widget_to_sdev(w);
+	swidget = w->dobj.private;
 	if (!swidget) {
 		dev_err(sdev->dev, "%s: swidget is NULL\n", __func__);
 		return NULL;
-- 
2.52.0

