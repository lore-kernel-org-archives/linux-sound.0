Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327F2C86D
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512470; cv=none; b=gDh/JKBt0kJLdvn2oi6J+OKP+ZR5PYqQ9q1zVQc3ID9FsYG6zbTUS//a8q5o85FB/KMK9GCma1jImPg2XminRANRI1G09pSQBMFHUggfwcLWcEhJUnqUdHTwOAIiq79ZwqC9BwjaB6cpk0/eI2G+fI7zMtD75lD1GvAb2uYPQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512470; c=relaxed/simple;
	bh=mFlurIju2I6cw3XLT3w2yAeAW3NplnuHS2SwMF0+TXk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HV8G4byuyPEZOrZMxoXcBgAeiNOHUoNVGDHUHYpPHo5lL4FsOuuZKdbDROi+5AWRUG7hywgzBq+1V9y1qEoqDjaCYkEk679+LFB+kGicgEZ/FrogGcg9eoeiHuYIpvm9lbPsu++GFaoo3tTYsKj9PH2lriLTBU53+PNnqROdApk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X3ADugBc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AgwAFvCq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FJ42W2Fa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9tXwxfp2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3ADugBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AgwAFvCq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FJ42W2Fa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9tXwxfp2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 758B93E29;
	Wed, 12 Aug 2026 05:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rm5zzDaZcWU6gmgFQcoTf4Cp1a+546D2BWA0uYHtetU=;
	b=X3ADugBcBFa5LhaYnBvMbCzSYhU4YHscvsz4yV1nIsCNlIwq4o4cdTD2Btg2vSHvvNQD6l
	A0BPrCfICB2yeh1k/5vXOzJugwA1EbnsATuoUeagebXmGoKuo7aYlV4XXtG9Z8gsZNqlPs
	s/VUM/O1Y//nVvvu+R3+SHzu4kQKHLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rm5zzDaZcWU6gmgFQcoTf4Cp1a+546D2BWA0uYHtetU=;
	b=AgwAFvCqz+DUjHtKJ8139l+Bq00GKRXklWEv+e6VijkMLFhZgd2vWy3HhLR1UwhpZ6IyvL
	lGP6fH+QLy4+0XCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FJ42W2Fa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9tXwxfp2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rm5zzDaZcWU6gmgFQcoTf4Cp1a+546D2BWA0uYHtetU=;
	b=FJ42W2FaURwa1Rem5/MmoqxwOIrx6rkH2yBhiS2d0nqJ8xRnRTRpLsQlt8vPV9TlKKocdT
	5/X/ThocPK1AdP+xY7Jhplv/1bMCn+JWK2l4GlAxJaQn3bFuMakw141tMptUf/hSA5zmMC
	ks4HHCwJTuNRcbNJq3zq8FXByJji93Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rm5zzDaZcWU6gmgFQcoTf4Cp1a+546D2BWA0uYHtetU=;
	b=9tXwxfp2YJYDi0ikX4wzrU48rdJEptVFtCBbPwK9RjM6rXNm7Y6jg//ZU/x9g2E7LwjH+M
	U+/QHLS4JBv9UpDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47C2D779B1;
	Wed, 12 Aug 2026 05:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jbwjC0oEfGqPbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 05:27:38 +0000
Date: Wed, 12 Aug 2026 07:27:37 +0200
Message-ID: <87pkzn29iu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Neil Andrews <neil@androos.io>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [BUG] snd-usb-audio: Audient iD14 (2708:0008) 20 dB channel imbalance
In-Reply-To: <0102019ff207ccda-7b65c5af-5c39-4218-ae8e-5ef8d55701e0-000000@eu-west-1.amazonses.com>
References: <87h5l1b33j.wl-tiwai@suse.de>
	<0102019ff207ccda-7b65c5af-5c39-4218-ae8e-5ef8d55701e0-000000@eu-west-1.amazonses.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 758B93E29
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 11 Aug 2026 20:13:45 +0200,
Neil Andrews wrote:
> 
> On Tue, 11 Aug 2026, Takashi Iwai wrote:
> > It's fine to skip the volume if it actually improves -- so please test
> > it ;)
> >
> > Judging from your description, an alternative with keeping the volume
> > control would be to just rename it; the problem is that it's tied with
> > "Speaker".  You can name it a different, some non-standard one,
> > instead, too.
> 
> Hi Takashi,
> 
> I tested both on 7.1.6 with sound/usb rebuilt out of tree, measured with
> the loopback rig from the original report. Both fix it. I would suggest
> the rename.
> 
> Baseline, unpatched, PipeWire at 50% (control driven to 109/127):
> 18.00 dB imbalance.
> 
> 1. { 12, NULL }
> 
> Control gone, userspace falls back to software volume, 0.00 dB. So it
> does improve.
> 
> One wrinkle: FU 12 keeps its value across a module reload, so if the
> quirk arrives while the hardware is already attenuated, the imbalance
> stays and there is no longer a control with which to undo it (measured:
> 18.00 dB, control absent). Only a power cycle clears it, which matters
> for anyone whose saved ALSA state holds a value below 0 dB.
> 
> 2. { 12, "Monitor Mix Playback" }
> 
> --- a/sound/usb/mixer_maps.c
> +++ b/sound/usb/mixer_maps.c
> @@ -495,6 +495,19 @@
>  	{}
>  };
> 
> +/* Audient iD14: FU 12 advertises Volume on only 4 of its 6 logical channels
> + * and sits on the monitor-mixer branch, but it is traced through to the
> + * Speaker output terminal and gets named "Speaker Playback Volume". Userspace
> + * then adopts it as the stream's hardware volume, and any setting below 0 dB
> + * attenuates some channels but not others (20 dB imbalance at 80%). Give it a
> + * non-standard name so that it is no longer taken for the stream's master
> + * volume, while remaining reachable for anyone who wants the monitor gain.
> + */
> +static const struct usbmix_name_map audient_id14_map[] = {
> +	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
> +	{}
> +};
> +
>  /*
>   * Control map entries
>   */
> @@ -579,6 +592,11 @@
>  		.map = maya44_map,
>  	},
>  	{
> +		/* Audient iD14 */
> +		.id = USB_ID(0x2708, 0x0008),
> +		.map = audient_id14_map,
> +	},
> +	{
>  		/* KEF X300A */
>  		.id = USB_ID(0x27ac, 0x1000),
>  		.map = scms_usb3318_map,
> 
> Gives numid=11,name='Monitor Mix Playback Volume'. PipeWire no longer
> picks it up (control stays at 127, 0.00 dB), and it still works when set
> deliberately, so an attenuated device can be recovered: 107 by hand
> gives 20.00 dB, back to 127 gives 0.00 dB. The name ends in "Playback"
> because a mapped name suppresses the automatic " Playback" but still
> gets " Volume" appended.
> 
> 3. A qualification to my report
> 
> I said userspace adopts the control as the card's hardware playback
> volume, without qualifying it. That is too broad.
> 
> alsa-ucm-conf 1.2.16.1 ships
> USB-Audio/Audient/Audient-iD14-HiFi-0008.conf, which splits the device
> into 2-channel sinks and declares no playback mixer element. With it in
> use PipeWire never touches FU 12: the control stays at 127 at every
> volume setting, on both split sinks and on the underlying node.
> Reproducing needs the ACP path instead, which I got by setting
> api.alsa.use-ucm = false for the device in WirePlumber (then 100% ->
> 127, 80% -> 122, 50% -> 109). All measurements above were taken that
> way.
> 
> So the affected set is narrower than I implied: the ACP path rather than
> that UCM profile, plus anyone whose saved ALSA state carries a value
> below 0 dB, since that is restored at boot either way. The descriptor
> problem itself is unchanged.
> 
> Happy to send either version as a proper patch with a Signed-off-by, and
> to test anything else on the hardware.

Let's take the rename approach, then.  Dropping can be done anytime
later if really needed, too.  Please submit a formal patch.


thanks,

Takashi
