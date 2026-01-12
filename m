Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778412820A0
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212577; cv=none; b=mTDFdLTtMw36/nYDZRVITPq8VmrjvhZgAfO2nYoo1TsIrtnsnuAiUUZTEzMQUCVn3IiEB9PrNz39UDZ96RC1SFcDcbKWqEJLb1J6qgttGB8efpacpVsuDmRKwBRVr6bSJqWpC05ShVmktzmT4phvxWTaQw8jbh5KxB2TZVNJO7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212577; c=relaxed/simple;
	bh=rTSZFVQlkNLy/0qozWxYPDpTvC2KXoABflGdHZgrLzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vh8OnIsE22ejzSg270YkLwC4O5baelbbGiTbvXD496EKnD/bOGs9mwoiYGQZSs0U7RLyQNUzMY7rqCNZczHhYT5LSM5L0Oe/4GSNiJGTaurTAsOMDPZ61dBH1TNlF9/q66+2IdJlnv6SUxUR9GHEVE804W5Ehweb/3s7eQjxqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCPK7SIy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCPK7SIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212576; x=1799748576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rTSZFVQlkNLy/0qozWxYPDpTvC2KXoABflGdHZgrLzg=;
  b=MCPK7SIyCOvq4z2NX107i5rszddyM9SO+H81pMauwJSuBIeO1OH8+IHf
   4D7fMUU3mRDvkZ1HjUVcvhjfpL4J7zP6QzLvkq6AUX0csUbUbc6+Be/U0
   9AFi3RV6W5BQTQ2nViT2Knvz8N8v0oLhMVSEcfi0ihO85kJiw582943Zk
   AQy/dpZBqbUlubFMPb9BCiHxZ7S7CI5EvAs044DoN9AvYNJjWf+ZM/uSI
   wxzhItohfkJdzec32cDrtT2qkjvmyIcyR7KWcAd4sK3oZl0+rXPhpbsBo
   DwEVmi0g8uHFEachrghLtkQ4HIeuyocCX+sDRP0g6iEYB/wEXvgOYkm5H
   g==;
X-CSE-ConnectionGUID: xpDYurp/Txyazm5zSQ5bfg==
X-CSE-MsgGUID: Ra6d66BzRpmjlgON+sSCCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535279"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535279"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:36 -0800
X-CSE-ConnectionGUID: 3EiJyALFQfSLatS5xOHLng==
X-CSE-MsgGUID: 8pN+Rs6hQg6jcYh03dEtWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534714"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 3/7] ASoC: SOF: amd: acp-ipc: Use guard() for spinlock_irq()
Date: Mon, 12 Jan 2026 12:10:00 +0200
Message-ID: <20260112101004.7648-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
References: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual spinlock_irq lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/amd/acp-ipc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 22d4b807e1bb..3cd4674dd800 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -190,15 +190,13 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
 	if (dsp_ack) {
 		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
-			spin_lock_irq(&sdev->ipc_lock);
+			guard(spinlock_irq)(&sdev->ipc_lock);
 
 			/* handle immediate reply from DSP core */
 			acp_dsp_ipc_get_reply(sdev);
 			snd_sof_ipc_reply(sdev, 0);
 			/* set the done bit */
 			acp_dsp_ipc_dsp_done(sdev);
-
-			spin_unlock_irq(&sdev->ipc_lock);
 		} else {
 			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_BOOT_COMPLETE: %#x\n",
 					    dsp_ack);
-- 
2.52.0

