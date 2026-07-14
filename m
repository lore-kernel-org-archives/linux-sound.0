Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5D477986
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036327; cv=none; b=en01kdfEFgkkesM6lMntWwPrFMPN74aqCo029BKg/bjOLj0w+la2R9SvcCJsj7p+sKmmttJbaEs5/t0F7gfjdrOYxcU4BK1Gli0RguIK9LvzlZgmIdqIVkHaEctC8k8ZYRTjX4NwpWZNC+5zkESzjUmVADHJ8qth5sjRaoEKWXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036327; c=relaxed/simple;
	bh=/Wc6mhR78UAEiSQyZG+xiqb9XnfBNIr1JEq0T2KNkpo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkA8xrY8MsBth2tSMJwLnXnLpW9tpyzNXJ9V6aw67Kd2Zu6QKyQ99uy5I3taPMaK3rEuzADCHyISP7zb6/4kKX6JT1NB8KdbYihjMMIjWP3PqrnLTUGHOQQpG5MFASuSnx8zNIjQe0OjXm3cqqd4imKpnC/ScxGYOArMhXy/AeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=psrNMcmT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GS0w9ZF6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=psrNMcmT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GS0w9ZF6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="psrNMcmT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GS0w9ZF6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="psrNMcmT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GS0w9ZF6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AA7D3DF4;
	Tue, 14 Jul 2026 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784036323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJgfRctefVvLHKw1bswhtN3cAhlMZWoQWCAaAHQNEVY=;
	b=psrNMcmTmF6k2W+Gs7BCkRGwE1VmupfdNV9Z0AJUfHXhydZE6D0YOsFSeCMZpMiiHuoFLs
	ynxLRJlPo23xu++IaQ4mVivAyZIMlu3n6aQTCssLdT4P76cZY4fQPv3E6YcA60rNmLucoY
	7Oz40llNzhwJ9uoxvunX8Rlk4IleTzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784036323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJgfRctefVvLHKw1bswhtN3cAhlMZWoQWCAaAHQNEVY=;
	b=GS0w9ZF6kVP4z4WE9cW/f5exLSiJBJV26IyGbQWCNLX2+ctzZp0wHcFkNBPYBPatjOgbM3
	0zUIuVFQi75Sv2DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=psrNMcmT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GS0w9ZF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784036323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJgfRctefVvLHKw1bswhtN3cAhlMZWoQWCAaAHQNEVY=;
	b=psrNMcmTmF6k2W+Gs7BCkRGwE1VmupfdNV9Z0AJUfHXhydZE6D0YOsFSeCMZpMiiHuoFLs
	ynxLRJlPo23xu++IaQ4mVivAyZIMlu3n6aQTCssLdT4P76cZY4fQPv3E6YcA60rNmLucoY
	7Oz40llNzhwJ9uoxvunX8Rlk4IleTzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784036323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJgfRctefVvLHKw1bswhtN3cAhlMZWoQWCAaAHQNEVY=;
	b=GS0w9ZF6kVP4z4WE9cW/f5exLSiJBJV26IyGbQWCNLX2+ctzZp0wHcFkNBPYBPatjOgbM3
	0zUIuVFQi75Sv2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AFCB779AE;
	Tue, 14 Jul 2026 13:38:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uuWGGeM7Vmo8aQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 13:38:43 +0000
Date: Tue, 14 Jul 2026 15:38:43 +0200
Message-ID: <878q7dzo64.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	Gordon Chen <chengordon326@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	jussi@sonarnerd.net,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@linux.intel.com
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio device
In-Reply-To: <474deb99-7ac2-40cf-a5a3-c2a3feb064b9@kylinos.cn>
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
	<18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
	<5ed9e0a3-e8ac-4295-b876-dcda8b96ca1e@kylinos.cn>
	<87tsq2yq70.wl-tiwai@suse.de>
	<474deb99-7ac2-40cf-a5a3-c2a3feb064b9@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,suse.com,kernel.org,sonarnerd.net,vivo.com,rong.moe,b4.vu,uniontech.com,iki.fi,vger.kernel.org,linux.intel.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9AA7D3DF4
X-Spam-Score: -3.51

On Tue, 14 Jul 2026 15:02:09 +0200,
Zhang Heng wrote:
> 
> > On Tue, 14 Jul 2026 03:58:08 +0200,
> > Zhang Heng wrote:
> >>> On Mon, Jul 13, 2026 at 04:10:48PM +0800, Zhang Heng wrote:
> >>>> +		/* Generic USB Audio (0x1e0b:d01e): use SIA for consistent scheduling */
> >>>> +		if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e))
> >>>> +			u->urb->transfer_flags |= URB_ISO_ASAP;
> >>> Not a maintainer, just a bystander who was Cc'd -- two small notes on the
> >>> form of the patch, plus one question I can't answer myself.
> >>> 
> >>> A per-device usb_id comparison in the endpoint.c fast path seems like the
> >>> kind of thing the quirk_flags_table in quirks.c exists to avoid. Would a
> >>> QUIRK_FLAG_ISO_ASAP (set in the table, tested here as
> >>> chip->quirk_flags & QUIRK_FLAG_ISO_ASAP) work for you? It keeps endpoint.c
> >>> device-agnostic, and the next device with the same symptom becomes a
> >>> one-line table entry rather than another if.
> >> First of all, let me clarify: this issue occurs when there is startup music,
> >> but it plays normally after entering the system. There is a heavy creaking
> >> sound when the system is turned on here. Based on the information from dmesg
> >> and syslog, there are a large number of xhci hcd frame synchronization
> >> failures. I tried adding URB_ISO_ASAP here, and it will be much better,
> >> with only a little noise.
> > OK, but it still makes sense to deal URB_ISO_ASAP workaround more
> > generically.
> > 
> >>>> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
> >>>> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> >>>> +		ep->skip_packets = 4;
> >>> The block immediately above this one already does exactly
> >>> "type == SND_USB_ENDPOINT_TYPE_SYNC -> skip_packets = 4"; adding the ID to
> >>> that condition would avoid the duplicate if. Also, the changelog doesn't
> >>> say what this hunk contributes on its own -- is URB_ISO_ASAP alone
> >>> insufficient, and if so, what does skipping the first 4 sync packets fix
> >>> that ASAP doesn't? Right now the two changes are indistinguishable in the
> >>> commit message, and skip_packets = 4 reads as belt-and-braces.
> >> As mentioned above, there is still a bit of noise when only adding
> >> URB_ISO_ASAP,
> >> 
> >> but skip-packets=4 can solve this problem.
> > Well, one missing thing is to understand why this fixes.
> > Originally, the skip_packets=4 for Playback Design devices was
> > introduced for bogus feedback packets at the start of the stream long
> > time ago.  But that's the only known device that needs it.  Does your
> > device send also 4 bogus packets?
> > 
> > The skip_packets=16 for M-Audio devices are rather for avoiding the
> > latency.  And, speaking of latency, I have a patch for the lowlatency
> > support of implicit fb mode, but never had a test environment.
> > Could you check the patch below and see the patch below has any
> > positive/negative influence?  Just to be sure.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > -- 8< --
> > index 682b6c1fe76b..6d144e39a849 100644
> > --- a/sound/usb/pcm.c
> > +++ b/sound/usb/pcm.c
> > @@ -265,6 +265,7 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip,
> >   	return 0;
> >   }
> >   +/* stop both data and sync endpoints */
> >   static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
> >   {
> >   	bool stopped = 0;
> > @@ -280,6 +281,24 @@ static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
> >   	return stopped;
> >   }
> >   +/* only start sync endpoint */
> > +static int start_sync_endpoint(struct snd_usb_substream *subs)
> > +{
> > +	int err;
> > +
> > +	if (subs->sync_endpoint &&
> > +	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
> > +		err = snd_usb_endpoint_start(subs->sync_endpoint);
> > +		if (err < 0) {
> > +			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* start both data and sync endpoints */
> >   static int start_endpoints(struct snd_usb_substream *subs)
> >   {
> >   	int err;
> > @@ -295,14 +314,9 @@ static int start_endpoints(struct snd_usb_substream *subs)
> >   		}
> >   	}
> >   -	if (subs->sync_endpoint &&
> > -	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
> > -		err = snd_usb_endpoint_start(subs->sync_endpoint);
> > -		if (err < 0) {
> > -			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
> > -			goto error;
> > -		}
> > -	}
> > +	err = start_sync_endpoint(subs);
> > +	if (err < 0)
> > +		goto error;
> >     	return 0;
> >   @@ -656,12 +670,16 @@ static int
> > lowlatency_playback_available(struct snd_pcm_runtime *runtime,
> >   		return false;
> >   	if (in_free_wheeling_mode(runtime))
> >   		return false;
> > -	/* implicit feedback mode has own operation mode */
> > -	if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
> > -		return false;
> >   	return true;
> >   }
> >   +/* return true if it's a normal playback (not in implicit fb) */
> > +static bool is_normal_lowlatency_playback(struct snd_usb_substream *subs)
> > +{
> > +	return subs->lowlatency_playback &&
> > +		!snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint);
> > +}
> > +
> >   /*
> >    * prepare callback
> >    *
> > @@ -709,9 +727,11 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
> >   	runtime->delay = 0;
> >     	subs->lowlatency_playback =
> > lowlatency_playback_available(runtime, subs);
> > -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
> > -	    !subs->lowlatency_playback) {
> > -		ret = start_endpoints(subs);
> > +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > +		if (!subs->lowlatency_playback)
> > +			ret = start_endpoints(subs);
> > +		else if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
> > +			ret = start_sync_endpoint(subs);
> >   		/* if XRUN happens at starting streams (possibly with implicit
> >   		 * fb case), restart again, but only try once.
> >   		 */
> > @@ -1539,7 +1559,7 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
> >   		frame_limit = subs->frame_limit + ep->max_urb_frames;
> >   		transfer_done = subs->transfer_done;
> >   -		if (subs->lowlatency_playback &&
> > +		if (is_normal_lowlatency_playback(subs) &&
> >   		    runtime->state != SNDRV_PCM_STATE_DRAINING) {
> >   			unsigned int hwptr = subs->hwptr_done / stride;
> >   @@ -1625,7 +1645,8 @@ static int prepare_playback_urb(struct
> > snd_usb_substream *subs,
> >   			subs->trigger_tstamp_pending_update = false;
> >   		}
> >   -		if (period_elapsed && !subs->running &&
> > subs->lowlatency_playback) {
> > +		if (period_elapsed && !subs->running &&
> > +		    is_normal_lowlatency_playback(subs)) {
> >   			subs->period_elapsed_pending = 1;
> >   			period_elapsed = 0;
> >   		}
> > @@ -1677,7 +1698,7 @@ static int snd_usb_pcm_playback_ack(struct snd_pcm_substream *substream)
> >   	struct snd_usb_substream *subs = substream->runtime->private_data;
> >   	struct snd_usb_endpoint *ep;
> >   -	if (!subs->lowlatency_playback || !subs->running)
> > +	if (!is_normal_lowlatency_playback(subs) || !subs->running)
> >   		return 0;
> >   	ep = subs->data_endpoint;
> >   	if (!ep)
> > @@ -1705,6 +1726,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
> >   					      prepare_playback_urb,
> >   					      retire_playback_urb,
> >   					      subs);
> > +		/* start EPs for both normal and implicit-fb modes */
> >   		if (subs->lowlatency_playback &&
> >   		    cmd == SNDRV_PCM_TRIGGER_START) {
> >   			if (in_free_wheeling_mode(substream->runtime))
> Regarding your patch, I am unable to test it because my current
> kernel is based on a certain stable version of 5.4. The
> differences in pcm.c are too significant, so the patch cannot
> be applied directly.

Please verify whether the problem really exists with the latest
kernel at first.  At least we have to be sure about the workaround
with URB_ISO_ASAP for the latest kernel before taking to the upstream.


thanks,

Takashi
