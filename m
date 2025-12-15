Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBB1FB1
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797631; cv=none; b=dCvRzWlN60AbrLnbg7o1YnYsIbF/SMIipWXPPziy1be9wOyUn8nBAIFlf8x1h/mWvKnyx/VpjRaXrjofB9HbjxunRfq79VtQeMqh67a8JETgo3WRooLd3/uwVyw/oyOlZJo8Gox+JBkA/oc8gkeiqVTZXAfSow070m1uYZD2Up0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797631; c=relaxed/simple;
	bh=XdnJr50ITHxMZzF2A1reH4pl/m8D2mXU1qSxmNPxvTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltvKvqllyZhJJCasABYDWu3HTCo39TnJD+CoW+dPnZqhy6/NFZn7fnJ2tCX1Ixwj+cisd4C+sslIyglplnbm8Ps45oYhbdQl5PeECMlWujmZ+Wc7Qtjc3ykHm4KTHQ0/5GFcb+kuCX0TxmIoAFsiQjGudsGL047RA0SkAaOp0G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOdE5HY3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOdE5HY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797630; x=1797333630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdnJr50ITHxMZzF2A1reH4pl/m8D2mXU1qSxmNPxvTg=;
  b=DOdE5HY3CXyUCeO3InqlZng351XmiVTLayJayIQajNbLj4sNAhwohsOr
   N6MA1ZcgcSYtfQlU3FPPVrfDJ9TWDdF8buxgJnW3j3uy0vtVAWomvJMat
   kCiiSvz69xUCoxv2koEHQgf7atR+u3NdmJfoIHMn695pS4AsJ+iWYLdOB
   C15UX2S2w7qJRIiQ400l2v/i1+HNHxsdSd5OtguhjtitVfRTolCMKzOG3
   TOKFU1Yirsw4X28aKDjlTRKPo1MNhUL3BM1VzhKFjwbP+SKTCcMhuQFyr
   hA4JmbwiBaKf4qwJXbcLc7LcG1EPNYtkjKh4JldkgGxwB5zY7Y5ot9WH1
   A==;
X-CSE-ConnectionGUID: sFbyjE5ZSuGN8ncuxPYA9g==
X-CSE-MsgGUID: Yw7svemlRsmzCaeWysKyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731746"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:29 -0800
X-CSE-ConnectionGUID: BP9QicimQIiCQa63/6IDzA==
X-CSE-MsgGUID: DHF5fBvdTluUaAQrJbFz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690205"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:27 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 1/8] ASoC: SOF: ipc4-control: If there is no data do not send bytes update
Date: Mon, 15 Dec 2025 13:20:41 +0200
Message-ID: <20251215112048.16331-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
References: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the bytes control have no data (payload) then there is no need to send
an IPC message as there is nothing to send.

Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 976a4794d610..0a05f66ec7d9 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -412,8 +412,16 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 	int ret = 0;
 
 	/* Send the new data to the firmware only if it is powered up */
-	if (set && !pm_runtime_active(sdev->dev))
-		return 0;
+	if (set) {
+		if (!pm_runtime_active(sdev->dev))
+			return 0;
+
+		if (!data->size) {
+			dev_dbg(sdev->dev, "%s: No data to be sent.\n",
+				scontrol->name);
+			return 0;
+		}
+	}
 
 	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
-- 
2.52.0

