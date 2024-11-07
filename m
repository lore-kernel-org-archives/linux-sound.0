Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A02101A3
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986128; cv=none; b=mscREBxjfTuaDm1LU+km3GPWKqOmX7LqctI+6jjY625Kmh0QvMFg++sn/qQBqOA1uKf99ZIMJMA7SBAlkP0/OTCJOq/OdI/30pV4CfC6V/OtUwfl85YxfWiP8zNyiMZEojuBLI+Jc+TDG7RD3KwyP6pcbQthfs10UrWv8JOLW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986128; c=relaxed/simple;
	bh=bByWK0N+I6i2tcnkd0aoEAU6Nq9794VWFR4oPU6kGGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzBrkEBl2sIlfWq8eQCp+MQ45SHqN7r2r81vMBlVMhIhZdIMfkfze/TdASObJcG0H1zzZMtKCD4Jl5VBhRGf0wl3fwjwDP+d3BN4BqjI28U/lWraZWTgY2lSLuvZAMZXPwwU7M4QTNMEJSkQmEXNCY9wTFwAaGTqJyzSuACrJMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq8GYgDa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq8GYgDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730986127; x=1762522127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bByWK0N+I6i2tcnkd0aoEAU6Nq9794VWFR4oPU6kGGM=;
  b=gq8GYgDal5EyiqygljO3AURdILg2C8nhFc54R7kJi7zUfg7YsRvEUw2u
   FH4k8R3WP9J3cm4qcfpKKZgNv0RusuxG7N64IeRskgENuLQmDBrjja1/I
   aGU5lTFPKUN+Zh44Mf76LQtCWaGEdMm2GwBPp/cgdqytfURHj1BmdR4qN
   yw465Cj50eDJmKBS34etbqzqGP3OqUEiEZlrl9R9iLTx+pUxlcoISV9HJ
   no1Ku7ZvutDtao7O0+NSbYWx04u8O9xAFLX7fQ7xMx4I6IUT66M+f7FCX
   eTxbszXPPEipasMvP8ZE9R/JUB75b2VjgP3UejOVxRcvTNOc/tkIbk/PR
   w==;
X-CSE-ConnectionGUID: IfXi4Lc2S7mdHg3XVQGbWQ==
X-CSE-MsgGUID: pIhsqc/gSWyCpZTUeE8unw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41931768"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41931768"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:28:47 -0800
X-CSE-ConnectionGUID: DFsqfSAHSYGJTihNkMUC6A==
X-CSE-MsgGUID: uyrnqr4USi2swGmsgnlgwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="85070278"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:28:44 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH] ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits
Date: Thu,  7 Nov 2024 15:28:40 +0200
Message-ID: <20241107132840.17386-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Write the size of the optional payload of SOF_IPC4_MOD_INIT_INSTANCE
message to extension param_size-bits.

The previous IPC4 version does not set these bits that should indicate
the size of the optional payload (struct sof_ipc4_probe_cfg). The old
firmware side component code works well without these bits, but when
the probes are converted to use the generic module API, this does not
work anymore.

Fixes: f5623593060f ("ASoC: SOF: IPC4: probes: Implement IPC4 ops for probes client device")
Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client-probes-ipc4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index 796eac0a2e74..603aed222480 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -125,6 +125,7 @@ static int ipc4_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
 	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
 	msg.extension = SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(INVALID_PIPELINE_ID);
 	msg.extension |= SOF_IPC4_MOD_EXT_CORE_ID(0);
+	msg.extension |= SOF_IPC4_MOD_EXT_PARAM_SIZE(sizeof(cfg) / sizeof(uint32_t));
 
 	msg.data_size = sizeof(cfg);
 	msg.data_ptr = &cfg;
-- 
2.47.0

