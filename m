Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976E24EF66
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696558; cv=none; b=NpXphnSRoyP6HZ9IqsE0NHKrTU7kWo6yvwnuT+Ik04oj0L/8wBaF2oceVMc/a7P84Y5DFbLuacMA6d+AqqcgAx0lR2clLcvOJgT3w8abeMQCaaO4Wki/uNcc+TVtmgs2mIyuAFceuzBgal+GHU9IpcdmTv92Ks4ktrIsXOpAFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696558; c=relaxed/simple;
	bh=XQYv1Eii0XFfymdhnZZNRO2WhUTQfofEEWKcPFuxoWE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqu8IfX16ANGG+d3AN4D1bWrdzTBbZLdML6itsKYtBq4P+sqxQz/KH3O/3Td2Eq41qOT6+QevaAGBNklPytNXfDXeyHnfBRYeRan62tZ97dVaxy688t6dYd4lNncYhzKaaqirqSC1cYZpLl7l+EQrPja6gPvsoevPD3IhRiDg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vt2DQbsi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=93bPBBp/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vt2DQbsi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=93bPBBp/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vt2DQbsi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93bPBBp/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vt2DQbsi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93bPBBp/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A2721F38A;
	Thu,  3 Apr 2025 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743696554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jR03OKPoN5xQEppV61mXdo1vYLwZBBmMtcZ2LC1jcAo=;
	b=Vt2DQbsiQ1w4ehhw0G8GmNSk5MRFpk2Kj87GM6MzQjcbW8he23OHY2RFGQM2CVneakITGe
	DXJBac2wKXSEsCC+2QDGT70ud/sm3GdRsP97xZhd7I30XJ8LY02q+VMLtOMVNleK4l+vFf
	jXH9G+hJ8bi1l/HNeJNmSO+xXPpccsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743696554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jR03OKPoN5xQEppV61mXdo1vYLwZBBmMtcZ2LC1jcAo=;
	b=93bPBBp/SOZIfU8dLTCksqCZvoUPUPqAD9aPtCZSqvoZE+oxsjCzwXB59hXOeF8r59K1cq
	mAkdDYWjOkSJSFAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Vt2DQbsi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="93bPBBp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743696554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jR03OKPoN5xQEppV61mXdo1vYLwZBBmMtcZ2LC1jcAo=;
	b=Vt2DQbsiQ1w4ehhw0G8GmNSk5MRFpk2Kj87GM6MzQjcbW8he23OHY2RFGQM2CVneakITGe
	DXJBac2wKXSEsCC+2QDGT70ud/sm3GdRsP97xZhd7I30XJ8LY02q+VMLtOMVNleK4l+vFf
	jXH9G+hJ8bi1l/HNeJNmSO+xXPpccsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743696554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jR03OKPoN5xQEppV61mXdo1vYLwZBBmMtcZ2LC1jcAo=;
	b=93bPBBp/SOZIfU8dLTCksqCZvoUPUPqAD9aPtCZSqvoZE+oxsjCzwXB59hXOeF8r59K1cq
	mAkdDYWjOkSJSFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 331531392A;
	Thu,  3 Apr 2025 16:09:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6xg1Cqqy7meMdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Apr 2025 16:09:14 +0000
Date: Thu, 03 Apr 2025 18:09:13 +0200
Message-ID: <87plht447q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	lgirdwood@gmail.com,	broonie@kernel.org,
	tiwai@suse.com,	linux-sound@vger.kernel.org,	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
	<87h637znpp.wl-tiwai@suse.de>
	<35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
	<8734eryn21.wl-tiwai@suse.de>
	<ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
	<87v7rmylc5.wl-tiwai@suse.de>
	<d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
	<87o6xeyfkk.wl-tiwai@suse.de>
	<69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
	<87jz82ye7b.wl-tiwai@suse.de>
	<8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
	<87o6xe7l4q.wl-tiwai@suse.de>
	<51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
	<871pu95oon.wl-tiwai@suse.de>
	<2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8A2721F38A
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.intel.com,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 03 Apr 2025 17:24:44 +0200,
Jaroslav Kysela wrote:
> 
> On 03. 04. 25 16:01, Takashi Iwai wrote:
> 
> > I agree that your patch can be a good start, at least, it addresses
> > the existing issue with the minimal change.  There are still rough
> > edges and we'll need to address, but I believe the patch (or modified
> > / fixed one) can be applied to 6.15 kernel, while keeping the
> > development for 6.16.
> 
> I did a quick research how is RESUME/SUSPEND implemented in current
> drivers and I found that it may be considered to enable SUSPEND
> trigger also in the paused state:
> 
> find sound/ -name "*.[ch]" -exec grep -A 2 -B 2 -H -E \
>     "SNDRV_PCM_TRIGGER_(RESUME|SUSPEND)" {} \;
> 
> My comments - seems almost all drivers handles SUSPEND as STOP:
> 
> sound/pci/ymfpci/ymfpci_main.c
>  - STOP/SUSPEND different, should not be a problem
> sound/pci/nm256/nm256.c
> sound/pci/intel8x0.c
>  - only saves suspend flag additionaly to STOP
> sound/soc
>  - some drivers ignores suspend/resume (ignore_suspend flag)
> sound/soc/pxa/pxa-ssp.c
>  - should not be a problem (enable/disable hw parts)
> sound/soc/sti/uniperif_player.c
>  - only resume trigger is supported ? but no resume info is set
> sound/soc/sof/intel/hda-dai.c
>  - only suspend support, but resume is not supported
> sound/xen/xen_snd_front_alsa.c
>  - it's just rpc
> sound/virtio/virtio_pcm_ops.c
>  - only suspend support, no resume
> 
> It would be probably nice if more eyes verifies this, but the only
> suspicious place is the xen front end. And some drivers may be broken
> already (no changes for them).

The xen driver provides SNDRV_PCM_INFO_PAUSE, but it doesn't handle
SNDRV_PCM_TRIGGER_PAUSE_* at all -- so the pause handling is broken
there, as it seems.

> I believe that this patch should be enough to resolve the issue
> instead the non-elegant pause release and may be applied also to 6.15:
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 4057f9f10aee..63a1b37cc098 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1694,8 +1694,17 @@ static int snd_pcm_do_suspend(struct
> snd_pcm_substream *substream,
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         if (runtime->trigger_master != substream)
>                 return 0;
> -       if (! snd_pcm_running(substream))
> -               return 0;
> +       if (! snd_pcm_running(substream)) {
> +               if (runtime->info & SNDRV_PCM_INFO_RESUME)
> +                       return 0;
> +               if (runtime->state != SNDRV_PCM_STATE_PAUSED)
> +                       return 0;
> +               /*
> +                * When resume is not supported, SUSPEND should STOP stream.
> +                * For futher operation, the stream must be fully restarted
> +                * to leave the permanent SUSPEND state.
> +                */
> +       }
>         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>         runtime->stop_operating = true;
>         return 0; /* suspend unconditionally */

I'm afraid that it's not that straightforward, unfortunately.
There are some stuff that require the pause release.

For example, pcm_dmaengine.c uses dmaengine_pause() as the suspend,
and if we apply this change, it'll end up with dmaengine_pause() calls
twice.  As far as I see, a similar pattern is seen in ASoC Intel catpt
driver (and maybe some others), too.

And, in drivers/soundwire/intel.c, there is already a workaround for
suspend-at-pause, and this might conflict.  We need to verify it.

Last but not least, the ASoC PCM core has its own DPCM state, and the
trigger-SUSPEND skips the operation unless the stream has been
running.  I believe that's the very starting point of the problem
Peter's patch tries to address.


> > I did some quick work on it, and now implemented
> > SNDRV_PCM_PAUSE_RELEASE_STOP trigger.  I guess it's more or less
> > aligned with what Jaroslav suggested.
> 
> Nice cleanups. The "ALSA: pcm: Save the proper suspended_state for
> non-resumable case, too" should be recoded. The state should be
> handled in action callbacks for all streams separetely.

OK, I'll rewrite it.  I wrote in the current way, as it'll be a bit
too complex otherwise, but let me try another shot.

> Also, I would consider to call suspend/resume triggers (depending on a
> flag like can_pause_release_stop) when the stream is paused, too. Some
> drivers may want this scheme.

Do you mean drivers that do share the same operation for
suspend/resume and pause?


thanks,

Takashi
