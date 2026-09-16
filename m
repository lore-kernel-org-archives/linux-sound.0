Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F407F4EC643
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560276; cv=none; b=TQBt3Eixte/xsUy+JcvpaG1/1IdIfz/WcFMQmqK1gfAOLHEo1jbewQyFMyUi/taAVULfkPS5W9s7Bh+s02CNNMtSUjJUWtJm1awS/JXmkYuW+7tQfT9hYwVTDRuj9asF/oAKbFoeL4Qw9hp9KvZwJF6Djfpmopk72KXFLA3gwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560276; c=relaxed/simple;
	bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/5gZqo8E1ukjUVJf1Ay3E/KoBDMUo45on7Ry5xbOwOeyGaoK2HZCcsXYkRTDoUJY/HkKZI0um0ugIkmK61VH2nBrRxcUy2G/8VQz3MOXuyONWXfvKMiBUuU7dqIuU6hYL8lCYtvTkiPSsF360IzLHZDWQ4B/woz3R7hjmGlDS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhM6telO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhM6telO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560270; x=1821096270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
  b=IhM6telOqHSmJ2npThR5UtIl+XfjfVi7MDqzujT+LlaS3nqJyL1HpO2I
   Gb+NPis/ks8RrwkL3zhaLAoYyG3DHNyxf8dijMW0a9654Jp0cAZLeBHta
   oLDV04Nr9dzWvidfxyCSxDdd4FKz8sQqI6WvTH93ocKjNLkPaqx8EF7lk
   tzOdnwbx8MyL3qV3b/sBO3xUiybTPRzRXCNPISqi6n9RykpeRvPBh21sn
   kOR2jv17xX3ZkX9r2HmQE8Pip7+kzoOUQmDbyqVhelL9jxok8kIbyJGTd
   yLkwQy6+K386Emy33Szej2/uFhphEbZNMr+rux/O1sW261sWnE65R7pc3
   Q==;
X-CSE-ConnectionGUID: y3NkRNExSUCfgQzhKiP+yw==
X-CSE-MsgGUID: hrWLrkkSQLymyHvSgWvhlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496567"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:23 -0700
X-CSE-ConnectionGUID: Qe7MYLW6T62fL3g9u9XMDQ==
X-CSE-MsgGUID: Bllg9RY6T1KH2d8upiOtiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273294023"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:21 -0700
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
Subject: [PATCH v4 24/26] ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
Date: Wed, 16 Sep 2026 15:03:18 +0300
Message-ID: <20260916120320.18318-25-peter.ujfalusi@linux.intel.com>
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

There is no need to select IPC3 and IPC4 along with INTEL_CNL as INTEL_CNL
selects both.

Similarly, INTEL_MTL selects IPC4, so there is no need to do that for LNL,
PTL and NVL.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/Kconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 915abbef398d..840d5a36b958 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -186,8 +186,6 @@ config SND_SOC_SOF_INTEL_ICL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_CNL
 
 config SND_SOC_SOF_ICELAKE
@@ -214,8 +212,6 @@ config SND_SOC_SOF_INTEL_TGL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_CNL
 
 config SND_SOC_SOF_TIGERLAKE
@@ -268,7 +264,6 @@ config SND_SOC_SOF_INTEL_LNL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_MTL
 
 config SND_SOC_SOF_LUNARLAKE
@@ -285,7 +280,6 @@ config SND_SOC_SOF_INTEL_PTL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_LNL
 
 config SND_SOC_SOF_PANTHERLAKE
@@ -302,7 +296,6 @@ config SND_SOC_SOF_INTEL_NVL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_PTL
 
 config SND_SOC_SOF_NOVALAKE
-- 
2.55.0

