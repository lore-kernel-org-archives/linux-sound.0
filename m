Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C023EB105
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179230; cv=none; b=Er/+F7Qz+grRShgkaYaX5x7xN0IA8DrX7uLUKCDrLhpsBOAwqKcburihDlEc/H8fDLU83MP96QWOSaC0ueumJ9QIJoeXr/SOi7v4Qi7DRtGTEjGMAS0erM4ekP2N24eOdwALyeXmtF67JKU8jwZe41YPt4gu5v4efNZhHS+02JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179230; c=relaxed/simple;
	bh=eq/gkGLfR9tm82RQg4vtnNIfvzPowe/IyfBc2126z5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXhvwovyS4wA9L117XaJW6fHXFibyPa54kKAcdFC6zIKWhPN7PBDtBnFWlIe4Yj1/6BIJQj8OOVW+NUwyZo9Ap/yxVBuyDZFz3SPB1ysqI3EcdY0SIX/RXhxN2isbsymW5BY9aTg45DR4xjRpVouPx+vUaK8QaCG/2ziXNPTIYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym6yKqax; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym6yKqax"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-372b4330deeso3315451a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179229; x=1781784029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5Kf5J038lfih6KxKA7XwnJbOeOSrjAYMTJJcwO356c=;
        b=Ym6yKqaxIujb5cEYTknV+iJI8Ijr+lMHsuIpkMB+QuYFVfP/PGj9FINvHtxsobtIUP
         p8/iQva4RI287PnwheFEvaTFFEcy39YvkMB1cwem8XRTCzBdIt9Nsu9Y8uRomC8FhzJj
         TVlWR/ZipUzLQ8u4NHjgZ3Qa6KTAs1t+Y/LsIkTecn7U6R8wbaEP8olZ/tYYMrd/jH/e
         8uK3qKq8KOq8KlXjIv8d7ZVS5QiGyPvmU6y2domlfHgOh1SQFKHdVYZiGfhvOuW6a5eY
         Td8SRrumJnaMKZYJJkj5rj+m1Mx84+WMilZ1LvU3gsyQSGHtDae6PsPUXv7vwj2XcLhR
         XcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179229; x=1781784029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5Kf5J038lfih6KxKA7XwnJbOeOSrjAYMTJJcwO356c=;
        b=nGbsjADoE8DB7zp9nAgzX9FCe2G/jsz3Y3cX/5PdYC1Bs25fPsH0Mc0vxwaIVH+DTo
         uwLzMnBCMR7dbUH9M2VQXynOhBEuzO79CkkD20CuqjdydT6UF4y870apIha19PgTpiAu
         QleKLvlx7LtRrZPNkT0yO6Zpn3hbqXiTzxsoFImS0Cl+ofUCa9dJM912Mc1PKj2gItRv
         9uG5uB8ayp7Gq8K5iUrMsMVT9nUPi6lmJCL+vaxI49tfIQGuXvTm6agF6GXe2Hs1qzUR
         yjCq6BhEJo3E2sKXA1J4C7KhBUgcL/KhjuZmF4mw91U8BoLkAtn4xZtkKjDllLyi8eL/
         Mmeg==
X-Forwarded-Encrypted: i=1; AFNElJ//vTA9k1cFb25xpmi4flCmv9kmWEe5A+H2wntZTyaEfYeGNeqV71BlqwriQH0EGZXxyZZeYCg+HyiYoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72bOSItgmjiD3U+23fg0hxoIl9xiWQ5cKDCCbq10ljvwP0kCp
	kij2TgS3FaosgNgfq27WYT6MWBw4mFSALI/LB2MeAJuQDdQ1jmSl7ij7
X-Gm-Gg: Acq92OHlSqhlpUDbVsTTtIvv+U3O8F5A+S019RqHBdgGcyEkWZXsHjKB9oui/YaoAjL
	p/1J1yAFnLCijmN7aiTe5b581Lr5Fw8QuXnSHRkLUZz6ioetkmAez1ihzw5qXI5Y0fyyIMp4gzi
	wwYu9gKnZ0w5hzwkU/qQtPlJjC+cP6jifm+VX1srk7sVwnuDOgRlpwVy8ArV29g7fFmTkixSBoS
	AubyFkN4ieapvSHt5ETq6sh9mXSnoxR0JQEgUpev5NyEMwdp6WDjX0r4M+NYVgDf1ddx7eY43Oo
	XCrJjn1tJjzh5kcyBt1TEAVbWbbZG0YZRwZKUTf2WlKgYbEXBlO/+WUMw1ewiOGglAQd0zC/DUj
	kthQ6Wt9uOsTFh3i525Vrhyu6uR/qpRQcgCA+1DNJFTCbYRY+W8T7QLPukf6sshfF0VEPDJmQRj
	inyF444uC00p8Rq5JrpLzuKVYBqXlJIyCM/MnWv5GnxdWWXOJn/DhQe7mahVT9MwLlm+VT
X-Received: by 2002:a17:90b:2dcb:b0:36d:79c6:1562 with SMTP id 98e67ed59e1d1-377aa88fdb7mr2567629a91.25.1781179229061;
        Thu, 11 Jun 2026 05:00:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:28 -0700 (PDT)
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
Subject: [PATCH 17/20] ASoC: Intel: atom: sst: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:58 +0700
Message-ID: <20260611115901.80438-18-phucduc.bui@gmail.com>
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
 sound/soc/intel/atom/sst/sst.c | 37 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index d9d695ed7cfb..7af76188db3e 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -57,17 +57,17 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 	isr.full = sst_shim_read64(drv->shim, SST_ISRX);
 
 	if (isr.part.done_interrupt) {
-		/* Clear done bit */
-		spin_lock(&drv->ipc_spin_lock);
-		header.full = sst_shim_read64(drv->shim,
-					drv->ipc_reg.ipcx);
-		header.p.header_high.part.done = 0;
-		sst_shim_write64(drv->shim, drv->ipc_reg.ipcx, header.full);
-
-		/* write 1 to clear status register */
-		isr.part.done_interrupt = 1;
-		sst_shim_write64(drv->shim, SST_ISRX, isr.full);
-		spin_unlock(&drv->ipc_spin_lock);
+		scoped_guard(spinlock, &drv->ipc_spin_lock) {
+			/* Clear done bit */
+			header.full = sst_shim_read64(drv->shim,
+						drv->ipc_reg.ipcx);
+			header.p.header_high.part.done = 0;
+			sst_shim_write64(drv->shim, drv->ipc_reg.ipcx, header.full);
+
+			/* write 1 to clear status register */
+			isr.part.done_interrupt = 1;
+			sst_shim_write64(drv->shim, SST_ISRX, isr.full);
+		}
 
 		/* we can send more messages to DSP so trigger work */
 		queue_work(drv->post_msg_wq, &drv->ipc_post_msg_wq);
@@ -76,11 +76,11 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 
 	if (isr.part.busy_interrupt) {
 		/* message from dsp so copy that */
-		spin_lock(&drv->ipc_spin_lock);
-		imr.full = sst_shim_read64(drv->shim, SST_IMRX);
-		imr.part.busy_interrupt = 1;
-		sst_shim_write64(drv->shim, SST_IMRX, imr.full);
-		spin_unlock(&drv->ipc_spin_lock);
+		scoped_guard(spinlock, &drv->ipc_spin_lock) {
+			imr.full = sst_shim_read64(drv->shim, SST_IMRX);
+			imr.part.busy_interrupt = 1;
+			sst_shim_write64(drv->shim, SST_IMRX, imr.full);
+		}
 		header.full =  sst_shim_read64(drv->shim, drv->ipc_reg.ipcd);
 
 		if (sst_create_ipc_msg(&msg, header.p.header_high.part.large)) {
@@ -103,9 +103,8 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 		msg->mrfld_header = header;
 		msg->is_process_reply =
 			sst_is_process_reply(header.p.header_high.part.msg_id);
-		spin_lock(&drv->rx_msg_lock);
-		list_add_tail(&msg->node, &drv->rx_list);
-		spin_unlock(&drv->rx_msg_lock);
+		scoped_guard(spinlock, &drv->rx_msg_lock)
+			list_add_tail(&msg->node, &drv->rx_list);
 		drv->ops->clear_interrupt(drv);
 		retval = IRQ_WAKE_THREAD;
 	}
-- 
2.43.0

