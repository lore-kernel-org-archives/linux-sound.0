Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D2F17F7
	for <linux-sound@vger.kernel.org>; Wed, 17 Apr 2024 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713340684; cv=none; b=gkB1wzE8suBx263Zjm/zjKb0uQjp8K9Gdms6fCFmJcdsjTEbpnP/aeIZO2QphpA2zH1XJOUIEOy5Vo9o89HOs4XoaHxzYrpwixXNKAv5GK1Ou82m6bgOs1zQNabM8zH48L0lgIryxKtFFXjwFvnSmOklrZ4gmbu44Mxego9s+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713340684; c=relaxed/simple;
	bh=6CFLzASbWsy9j5PovUe2bZlIC18t8wN5CiLuLsKFLOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMBbkbjJByGhC4cwNrBHLZO7gsjLF5J9TR9hVt1RVID463K7hQ8DPu1DwlWMTFhn0n6QS2GSOasAH3x77fG4EnE8XYgXOej4/IcZh34xd0nMvNgmGa25/vrFUIWIIMaGCbKzwcd7h4eo5vPFa1/bBYVD881HFOJvqPPRym1Sq5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSCOanDL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSCOanDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713340684; x=1744876684;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6CFLzASbWsy9j5PovUe2bZlIC18t8wN5CiLuLsKFLOY=;
  b=XSCOanDLDJ2mmGQeb22BZzxVJnLthPA5qWNoF+EKAD3R9bh0McttuyR2
   PiDi9zC4XDAimqNP+VvumR7ahY+H0SF0Cf1iephIziCej+0vO2JNHDxuP
   D/maRhZzIXZE0V3wTFuCEuFyuhRjxvH2H6ZqfFUuVWnA9dhDUlafGdoQ0
   Gilyf9XXErvX1BfLzDL1Ks4WD0/nFclR1lt56gdKQEvbxesDe1yhHthtc
   m1tok2GifuFsKfpLgVCGpHpSZ9xBC8bIREEu+nhd7XEFzVsrU4YZCiMu3
   DgNd0kleLPS91P14uuokP7v1Yq5EMLqqV/RW0FEr8QW/chFmO9JP3O6CC
   g==;
X-CSE-ConnectionGUID: mIo6dLCHQFycSva0C4I6pA==
X-CSE-MsgGUID: k5T6gww7Rj2F4iJLG19Bnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12602644"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="12602644"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 00:58:03 -0700
X-CSE-ConnectionGUID: xAl/NlhBQGWCc+//yxi9MQ==
X-CSE-MsgGUID: syg1YQEZQEK6ZMLPlO+Vcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="53508852"
Received: from vjihanak-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.251.216.41])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 00:58:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	chaitanya.kumar.borah@intel.com,
	yung-chuan.liao@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH] ASoC: SOF: Core: Handle error returned by sof_select_ipc_and_paths
Date: Wed, 17 Apr 2024 10:58:04 +0300
Message-ID: <20240417075804.10829-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch which fixed the missing remove_late() calls missed a case
when sof_select_ipc_and_paths() could return with error and in this
case sof_init_environment() would just return with 0.

Do not ignore the error code returned by sof_select_ipc_and_paths().

Fixes: 90f8917e7a15 ("ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
Hi Mark,

Can you queue this as a fix for 6.9 cycle as 90f8917e7a15 already present
in 6.9-rc3

Thank you,
Peter

 sound/soc/sof/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index cc84d4c81be9..238bda5f6b76 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -350,7 +350,9 @@ static int sof_init_environment(struct snd_sof_dev *sdev)
 	}
 
 	ret = sof_select_ipc_and_paths(sdev);
-	if (!ret && plat_data->ipc_type != base_profile->ipc_type) {
+	if (ret) {
+		goto err_machine_check;
+	} else if (plat_data->ipc_type != base_profile->ipc_type) {
 		/* IPC type changed, re-initialize the ops */
 		sof_ops_free(sdev);
 
-- 
2.44.0

