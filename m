Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FCE374E40
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336863; cv=none; b=a3tHpF0w2V+zi/SrH2C50ra+gOr3hp8dk1mlAaHZwNfBTLzoMzlHYdf19x55ocSC4+AnWeuIku6OIHsQ+Zfv3KuCq3FKX6yZftVa7l9+JNf+oxk8NxPa4Z0Hc+sLsyL0Br+wNn4dba2MxI1tLr4oTzQjYPIxz62O1fK2GZ24RcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336863; c=relaxed/simple;
	bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hu4O7SYuP4Lxyt24SOkQ/LYLDHNcATr+ySftmhXr69UMBD1UOVWrFnL3ft/0185yWZhZjHd9/ym7oPBVhl9l5jlsxwzoZCToFWQ6XA9c13+GAEjA81SqHwbjbnI3kd/qHN5uXG5a+Q7hUQ3juaBOi/sPJFq/vHY0uO6ydwpicyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/81Tc6y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/81Tc6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336860; x=1819872860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t03lNhPZLJrH8XvChLO3NRAc+e+xYhd1hjUzdhAKt3w=;
  b=h/81Tc6yW4DRjDceA1lCl7aiPDo9Li1ML9E20SsaOzRcyg0abyGxx/PA
   sLah++8YiH+nGVe7HHje+SHTQpOWfh6deQazwIfrTQbayNNUGAjEyDhFd
   D2AGZfte9EgmGodzDeLHmnV/rgB5/CUwcpQs+3u5FYbUYoPfCFTY13kIT
   K9sc6GRf4jYc/yyLG+NDGzJYwIGc9xaTHVHKLjuNPiTNlxdd78PyMjTQ/
   GZHSSH0A3z+pI2H9kmRuIMfKhJwZHFQF9qzso3KR3Gd5s7gL47rI6hA6M
   +yv6E71C+4cFbq3aLMaTemQeKJRbW7JFS5YW0YxtH1j5Kb6B8x0km9ovn
   g==;
X-CSE-ConnectionGUID: +qLvYeCVSjyun4tqg+FCbg==
X-CSE-MsgGUID: fTrZv9afTmCPgi/AxLXXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99121004"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99121004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:15 -0700
X-CSE-ConnectionGUID: UCNH23scRReN6kW8/vsxtw==
X-CSE-MsgGUID: soQm68mWS2uWz305KUan7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099084"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 07/10] ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
Date: Wed,  2 Sep 2026 10:18:11 +0200
Message-Id: <20260902081814.1590883-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
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

