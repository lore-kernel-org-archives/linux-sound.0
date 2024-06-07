Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E215278C
	for <linux-sound@vger.kernel.org>; Fri,  7 Jun 2024 05:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739997; cv=none; b=AA78D4A3fgOzodhjfczTlxuNfZ50wTOsxGP2/yC3W3XYcDgUaGy2SmX5iF7R25FjCj1nDxcciXsuUtB+Hh+axWwyzVIVa0pUNpDgMN15T3nqJTiUrf1Bz+H4e9Qj4BCW69ysufpvY/Gr80+Gyk/71pOSC1UQRSu/KFPd1PECqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739997; c=relaxed/simple;
	bh=1N1jNS6oPi4+IKGQxaSb1DikVwGreTJGkQaXqfyCFGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmkqE2VoKEp/zXO3h1LWlgcSlBIbh16k/l4YcM7MQ9AALTeMqmVA+3/w/qPbNVa2GuyHvOf/xi1wMPutIw4KD2BVHYFi2menf4bCPzhea7Wa93uP8TYmX66rlC9UcJjJI3UQVkA2x3tSSMqSaTd3nJm/SdK0p99ULC7ia/CM6Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYEZfi79; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYEZfi79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717739995; x=1749275995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1N1jNS6oPi4+IKGQxaSb1DikVwGreTJGkQaXqfyCFGI=;
  b=VYEZfi79/t8+TLAIMw8v/ybQd7DWqnItvTsYSCjyp38xnVPRrG9oy3/q
   ynm2c1LX7wPO2QpVIy3Z5KZubmCk3vMRYZrkkBfk8wbHYFcvaGPB8j+ZX
   KSph7F5HoKmFu4rFocOT+IVZQQNOl5sSrkComAep/tZ9qBiZLI5PPmZ4J
   kYDDIGwyhT7WfPl/0qY7JvvgJKBy3WmEX5QYkK9J8gtkupPxy7YFqZG+o
   nkB0myYm2xmMkUb/70hodZoUccT0HXyA1IyHXXO2H2Qru7pdN1DG9Tlrd
   3NYIgSZqSp0fOGkUeanZRg+mSNCKEphYsPfaBXsqm2BkfdtvUXF+yTM58
   Q==;
X-CSE-ConnectionGUID: U32OP+kXQR6JclTdIuvV3Q==
X-CSE-MsgGUID: OmQdJdNIRge8bayp8+SB6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14625307"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14625307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 22:59:55 -0700
X-CSE-ConnectionGUID: Hv/Tq7iNRTW9ZyXBoUTrfg==
X-CSE-MsgGUID: y5TNTcf7SZ69nClJ0/js6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38277036"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.222])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 22:59:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	cezary.rojewski@intel.com,
	broonie@kernel.org
Subject: [PATCH] ALSA/hda: intel-dsp-config: Document AVS as dsp_driver option
Date: Fri,  7 Jun 2024 09:00:21 +0300
Message-ID: <20240607060021.11503-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dsp_driver=4 will force the AVS driver stack to be used, it is better to
docuement this.

Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 537863447358..478d2b50c571 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -18,7 +18,7 @@
 static int dsp_driver;
 
 module_param(dsp_driver, int, 0444);
-MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
+MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");
 
 #define FLAG_SST			BIT(0)
 #define FLAG_SOF			BIT(1)
-- 
2.45.2

