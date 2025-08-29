Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5FB286D77
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756456113; cv=none; b=L3tPFJiNAOCfyU0cVdxgHKoxJFFLGdqtRPlDeQ8Gdb+1O2+/0bakwMm4h1jr6IkyElRM95YeU+y+tqQ4ivqe4ef+41/PTkEMpSD70bZbFVDXAujii3QA9HFqZLj4V1L0lQ/2FwkzoPUnzS5HbJH/1LZE3xhKhOqJovYn5o8I+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756456113; c=relaxed/simple;
	bh=aQ0c1Z695edSh6jJnZpv8qgr6mF/22UNXe4bmRifxVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a10cXNYfi8hNgYJXbfPJMDBUyT1G0tM8fo08thFbuh0SQtaddUCpDME1CvJkLIKZ3JSJ8TVrTXygomUdtK69CcQ0NcX0MXAIH5Pfn6kZ5lr5oupYakBEqZMu97e47FPkWiLGXewBjf85x7KtAQglFXhaf00y3/cU2S5GWb3Pe8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoK1I5fK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoK1I5fK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756456113; x=1787992113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aQ0c1Z695edSh6jJnZpv8qgr6mF/22UNXe4bmRifxVM=;
  b=UoK1I5fKlzxtjkPe3y+PNWnH2mfWjPdlVLwEqYAkYIdqz5YB7sYSh726
   duAlXljnvKJCvnlicuN1w/KTaGL/rImRyBCG4tFUgMMOsU2Yp20AJtxFO
   V4e5udniCnf4r9x4p8v5wY/WRTe2AB2qrIrMmUaS5CyFYPW6ian9EK0U7
   B+SdLohKQ6qj06gukHRSo59NuGMjmAooR4RT0Zo0z0MHfDwTEZFkWDYkP
   HLz1df7RHhsWxPEwzHkNeP2o1kEcwwth5gH/m5JhUPJsC6iItE40Zu8MH
   Uuss0tKEHDTYeLyyBNcMlCuaVeuHASOWnHBY4cNF6063vSY9qdWpbCKHp
   g==;
X-CSE-ConnectionGUID: WRUqKM1cTyKozYiGxZLb0Q==
X-CSE-MsgGUID: Si4DCQcBTzOvex7TlvbE2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61373556"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61373556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:28:32 -0700
X-CSE-ConnectionGUID: VSsmRu2KReajqgZa5lK1cw==
X-CSE-MsgGUID: w5+IH/qmQXa7ZnGWT69ZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170494494"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:28:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 1/2] ASoC: SOF: Intel: split codec mask detect and programming UNSOL
Date: Fri, 29 Aug 2025 11:29:07 +0300
Message-ID: <20250829082908.2693-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
References: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We only need to detect codec mask in probe, but need to program UNSOL
in probe and resume. We will detect codec mask and program UNSOL
separately in the follow up commit.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 3 ---
 sound/soc/sof/intel/hda-ctrl.c  | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 2f9925830d1d..37674ea452d6 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -260,9 +260,6 @@ void hda_codec_detect_mask(struct snd_sof_dev *sdev)
 	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
 		return;
 
-	/* Accept unsolicited responses */
-	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
-
 	/* detect codecs */
 	if (!bus->codec_mask) {
 		bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 4f34fd919a00..f43eb2a21f48 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -220,6 +220,9 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	}
 	usleep_range(1000, 1200);
 
+	/* Accept unsolicited responses */
+	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
+
 	hda_codec_detect_mask(sdev);
 
 	/* clear stream status */
-- 
2.50.1

