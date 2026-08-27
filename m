Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545323BCEE
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836304; cv=none; b=OFm2hOyy8/cJh1hbZhFnYOXCMb8I42uKmXd08/iAPlIpVVJSOuPz1mcvCnF2jknep/jwJMr6zEXMBL+W0Z1a6omlLRB+Q6qhBpMWB7dBEOFDvWO0t4aIVwSX3Nf+57IK/5JnRjahAW9mQMBXaj+5UaEYgwH5kkWoBVoiF35hY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836304; c=relaxed/simple;
	bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iIk81eAcyaW5gSTmCMW7iOIVX5YgMrC8m3mdDT3aiLPzvU0G7O1UYAc8ChNXReBP057KMtxjgA2ibgKFS9f5I8LpjgsGiW/Nd26uGfclpL0vTwI5fHxboYXyuaPxSW9tsbOr2TV1awkJ3uht5nYbfN16XXpKk2ukOhGN4ckg3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cW6FFSy/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cW6FFSy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836294; x=1819372294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
  b=cW6FFSy/pRor4fAIksSej+v+mwp2Nq1XTy3KoK/rYtk0r/lhcm5ym15l
   UusoMiehNRJj9flXeISd9klP6OHTrOBUS6PygTSdI5OKwdJrG+EktUGG3
   +7H66Z7oMvWAjN86JjDeudciYm1zx5zKtMYMqikjWwg2GhXr+6h/DGvPX
   1MSmxUOh1nbVLT96drjUxyUxILG+21KgKna4I9dEtUcTtZemppuv6K4WT
   Y7QS47gG5kRPdSo5d9sy0koXzYmKxvHRIMDWVPZ9KhsLWZIjB4LvfghMs
   7O8iAGKsww6QeZwmpsk3hP9zCF0Uk7PE69i50BuFuKkNbD53WitrLBYXA
   w==;
X-CSE-ConnectionGUID: 6mMwgD8jQxytXjA+5VzomA==
X-CSE-MsgGUID: ra/jAo9yRFqtTuMYTdqxpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539069"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539069"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:11:02 -0700
X-CSE-ConnectionGUID: 6rb9P2DFRza+eZRzgX0Deg==
X-CSE-MsgGUID: E/VExmo2TYuEochPnbEB5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589356"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:10:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/10] ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
Date: Thu, 27 Aug 2026 15:15:07 +0200
Message-Id: <20260827131510.1014084-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tests with corrupted firmware binaries prove that the recovery procedure
can hit deadlock with d0ix_work if the work has been scheduled shortly
before the event that triggered the recovery e.g.: timeouts on
communication with a dead AudioDSP firmware.

At the same time, the ready-check shall be done after acquiring the
msg_mutex as the flag might have been modified by the time the lock is
granted. The recovery case is one of such examples.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 39b0de9831da..5010b0f5be47 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -172,7 +172,7 @@ static void avs_dsp_exception_caught(struct avs_dev *adev, union avs_notify_msg
 
 	/* Avoid deadlock as the exception may be the response to SET_D0IX. */
 	if (current_work() != &ipc->d0ix_work.work)
-		cancel_delayed_work_sync(&ipc->d0ix_work);
+		cancel_delayed_work(&ipc->d0ix_work);
 	ipc->in_d0ix = false;
 	/* Re-enabled on recovery completion. */
 	pm_runtime_disable(adev->dev);
@@ -395,11 +395,11 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	struct avs_ipc *ipc = adev->ipc;
 	int ret;
 
+	guard(mutex)(&ipc->msg_mutex);
+
 	if (!ipc->ready)
 		return -EPERM;
 
-	guard(mutex)(&ipc->msg_mutex);
-
 	spin_lock(&ipc->rx_lock);
 	avs_ipc_msg_init(ipc, reply);
 	avs_dsp_send_tx(adev, request, true);
-- 
2.34.1

