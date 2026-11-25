Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590879;
	b=OHHi1z2K5j1ngJ/ub3qQhcD1KsX4xX+XCdvukAVJ7YTmb0NWYUChXT+YU/tlaJDZPFUz
	 GwpTDRoTnxTwX/JofMPoIEmLHna69jfE3fMvBf4hiurLohvEwOQ9hObc64MBSbwJP3qXN
	 2Z3194cFDa6uffpyc/KEYwZfL9e0w6UWu2yPRww3sxDVjNJdXXQWZVTG9bM6+fcgf3X3s
	 yV3zo0vfSVm+CtoMwG/FPUsv0W0Q31GJLB0r+9ABYeLF6Pp9nvEcf0CdLt3FzUEpnxXWm
	 aetKw01l+SRKHEVEpZJqsrC0WX/duQpaNoLP1zz/HG2RJqf+zZqx4PDxHRQIKC6dSVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590879;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=dBI2RYLDZVzemBXrOdKSUj2V9jC1KWDMszq6Q2TiGfA=;
	b=P0IzsbX/WQ4oC9tRwAUHy/5xBJP+Z0VV8ihV0rYR3wMUQNFHikSGs9czFQ8ygx84rpnC
	 PbBF1whSCLu3SrIs1D6gpMhefdZOXYpanjjLGDZHzi8V709oUMD7bggZLIckCD6T4Uop0
	 n3/PDMhUsgf1TGcdKGl1Gha3vR2EPs78LBvxc4t8HiLHsSxHd9Zt6dzu1QVctLLleCxSd
	 iwxEWmTKJzuhfxRQCky1gZcYsdDC7ke90LzkKwFRiUHeVd38dpobfFIhUJbOyXfQOxyRc
	 AGj3+7wmc7gVNHUB9rAyPfn45MMVvhcAWlPbkjbRlnIn7uXMi/w33e+2fS9JvqgYwog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g9mEIOw+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p8ao74yp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g9mEIOw+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p8ao74yp;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF8606A680
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 07:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FAF8606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g9mEIOw+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p8ao74yp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g9mEIOw+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p8ao74yp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 98E541F395;
	Wed, 25 Nov 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795590876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBI2RYLDZVzemBXrOdKSUj2V9jC1KWDMszq6Q2TiGfA=;
	b=g9mEIOw+c12oeZG3zZV/OSVCUvrsm5NiyeQXe3UsW88iCAm3Dj3EMtW5dOhAPbUb+MOhGQ
	9NLAiWW9kLAvByCveLCQiIpo1UHrAiWq6CDpYMH7Xocj7YyhF6XLnOUutfE18c/IUbCBFM
	pyZagi8bSS9u/AIaD5WZIe2n2eDls5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795590876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBI2RYLDZVzemBXrOdKSUj2V9jC1KWDMszq6Q2TiGfA=;
	b=p8ao74ypiuGWaoFasJAl7eDzGAaWeo45FAiMepv5tu6mVYm3bBAqs4ecohzJ9dSfDBQRBs
	QxdatqlHQQa1t+Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g9mEIOw+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p8ao74yp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795590876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBI2RYLDZVzemBXrOdKSUj2V9jC1KWDMszq6Q2TiGfA=;
	b=g9mEIOw+c12oeZG3zZV/OSVCUvrsm5NiyeQXe3UsW88iCAm3Dj3EMtW5dOhAPbUb+MOhGQ
	9NLAiWW9kLAvByCveLCQiIpo1UHrAiWq6CDpYMH7Xocj7YyhF6XLnOUutfE18c/IUbCBFM
	pyZagi8bSS9u/AIaD5WZIe2n2eDls5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795590876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBI2RYLDZVzemBXrOdKSUj2V9jC1KWDMszq6Q2TiGfA=;
	b=p8ao74ypiuGWaoFasJAl7eDzGAaWeo45FAiMepv5tu6mVYm3bBAqs4ecohzJ9dSfDBQRBs
	QxdatqlHQQa1t+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5202E1339F;
	Wed, 25 Nov 2026 07:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9l9CtyKBmu1HQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 07:14:36 +0000
Date: Wed, 25 Nov 2026 08:14:35 +0100
Message-ID: <87tsl58js4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Miloslav Brada <email@miloslavbrada.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [BUG] ALSA: usb-audio: list_add corruption in push_back_to_ready_list() on 7.3.4
In-Reply-To: <awZs88beIhMcOchv@genesis.transkript.cz>
References: <awZs88beIhMcOchv@genesis.transkript.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -11.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 98E541F395

On Wed, 25 Nov 2026 06:06:59 +0100,
Miloslav Brada wrote:
(snip)
> Possible fix (untested, only a sketch)
> --------------------------------------
> 
> 1) Check the state again under ep->lock. stop_urbs() changes the state
>    before it takes ep->lock to flush the list, so any push that takes
>    the lock after the flush sees !running:
> 
> 	static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
> 					    struct snd_urb_ctx *ctx)
> 	{
> 		guard(spinlock_irqsave)(&ep->lock);
> 		/* don't re-queue after stop_urbs() flushed the list */
> 		if (!ep_state_running(ep))
> 			return;
> 		if (list_empty(&ctx->ready_list))
> 			list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
> 	}
> 
>    (snd_usb_endpoint_start() sets RUNNING before its fill_rest loop,
>    so that caller is not affected.)

Yes, this should cover in your particular case, and that'll be likely
the easiest fix for now.  Could you check the below?

But for a long-term solution, we'd need to improve the EP state change
and link change more tightly covered by the proper locking instead of
the current atomic check.


thanks,

Takashi

--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -449,6 +449,9 @@ static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
 				    struct snd_urb_ctx *ctx)
 {
 	guard(spinlock_irqsave)(&ep->lock);
+	/* don't re-queue after stop_urbs() flushed the list */
+	if (!ep_state_running(ep))
+		return;
 	/* ctx may still be linked: a stale completion racing a stop/restart. */
 	if (list_empty(&ctx->ready_list))
 		list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
