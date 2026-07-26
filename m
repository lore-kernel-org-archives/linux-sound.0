Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB71C84A0
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785075111; cv=none; b=S5xFo6zwwZKn9sQo41BamlJts0E1uwhyLRZQmV70VPatpuLjXwbEQNvgzYJcz3WAnZZA5VlBuKJKDl6Cgs/My+q2Vt7zacWvSrHd727/+ckZ1N8KQUPRlPG/8Xrag+7WRQMAKA4f3L9O4FN7xkM7m31B8aXj1TIepRLXxgbeP4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785075111; c=relaxed/simple;
	bh=m54qEh4b6Acdf9UZ35kVF5bqLaGmiZsB3rauzcV2bhQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRc23GxBrjTC4E7bJhsDCagCHZXi2806tMqOh0388VsjmqyTlBZ19u0qQLrO+YbhZ82lc6OYhxerAF1WKWyzP32wPxrhD7A4BJunLWHHDyB1IyxWGc7VKlRzxRBIaqu5ap/4jP8hmAixDy6sLFSuCtc3R0D5aUyUQsjr/s/bTLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mOjBwLHs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6qJbGu4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wViIkC/i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tV5KntA/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mOjBwLHs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6qJbGu4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wViIkC/i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tV5KntA/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A39A97D626;
	Sun, 26 Jul 2026 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785075097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZvYmnJFPdGRVzo4dHHeHG/tCrhQWmUfjNkCgIk34lE=;
	b=mOjBwLHshWBzQsbAj6kjpiXfv52mRyFJW0RQm7KrH7MYGjl55JZv6QWQgYFVpFz2nESHab
	zpISbLqV3BFfv/g5BP/Mrr4Iw7edqNT8zcUTIrm3WUsq/oOh3Edv+q9xaU1DoS8AxQCrS1
	5boA7F0Db6+lJ9WkoyCyY765WgkStMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785075097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZvYmnJFPdGRVzo4dHHeHG/tCrhQWmUfjNkCgIk34lE=;
	b=E6qJbGu4w+g6smiYJaWePPl8zlEFFApPoBes/AgHLWWXtPvIZn/2BNgfIpa0UtQANl5a14
	dHHEdGyi8/l3hmAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785075093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZvYmnJFPdGRVzo4dHHeHG/tCrhQWmUfjNkCgIk34lE=;
	b=wViIkC/iqqx8hJdGI5fU/SeaQiFAWEBNQJg78MjjBG+mW1uv56csAXiOqz/lRL27PphS3I
	zsGxNyWxI1VNzgBhkG+xLYMkDwH4fnngw2x/Lm0fv5ab2wqQIDjZpxZoOI50Jz7CGARAjC
	YoU52AOzd4mjTMEH2STQfndmFzPEWXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785075093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZvYmnJFPdGRVzo4dHHeHG/tCrhQWmUfjNkCgIk34lE=;
	b=tV5KntA/j2ACYPDT0ozioJzTw6SJVJEnfTH/JGK4h3o/XoVmlZDcVactz5ilEtQ/AvCP/A
	nYHMsj8P4GnoSyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70FDA779B9;
	Sun, 26 Jul 2026 14:11:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OhHfGZUVZmpPAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 14:11:33 +0000
Date: Sun, 26 Jul 2026 16:11:32 +0200
Message-ID: <87mrvdalij.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gunal Seenivasagan <gunal2002@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for Infinix INBOOK X3 Slim
In-Reply-To: <20260726085715.229802-1-gunal2002@gmail.com>
References: <87y0ey9of8.wl-tiwai@suse.de>
	<20260726085715.229802-1-gunal2002@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 26 Jul 2026 10:57:11 +0200,
Gunal Seenivasagan wrote:
> 
> The Infinix INBOOK X3 Slim (ALC269VB, subsystem 0x2782:0250) has its
> internal speakers wired to pin 0x1b, but the BIOS pin configuration
> table declares 0x1b as "no physical connection" (0x411111f0). It instead
> declares pin 0x14 as the internal speaker, although nothing is connected
> to 0x14.
> 
> As a result the internal speakers are silent under Linux while the
> headphone jack works correctly. The codec output path to 0x14 is fully
> open (DAC assigned and streaming, mixer and pin unmuted, EAPD asserted),
> so the failure is silent with no error reported. The speakers work under
> Windows, where the vendor driver supplies its own pin table.
> 
> Add a fixup that disables the unconnected pin 0x14 and declares pin
> 0x1b as the internal speaker.
> 
> Reusing the existing ALC269VC_FIXUP_INFINIX_Y4_MAX was tried first, since
> it also remaps 0x1b to an internal speaker. It is not sufficient here: it
> leaves 0x14 declared, so autoconfig finds two line_outs
> 
>   line_outs=2 (0x14/0x1b/0x0/0x0/0x0) type:speaker
> 
> and binds the primary "Speaker" control to the unconnected pin 0x14 while
> demoting the working speaker at 0x1b to "Bass Speaker". Audio is audible
> that way, but the volume and mute controls a desktop actually uses end up
> attached to a pin that is not wired to anything. Disabling 0x14 is what
> produces a single correct Speaker output.
> 
> Verified on the affected machine: with the corrected pin
> configuration the driver's autoconfig reports
> 
>   line_outs=1 (0x1b/0x0/0x0/0x0/0x0) type:speaker
> 
> both channels play, headphone auto-mute switches correctly in both
> directions, and audio survives codec runtime suspend (D3) and resume.
> 
> Signed-off-by: Gunal Seenivasagan <gunal2002@gmail.com>
> ---
> v2: No functional change. Corrected the author and Signed-off-by lines to
>     my full name, as requested by Takashi.

Applied now.  Thanks.


Takashi
