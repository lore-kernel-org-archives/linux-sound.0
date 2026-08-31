Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698053DB32A
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168728; cv=none; b=f3USk3ilgIqpRRmRiYkR9/BPCJBzcK4bfi2+yBgpB7wbww0UDg+LCAwdP6ShdWysJw3WlWnRmBLzn7QOsFHGywwSW3rrf28AH1kXSb0qZYxCF5egDRl4Z5OEJNGTsQaHSgnX5chr6EhMaNOgICvmsghm4L3mLLWIUaaAQrQ6AH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168728; c=relaxed/simple;
	bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G+ePq6+Xz5olVtVo6H6JkX2VNDJdm3zr5HjLiM4YIJTyon4TRakLTvjwBtMSRrw8u2zCYmyq3FSg0yYT+zWNga16XU/smNLF4DF8btOa2dKEXhH3eEmP0srWDABjD/bT7If/vTomwgov8zBI+jlK0U56DyCnKknZcZ1aPY0WI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2wkJvHb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2wkJvHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168727; x=1819704727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
  b=Z2wkJvHb67SloEvhNCkCzcgtxgGcs8oAZOyEntz8Z3o54ldKvIQnGnji
   pQGdBaIY2yPhqxQeOj21pf7mKEZbM+ME2W6L+wqCuLkfyS1hXsA9BKmr4
   lUzakSnhUS5ZBLlFPDB4A1WOkM6X3+TSGdP+Q25SfjhPq+vJbMwfEFM0X
   aSoJjAEhZI/hs0rcn6cS6kXMol7C+d4xlBEeRK6p/Aam9I9I1JDvVnn4D
   iO/OweT2d/A5P0umizjR3yreCWcmeQAIOKv9FzEtgLYnDMiifJAkAwkOK
   GqShRX0WYoZJdnRgLcrAjIOl7bvhJYzoLvRnfSv8wVc2AnvpEZSRaVsTN
   Q==;
X-CSE-ConnectionGUID: lvdUeGhnSdu7qd6MHGCECg==
X-CSE-MsgGUID: /PBq4YS0T/m9PP5lIvDnhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332979"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:07 -0700
X-CSE-ConnectionGUID: CJ3HNSNeScaF+Yvu0BE6AA==
X-CSE-MsgGUID: uKxptHGFS6OE2yKNIqOVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265508019"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:32:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 08/11] ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
Date: Mon, 31 Aug 2026 11:36:12 +0200
Message-Id: <20260831093615.1117987-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
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

