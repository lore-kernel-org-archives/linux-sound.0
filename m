Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A103F6612
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179231; cv=none; b=LaEU0CSVuRObWzvAiY2cUEyPhCL5Lo1Cz3uU0awSy+uAIz3bpy9UbfiNAmuiDTwp5zjMZyGe1fNNO5C2rv4TaVc7jOjYoOc4R3ejmu3iejm8pYGgbDD2PRde09VDxDDqb5zRNmr3PflTU4/sS593Fi/wUA1QDXB9oxUXWMqJ4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179231; c=relaxed/simple;
	bh=923R4REjT+71SfmOjz0SOFs5/3fdjCRy07YsL2TBHLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3kGGyl83HajhODcQvcZF9veVf6TVgd5YbsVYBmiWtmCkSht60RUuv7p8xBdQpZlzsHvM7hCrZ0sBSDn942sv5ys+0Hm5vm2kO5solRW7qs4U/iKhrr9lOPzU5NgVk+Y/LPXzCMQkoTkS+TJnHu+ycAQDMvTnfRk/7QRBCti5T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMMm/dKt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMMm/dKt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so513617a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179229; x=1781784029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUdcCqXkBph/H33/S75zUJt8s6zUgSb/L6PoIj1uErA=;
        b=bMMm/dKtV6Psn+PIwQDeV0Thwo45cepSOzHtR3w3duMttk6ZWaCHbUn6osQDOYr46M
         lU6AdCSUzwPbp3UmJ7Xffiq+pX93hvVXkYvsv/ree0OcyOov7vfHpv4oCKRqV9zto4uD
         W0R3Vm654pU6M58brotN5T8FyGAjEaG+m9khOsr1K8vbTa3JSQf0s8upJCOHurE4kk7l
         5AUYQBL4D+la7VY7cJhsciBYczzflD9ew3DTlyl3nHpnTUYIr9TcdV+RhohLS6OhFGvA
         AO6pGD6QYaR/ZYsM7Vkk38fUxmda1B/eq/UAfBOHlTgqBHiUq/ddLDNo8ch7G8N31d8T
         HN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179229; x=1781784029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUdcCqXkBph/H33/S75zUJt8s6zUgSb/L6PoIj1uErA=;
        b=UqkomJ7BGPpkkfbvQyfs56cgoJsEy4yNTOViHaz/MhlFRgkJEWXxInaZRTrfkuTsJB
         nBZyUMaUjo22wUZd5dNCdOXu2uh8gKd5Tez+3B4okhKvd6DUpiAKapYuVb7pnv6b0an2
         6E7DXNKj665YxvMMX5egDTFnvcsgeJ1bS8j66NMQ77AN5DYXCJgGh5v8HNK8uHB5bs6N
         Rsk27WSvjpKRGuP5shPXBEzj5t5AbxrBjO/6gCCEXboLSGtweBzA6yzlTANvXFQuq70w
         LDT4l56KJEUrwU0jCX97FxPbcTPecoSBQTnniDBs1rKEhmv7vLykYQOjGw27TY43A8MD
         RhRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/608wowDQChRGIBJUHK2s4wM2FkgmepliSZ8LYnL5zf6SpN/neVN5KAo2rABxgmWEUOV5bKiTlGbmWAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfUqhvAOSxmQcDa9zurUA5FDRcBcTrjbJiH18Vm6G9w8n1i5k
	nFaTrmwwoc8ixVHmpa63h+8r2pKFypeRHNMM0z5n+jwnv4f6h2p9v19s
X-Gm-Gg: Acq92OHXOi+erWViBdxT7UC1M85Qp0k7YhEihWIiaV193zK00Hx+pDfOotpd5NxA3+f
	YfjpP5E3R34YSYpb16x+cd0CzcIksFn44NAVyNH2IFVjQ+svGAHtJKbWZNn4qowYNMjeXSd0ZPr
	dOcZ8ogIAuqGHe1xAOZjIdZzd8ksYe9ViJsgF8c4W0/05/7+tcMd20KevcEOJ2XIrQnBJr1kQWO
	+Z9khW0axer6P4KHvZ+AJAWFiNZ3cKFcUyhKWr9KvME+mR7NX6xxpCJ3ThWkXq1xRu3Yn9LX6l1
	QKLSySv1OAmQY2hEIrKDe5EaAITDf8OUSbPvuaG7ePAwx2xvG9X/yjjSdQzwgsmU+tCvcopC2el
	yfSOlf6PnYX86zSmXkYR5tw2+YeDgoPIymUdwFfu+e3DmwJiSYL+dorOd2ycXGsRacZWfzSF0Xm
	jqE1qPzdofvljp0x6sqrUzuidM+ITolepzAdxsdP+Qu4a0vtVxxEknS9WPD2sJjDaFPr9v
X-Received: by 2002:a17:90b:3a8c:b0:36d:633a:c7fc with SMTP id 98e67ed59e1d1-3780647a712mr2069171a91.10.1781179224599;
        Thu, 11 Jun 2026 05:00:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 16/20] ASoC: Intel: atom: sst_pvt: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:57 +0700
Message-ID: <20260611115901.80438-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst/sst_pvt.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index 67b1ab14239f..e5b7c5646659 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -64,9 +64,8 @@ u64 sst_shim_read64(void __iomem *addr, int offset)
 void sst_set_fw_state_locked(
 		struct intel_sst_drv *sst_drv_ctx, int sst_state)
 {
-	mutex_lock(&sst_drv_ctx->sst_lock);
+	guard(mutex)(&sst_drv_ctx->sst_lock);
 	sst_drv_ctx->sst_state = sst_state;
-	mutex_unlock(&sst_drv_ctx->sst_lock);
 }
 
 /*
@@ -179,9 +178,8 @@ void sst_clean_stream(struct stream_info *stream)
 {
 	stream->status = STREAM_UN_INIT;
 	stream->prev = STREAM_UN_INIT;
-	mutex_lock(&stream->lock);
-	stream->cumm_bytes = 0;
-	mutex_unlock(&stream->lock);
+	scoped_guard(mutex, &stream->lock)
+		stream->cumm_bytes = 0;
 }
 
 int sst_prepare_and_post_msg(struct intel_sst_drv *sst,
@@ -302,18 +300,17 @@ int sst_assign_pvt_id(struct intel_sst_drv *drv)
 {
 	int local;
 
-	spin_lock(&drv->block_lock);
+	guard(spinlock)(&drv->block_lock);
 	/* find first zero index from lsb */
 	local = ffz(drv->pvt_id);
 	dev_dbg(drv->dev, "pvt_id assigned --> %d\n", local);
 	if (local >= SST_MAX_BLOCKS){
-		spin_unlock(&drv->block_lock);
 		dev_err(drv->dev, "PVT _ID error: no free id blocks ");
 		return -EINVAL;
 	}
 	/* toggle the index */
 	change_bit(local, &drv->pvt_id);
-	spin_unlock(&drv->block_lock);
+
 	return local;
 }
 
@@ -363,10 +360,8 @@ EXPORT_SYMBOL_GPL(relocate_imr_addr_mrfld);
 void sst_add_to_dispatch_list_and_post(struct intel_sst_drv *sst,
 						struct ipc_post *msg)
 {
-	unsigned long irq_flags;
+	scoped_guard(spinlock_irqsave, &sst->ipc_spin_lock)
+		list_add_tail(&msg->node, &sst->ipc_dispatch_list);
 
-	spin_lock_irqsave(&sst->ipc_spin_lock, irq_flags);
-	list_add_tail(&msg->node, &sst->ipc_dispatch_list);
-	spin_unlock_irqrestore(&sst->ipc_spin_lock, irq_flags);
 	sst->ops->post_message(sst, NULL, false);
 }
-- 
2.43.0

