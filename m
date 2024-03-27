Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F7130E3C
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556680; cv=none; b=uPr2gMyd9PAqGWvXYmDPZQYbvKjm9FbZhGwyu33MpKVE/Jg+ART4lQ+x8fTVoN+QnFLWxexesdiuGp38V/Jahudt8NtsH5g/+9m/FuHdBfFzKeBXHApcJtF98UpPOGDuIkynacg61dXwEfum57zaxoMF/ETv7Ssi4vNREfOVyOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556680; c=relaxed/simple;
	bh=yo1S20Nb/qbRVE550kkoA7HJaQ0Sj7F5P9mjlosdfF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qK4vNqxF7R9PoHdiZdCqIOVLURL7cEn19ndWt5N+1ynpIBkIjbzSW5UX5/79EMmS5W10hKqiY5fDUjUENCv+jMTek7ZDI/OS2CJq3jCQPmsQ5IW9dStVR2kufTnAhoYIvn4IBt/fHQEwz5rxDgvYzi2dSaUsgpKinRUxr4CiNcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Trk6tGXP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Trk6tGXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556678; x=1743092678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yo1S20Nb/qbRVE550kkoA7HJaQ0Sj7F5P9mjlosdfF0=;
  b=Trk6tGXPZlYihfMrOY/BlEU8tPcwQignk+VDAsl3aJNCPSgxwAy/iEy3
   QHRYD5Nzib3MXbYs77Ryaai0Al0rZMASnuLmxV/uBGnqSFIqbESRdHlhl
   /plEF/7FxwsFwH+IRo5eyD2NShe67QEawx8il99PMKsRtSTUQR3P1rfE5
   ZI+k4wQ7p1gcXmhG5Ljtt0OnKXx+yPwL1MOQUoIf3sR26Wm9JT5/bm+xL
   DQIC5cA0xNaeOR3CSeJSAdlQxlleFluSl7Ewu2Fw2Mr67GPaAs2d8nKwA
   lHKeadvcSsyKfkrLYVSwTtP9JHe5emCB0up0AkcQGxkOKIlOTLW/tt/4F
   w==;
X-CSE-ConnectionGUID: 5WKCbbs/QbG0hYg7Cq9r0g==
X-CSE-MsgGUID: oxVt3vvmSreu8J5TcbmBug==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221566"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821337"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/18] ASoC: Intel: sof_cs42l42: board id cleanup for adl boards
Date: Wed, 27 Mar 2024 11:24:05 -0500
Message-Id: <20240327162408.63953-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Introduce "adl_cs42l42_def" for adl boards which implement headphone
codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 2 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 40ecfeaa1d26..8a2833a0e3c5 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -263,7 +263,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_AMP(1)),
 	},
 	{
-		.name = "adl_mx98360a_cs4242",
+		.name = "adl_cs42l42_def",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
 					SOF_NUM_IDISP_HDMI(4) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 9ac9310dd2be..7977a6fb9a5c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -497,7 +497,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10134242",
-		.drv_name = "adl_mx98360a_cs4242",
+		.drv_name = "adl_cs42l42_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",
-- 
2.40.1

