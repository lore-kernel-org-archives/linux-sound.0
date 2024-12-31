Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D217ADE8;
	Tue, 31 Dec 2024 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735646092; cv=none; b=sLbBKMm65y8Vji+mPaBH2Lffx7tPwDrdAqVOSrOCDx/p5SyNVXh5OJ1NzmU51VNl+T++GbO+deNQb7je3QC2IHMBULgN7hsWwFV28hhjyXfxY5ca3hGPxOdzz3YcZt5qcfyfcLhDA8Uxg3v/244Lp6bBE0GdeigUDa6t8c9eNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735646092; c=relaxed/simple;
	bh=RcGeQ9PenB/szGAL47uJZGNkWQdjmC8IBkkEXKXTB9U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2nH7Fh5cxTFgRy4qhS7UEOg9AINQUpBd9q00v6IClUmYFafb0CKTSgcAaRbm0Fy+9dsYRfSinSsqlfNGV5SyLOrYyGhI0m79y6bTRbFvOqxalDa7mYh5c/35VD0nZ/QEmIXWgBtxbeByh6wOKONKIlW3rJKSiARPuKKNlodxDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t8NrLiO6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nenDIgdq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t8NrLiO6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nenDIgdq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t8NrLiO6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nenDIgdq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t8NrLiO6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nenDIgdq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A7781F37C;
	Tue, 31 Dec 2024 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735646088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuL47rFQGE069oD+O8VlGslrH6e5GjeUVX4EiiV1NPM=;
	b=t8NrLiO6GN1nJPRg/V7rHfrk839E4taO8UJOeYdW3KBhkXeq6lJKa3dS/DFQpiU+ApD64X
	zRTcHtg1BFOuq0CRSgTARzCsy1Tp6cb/bN0ndaQfUUeWDxyfz2AwKSoCXT0w8pwJghmPZa
	J5GwibpwA2UKX9VvkNl9l1hR5E1P5iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735646088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuL47rFQGE069oD+O8VlGslrH6e5GjeUVX4EiiV1NPM=;
	b=nenDIgdqxCC1mh3o5tdkddv/AO0iHodJ1T4vdMeoYfNJZsEx1h7va6HQZcH29tNDXeE+qA
	yv08ikmD96Bb9LAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735646088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuL47rFQGE069oD+O8VlGslrH6e5GjeUVX4EiiV1NPM=;
	b=t8NrLiO6GN1nJPRg/V7rHfrk839E4taO8UJOeYdW3KBhkXeq6lJKa3dS/DFQpiU+ApD64X
	zRTcHtg1BFOuq0CRSgTARzCsy1Tp6cb/bN0ndaQfUUeWDxyfz2AwKSoCXT0w8pwJghmPZa
	J5GwibpwA2UKX9VvkNl9l1hR5E1P5iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735646088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuL47rFQGE069oD+O8VlGslrH6e5GjeUVX4EiiV1NPM=;
	b=nenDIgdqxCC1mh3o5tdkddv/AO0iHodJ1T4vdMeoYfNJZsEx1h7va6HQZcH29tNDXeE+qA
	yv08ikmD96Bb9LAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 415E613A30;
	Tue, 31 Dec 2024 11:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l3QnDojbc2fbKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Dec 2024 11:54:48 +0000
Date: Tue, 31 Dec 2024 12:54:47 +0100
Message-ID: <87ldvwukxk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kun Hu <huk23@m.fudan.edu.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
In-Reply-To: <182E26F6-E0BC-44D3-A0E7-124C81B7F8EB@m.fudan.edu.cn>
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
	<B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
	<87ed1qydgi.wl-tiwai@suse.de>
	<3326E7C2-1E4F-4F57-AAB5-065C20854F31@m.fudan.edu.cn>
	<87pll9wi4x.wl-tiwai@suse.de>
	<182E26F6-E0BC-44D3-A0E7-124C81B7F8EB@m.fudan.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 30 Dec 2024 14:10:24 +0100,
Kun Hu wrote:
> 
> 
> > 
> > Good to hear.  Then I'm going to submit this as a band-aid fix; this
> > is simple and easy to backport to older stable releases, too.
> > 
> > Meanwhile, we may have a different fix for the long term.  Essentially
> > the sysex handling in OSS layer is unnecessarily complex, and we can
> > send a packet immediately at each time instead of combining them.
> > 
> > Could you try the patch below instead of the previous one?
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > -- 8< --
> > diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
> > index 98dd20b42976..c0b1cce127a3 100644
> > --- a/sound/core/seq/oss/seq_oss_device.h
> > +++ b/sound/core/seq/oss/seq_oss_device.h
> > @@ -55,7 +55,6 @@ struct seq_oss_chinfo {
> > struct seq_oss_synthinfo {
> > struct snd_seq_oss_arg arg;
> > struct seq_oss_chinfo *ch;
> > - struct seq_oss_synth_sysex *sysex;
> > int nr_voices;
> > int opened;
> > int is_midi;
> > diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
> > index e3394919daa0..02a90c960992 100644
> > --- a/sound/core/seq/oss/seq_oss_synth.c
> > +++ b/sound/core/seq/oss/seq_oss_synth.c
> > @@ -26,13 +26,6 @@
> >  * definition of synth info records
> >  */
> > 
> > -/* sysex buffer */
> > -struct seq_oss_synth_sysex {
> > - int len;
> > - int skip;
> > - unsigned char buf[MAX_SYSEX_BUFLEN];
> > -};
> > -
> > /* synth info */
> > struct seq_oss_synth {
> > int seq_device;
> > @@ -318,8 +311,6 @@ snd_seq_oss_synth_cleanup(struct seq_oss_devinfo *dp)
> > }
> > snd_use_lock_free(&rec->use_lock);
> > }
> > - kfree(info->sysex);
> > - info->sysex = NULL;
> > kfree(info->ch);
> > info->ch = NULL;
> > }
> > @@ -395,8 +386,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
> > info = get_synthinfo_nospec(dp, dev);
> > if (!info || !info->opened)
> > return;
> > - if (info->sysex)
> > - info->sysex->len = 0; /* reset sysex */
> > reset_channels(info);
> > if (info->is_midi) {
> > if (midi_synth_dev.opened <= 0)
> > @@ -408,8 +397,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
> >   dp->file_mode) < 0) {
> > midi_synth_dev.opened--;
> > info->opened = 0;
> > - kfree(info->sysex);
> > - info->sysex = NULL;
> > kfree(info->ch);
> > info->ch = NULL;
> > }
> > @@ -482,63 +469,26 @@ snd_seq_oss_synth_info(struct seq_oss_devinfo *dp, int dev)
> > 
> > /*
> >  * receive OSS 6 byte sysex packet:
> > - * the full sysex message will be sent if it reaches to the end of data
> > - * (0xff).
> > + * the event is filled and prepared for sending immediately
> > + * (i.e. sysex messages are fragmented)
> >  */
> > int
> > snd_seq_oss_synth_sysex(struct seq_oss_devinfo *dp, int dev, unsigned char *buf, struct snd_seq_event *ev)
> > {
> > - int i, send;
> > - unsigned char *dest;
> > - struct seq_oss_synth_sysex *sysex;
> > - struct seq_oss_synthinfo *info;
> > + unsigned char *p;
> > + int len = 6;
> > 
> > - info = snd_seq_oss_synth_info(dp, dev);
> > - if (!info)
> > - return -ENXIO;
> > + p = memchr(buf, 0xff, 6);
> > + if (p)
> > + len = p - buf + 1;
> > 
> > - sysex = info->sysex;
> > - if (sysex == NULL) {
> > - sysex = kzalloc(sizeof(*sysex), GFP_KERNEL);
> > - if (sysex == NULL)
> > - return -ENOMEM;
> > - info->sysex = sysex;
> > - }
> > -
> > - send = 0;
> > - dest = sysex->buf + sysex->len;
> > - /* copy 6 byte packet to the buffer */
> > - for (i = 0; i < 6; i++) {
> > - if (buf[i] == 0xff) {
> > - send = 1;
> > - break;
> > - }
> > - dest[i] = buf[i];
> > - sysex->len++;
> > - if (sysex->len >= MAX_SYSEX_BUFLEN) {
> > - sysex->len = 0;
> > - sysex->skip = 1;
> > - break;
> > - }
> > - }
> > -
> > - if (sysex->len && send) {
> > - if (sysex->skip) {
> > - sysex->skip = 0;
> > - sysex->len = 0;
> > - return -EINVAL; /* skip */
> > - }
> > - /* copy the data to event record and send it */
> > - ev->flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
> > - if (snd_seq_oss_synth_addr(dp, dev, ev))
> > - return -EINVAL;
> > - ev->data.ext.len = sysex->len;
> > - ev->data.ext.ptr = sysex->buf;
> > - sysex->len = 0;
> > - return 0;
> > - }
> > -
> > - return -EINVAL; /* skip */
> > + /* copy the data to event record and send it */
> > + if (snd_seq_oss_synth_addr(dp, dev, ev))
> > + return -EINVAL;
> > + ev->flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
> > + ev->data.ext.len = len;
> > + ev->data.ext.ptr = buf;
> > + return 0;
> > }
> > 
> > /*
> 
> Hi,
> 
> Regarding your changes, I¢ve conducted multiple rounds of race condition testing using the same method. The original issue, caused by competition for shared resources, could consistently reproduce an out-of-bounds error in just a few attempts. The temporary band-aid fix and the latest changes have been tested at least 10,000 times, and no issues have occurred so far.

OK, that's convincing enough.
I'm going to submit the proper patch.  It won't be queued for 6.13 but
for 6.14, though.


thanks,

Takashi
