Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14128DB76
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212588; cv=none; b=o/rZqbPDTntm7NvZmZhbnXm1GlpEV0/2/E695K90t+yGaTROJokEeqOZuF5Ad3cl32r5RSqVJE6lrPOLPU6BKdXnsaBPsYcs1W2uUt5X+z+xMF0oxgiVWacJumoAdc4AMwcXn6MatDDYwq7ZQsXEYPhE3XL57yvRHRAMeVY6PoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212588; c=relaxed/simple;
	bh=J0ZZO3kvkGeQKJmZR3RGmiio41rbbWOzn3d97m+ZaLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiRhX4ZMXC+qz98iy8peuyre3SYBsbxFyevFolNGBTXmabEnknENnfDTll/lsuO/pia5nFFOOl6L5N8rTGdWhbaL4prmx46XgbstrGUK7UWL5EpWz+u6ug5Gw7HWEB2KRwmFQuzZwyQW8o/GYtVPzmDSwrdN2MtXwzHLaUg6OYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7CPZQtN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7CPZQtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212587; x=1799748587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J0ZZO3kvkGeQKJmZR3RGmiio41rbbWOzn3d97m+ZaLs=;
  b=d7CPZQtNRn2vcjFLbF8aUq5D/HmYS1Nv2qnMV0DOMAYg0x5bOlagwpiS
   QIiEEFBKGCdxBOQytRbyc5IqzMN82d5KCGVgVPa2AwBtCUZjgHdgspV03
   ingfU9ZeyBfk7yVrX5Uaobtv0Z9erD6bWd2L0S/QAKgbD8La64shlHdCO
   moyEImlXmBicwNH2J2L7ESXPE4quawDebnepG4QCh12JI/OAUp7u2H/+C
   cK7B0vV6rEuT8D/W6F231qlUw9uCV7mvoIfpjrizb/Y7iBMNyTctEe7MK
   1FbrI98aecqSnSweFf8aeue+c02p6tkjQWqTzwVSCX4owTRo/70zMznYw
   w==;
X-CSE-ConnectionGUID: 9n3hVC4YTN61SGXZTA1RqA==
X-CSE-MsgGUID: 6u21IMp5T2qTulZtnwi8gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535305"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:46 -0800
X-CSE-ConnectionGUID: FEp/feezTVix54HnR9JE4Q==
X-CSE-MsgGUID: sNoChCimQBWwfbiSf5pwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534726"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:44 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 7/7] ASoC: SOF: ipc/ops: Use guard() for spinlocks
Date: Mon, 12 Jan 2026 12:10:04 +0200
Message-ID: <20260112101004.7648-8-peter.ujfalusi@linux.intel.com>
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

Replace the manual spinlock lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c |  4 +---
 sound/soc/sof/ops.c | 34 +++++++---------------------------
 2 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 3fdeb07bafa3..e6d8894b8ef6 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -47,7 +47,7 @@ int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 	 * The spin-lock is needed to protect message objects against other
 	 * atomic contexts.
 	 */
-	spin_lock_irq(&sdev->ipc_lock);
+	guard(spinlock_irq)(&sdev->ipc_lock);
 
 	/* initialise the message */
 	msg = &ipc->msg;
@@ -66,8 +66,6 @@ int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 	if (!ret)
 		msg->ipc_complete = false;
 
-	spin_unlock_irq(&sdev->ipc_lock);
-
 	return ret;
 }
 
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index bd52e7ec6883..74c04dcf4167 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -38,13 +38,8 @@ bool snd_sof_pci_update_bits_unlocked(struct snd_sof_dev *sdev, u32 offset,
 bool snd_sof_pci_update_bits(struct snd_sof_dev *sdev, u32 offset,
 			     u32 mask, u32 value)
 {
-	unsigned long flags;
-	bool change;
-
-	spin_lock_irqsave(&sdev->hw_lock, flags);
-	change = snd_sof_pci_update_bits_unlocked(sdev, offset, mask, value);
-	spin_unlock_irqrestore(&sdev->hw_lock, flags);
-	return change;
+	guard(spinlock_irqsave)(&sdev->hw_lock);
+	return snd_sof_pci_update_bits_unlocked(sdev, offset, mask, value);
 }
 EXPORT_SYMBOL(snd_sof_pci_update_bits);
 
@@ -90,28 +85,16 @@ EXPORT_SYMBOL(snd_sof_dsp_update_bits64_unlocked);
 bool snd_sof_dsp_update_bits(struct snd_sof_dev *sdev, u32 bar, u32 offset,
 			     u32 mask, u32 value)
 {
-	unsigned long flags;
-	bool change;
-
-	spin_lock_irqsave(&sdev->hw_lock, flags);
-	change = snd_sof_dsp_update_bits_unlocked(sdev, bar, offset, mask,
-						  value);
-	spin_unlock_irqrestore(&sdev->hw_lock, flags);
-	return change;
+	guard(spinlock_irqsave)(&sdev->hw_lock);
+	return snd_sof_dsp_update_bits_unlocked(sdev, bar, offset, mask, value);
 }
 EXPORT_SYMBOL(snd_sof_dsp_update_bits);
 
 bool snd_sof_dsp_update_bits64(struct snd_sof_dev *sdev, u32 bar, u32 offset,
 			       u64 mask, u64 value)
 {
-	unsigned long flags;
-	bool change;
-
-	spin_lock_irqsave(&sdev->hw_lock, flags);
-	change = snd_sof_dsp_update_bits64_unlocked(sdev, bar, offset, mask,
-						    value);
-	spin_unlock_irqrestore(&sdev->hw_lock, flags);
-	return change;
+	guard(spinlock_irqsave)(&sdev->hw_lock);
+	return snd_sof_dsp_update_bits64_unlocked(sdev, bar, offset, mask, value);
 }
 EXPORT_SYMBOL(snd_sof_dsp_update_bits64);
 
@@ -134,11 +117,8 @@ void snd_sof_dsp_update_bits_forced_unlocked(struct snd_sof_dev *sdev, u32 bar,
 void snd_sof_dsp_update_bits_forced(struct snd_sof_dev *sdev, u32 bar,
 				    u32 offset, u32 mask, u32 value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->hw_lock, flags);
+	guard(spinlock_irqsave)(&sdev->hw_lock);
 	snd_sof_dsp_update_bits_forced_unlocked(sdev, bar, offset, mask, value);
-	spin_unlock_irqrestore(&sdev->hw_lock, flags);
 }
 EXPORT_SYMBOL(snd_sof_dsp_update_bits_forced);
 
-- 
2.52.0

