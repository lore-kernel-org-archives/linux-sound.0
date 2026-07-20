Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA5279903
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529563; cv=none; b=gTvkj2eb2fjsRTDot/S+Mv1A1k64kGeve8PD/1XYx0mVIGi9Lse+wN2XigORQqwpS0YgKzKpy2krBFci+yygGcAZy1ClmKmhPhjuzxHdLoA+9F5aqZutNUNRv/H1htBPRX1iQa/CnaK9Jo/QjtZEQ5AX6oqedr+EgYXEAJgo2sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529563; c=relaxed/simple;
	bh=cf0UcdF1oc6fazNfMpqORhG4w+Lu+pEQjQMfAtBQMwY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OV7FdOcDq7j2pnS5hESihV+P7Lff8KKUQ1jlvVweSXqxJce/1Hu6aEem7He+a1w2zX2oZEZD6eIuK9l1cPxnG3+VAxu/n3AfqWy+3Ng84tBF3ZcpX3Vv6zVRLADIYZbipGQxdBicIPf3ckmM6qquSf7E9Vk6cl2OE0MsRDZfCEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kOhQn02j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ad2h3kaS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZUzII9a/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGbObu0/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kOhQn02j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ad2h3kaS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZUzII9a/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGbObu0/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E58E479DE1;
	Mon, 20 Jul 2026 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784529558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UOF+4eEYsPA/rMBkMMMH9808Zr1SRxW1O8QPqeS1QI=;
	b=kOhQn02jQV35tdT9KmSaVJQP7N57AtNBY/0Pa1OzlB6jrtuZH7AsvLaV8tFj3Cf9YfdYhy
	W5LnKl3IJoNnj3wjq73ENCFXp91c6Gb15GTxoqXHSeTI8rJT2PWcAyXvUVef/ByAHmOVZz
	H30mQfxyIfMbbCvOtyI1UWHCYDtRFXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784529558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UOF+4eEYsPA/rMBkMMMH9808Zr1SRxW1O8QPqeS1QI=;
	b=Ad2h3kaSXVUyjpD7fSM76f8V0lMpNdk3MgLHXOhrIpOUTXp16P2cskRRQOZgTO4L1RXl/X
	J/ViLfpvwPxmrrBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZUzII9a/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="cGbObu0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784529557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UOF+4eEYsPA/rMBkMMMH9808Zr1SRxW1O8QPqeS1QI=;
	b=ZUzII9a/TnSHe+/gxDP0Eu40lZC9hJIYaLWDI6SSDOEab64dw7526CpZymPHkEamHfnNHI
	ryajv/sCaIA+527BaaDzNfxhp+xFK4JP3cZpw8h3CTvuU6waoxJFPKipx+EiqICraHoMHc
	3OQpcI6bZQGQsvj5SPuhxp/HsPRnLPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784529557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UOF+4eEYsPA/rMBkMMMH9808Zr1SRxW1O8QPqeS1QI=;
	b=cGbObu0/Mebo3+blkbL44/K5wJ7K5JFUlOQDHoQk9fy1Ei+LxV/utqocaOX/M1YUA7Nb1L
	DOexKHVIU0MhmGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86827779AA;
	Mon, 20 Jul 2026 06:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kCdNH5XCXWpDegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 06:39:17 +0000
Date: Mon, 20 Jul 2026 08:39:17 +0200
Message-ID: <87tspuqi5m.wl-tiwai@suse.de>
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio device
In-Reply-To: <9fc3da84-0985-4357-93bb-ce90a86b01de@kylinos.cn>
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
	<18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
	<87zezvx73v.wl-tiwai@suse.de>
	<d77254b3-1e6f-483e-8c03-b8f1e033d7a0@kylinos.cn>
	<878q77s6jp.wl-tiwai@suse.de>
	<9fc3da84-0985-4357-93bb-ce90a86b01de@kylinos.cn>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,suse.com,kernel.org,sonarnerd.net,vivo.com,rong.moe,b4.vu,uniontech.com,iki.fi,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E58E479DE1
X-Spam-Score: -3.51

On Mon, 20 Jul 2026 04:23:25 +0200,
Zhang Heng wrote:
> 
> 
> > Please add some comment why the device needs this workaround.
> > IIUC, the reason is different from the others in your case.
> > 
> > Also, please verify that the problem is reproduced in the latest
> > upstream kernel, and the workaround works as expected there, too.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> >> --- a/sound/usb/quirks.c
> >> +++ b/sound/usb/quirks.c
> >> @@ -1938,6 +1938,10 @@ void snd_usb_endpoint_start_quirk(struct
> snd_usb_endpoint *ep)
> >>   	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> >>   		ep->skip_packets = 4;
> >>
> >> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
> >> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> >> +		ep->skip_packets = 4;
> >> +
> 
> Let me update the current status: that piece of code can be
> omitted. I have applied your test patch, but there is no
> change. It might be that your patch has no effect on this
> device. I tested with version v7.2-rc1. To be honest,
> without any modification, the problem becomes a reproducible
> stutter plus crackling noise. After applying my fix, it
> becomes a probabilistic stutter (still with a relatively
> high probability of recurrence), but when there is no
> stutter, there is also no crackling noise. So I am sure
> that this patch is at least useful, but it does not
> perfectly solve the problem. I am still trying to resolve
> the stutter issue, and I wonder if it is due to resource
> contention during boot? This problem only occurs at boot
> time; after entering the system, it disappears.

OK, if the workaround is no solid solution, it's not worth to take.

Have you tried lowlatency=0 option?  If it's an implicit fb and about
the playback, it might stabilize.


thanks,

Takashi
