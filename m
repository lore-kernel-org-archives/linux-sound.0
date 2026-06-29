Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0973E1206
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728963; cv=none; b=X0ySoyBJG/DxZ6pzje9YjpHt9Nnw79BqtLbSn2DfA1h7yTWrlEmCzoe1m3vi71nOlo7iWVvtSqvIWhtUIW4WLsDpl105cb35fgTis0qDK52tsWHa00SVeCo7qBma/9+Xpqcbv0Cz8XXQ2VGy83YTSkijHC6LOppe92158O5KVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728963; c=relaxed/simple;
	bh=1GHzUnKxdnsNqlTcFxg0/UswViPlA97gm4+F68SgfWM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgaTh7IG3n+jOn2Mgpk5oCzI7z1fT9wNXNVeM+BUDvYEQ45rrC7wIvLDhn3HPp8aLTdGr9wqubuYzu6OF9LUzfG0xUUiz1PZdim+uyQhjeMMHPCNUqXVA1UaNyVgzewl7EYM6FpQR34KocU2rs8HIk6x10JTGNxUtzJ/tr/SLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rS4X8+MH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvXvm+6w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rS4X8+MH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvXvm+6w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rS4X8+MH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvXvm+6w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rS4X8+MH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvXvm+6w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2905A73011;
	Mon, 29 Jun 2026 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782728960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOF2XB6r1n4WKjqa53VYJkKB3LX7c2wxUBN35G76kas=;
	b=rS4X8+MHPa4VWDETNd3VK88qcXOf3XirjT/6aCcsJCUgy7ZDrMYKyUDN6u/6kSBEdHL6jC
	41EZ8qOE2QZFxggNHEiTJH6fldVoYAFS79byvcOeD2QZ+s3lhCXJqp6cEclJLpjOrcR0gT
	pi5qGm095V/PojLVpoyFcq1PUpgj5H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782728960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOF2XB6r1n4WKjqa53VYJkKB3LX7c2wxUBN35G76kas=;
	b=vvXvm+6wby8dkMYlqdXGS3iz0C5vGK7zb/O9Bdcd+JOXGii9ZtrwxWd30Bjn6VMxzMM5qe
	vYfGl3HbPxOvwJAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rS4X8+MH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vvXvm+6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782728960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOF2XB6r1n4WKjqa53VYJkKB3LX7c2wxUBN35G76kas=;
	b=rS4X8+MHPa4VWDETNd3VK88qcXOf3XirjT/6aCcsJCUgy7ZDrMYKyUDN6u/6kSBEdHL6jC
	41EZ8qOE2QZFxggNHEiTJH6fldVoYAFS79byvcOeD2QZ+s3lhCXJqp6cEclJLpjOrcR0gT
	pi5qGm095V/PojLVpoyFcq1PUpgj5H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782728960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOF2XB6r1n4WKjqa53VYJkKB3LX7c2wxUBN35G76kas=;
	b=vvXvm+6wby8dkMYlqdXGS3iz0C5vGK7zb/O9Bdcd+JOXGii9ZtrwxWd30Bjn6VMxzMM5qe
	vYfGl3HbPxOvwJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCBAE779A8;
	Mon, 29 Jun 2026 10:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxCsNP9IQmrsHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jun 2026 10:29:19 +0000
Date: Mon, 29 Jun 2026 12:29:19 +0200
Message-ID: <87zf0dprls.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christopher =?ISO-8859-1?Q?H=F6ner?= <christopher-hoener@web.de>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v4] ALSA: hda/realtek: Enable internal speakers on Razer Blade 16 (2025)
In-Reply-To: <20260623191436.6605-1-christopher-hoener@web.de>
References: <20260620144128.13602-1-christopher-hoener@web.de>
	<20260621205711.11127-1-christopher-hoener@web.de>
	<20260622174309.5873-1-christopher-hoener@web.de>
	<20260623191436.6605-1-christopher-hoener@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2905A73011
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[web.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 23 Jun 2026 21:14:36 +0200,
Christopher Höner wrote:
> 
> On the Razer Blade 16 (2025) (Realtek ALC298, PCI SSID 1a58:300e) the
> internal speakers are driven through an external smart amplifier whose
> crossover, voicing and protection live in a DSP reached over a vendor
> coef mailbox on NID 0x20.  Both speaker pins are fed from one DAC
> through a mixer and the amplifier does the crossover.  The BIOS leaves
> the tweeter pin (NID 0x14) disabled (default config 0x411111f0), so the
> tweeters are not exposed and the amplifier is never programmed for this
> machine under Linux.
> 
> Add a fixup for the machine that:
> 
>   - re-exposes the tweeter pin (NID 0x14) as an internal speaker in the
>     same association (2) as the woofer (NID 0x17), so the controls come
>     out as "Speaker"/"Bass Speaker", with auto-mute on headphone
>     insertion;
> 
>   - pins every output to a fixed converter via preferred_dacs so the
>     routing does not depend on the generic parser's DAC-allocation
>     heuristics: both speaker pins share DAC 0x03 (the only converter
>     that drives the woofer on this machine) through the mixer, while the
>     headphone (NID 0x21) keeps DAC 0x02.  Without a fixed assignment the
>     parser brings up only one speaker pin and leaves the other silent;
> 
>   - wakes the external amp, programs its DSP over the NID-0x20 mailbox
>     at init (boot and resume) and parks it; it is woken again for
>     playback and parked afterwards from a pcm_playback_hook, like the
>     existing Samsung and LG Gram amplifier fixups.
> 
> The DSP sequence was obtained by capturing the Windows driver's HD-audio
> traffic via QEMU/VFIO passthrough of the controller and reducing it to
> the NID-0x20 writes this machine needs; everything else the parser
> rebuilds.  The captured tables are large, so the programming and
> the fixup live in a separate file under
> sound/hda/codecs/helpers/ that the codec driver includes.
> 
> Signed-off-by: Christopher Höner <christopher-hoener@web.de>

Applied to for-next branch now.  Thanks.


Takashi
