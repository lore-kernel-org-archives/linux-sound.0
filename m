Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0D366069
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613499; cv=none; b=OxsNiknf4DZR7UWaSr1u1VvmGAMS9rtC43IlfIcOK4Q4Utct+dJbafGcCCQMCfTHSMCdll+oQ3IEIIt+scs0PgfpHEYa4fiItUtdslFr8QKVLoeb/DX4oc9Bqy5ppGwgyZymT0FSIPVJAbAOh20x/PFEJLvr0K5Fu6xlz5cNzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613499; c=relaxed/simple;
	bh=+CzhaZxZ4UWnnufSlDT4enw/pBg/6e9iFPEl5USLM2I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDLICnAct5IeZ9TSv5RRwp1OQ+HPAABB0Fcl9Nt5vRpzHmpBTVqVjQQESZPbey49MIGbHGWMXtwdiyIZx6FvhUHQ9jHEM4UBHK1bOD/CnS2MpciTJokVS/cNqQ26ylouR57+MRohrTSQC1usQ8UAzCFnp5936vCDwDp/pmCEp7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=djnIRwks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d99xJOGu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=djnIRwks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d99xJOGu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="djnIRwks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d99xJOGu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="djnIRwks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d99xJOGu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C77004D315;
	Fri, 27 Mar 2026 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774613489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXOcggCBtt/M4OMZbA1vTY8/4PSo9qH2Dc9E3513UHI=;
	b=djnIRwksCLI2mgTjAFy/O59vGHNRtYiFYeoSe5KK2kBrnzQZvVKyTd+XNxh4/cQ+1kcH3J
	fls6rXI82IqXPFgbnP3CrR+z1n2roRiz5dwLEzbnVqu3BDkuOFh2HVVAzDb0ODcQ5kXFhr
	7TvhLYmTm4VOH/4iLMfIVLKhlv9wumA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774613489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXOcggCBtt/M4OMZbA1vTY8/4PSo9qH2Dc9E3513UHI=;
	b=d99xJOGuwIqI8XivSUjGYfS4pCtp+shpSFiqPBWfnpjqq1tQ62/RrhHBf0gFWqCWMQcu+G
	hbmIPQAW9K2S2aBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=djnIRwks;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d99xJOGu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774613489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXOcggCBtt/M4OMZbA1vTY8/4PSo9qH2Dc9E3513UHI=;
	b=djnIRwksCLI2mgTjAFy/O59vGHNRtYiFYeoSe5KK2kBrnzQZvVKyTd+XNxh4/cQ+1kcH3J
	fls6rXI82IqXPFgbnP3CrR+z1n2roRiz5dwLEzbnVqu3BDkuOFh2HVVAzDb0ODcQ5kXFhr
	7TvhLYmTm4VOH/4iLMfIVLKhlv9wumA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774613489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXOcggCBtt/M4OMZbA1vTY8/4PSo9qH2Dc9E3513UHI=;
	b=d99xJOGuwIqI8XivSUjGYfS4pCtp+shpSFiqPBWfnpjqq1tQ62/RrhHBf0gFWqCWMQcu+G
	hbmIPQAW9K2S2aBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D8234A0A2;
	Fri, 27 Mar 2026 12:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mNcoIfFzxmmJRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 12:11:29 +0000
Date: Fri, 27 Mar 2026 13:11:29 +0100
Message-ID: <87ikahqxou.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fu Hao <fuhao@open-hieco.net>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 7/8] ALSA: hda: Fix single byte writing issue for Hygon family 18h model 5h
In-Reply-To: <b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
References: <cover.1774595153.git.fuhao@open-hieco.net>
	<b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C77004D315

On Fri, 27 Mar 2026 09:11:13 +0100,
Fu Hao wrote:
> 
> On Hygon family 18h model 5h controller, some registers such as
> GCTL, SD_CTL and SD_CTL_3B should be accessed in dword, or the
> writing will fail.
> 
> Signed-off-by: Fu Hao <fuhao@open-hieco.net>
> ---
>  include/sound/hdaudio.h       |  1 +
>  sound/hda/controllers/intel.c |  4 ++++
>  sound/hda/core/controller.c   | 10 +++++++--
>  sound/hda/core/stream.c       | 42 ++++++++++++++++++++++++++---------
>  4 files changed, 45 insertions(+), 12 deletions(-)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index f11bfc6b9..57a144fec 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -352,6 +352,7 @@ struct hdac_bus {
>  	bool not_use_interrupts:1;	/* prohibiting the RIRB IRQ */
>  	bool access_sdnctl_in_dword:1;	/* accessing the sdnctl register by dword */
>  	bool use_pio_for_commands:1;	/* Use PIO instead of CORB for commands */
> +	bool hygon_dword_access:1;
>  
>  	int poll_count;
>  

I hesitate to add another flag just for this platform.
And looking at the changes, all appear to be about the dword access
for sdnctl writes.  So I believe we can simply extend
access_sdnctl_in_dword to do the dword access in each write access,
instead?  The performance shouldn't matter as it's no hot path.

Alternatively, you can enable bus->aligned_mmio flag, but this needs
to enable CONFIG_SND_HDA_ALIGNED_MMIO.  That's a visible cost for
other platforms, though.


thanks,

Takashi
