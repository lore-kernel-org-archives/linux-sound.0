Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763454A3D2E
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194326; cv=none; b=A5lkJnrntylrpjohzOiGs/a50/uaLS3dYDPZJdcrvuQoydwMuqeLr5duutY8oDoyH2pI3UJPyaEiNxrBL2ad6RisyFPyx60YG/Fhmabr22ZLxPW0vpluayliyU4VgvBjot7LLKS0/dQTYU/q3AJLvtJG+zzDnT0MhpaPq3O/mws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194326; c=relaxed/simple;
	bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A7IyTfhRAzlBHaxPfdvvg3GXn5uJWfuz0V8sPprjQ/a6ODgEzExJM4iWPNNqvxHo5VO9hNZQVKOXV41iKEbw4aWPU0W5CQBvsZQYeiX3zXBQWUDBvnj99WrDNrhSuz2Xkfq6WSOihpxgof8AVYKMPvlWo59bJ1PF8My4IBluQBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSNQQXkQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSNQQXkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194324; x=1819730324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
  b=TSNQQXkQKQOC920yHsvHeqCwkX76uVF8PQ6L7NLYo4APBtPRRrryNYVI
   ElGTIUgiWx98Rcl9pObQ7vO9TluphD6o1RGzdBjcjCTsWPXF+3ROAf3x3
   NV2f5R0Bd45/13ZjUz1/Pru5IyVky1RjKVhX25dv1MOaFMZ4KFJOTeXty
   rsnx5gq7927hBSIETsk4+QIlzcsAFu4/+GxSJ9ELVNxAEaKKFMgkrDLbC
   xyhYZHuFC7Q/fkRSXbJ3hGsfRgH7ha95oYnkgNaKW4arfo3JR1k8SwEko
   PBwLXxHWi4V0nXg5MR0794ocxlKGjWymmFSiNDmuCWpXcFGGQc+s5U0HG
   Q==;
X-CSE-ConnectionGUID: mmj89WMnRm6s0Sq1C8W2tA==
X-CSE-MsgGUID: HN7z8NlFSTSeU24vejo5KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379753"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:44 -0700
X-CSE-ConnectionGUID: EoUgDO1bR1yDjzr0JQmTgw==
X-CSE-MsgGUID: X38rHq28R+eFCM7gZW6gJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111856"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:43 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 07/10] ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
Date: Mon, 31 Aug 2026 18:42:30 +0200
Message-Id: <20260831164233.1487766-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

