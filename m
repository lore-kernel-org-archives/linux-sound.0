Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937223F44F3
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179244; cv=none; b=I7D9lNYi+wlp9D0E3WqtmAdAJ+NROZ6T/6oAerqmeepa/gkYBFYEXof6VYUWAcBOj7zABQSOrbZICyWk8I3oTcTxKrKsPl/zuymJmzPmnfTXFWoiX2PhDTUjN110fl1zscfTAitu4MZgGyQKxoqITc9Frq2ncfvENYtbYLLge8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179244; c=relaxed/simple;
	bh=91ooDYWBMu1dh5b8vR884c90Ox/AsfYMF/V4v2FhMvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dybj/naZbEUOMFeO3X/vN4a7nIvFXkf6pK9Bv0kTlZJur2zKmqXOC6RjXQJJWowmd5KJxBYOgy3XPr2Xe6QIyoV/dmgRFA+g6OcSjCiGFZsUpdGJJH3a8mnjJaBBuD1xMcjAdY0lXSNEL7uJCtazShZQtT7I7+4cZqPtLahRoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwENYgNV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwENYgNV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so384415a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179242; x=1781784042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4PV9lmErDIzgABct4j90hNz5rsVhbbxUQcJjXZWD/0=;
        b=BwENYgNVP7J9RI6J0/yeFgPFcBnOjTjs5kSfkBcRp1QT9FDZ/xRbB3Xcyd2OAxyPc0
         pUiTLgAzOibGTJdPdE0ZB0CLc6RQrmscj3puZVraKYLzjPM+8ewXjlJGq/oA+uBniN3q
         UOdui6nmo4Aci4znzJoNkKjjAsWaC4pJdGoBYEDllVF5Ue8B8ixwjCi90j90GbSdnxwA
         ZsmUO9GTlQ/4JN8Cchxw4BZuptXRLtHCN9Vcxthyep0KAn2pRNHOiwvIfodiuvUAb8Hx
         YPTC9lm9OR2bHNTUXIluRYhtO+sc0qMVQUgIbZfDJ7AdcRe/W90cX0VVvcIzaJj2WaUx
         vF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179242; x=1781784042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4PV9lmErDIzgABct4j90hNz5rsVhbbxUQcJjXZWD/0=;
        b=Tsqkv4M3DTpqiJYnA1XqudBcqUCLaWtcB7l6vNXKaQ2ZR5lsYsfUjq9Ogr2+aO0ANO
         6FNPlGGz9H7qwzHs1XzTdmH1Xn7O9AySlZz1PJwqMvj8m4cEA/Lb0jpPP6Is8zB9tMyP
         Nxper2zMEjw98z19wiBJK+Vf8e2VerTssW6bFlJSRBaz5XC2VrxiI7l4SZLBH8oojTHD
         h6IGM5UzO3JTTsCXrz3U/OUISYKJ6wKI6//WtuyXaXnGMHVN3PDpcd3xNjscja6JIDyE
         jjlLCgD7bUyAAjI9uklMm6O3CrpB6ncQmu/ceJjqdErfOOoZ1ecVurqwXYB6ls/eKvDV
         ZLNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vj5wNIGUogG05gn/fV9297ObGvVG8cQbTVhCR7eLkw62pn4ocdtYtYJ+5XXrb0W1cEWUFlVOFFb4OuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jMIcGWNk2v76f0TmvTBuq7oR7Gc0fZNarfO+kHLIYcgmbQpx
	kfut9viQ8G4wuBNn0G2nQTx+jfKVL3Rr1QYnRLzIWbm/4RYlel8uYMmS
X-Gm-Gg: Acq92OFYNwp4vXdXoj4GxG8GMd4HIlCwfDm/ZkryIe3tLyHRQBXxF2aTjaR0U5vAA2p
	RiYZZCsFLE/XU7OFEzG2AhaM8ZeFN926RUvFr+egxPQ2oOKsbIve8Tvf+wAjje2jV08ckHHDLXr
	qhQGUW3ypTL/tT+58JnuAvPt0Zfqij3lZfd6T7mIn0eNQKqkhJB33wmkpWAON6PW+63a55lLLt+
	Yc0c+Atmn6Z7ED4WFwDfAMT9VPh+C9QkE40998AVAV5rOxmfUaElSy779ypYmUAaouj+wBDQupL
	s4PDbyTNnYcHAOb3mYTWhsesVTMomF9fnAqP0aLh5xrlqSNdotzZvgHNawVWSXQeqXz+LOJ9mGA
	G2qh3qR35xbdWj30VPmYtuHiCHDWSfOny93gNnari6p8zPJ9YbYw6fsOUPrZqPd0/xhprS4uMdF
	Xm50AzzHN0ArtVGUVgjvkZV/eUCcUYApVKtwDANaN/P/Yj8JMuUwbp4LsFOsZRHz6rOpaT
X-Received: by 2002:a17:90b:3fcc:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-378045c77fdmr1738306a91.7.1781179241641;
        Thu, 11 Jun 2026 05:00:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:41 -0700 (PDT)
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
Subject: [PATCH 20/20] ASoC: Intel: atom: sst_ipc: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:59:01 +0700
Message-ID: <20260611115901.80438-21-phucduc.bui@gmail.com>
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst/sst_ipc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index 0d5e71e8a5b5..580678c89b28 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -38,9 +38,8 @@ struct sst_block *sst_create_block(struct intel_sst_drv *ctx,
 	msg->on = true;
 	msg->msg_id = msg_id;
 	msg->drv_id = drv_id;
-	spin_lock_bh(&ctx->block_lock);
-	list_add_tail(&msg->node, &ctx->block_list);
-	spin_unlock_bh(&ctx->block_lock);
+	scoped_guard(spinlock_bh, &ctx->block_lock)
+		list_add_tail(&msg->node, &ctx->block_list);
 
 	return msg;
 }
@@ -180,9 +179,8 @@ void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx)
 	union interrupt_reg_mrfld isr;
 	union interrupt_reg_mrfld imr;
 	union ipc_header_mrfld clear_ipc;
-	unsigned long irq_flags;
 
-	spin_lock_irqsave(&sst_drv_ctx->ipc_spin_lock, irq_flags);
+	guard(spinlock_irqsave)(&sst_drv_ctx->ipc_spin_lock);
 	imr.full = sst_shim_read64(sst_drv_ctx->shim, SST_IMRX);
 	isr.full = sst_shim_read64(sst_drv_ctx->shim, SST_ISRX);
 
@@ -200,7 +198,6 @@ void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx)
 	/* un mask busy interrupt */
 	imr.part.busy_interrupt = 0;
 	sst_shim_write64(sst_drv_ctx->shim, SST_IMRX, imr.full);
-	spin_unlock_irqrestore(&sst_drv_ctx->ipc_spin_lock, irq_flags);
 }
 
 
-- 
2.43.0

