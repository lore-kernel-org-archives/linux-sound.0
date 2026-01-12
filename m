Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8B2820A0
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212580; cv=none; b=qB/2OmR+utUfx3oR9byleiXXNKg+JNL/Bf+NGVO2dEb/ciSXz0CAVbH8AHj4ogGIHoMsxq6A49Bh/p7AQfStLLPh2wy0a+juGfNF7xv6/kguJS7byEu5pJqHaE4wkOnjgWM0Nso4doxH2PpVp61bnQFGru/rEs+gHS05qbSMmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212580; c=relaxed/simple;
	bh=IO5fica7q6i7VablJMCqVg2Zui5ZNe/5l1w73lNAwos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JT+0IknZ4QaJPIbsC0VXMO2YSBS8v4ydOrwLXNRlIH8wnQAI6lunG9OQxxQLGBTbUBPcKKardzFPKCHznPs1p2RoUAxjV1vNJfgH0H2GR70YSC6KRELARycnVHI3x898n/2bt5gN4Sq3LjujVFkh1cyCxfvOTbPMZweEBmgnDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrwFjbue; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrwFjbue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212579; x=1799748579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IO5fica7q6i7VablJMCqVg2Zui5ZNe/5l1w73lNAwos=;
  b=BrwFjbueGp0Y9ox4ST0KsiVajDVsYm2f5TWVN5fPsoAEzk8xkdJ9BEzg
   dihLTbT52IeWLdGxdL1TD/iexWyFXcpD8jUjUJenszgOQ71rbeOL1cVWG
   CbFxa5O80mhACb7hhVVmMXWyfJ7qnsAuDFfGM6jn9DTDMvJjn3A+5OTjj
   3CpuzavApEOUCV42deo2G78yrtVx4TJyUdqOzbnY2J2ujkivL/0L74Fga
   yQG+HIJFcT14VX46IYtfHdsNhUoBs87ebPPrpK0DOlWb0LTengTmJSdY0
   nC7hKyJT1Zb5tKDzBp+EliOrDwmjskFyUqujGRT9R67Zrw8cUxYBEnXdr
   Q==;
X-CSE-ConnectionGUID: OL5BH0LCQWi+lz8tt6KcOw==
X-CSE-MsgGUID: LG4vk9bAT0WhqKUs5sE3Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535286"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535286"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:39 -0800
X-CSE-ConnectionGUID: lgvFEeT1TXKECQryyA6+xA==
X-CSE-MsgGUID: GJNSXvDcR6Cff0eJSiOtXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534718"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 4/7] ASoC: SOF: imx: imx-common: Use guard() for spinlock_irqsafe()
Date: Mon, 12 Jan 2026 12:10:01 +0200
Message-ID: <20260112101004.7648-5-peter.ujfalusi@linux.intel.com>
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

Replace the manual spinlock_irqsafe lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/imx/imx-common.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index e787d3932fbb..7a03c8cc5dd4 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -81,14 +81,10 @@ EXPORT_SYMBOL(imx8_dump);
 
 static void imx_handle_reply(struct imx_dsp_ipc *ipc)
 {
-	struct snd_sof_dev *sdev;
-	unsigned long flags;
-
-	sdev = imx_dsp_get_data(ipc);
+	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
 
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
+	guard(spinlock_irqsave)(&sdev->ipc_lock);
 	snd_sof_ipc_process_reply(sdev, 0);
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 }
 
 static void imx_handle_request(struct imx_dsp_ipc *ipc)
-- 
2.52.0

