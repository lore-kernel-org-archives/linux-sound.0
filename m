Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777407;
	b=QcVCqGqncIVU2I0SXZRPDAOAJFMcv7kvzbE8k3Gx/nbwqPl0KMXQcrvMeOCiuq7Ukvwj
	 AqFYYl+/5muamMdV0j0A3E8VzStWqwEX46EHJ1bTLkQr/eDkWwpT2lrUIyEFrCwQdynQ/
	 S1KXhcx6r3urqYqTB0U9iGhpEUFrN+SROFI6Z6ZRY9bVeZRXrDovNsyDXg7yoh3veY3Tb
	 C/6ubkcvfvTffI0DXh7VFmcl2vNf7Ap4I+mAq+0cGJY9vsZEW4yr77eY+qYErYB/Z90sl
	 KN/ibXfT0VK/juAVdQp0uzk4L8+I3ieeVNIuYgPtCJ7l2KZGjqjH0NA+AQpcxs0CijA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777407;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=S3SrCHCwk6BAKWXVnhjVzpnJ6Mzpbi9ZiVkWv+2Nb3U=;
	b=BYgPPtidzC3JXifmgwTK6GHYmHyYa5L/XJy0KzsVtjktukB37jw7CoPBKCR6N5Kf1vUk
	 St15JR3H3g34GdnX6zz1KYhXhv3lCB9TwUGn6sOe2wtT7bVzLw/mETDwtYOguNazzSN/Q
	 VFdzeSUZ17U5t/V3G5RNEPGaaEAbUtXwe3iVbXZne3alZQ5GT/Ng3zcPgKbCK9rbXbBft
	 xDQpua5xZl9KT4I2AYaAhL2Eq3gIm7+I3brmjsrK1UGwpwh84p4P1nqSn429Wn/fAiPwr
	 vLi3V2J4iI1XWUp631KX85YHZFir6PdiXxR9Ph00r9Y/xPOiAR0W/ltmLfV67Y2xtsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="EPqzKPa/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tmwVX4dD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="0rkF/Ybv";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="IIxl4c/0";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21F4606A32E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 07:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21F4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EPqzKPa/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tmwVX4dD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0rkF/Ybv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IIxl4c/0
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0EB722011;
	Wed,  4 Nov 2026 07:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793777405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3SrCHCwk6BAKWXVnhjVzpnJ6Mzpbi9ZiVkWv+2Nb3U=;
	b=EPqzKPa/vsIzvS0zY4qvRrnJ1fpyhgXrJig0/SYaUfdx5ntcOvr2GXLcuWlf6yFjfB+Naq
	E4D23VtCZqYMJzuua8rJJZg9hXtzqyTCCnJum9Jdj5jXmD1kdvzvIR4je+jZdmpJ0RF6+I
	bB/lCB/b9d9ZJcN9MKJfZ7RRISq9+pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793777405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3SrCHCwk6BAKWXVnhjVzpnJ6Mzpbi9ZiVkWv+2Nb3U=;
	b=tmwVX4dD658j89zc000wdeEibFrjtUAil97JOXYGhCgrJ4q9G/9K2XG1S4DoUbWnnDCgTF
	UoXJwwCNleKIuWCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793777404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3SrCHCwk6BAKWXVnhjVzpnJ6Mzpbi9ZiVkWv+2Nb3U=;
	b=0rkF/Ybvrq7clFXyHQc3CZz3Vc/aV0O3VLtkLnkxg0cdxLsULs+mE6GJEcqwPxgMDzXrmu
	4R/6agL109dKJlHwkZp4vmDSNc55wF9lBWutEK4X6a6cxYIBT99++l5L+IqRWwFZQoAtu0
	LWvdmRudRHK0cgenrntMvu0imHObJpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793777404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3SrCHCwk6BAKWXVnhjVzpnJ6Mzpbi9ZiVkWv+2Nb3U=;
	b=IIxl4c/0gFOOaS9b2qbneefwtVgzaCes8N0anmkvEYA4f9WZeMFxgawXcuATZs9nCvvfm4
	GxnDS6cS5GOtv/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6005D134A5;
	Wed,  4 Nov 2026 07:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IZ83Dvze6mpVOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 07:30:04 +0000
Date: Wed, 04 Nov 2026 08:30:03 +0100
Message-ID: <87jymtuk90.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Vincent Cloutier <vincent.cloutier@icloud.com>,
	Takashi Iwai <tiwai@suse.de>,
	Vincent Cloutier <vincent@cloutier.co>,
	Cen Zhang <zzzccc427@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>,
	Damien Stewart <hypexed@yahoo.com.au>,
	Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PATCH] ALSA: pcm: Allow HW_REFINE queries with mapped buffers
In-Reply-To: <18b03c3e-a6d7-f500-50ce-3097d01ab042@xenosoft.de>
References: <874idyx9n6.wl-tiwai@suse.de>
	<20261104004113.546712-1-vincent.cloutier@icloud.com>
	<18b03c3e-a6d7-f500-50ce-3097d01ab042@xenosoft.de>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,icloud.com,xtra.co.nz,yahoo.com.au];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[icloud.com,suse.de,cloutier.co,gmail.com,perex.cz,vger.kernel.org,xtra.co.nz,yahoo.com.au,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 04 Nov 2026 06:27:00 +0100,
Christian Zigotzky wrote:
> 
> On 11/04/2026 01:40 AM, Vincent Cloutier wrote:
> > From: Vincent Cloutier <vincent@cloutier.co>
> > 
> > PulseAudio 16.1 queries supported formats after configuring and mapping
> > a PCM buffer. Sharing HW_PARAMS' state checker with HW_REFINE causes
> > these queries to fail with -EBADFD because a non-OSS stream has active
> > buffer mappings. PulseAudio then fails to create its sinks and sources.
> > 
> > Make the mmap restriction optional in the shared state checker. Keep it
> > for HW_PARAMS, which can reconfigure the mapped buffer, but skip it for
> > HW_REFINE, which only refines the caller's constraint structure. Keep
> > the stream-state checks and buffer access locking for native, compat
> > and legacy refinement ioctls rather than bypassing their wrapper.
> > Leave the accepted stream states unchanged.
> > 
> > On Librem 5, both L5 and Modem cards reproduce the failure for playback
> > and capture: refinement succeeds before setup and after RW setup, but
> > fails after MMAP setup in PREPARED state. With this change, all eight
> > cases pass, PulseAudio starts normally and audible playback works.
> > The reproducer does not start streams or transfer audio data.
> > 
> > Fixes: ad28d2f607d1 ("ALSA: pcm: Serialize and check HW_REFINE ioctls")
> > Link: https://lore.kernel.org/linux-sound/41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de/
> > Link: https://lore.kernel.org/linux-sound/874idyx9n6.wl-tiwai@suse.de/
> > Assisted-by: OpenCode:GPT-6.1 Sol
> > Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
> > ---
> >   sound/core/pcm_native.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> > index 5cbf88da7626..01d9f5ad4ea9 100644
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -776,14 +776,15 @@ static void pcm_qos_req_update(struct snd_pcm_substream *substream, int usecs)
> >   					    usecs);
> >   }
> >   -static int hw_params_state_check(struct snd_pcm_substream
> > *substream)
> > +static int hw_params_state_check(struct snd_pcm_substream *substream,
> > +				 bool check_mmap)
> >   {
> >   	guard(pcm_stream_lock_irq)(substream);
> >   	switch (substream->runtime->state) {
> >   	case SNDRV_PCM_STATE_OPEN:
> >   	case SNDRV_PCM_STATE_SETUP:
> >   	case SNDRV_PCM_STATE_PREPARED:
> > -		if (!is_oss_stream(substream) &&
> > +		if (check_mmap && !is_oss_stream(substream) &&
> >   		    atomic_read(&substream->mmap_count))
> >   			return -EBADFD;
> >   		return 0;
> > @@ -806,7 +807,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
> >   	err = snd_pcm_buffer_access_lock(runtime);
> >   	if (err < 0)
> >   		return err;
> > -	err = hw_params_state_check(substream);
> > +	err = hw_params_state_check(substream, true);
> >   	if (err)
> >   		goto unlock;
> >   @@ -944,7 +945,8 @@ static int snd_pcm_hw_refine_with_lock(struct
> > snd_pcm_substream *substream,
> >   	err = snd_pcm_buffer_access_lock(runtime);
> >   	if (err < 0)
> >   		return err;
> > -	err = hw_params_state_check(substream);
> > +	/* Refinement queries constraints without changing the mapped buffer. */
> > +	err = hw_params_state_check(substream, false);
> >   	if (err)
> >   		goto unlock;
> >   
> > base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> @Takashi
> 
> Should I still try to find out which replacement of
> snd_pcm_hw_refine_with_lock() actually matters or has the issue been
> sorted out with Vincent's patch?

Try Vincent's patch at first.  If it doesn't help, go for further
investigations.


thanks,

Takashi
