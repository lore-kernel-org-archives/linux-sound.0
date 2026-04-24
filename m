Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96A130B51D
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028171; cv=none; b=SFw9/mEKYafcWroYvgLJ6fgUuEQlAO5dH1YL1C7GVbp8jNhhN+oVnKsa434Cp7eNOAmBOYIz/2XuQKIF3F+ocPTYKKPO+Abq/9Z20l1vfxGjCa1RMNXApjO66z2SUqzRqUnOAohKTTe/bofVqIdG6DWidNRi0D++pboyOOBu1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028171; c=relaxed/simple;
	bh=t6f/QTq9IW8qyCOZqTcqxJKNGharoYTt7FR9nFkJ+1U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stvHrmswLwloy5jZgQ5aVSgh4A1ChWX8q3M9AwNpFxIvFI52CgEGvxN7oZh+WJpp/EL1NrbQrss5uv2131GnSGbnN0+4vFSy2vphwGZfoYFdcTLT+hS1qjIGuG/wsCCwwYOi7ZRPGF06koKPMZBR3ucGRxUkJvHtmYULzJ6Ddt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=czlDADw3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8VOX8/IP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4+NwHXI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QVSBXWA5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="czlDADw3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8VOX8/IP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4+NwHXI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QVSBXWA5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6D9F6A836;
	Fri, 24 Apr 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777028168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+Xg7o8N5O7U1PoamGPZorwlp6X5fVmtBjkFbLZG3XY=;
	b=czlDADw3NFZo3Cg9b8x6V3THJe9mzQ46tfWT0YCmlpFvc3o/aM4/o6qInxcvygn0FVp+Pl
	TfXplkMcJ9JK6yML6DlImOQHqX8Swv+x67BOUGpnzq+MfmQwBzUXJpNtg9zxKEZ2WN4KOV
	ZylmWi/tDiBb5bFgJh+WyK1zMvJK9uE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777028168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+Xg7o8N5O7U1PoamGPZorwlp6X5fVmtBjkFbLZG3XY=;
	b=8VOX8/IP0rAdyPsww4q1YohxuyxrRitpRAiDbEhmt65VW5y6u7Oi3UfWqCj0/kywAARySg
	QsOYw7VtCEB/8gAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M4+NwHXI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QVSBXWA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777028167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+Xg7o8N5O7U1PoamGPZorwlp6X5fVmtBjkFbLZG3XY=;
	b=M4+NwHXIf4k2ZRG7A6XRRGabjaEuPdav9GoQEIVyTn0L5aobYXqJJbcLfKUS7ohLDGNQTY
	nWuXtgvA7ly6XK/3WzGpr0cyIWQ+L2tpLMLhYzk6OhK3BKJ5jy/mqp6ElRg4RNI7otYyBT
	4662Wi5/iKRJYwFgg7amwOEwNKPO/3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777028167;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+Xg7o8N5O7U1PoamGPZorwlp6X5fVmtBjkFbLZG3XY=;
	b=QVSBXWA5kX4rXKgyzOzI+zUUyNQeeTKvl6vC6Cc1e58Oq1KjW2KmvTFArTs13lUXrGGlgb
	u3yBTSxnMDUgiYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9804C593A4;
	Fri, 24 Apr 2026 10:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p3rWI0dM62lDGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Apr 2026 10:56:07 +0000
Date: Fri, 24 Apr 2026 12:56:07 +0200
Message-ID: <87v7dg1vaw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	byoungyoung@snu.ac.kr,
	eulgyukim@snu.ac.kr
Subject: Re: [BUG] KASAN: slab-use-after-free in ALSA OSS read/poll race
In-Reply-To: <CAD6E879vAXrUasE1Jp6xdPO_AZ-wbqRoThZTKSfVu2s0BbntiA@mail.gmail.com>
References: <20260423145330.210035-1-jjy600901@snu.ac.kr>
	<87a4ut3dfp.wl-tiwai@suse.de>
	<20260424071208.2388558-1-jjy600901@snu.ac.kr>
	<874il03gpy.wl-tiwai@suse.de>
	<CAD6E879vAXrUasE1Jp6xdPO_AZ-wbqRoThZTKSfVu2s0BbntiA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: E6D9F6A836
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 24 Apr 2026 12:12:41 +0200,
Jaeyoung Chung wrote:
> 
> On Fri, Apr 24, 2026 at 5:28 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > Does something below work?
> > Once after confirming, I'll submit a proper patch.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > -- 8< --
> > diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> > --- a/sound/core/oss/pcm_oss.c
> > +++ b/sound/core/oss/pcm_oss.c
> > @@ -2155,10 +2155,16 @@ static int snd_pcm_oss_get_trigger(struct snd_pcm_oss_file *pcm_oss_file)
> >
> >         psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
> >         csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
> > -       if (psubstream && psubstream->runtime && psubstream->runtime->oss.trigger)
> > -               result |= PCM_ENABLE_OUTPUT;
> > -       if (csubstream && csubstream->runtime && csubstream->runtime->oss.trigger)
> > -               result |= PCM_ENABLE_INPUT;
> > +       if (psubstream && psubstream->runtime) {
> > +               guard(mutex)(&psubstream->runtime->oss.params_lock);
> > +               if (psubstream->runtime->oss.trigger)
> > +                       result |= PCM_ENABLE_OUTPUT;
> > +       }
> > +       if (csubstream && csubstream->runtime) {
> > +               guard(mutex)(&csubstream->runtime->oss.params_lock);
> > +               if (csubstream->runtime->oss.trigger)
> > +                       result |= PCM_ENABLE_INPUT;
> > +       }
> >         return result;
> >  }
> >
> > @@ -2832,6 +2838,17 @@ static int snd_pcm_oss_capture_ready(struct snd_pcm_substream *substream)
> >                                                 runtime->oss.period_frames;
> >  }
> >
> > +static bool need_input_retrigger(struct snd_pcm_runtime *runtime)
> > +{
> > +       bool ret;
> > +
> > +       guard(mutex)(&runtime->oss.params_lock);
> > +       ret = runtime->oss.trigger;
> > +       if (ret)
> > +               runtime->oss.trigger = 0;
> > +       return ret;
> > +}
> > +
> >  static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
> >  {
> >         struct snd_pcm_oss_file *pcm_oss_file;
> > @@ -2864,11 +2881,11 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
> >                             snd_pcm_oss_capture_ready(csubstream))
> >                                 mask |= EPOLLIN | EPOLLRDNORM;
> >                 }
> > -               if (ostate != SNDRV_PCM_STATE_RUNNING && runtime->oss.trigger) {
> > +               if (ostate != SNDRV_PCM_STATE_RUNNING &&
> > +                   need_input_retrigger(runtime)) {
> >                         struct snd_pcm_oss_file ofile;
> >                         memset(&ofile, 0, sizeof(ofile));
> >                         ofile.streams[SNDRV_PCM_STREAM_CAPTURE] = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
> > -                       runtime->oss.trigger = 0;
> >                         snd_pcm_oss_set_trigger(&ofile, PCM_ENABLE_INPUT);
> >                 }
> >         }
> >
> >
> 
> Thanks for the quick fix.
> 
> The patch looks good to me. I tested it on my side and no longer
> see the KASAN report.

Good to hear.  I'm going to submit a formal patch.
Thank you for quick testing!


Takashi
