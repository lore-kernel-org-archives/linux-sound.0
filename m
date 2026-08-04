Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B03822BB
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867544; cv=none; b=Sc1qmZWzamz/OcGQzprEtATsgnHLCZDTE+JlAfSvWZNKVv2HB9YLQms+qFl1n2l//CVbgi1giU6Z8Ndpz8w9XNgZiOaVEIcClz2t/a7VYKeUAAVlycy9XEjDemXnwzJpzkAd7ZrYKiJ3Gx859BbkppIo4C2HR1VYn2nGq9mXMGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867544; c=relaxed/simple;
	bh=bszDY8y5UBg0R1ShE+NZT/csVEu+aXX5zsl5wr4BfzE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rf+hO6ODFahjauwzHSCuQsCZ9rtcYP5XwlQWNOHKOMN7nxbgcMcahryedg33CzKXApuRMwOp2zdVqb5imLyGjjI2qR99208uTj+iplDUp88AYnay4lQgnCEm82tcuVIxhHbKy2XyEv00GV7fT6ye9/M+1i9fPKdvxePrniwNFpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VciLFdFw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SyOZ9WIq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tQMtasTN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rfz7ohPI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VciLFdFw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SyOZ9WIq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tQMtasTN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rfz7ohPI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D05BA3DF3;
	Tue,  4 Aug 2026 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785867536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nlPbLRVFGRc6GM9rZuo/JMr1gNpyMmGL+Zg5M3DBWkc=;
	b=VciLFdFw1Om9vuIhssnW6e6j/V32Bx/BUxNDp1TXqRUVWXhAlfbm8jbFMTAcOn3BsL7X0I
	+sAfVcCYEwKHdPlqpQgjj7023BJLIKGmTFPWTheAQg00U5RqXQDJ8Zw/tiR+JGajTQjwib
	ub3gH2zGUTUPW8xmpNS1qglqY+tLcXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785867536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nlPbLRVFGRc6GM9rZuo/JMr1gNpyMmGL+Zg5M3DBWkc=;
	b=SyOZ9WIqdxUibPiiQpmDSE3E7LkSlGNkdDO63EcaMjOrlOw1ND/oQ3Y4Y/D7LoKXxnq9BM
	kucyRmYFUbCdNQAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785867532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nlPbLRVFGRc6GM9rZuo/JMr1gNpyMmGL+Zg5M3DBWkc=;
	b=tQMtasTNv3X7zJs2/Q8axQJQY07O8WcPMvx5Aghwcc+KtMJOcOrX6+DrrQjSz2fGogrSsU
	847j69urwvfuvrDKj+ZYZIlARrI38w6H9kJKmgx/lxZdHs8escMUQX06a/JZXm3slC7KtZ
	MQK8V4l33HVt23XuRAWWTTx19LCoUnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785867532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nlPbLRVFGRc6GM9rZuo/JMr1gNpyMmGL+Zg5M3DBWkc=;
	b=Rfz7ohPIGJo52aK32TuG4gqo0oka6gdHdCTLTmWC6LD+J5iGKlVz1uqdAsH8Tn55nGB6yB
	umMRHUUj/AG9bVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FCFD779BB;
	Tue,  4 Aug 2026 18:18:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wDzlJQwtcmq2KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 04 Aug 2026 18:18:52 +0000
Date: Tue, 04 Aug 2026 20:18:52 +0200
Message-ID: <87wlu5hhpv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arun Raghavan <arunr@valvesoftware.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"Arun Raghavan" <arun@arunraghavan.net>
Subject: Re: [External Mail] Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
In-Reply-To: <DKGCFDZL0ZPJ.WU7CLZ8ZJKOI@valvesoftware.com>
References: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
	<87tspai11y.wl-tiwai@suse.de>
	<DKGCFDZL0ZPJ.WU7CLZ8ZJKOI@valvesoftware.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arunraghavan.net:email,suse.de:mid,valvesoftware.com:email,imap1.dmz-prg2.suse.org:helo]

On Tue, 04 Aug 2026 19:42:17 +0200,
Arun Raghavan wrote:
> 
> On Tue Aug 4, 2026 at 4:21 AM PDT, Takashi Iwai wrote:
> > On Tue, 04 Aug 2026 00:07:52 +0200,
> > Arun Raghavan wrote:
> >> 
> >> The stream descriptor status register reports FIFO and descriptor
> >> errors, but these are currently cleared silently along with the rest
> >> of the interrupt status. Log them, rate-limited, so DMA problems are
> >> visible instead of only manifesting as audible glitches.
> >> 
> >> Observed on some AMD GPU HDMI audio controllers under specific low power
> >> circumstances.
> >> 
> >> Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
> >> Cc: Arun Raghavan <arun@arunraghavan.net>
> >
> > Applied now to for-next branch.
> >
> > It's interesting at which situation you get the error bit and which
> > one.  If it can be used *reliably* for catching a streaming error, the
> > driver could notify XRUN or error appropriately, too.
> 
> Ah, I should have mentioned that in the commit message. The error bit
> that was signalled was SD_INT_FIFO_ERR -- the status byte was read as
> (SD_STS_FIFO_READY | SD_INT_FIFO_ERR).
> 
> We are still working on pinning down the precise cause in this case, but
> it seems to be related to issues in some specific setups during lower
> frequency memory clock transitions. The error manifests as a short
> dropout caused by what appears to be a stall or missed transfer. The
> frequency of dropouts varies from several per minute to one every few
> minutes.
> 
> In such a case, the existence of XRUNs might be good to know further up
> the stack, though it isn't clear that there is much that userspace can
> autonomously do to mitigate the it.

When we do stop the stream as XRUN and notifies to user-space, usually
it tries to recover / restart -- something like below.

But it's hard to judge whether we should do this, or it can lead
rather to misbehavior.  We need experiments.


thanks,

Takashi

-- 8< --
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index aa994d6e6d35..615e48ecb009 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -412,7 +412,9 @@ void snd_hdac_bus_link_power(struct hdac_device *hdev, bool enable);
 void snd_hdac_bus_update_rirb(struct hdac_bus *bus);
 int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
 				    void (*ack)(struct hdac_bus *,
-						struct hdac_stream *));
+						struct hdac_stream *),
+				    void (*error)(struct hdac_bus *,
+						  struct hdac_stream *));
 
 int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus);
 void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus);
diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index afec5c5546ec..329854c9fe92 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -1058,6 +1058,15 @@ static void stream_update(struct hdac_bus *bus, struct hdac_stream *s)
 	}
 }
 
+static void stream_error(struct hdac_bus *bus, struct hdac_stream *s)
+{
+	struct azx_dev *azx_dev = stream_to_azx_dev(s);
+
+	spin_unlock(&bus->reg_lock);
+	snd_pcm_stop_xrun(azx_stream(azx_dev)->substream);
+	spin_lock(&bus->reg_lock);
+}
+
 irqreturn_t azx_interrupt(int irq, void *dev_id)
 {
 	struct azx *chip = dev_id;
@@ -1082,7 +1091,8 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
 
 		handled = true;
 		active = false;
-		if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update))
+		if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update,
+						   stream_error))
 			active = true;
 
 		status = azx_readb(chip, RIRBSTS);
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 78855ac357c6..67bb74c618bf 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -676,8 +676,10 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_stop_chip);
  * Returns the bits of handled streams, or zero if no stream is handled.
  */
 int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
-				    void (*ack)(struct hdac_bus *,
-						struct hdac_stream *))
+				   void (*ack)(struct hdac_bus *,
+					       struct hdac_stream *),
+				   void (*error)(struct hdac_bus *,
+						 struct hdac_stream *))
 {
 	struct hdac_stream *azx_dev;
 	u8 sd_status;
@@ -692,6 +694,8 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
 				dev_warn_ratelimited(bus->dev,
 						"stream %u dma error: 0x%02x\n",
 						azx_dev->index, sd_status);
+				if (error)
+					error(bus, azx_dev);
 			}
 			if ((!azx_dev->substream && !azx_dev->cstream) ||
 			    !azx_dev->running || !(sd_status & SD_INT_COMPLETE))
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 1a53856c2ffb..6a5a6e526c2c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -270,7 +270,8 @@ static irqreturn_t avs_hda_interrupt(struct hdac_bus *bus)
 	u32 status;
 
 	status = snd_hdac_chip_readl(bus, INTSTS);
-	if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream))
+	if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream,
+					   NULL))
 		ret = IRQ_HANDLED;
 
 	spin_lock_irq(&bus->reg_lock);
