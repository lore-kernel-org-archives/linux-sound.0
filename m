Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF4223328
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906976; cv=none; b=CR4Oz34bW8jfF04V9rn8t8kS60TeekQucxYtbODddsAR34N8gAzOKUT3+4xfntUhbj6winxlYMS41BvE7V/ioL5eWSUDNG8CGv0m2yZ+khKdC7B2Sj19M1zceIozRWtyTOjssxdkKWS2EBxd4GslZ6pVOTWkE1KMlyaO5PtxyE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906976; c=relaxed/simple;
	bh=BsG8x9kLBwo88mtsF4Dxn93vkeuffnsA14ampfzIRnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKG+BpNkrbdFsHbty1BSjuipDc4rd2+wtgULGc49PWH9VPjc6jBUKf/mBhFpPpGIm+16ihbcbAcopXDIMuakJL+HuiPUBtxPDltK+HCt9MiNDhV9jouSoXx52kd+zy8Qe7c99LWNwi3kf3IBa4gHhFwhW9PbFvUum78w0vp6W2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IXFPfer+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGDNAVC8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IXFPfer+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGDNAVC8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IXFPfer+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGDNAVC8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IXFPfer+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGDNAVC8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A326E5BE4E;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBB6jjWhMvKqoOzDlurdQLAxG87p38/ZAHqBJucYx9M=;
	b=IXFPfer+WJ01RTuE2MfUxRKO8XvKKyygtjzX7LavXyLWVj59MqyQ+s54VjPapd2eEijt4K
	pQPXlPGLuL7WoRjHVQS2KzSs51yo9i25Gsi6/wsM2GWxVe0jCq/UsC8rPprkVbfyCr1b3J
	s9JH/yrmMOl3/A65zhhKvYab+XjXeCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBB6jjWhMvKqoOzDlurdQLAxG87p38/ZAHqBJucYx9M=;
	b=JGDNAVC83HpFwLmUeGoZqPsCOeTekO7j7p8SBEhD1VjRDqFeQltOkc/WQE/0aCxEyBuEcL
	27Q1b0Hcuz0s9EBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBB6jjWhMvKqoOzDlurdQLAxG87p38/ZAHqBJucYx9M=;
	b=IXFPfer+WJ01RTuE2MfUxRKO8XvKKyygtjzX7LavXyLWVj59MqyQ+s54VjPapd2eEijt4K
	pQPXlPGLuL7WoRjHVQS2KzSs51yo9i25Gsi6/wsM2GWxVe0jCq/UsC8rPprkVbfyCr1b3J
	s9JH/yrmMOl3/A65zhhKvYab+XjXeCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBB6jjWhMvKqoOzDlurdQLAxG87p38/ZAHqBJucYx9M=;
	b=JGDNAVC83HpFwLmUeGoZqPsCOeTekO7j7p8SBEhD1VjRDqFeQltOkc/WQE/0aCxEyBuEcL
	27Q1b0Hcuz0s9EBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A4F713A7E;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8PHNGBLBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 23/25] ALSA: hda/core: Use guard() for spinlocks
Date: Mon, 11 Aug 2025 12:07:57 +0200
Message-ID: <20250811100807.7962-24-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/controller.c | 58 +++++++++++++++----------------------
 sound/hda/core/stream.c     | 22 +++++---------
 2 files changed, 31 insertions(+), 49 deletions(-)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index b5c833b9f8b9..a7c00ad80117 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -44,7 +44,7 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 {
 	WARN_ON_ONCE(!bus->rb.area);
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	/* CORB set up */
 	bus->corb.addr = bus->rb.addr;
 	bus->corb.buf = (__le32 *)bus->rb.area;
@@ -86,7 +86,6 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_init_cmd_io);
 
@@ -112,18 +111,17 @@ static void hdac_wait_for_cmd_dmas(struct hdac_bus *bus)
  */
 void snd_hdac_bus_stop_cmd_io(struct hdac_bus *bus)
 {
-	spin_lock_irq(&bus->reg_lock);
-	/* disable ringbuffer DMAs */
-	snd_hdac_chip_writeb(bus, RIRBCTL, 0);
-	snd_hdac_chip_writeb(bus, CORBCTL, 0);
-	spin_unlock_irq(&bus->reg_lock);
+	scoped_guard(spinlock_irq, &bus->reg_lock) {
+		/* disable ringbuffer DMAs */
+		snd_hdac_chip_writeb(bus, RIRBCTL, 0);
+		snd_hdac_chip_writeb(bus, CORBCTL, 0);
+	}
 
 	hdac_wait_for_cmd_dmas(bus);
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	/* disable unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, 0);
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_stop_cmd_io);
 
@@ -171,9 +169,8 @@ static int snd_hdac_bus_send_cmd_pio(struct hdac_bus *bus, unsigned int val)
 {
 	unsigned int addr = azx_command_addr(val);
 	int timeout = 50;
-	int ret = -EIO;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 
 	while (timeout--) {
 		/* check ICB bit */
@@ -184,8 +181,7 @@ static int snd_hdac_bus_send_cmd_pio(struct hdac_bus *bus, unsigned int val)
 			/* Set ICB bit */
 			snd_hdac_chip_updatew(bus, IRS, AZX_IRS_BUSY, AZX_IRS_BUSY);
 
-			ret = snd_hdac_bus_wait_for_pio_response(bus, addr);
-			goto out;
+			return snd_hdac_bus_wait_for_pio_response(bus, addr);
 		}
 		udelay(1);
 	}
@@ -193,10 +189,7 @@ static int snd_hdac_bus_send_cmd_pio(struct hdac_bus *bus, unsigned int val)
 	dev_dbg_ratelimited(bus->dev, "send_cmd_pio timeout: IRS=%#x, val=%#x\n",
 			    snd_hdac_chip_readw(bus, IRS), val);
 
-out:
-	spin_unlock_irq(&bus->reg_lock);
-
-	return ret;
+	return -EIO;
 }
 
 /**
@@ -228,7 +221,7 @@ static int snd_hdac_bus_send_cmd_corb(struct hdac_bus *bus, unsigned int val)
 	unsigned int addr = azx_command_addr(val);
 	unsigned int wp, rp;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 
 	bus->last_cmd[azx_command_addr(val)] = val;
 
@@ -236,7 +229,6 @@ static int snd_hdac_bus_send_cmd_corb(struct hdac_bus *bus, unsigned int val)
 	wp = snd_hdac_chip_readw(bus, CORBWP);
 	if (wp == 0xffff) {
 		/* something wrong, controller likely turned to D3 */
-		spin_unlock_irq(&bus->reg_lock);
 		return -EIO;
 	}
 	wp++;
@@ -245,7 +237,6 @@ static int snd_hdac_bus_send_cmd_corb(struct hdac_bus *bus, unsigned int val)
 	rp = snd_hdac_chip_readw(bus, CORBRP);
 	if (wp == rp) {
 		/* oops, it's full */
-		spin_unlock_irq(&bus->reg_lock);
 		return -EAGAIN;
 	}
 
@@ -253,8 +244,6 @@ static int snd_hdac_bus_send_cmd_corb(struct hdac_bus *bus, unsigned int val)
 	bus->corb.buf[wp] = cpu_to_le32(val);
 	snd_hdac_chip_writew(bus, CORBWP, wp);
 
-	spin_unlock_irq(&bus->reg_lock);
-
 	return 0;
 }
 
@@ -333,21 +322,20 @@ static int snd_hdac_bus_get_response_rirb(struct hdac_bus *bus,
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	for (loopcounter = 0;; loopcounter++) {
-		spin_lock_irq(&bus->reg_lock);
-		if (!bus->polling_mode)
-			prepare_to_wait(&bus->rirb_wq, &wait,
-					TASK_UNINTERRUPTIBLE);
-		if (bus->polling_mode)
-			snd_hdac_bus_update_rirb(bus);
-		if (!bus->rirb.cmds[addr]) {
-			if (res)
-				*res = bus->rirb.res[addr]; /* the last value */
+		scoped_guard(spinlock_irq, &bus->reg_lock) {
 			if (!bus->polling_mode)
-				finish_wait(&bus->rirb_wq, &wait);
-			spin_unlock_irq(&bus->reg_lock);
-			return 0;
+				prepare_to_wait(&bus->rirb_wq, &wait,
+						TASK_UNINTERRUPTIBLE);
+			if (bus->polling_mode)
+				snd_hdac_bus_update_rirb(bus);
+			if (!bus->rirb.cmds[addr]) {
+				if (res)
+					*res = bus->rirb.res[addr]; /* the last value */
+				if (!bus->polling_mode)
+					finish_wait(&bus->rirb_wq, &wait);
+				return 0;
+			}
 		}
-		spin_unlock_irq(&bus->reg_lock);
 		if (time_after(jiffies, timeout))
 			break;
 #define LOOP_COUNT_MAX	3000
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index 0caeebcc591a..503bb3fcacc2 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -370,7 +370,7 @@ struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 	if (substream->pcm)
 		key |= (substream->pcm->device << 16);
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(azx_dev, &bus->stream_list, list) {
 		if (azx_dev->direction != substream->stream)
 			continue;
@@ -389,7 +389,6 @@ struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 		res->assigned_key = key;
 		res->substream = substream;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 	return res;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_assign);
@@ -419,9 +418,8 @@ void snd_hdac_stream_release(struct hdac_stream *azx_dev)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	snd_hdac_stream_release_locked(azx_dev);
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_release);
 
@@ -923,13 +921,11 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 	int err;
 
 	guard(snd_hdac_dsp_lock)(azx_dev);
-	spin_lock_irq(&bus->reg_lock);
-	if (azx_dev->running || azx_dev->locked) {
-		spin_unlock_irq(&bus->reg_lock);
-		return -EBUSY;
+	scoped_guard(spinlock_irq, &bus->reg_lock) {
+		if (azx_dev->running || azx_dev->locked)
+			return -EBUSY;
+		azx_dev->locked = true;
 	}
-	azx_dev->locked = true;
-	spin_unlock_irq(&bus->reg_lock);
 
 	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, bus->dev,
 				  byte_size, bufp);
@@ -955,9 +951,8 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
  error:
 	snd_dma_free_pages(bufp);
  err_alloc:
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	azx_dev->locked = false;
-	spin_unlock_irq(&bus->reg_lock);
 	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_dsp_prepare);
@@ -1001,9 +996,8 @@ void snd_hdac_dsp_cleanup(struct hdac_stream *azx_dev,
 	snd_dma_free_pages(dmab);
 	dmab->area = NULL;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	azx_dev->locked = false;
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_dsp_cleanup);
 #endif /* CONFIG_SND_HDA_DSP_LOADER */
-- 
2.50.1

