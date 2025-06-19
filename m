Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B9623956A
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335094; cv=none; b=uaGWQWFnOE/3FP49/pgf/LPiGpiK2ZxoYsqZc0TMifH81bMsJjKKjdiKVGBtp39u2FdX6GX59kQfJfPAg7lw1E79TFI8y8G4W68EV8HydT5dj26vw5hNulmV1T4pVYP34NcMIaoQapZHtmng/t9N4hGjR18WptdAwh8t7ltjW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335094; c=relaxed/simple;
	bh=Gs33xNcwckPiZhlvdsv1vz3ZVonSM6K1L0PeTIDsS3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JE6A9jdp60SgthC1JVmjkShxTBgf64KYOcw3I9BlD/e8XIcxyYULtJdt3ebsJmpIolFTAfxWxmqL5Chx+NIb1wY0kk97S3yPyDYmSg7bBUBsKdlhKbEa/mUoXutBESivAgMwUSLxXvqI+O1vnI7ZpY6Ulq3C4ocI/hXwR1TcAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlCWxUkI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlCWxUkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335094; x=1781871094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gs33xNcwckPiZhlvdsv1vz3ZVonSM6K1L0PeTIDsS3o=;
  b=UlCWxUkIlX7oZIzqO6pgDPo3i/G19Z05k4QpGmqRs+DQFEh40NhqXX0u
   XTdqcj2WYU9uV/DTa7AOZ1RvVVf5JxTivTVqgt+1MvuNNuCUq4duEbSpu
   KYvCU38utXTz60zInuwymSH8o9T5UxDiYAdnDzqP+tTUfuDR/1sXRElXR
   QU1wBdFNy6NxmUELiqCfvFNv4WhnkLMwuGnOmU99jvF1IppCIpjGgQSfr
   8VI42mlHucRKzPZoRRTwZWxvHgZ4F1wwsjFst9mXRSEDaPP5bD05BwtK9
   d/e1rjA0iZi9Z9FGk4xnpPPbZLz9qt/fwnOj/PmFCIwOPjof5GyQD7pjF
   w==;
X-CSE-ConnectionGUID: XZfMPzufQke7f4iBo+IyGw==
X-CSE-MsgGUID: YwmFuvdJRkGSQcXDNI7/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52555727"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52555727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:33 -0700
X-CSE-ConnectionGUID: UDLEt8hqQe2GLAmZp7a4YA==
X-CSE-MsgGUID: dOmfeEgzQgK/9RjuvfEnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155013377"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: ipc4-pcm: Harmonize sof_ipc4_set_pipeline_state() dbg print
Date: Thu, 19 Jun 2025 15:11:21 +0300
Message-ID: <20250619121121.25241-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
References: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Harmonize sof_ipc4_set_pipeline_state() dbg print with the new print
in sof_ipc4_set_multi_pipeline_state().

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index be4518d8970b..cf809959eaea 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -113,7 +113,8 @@ int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 s
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 primary;
 
-	dev_dbg(sdev->dev, "ipc4 set pipeline instance %d state %d", instance_id, state);
+	dev_dbg(sdev->dev, "Set pipeline %d to state %d%s", instance_id, state,
+		sof_ipc4_pipeline_state_str(state));
 
 	primary = state;
 	primary |= SOF_IPC4_GLB_PIPE_STATE_ID(instance_id);
-- 
2.49.0

