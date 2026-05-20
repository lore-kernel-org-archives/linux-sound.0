Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF42BE03B
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285309; cv=none; b=VgdjPZYxHbRzmFIUNbWe9QopCmBWTxeZlj+PXZ/VZ7Dliy53vKJcErgMOM2ahvuKay10ntKr5q84P5IFhTngLZXgsVbHuizkMhwD/O3rtoDbgZ0a5BWGPvBAYYYOSEcNoEDj4srRLzDJV5VK1gsm88P/GXezd7v+597lHXftv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285309; c=relaxed/simple;
	bh=C9jP+UclNcMuKZUB6LjzKfMzTwWP7TPHdWlyfnxjk5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFoHzHh21fcxA+D1OAPWkwOgO4MuvRqGJa4Vkyl8QRgiGfxtC51HdCuaNZ6ACi4btYS9idUuC5SF4xRawbCBMJDrPSJcruDbqnTJTmH4qiCjKF1c0BOcSVbVqFWP2GcedlLbn6g8HZSq9SRCwANu9HKG+I8BzNjzRNhYUEMSFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjTgHIno; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjTgHIno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779285309; x=1810821309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C9jP+UclNcMuKZUB6LjzKfMzTwWP7TPHdWlyfnxjk5c=;
  b=QjTgHInoYsEntrPNACJNVFg2OdjeoWNwi0RZinbTmrkG8KMqjmoinl4+
   sxVR1tdkbTZrtffVclJYN4wL68+rC9cm1ySK+LNAJ2WUArJhXDo1YXqyo
   aWrtVXngYums+fvu8or7f5a3kcZYdbW/gwUOnpUtwyfIKJ1Nuogt+nUIl
   uQoMWWmVmmuhfSjAMIWIKA+o8b8Alt9fJIh9e4NWD67Yoeg0GpylU9YAb
   rN8mNIJSvLUgN6kC3ZJkf8nlk0NoZK5o8d86cWX3GADt5rO0DVNl/BrIy
   jjFgz1WuJawnI+shKp4Haa4yMORV3jjzsGNzQx0r0gZaqvjIXLQ+GnYx9
   g==;
X-CSE-ConnectionGUID: 6Du1gfJVSVqxO/4jC73kXQ==
X-CSE-MsgGUID: YSyAAeOXQ3mXd6JyguKUvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83800398"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="83800398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:55:09 -0700
X-CSE-ConnectionGUID: FWbbKuMKRS6BRTEJ1yCS3g==
X-CSE-MsgGUID: JahAmGBSTf+tyKFr4Mz1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235757681"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:55:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: Handle SOF_DBG_DISABLE_MULTICORE flag for pipelines
Date: Wed, 20 May 2026 16:55:13 +0300
Message-ID: <20260520135514.32720-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
References: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SOF_DBG_DISABLE_MULTICORE is handled for swidgets in topology.c but the
pipeline's core is not changed to primary core if the flag is set.

Check the flag and if it is set, force the pipeline core to primary core.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 76812d8fb567..94851ad809fc 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -942,6 +942,9 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
+		pipeline->core_id = SOF_DSP_PRIMARY_CORE;
+
 	swidget->core = pipeline->core_id;
 	spipe->core_mask |= BIT(pipeline->core_id);
 	if (pipeline->direction_valid) {
-- 
2.54.0

