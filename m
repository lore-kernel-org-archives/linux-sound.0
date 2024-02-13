Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F217994
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811456; cv=none; b=c49XbHbTPETnCceNzCsdF7lapaEBs9K9oW7DPoMinNLznLYubd0ZCwADPenxvbstlekAkdoKFTydjex/hrGOMGTMLMDAiih5TTvK/IdMvs2aXwcisDBax+M3RO/HRO0ErT4tpkcxDiq+LnlN83bAjHxFXaADt0g37TKuEkSWocY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811456; c=relaxed/simple;
	bh=SnkuqvvDOmXFV3WjoSc7ZeZ/+yVwyovmEpJLtOc+Wxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipKRW6tXOP2lVSProcsWCdOxA2y69xZSY+Dh3wIkPJTd2ycgh0kmKU9ict1uljiRhTnDElVTlXo9KN0pf/GGcJOVMDdia8BYDtzVRCrhFg0gvK/B4AddctQWzxGdU+CvX0vQYI8IDhACHzb1m7aqzmEYiUlZn+Xx6M7JKSY9yl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6UDvKNN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6UDvKNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707811455; x=1739347455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SnkuqvvDOmXFV3WjoSc7ZeZ/+yVwyovmEpJLtOc+Wxg=;
  b=C6UDvKNN63GJ3v88RWGpzGjp7a9Xh/oc5/s/eTsfk7yMdqOqR8Ue1qNn
   VxhOQGeh+4OcY4vuh3h+jDwI2ixdzoZk9lUi2LV8fZMTRWyAPjKsG+A0Z
   rqR5SsNADxS15o0DZQplNOPu0Em7aXpDnRlLJKcTApyZanokDIIgxYGEx
   IuyWiocFq+GbxBfGWvZRBs0AUkThSlwKm0yWs+K5zuAOB14TetVKblD3K
   +8hFzUSO8HsNBMN4maQxRRwEKbyL2DdLnydRPqLgy791PmxlUBpbLQDGl
   6IyjufE0Q6EM2+CE/+NCqr5q9ojat/ruDdBwuHNApbRIdb7XT22hMQz0Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1713102"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1713102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2804376"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:04:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: pci-lnl: Change the topology path to intel/sof-ipc4-tplg
Date: Tue, 13 Feb 2024 10:04:18 +0200
Message-ID: <20240213080418.21256-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
References: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware release which going to introduce support for Lunar Lake will
use the documented default topology directory for IPC4:
intel/sof-ipc4-tplg

Change the default path accordingly before sof-bin (sof-firmware) release
includes Lunar Lake firmware and topologies.

Link: https://github.com/thesofproject/sof-docs/blob/master/getting_started/intel_debug/introduction.rst#2-topology-file
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Mengdong Lin <mengdong.lin@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/sof/intel/pci-lnl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 78a57eb9cbc3..b26ffe767fab 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -36,7 +36,7 @@ static const struct sof_dev_desc lnl_desc = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/lnl",
 	},
 	.default_tplg_path = {
-		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_4] = "sof-lnl.ri",
-- 
2.43.0

