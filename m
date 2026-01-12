Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF60428CF5F
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212583; cv=none; b=Dou+ge69sYNsOVjh6fwrZhKWS8y5Oqi9lfEJVY9Gapwowmm5P38WovEVHBasqQVtnEaNB0D4bOa5bWxaSsVypdM9ahyEJ+HzDJ/HO+dwK5ML9YXFxmpgf2gNh37KX+Ph4aoBnabAr22fiGY+w/5ju+6CQWLBMwuUD5ic97fSStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212583; c=relaxed/simple;
	bh=IGTBsl17f1hTcuEqK+R2lYKCT5vRYeo27x40VBiLknc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrV3l5N0z807AiZYA6ZxSY0z9gmi9J9L4JvR4EztK7q+BDE5TN6Nw5SS3Un35rrGR4siQEHaj8PwPwgRTBXDkC84Kskb+O+ovKpse1Rgi6c1s1IAqSF8rXQyLOSVXsnRZcOIFRc6dM8uH60p8+WZY21GRiApb0hVs8szr2LHj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1YmNBEo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1YmNBEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212581; x=1799748581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IGTBsl17f1hTcuEqK+R2lYKCT5vRYeo27x40VBiLknc=;
  b=n1YmNBEoRSkgK2IXvMyf/cN1RQkoAMuUHUcCa8pHX2u9EKJ5TyrM0VF+
   CBZp5oatllXOXYAd+S8bdc2s2pO3ZaIsA4T+S0QslpceHDcpwq9mcyKBY
   rZZmBvEVdDWZgcEjq/fie9FeBc8BBWnRqBHcDlmNKI4/lXaPCVcmkMZ5v
   unayp9sAUZIzrD9zBdA2Ai5gv9sByIg/WZepV36k6IH9w2+0fGzxaUCQ0
   PclsIjNXXtinE4S/kDsQDlvJcp+O6MXuhIiUS+0bSUf/+TdFho1rZiHUS
   WMoU2u9tiL89Ul8Efg40eWzTKVDo7JvamEFMp8CE0AW5f3Cpa7PilmD2r
   w==;
X-CSE-ConnectionGUID: UhXyFuP2TmSYHo9WfT3bow==
X-CSE-MsgGUID: jOOWagcURS6Pkc9VkQUppg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535292"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:41 -0800
X-CSE-ConnectionGUID: RC+eqeDPR+Chr4JV4ibzhw==
X-CSE-MsgGUID: xoORcX5aROKh2WnBYhQPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534720"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 5/7] ASoC: SOF: mediatek: mtk-adsp-common: Use guard() for spinlock_irqsave
Date: Mon, 12 Jan 2026 12:10:02 +0200
Message-ID: <20260112101004.7648-6-peter.ujfalusi@linux.intel.com>
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

Replace the manual spinlock_irqsave lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/mediatek/mtk-adsp-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/mediatek/mtk-adsp-common.c b/sound/soc/sof/mediatek/mtk-adsp-common.c
index 01bbadb160ff..75b4af4b5111 100644
--- a/sound/soc/sof/mediatek/mtk-adsp-common.c
+++ b/sound/soc/sof/mediatek/mtk-adsp-common.c
@@ -107,11 +107,9 @@ EXPORT_SYMBOL(mtk_adsp_send_msg);
 void mtk_adsp_handle_reply(struct mtk_adsp_ipc *ipc)
 {
 	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
-	unsigned long flags;
 
-	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
+	guard(spinlock_irqsave)(&priv->sdev->ipc_lock);
 	snd_sof_ipc_process_reply(priv->sdev, 0);
-	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
 }
 EXPORT_SYMBOL(mtk_adsp_handle_reply);
 
-- 
2.52.0

