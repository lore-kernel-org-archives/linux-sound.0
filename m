Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617437;
	b=N/NjCYL+CfwEMuJfOK8Kj3gVjO0Qr0AIbDUMJs9Reqiq/71dchzd9HRv9xDzNEOPgVbq
	 tkXVpc5edyqLMndEXQZXlsM9mWE/GNtOMkcZWJk3IKZ/dbPXqYq8kHbNTdm6unWadQ+nn
	 svi868Hf0jxjS2V7MXk+HVppjJe0LMIkve5UpFFktnS9c72zQuU+lFsgN6TCSX5plzLBu
	 +4ja0qZ1N9/qEVnFmxPbgwyNy5SKQC3hYplPv5rmu1kyEmCAni2+9YQRFSQMsmPiH2fKD
	 0+/X2BBcmOB12PnSxk8fXvlaS0swvfhLE4xg0Ppcl07xVX4g8+evl2nq/cs8jAB7xnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617437;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=a1z6mFKNN7mwM3tDmuN0B/RHnl21libnt36QuB0wxAU=;
	b=4mQjHRQq/hQwo7etVr/NglsjtoaFQJvu5UVQZcO60j4MI1TcEZwLIkgGWMywRurUoIhx
	 Flqc0v+uVRc/+reZwSgNOeDerOvzWNXbHulZNMNeCCzQvQwZ/IF46YpLJzHAjCR+L0SZy
	 k8O6Mh5Qp1FzrdgAxMRdn/QTNt4L9LiUtntIuuz8ZvwbOVjsWsiS4AGLLu4JZAynjRJKm
	 axppebo4/2khQu2dGU1pjPcqA3ffLlryD+O3nyxVAaXaEwr9loWUqFTkkz8upMiOqpNnJ
	 Xl3ouQ5T7+QzsyEZ2/Dko0FlViO/0oHeLaTej3uFYL0DOMYnZgrGvQISIONQR59hkkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aad4DSn7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wnu6LJMx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aad4DSn7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wnu6LJMx;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43A606A33C;
	Wed, 25 Nov 2026 14:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D43A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aad4DSn7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wnu6LJMx;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aad4DSn7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wnu6LJMx
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 39DA21F7A2;
	Wed, 25 Nov 2026 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1z6mFKNN7mwM3tDmuN0B/RHnl21libnt36QuB0wxAU=;
	b=Aad4DSn7C9kBUnsH5l1VtAD2EV77wEFF5qpflP4kmwkoc6HORtGPPcfzYmK0N0AAKOfXDx
	HtumUH2u8ctpwe06WHgs3aUthnu/kTV5HLLxUVsZxWsPjLf+kJuM/OdWyG9SZrN8fACAwT
	rNG2+/kPWv0IW7zzRNqufRomDN/XndU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1z6mFKNN7mwM3tDmuN0B/RHnl21libnt36QuB0wxAU=;
	b=Wnu6LJMxwKdzfPNcaz4l4j2OxKmO+H9UfcS0JUF9AoUvUc6zbECOYujJF/XSSn31E5CSLP
	ZyBP0jouMESzygDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Aad4DSn7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wnu6LJMx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1z6mFKNN7mwM3tDmuN0B/RHnl21libnt36QuB0wxAU=;
	b=Aad4DSn7C9kBUnsH5l1VtAD2EV77wEFF5qpflP4kmwkoc6HORtGPPcfzYmK0N0AAKOfXDx
	HtumUH2u8ctpwe06WHgs3aUthnu/kTV5HLLxUVsZxWsPjLf+kJuM/OdWyG9SZrN8fACAwT
	rNG2+/kPWv0IW7zzRNqufRomDN/XndU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1z6mFKNN7mwM3tDmuN0B/RHnl21libnt36QuB0wxAU=;
	b=Wnu6LJMxwKdzfPNcaz4l4j2OxKmO+H9UfcS0JUF9AoUvUc6zbECOYujJF/XSSn31E5CSLP
	ZyBP0jouMESzygDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA64B134E8;
	Wed, 25 Nov 2026 14:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8vL3JpnyBms5bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:37:13 +0000
Date: Wed, 25 Nov 2026 15:37:13 +0100
Message-ID: <87ecc96kpy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: Re: sound: core: rawmidi input close can re-queue event_work after cancel_work_sync() (UAF)
In-Reply-To: <5a5b96e3.569.1a212bd09ac.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<2033d529.2ad1b.1a2023ca712.Coremail.xuhx@hust.edu.cn>
	<c53ccf5f-7973-4b11-b7ea-7972bc87df97@kernel.org>
	<5a5b96e3.569.1a212bd09ac.Coremail.xuhx@hust.edu.cn>
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
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[perex.cz:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,hust.edu.cn:email];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,perex.cz:email,hust.edu.cn:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 39DA21F7A2

On Wed, 25 Nov 2026 13:45:08 +0100,
徐晗翔 wrote:
> 
> close_substream() cancelled the input event work before clearing
> substream->opened, but snd_rawmidi_receive() serializes only against
> the opened store: a driver that delivers input in that window
> re-queued event_work after the cancellation, and the work then ran
> on the runtime freed by snd_rawmidi_runtime_free() (KASAN UAF in
> snd_rawmidi_input_event_work()).
> 
> Cancel the work a second time after opened is cleared and before
> the runtime is freed.  Also restore the per-substream disconnected
> flag: snd_rawmidi_dev_disconnect() marks input substreams
> disconnected under substream->lock and drains the event work, so a
> driver that keeps calling snd_rawmidi_receive() after the
> disconnect cannot re-queue the work either (snd_rawmidi_receive()
> and snd_rawmidi_input_trigger() check the flag).

This should have been already addressed in the recent upstream code.
Please verify whether you still see the issue.


thanks,

Takashi

> ---
>  sound/core/rawmidi.c    | 23 +++++++++++++++++++++--
>  include/sound/rawmidi.h |  1 +
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
> --- a/sound/core/rawmidi.c
> +++ b/sound/core/rawmidi.c
> @@ -215,7 +215,7 @@
>  
>  static void snd_rawmidi_input_trigger(struct snd_rawmidi_substream *substream, int up)
>  {
> -	if (!substream->opened)
> +	if (!substream->opened || substream->disconnected)
>  		return;
>  	substream->ops->trigger(substream, up);
>  	if (!up)
> @@ -557,6 +557,14 @@
>  		substream->opened = 0;
>  		substream->append = 0;
>  	}
> +	/* Drain the input event work that a racing snd_rawmidi_receive()
> +	 * may have queued after the earlier cancellation in
> +	 * snd_rawmidi_input_trigger(): receive() serializes only against
> +	 * the opened=0 store above, not against the earlier cancel, so the
> +	 * work can be pending again here.  It must not outlive the runtime
> +	 * free below. */
> +	if (substream->stream == SNDRV_RAWMIDI_STREAM_INPUT)
> +		cancel_work_sync(&substream->runtime->event_work);
>  	substream->ops->close(substream);
>  	if (substream->runtime->private_free)
>  		substream->runtime->private_free(substream);
> @@ -1151,7 +1159,7 @@
>  	struct snd_rawmidi_runtime *runtime;
>  
>  	guard(spinlock_irqsave)(&substream->lock);
> -	if (!substream->opened)
> +	if (!substream->opened || substream->disconnected)
>  		return -EBADFD;
>  	runtime = substream->runtime;
>  	if (!runtime || !runtime->buffer) {
> @@ -2065,6 +2073,17 @@
>  		list_for_each_entry(s, &rmidi->streams[dir].substreams, list) {
>  			if (s->runtime)
>  				wake_up(&s->runtime->sleep);
> +			/* mark input substreams disconnected and drain the
> +			 * event work: a driver that keeps calling
> +			 * snd_rawmidi_receive() after the disconnect must
> +			 * not re-queue the work on a runtime that the close
> +			 * path is about to free */
> +			if (s->stream == SNDRV_RAWMIDI_STREAM_INPUT) {
> +				scoped_guard(spinlock_irqsave, &s->lock)
> +					s->disconnected = true;
> +				if (s->runtime)
> +					cancel_work_sync(&s->runtime->event_work);
> +			}
>  		}
>  	}
>  
> diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
> --- a/include/sound/rawmidi.h
> +++ b/include/sound/rawmidi.h
> @@ -84,6 +84,7 @@
>  	int stream;			/* direction */
>  	int number;			/* substream number */
>  	bool opened;			/* open flag */
> +	bool disconnected;		/* device disconnected flag */
>  	bool append;			/* append flag (merge more streams) */
>  	bool active_sensing;		/* send active sensing when close */
>  	unsigned int framing;		/* whether to frame input data */
> -- 
> 
> 
> > -----原始邮件-----
> > 发件人: "Krzysztof Kozlowski" <krzk@kernel.org>
> > 发送时间:2026-11-24 22:52:58 (星期二)
> > 收件人: 徐晗翔 <xuhx@hust.edu.cn>, perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: Re: sound: core: rawmidi input close can re-queue event_work after cancel_work_sync() (UAF)
> > 
> > On 22/11/2026 08:50, 徐晗翔 wrote:
> > > 
> > >   Please keep me in Cc; I am not subscribed to the lists.
> > 
> > 
> > Why? You never responded to any other query we asked for the last month!
> > 
> > 
> > Best regards,
> > Krzysztof
