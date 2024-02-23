Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CD12E5E
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677944; cv=none; b=I8w7GNvUuldlv5+gUmigebwYKq1AEq2F3SsBBcEjxAPqfBX3D7SM2NgMAbCrImek2HL0EZg4VZOh4jYNvGKLib/ZrYTw86SU+rluPgILAmSNPVlquNbnoRvon+yz7/PNmPfrR+7er0OW/2p5AE5KdELhLfcHAoF8TRHva4Dyrng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677944; c=relaxed/simple;
	bh=rI6exfQiGrn6509H+3NobZMa6LTdn4FLfe87IR5pUxs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTsq5o2hwoxnfdlFgGS2ttpiQ1Ku40O9vGKqq8IE/4P1EuLJlRp7oUhbxQ7J9fboo0vCDUwxTaAbNe7tQ8T5v3L91ZAVf5A5+f21QAB9YtOKjDKmRHwvJOXXkxTIn2k2uOf8VJUZFvPZoim0oZAFFJ4i7p1Ro8l+oj84LF5ZQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zkX2QR2E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F3MD0o0+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bvZpoApt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ENftY49n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zkX2QR2E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F3MD0o0+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bvZpoApt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ENftY49n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D98A61F7FF;
	Fri, 23 Feb 2024 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoVdYdP3oTep5spKoSFV+V4jc8nkwkI92FWcbHsUcdM=;
	b=zkX2QR2EycEPb5NazOkyFF2hKL0XaUv3RSP/CApZYbTlej75qQ5aUxT2DLjDu0AqR4gneV
	+0WojjYBgU4RPxehMtIhSOdNOUpWOPk3dT6HUgPQBsAlYaZ9N8bwHTzkpoA4jBSE1zBNaR
	ak77wJngfUxnfWdTIrxYyrDEq5pMhPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoVdYdP3oTep5spKoSFV+V4jc8nkwkI92FWcbHsUcdM=;
	b=F3MD0o0+qMcclYatlHC7yVdKDgsw3RLo27hkxW8mAdTELM1XXDIlutpSUsTSPX2GFN4uEH
	h4uIcyNzoce71iAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoVdYdP3oTep5spKoSFV+V4jc8nkwkI92FWcbHsUcdM=;
	b=bvZpoAptyEZ/Jcv107iiFTkD3tYux4vKmtnn9k4CSzcL3NXmJv7wvh0JWetzpvgYtOIltH
	FTZl92ZRMDE6hGxqqZgiK8JX5FnbPGFQuzK1UuvjRAPhadUAc5RonxbeYd9cpsuFkCGjmy
	F83+8OpMFvbbxpjeHjRknumu/IT9QyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoVdYdP3oTep5spKoSFV+V4jc8nkwkI92FWcbHsUcdM=;
	b=ENftY49nZEBGKg7Li4IjRitOYJgeOCowpS+Wcc22fl8e355V21E21ERncdi85wRdlLrJHk
	K+bXqYNti7muBHDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B499D133DC;
	Fri, 23 Feb 2024 08:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fc24KjRb2GUQPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:45:40 +0000
Date: Fri, 23 Feb 2024 09:45:40 +0100
Message-ID: <87a5nr4lhn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: clarify and fix default msbits value for all formats
In-Reply-To: <f70b524e-d7fe-495b-9823-c52000d4853e@perex.cz>
References: <20240222173649.1447549-1-perex@perex.cz>
	<87jzmw4acv.wl-tiwai@suse.de>
	<f70b524e-d7fe-495b-9823-c52000d4853e@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bvZpoApt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ENftY49n
X-Spamd-Result: default: False [0.53 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.16)[69.32%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 0.53
X-Rspamd-Queue-Id: D98A61F7FF
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

On Thu, 22 Feb 2024 19:59:14 +0100,
Jaroslav Kysela wrote:
> 
> On 22. 02. 24 19:33, Takashi Iwai wrote:
> > On Thu, 22 Feb 2024 18:36:49 +0100,
> > Jaroslav Kysela wrote:
> >> 
> >> Return used most significant bits from sample bit-width rather than the whole
> >> physical sample word size. The starting bit offset is defined in the format
> >> itself.
> >> 
> >> The behaviour is not changed for 32-bit formats like S32_LE. But with this
> >> change - msbits value 24 instead 32 is returned for 24-bit formats like S24_LE
> >> etc.
> >> 
> >> Also, commit 2112aa034907 ("ALSA: pcm: Introduce MSBITS subformat interface")
> >> compares sample bit-width not physical sample bit-width to reset MSBITS_MAX bit
> >> from the subformat bitmask.
> >> 
> >> Probably no applications are using msbits value for other than S32_LE/U32_LE
> >> formats, because no drivers are reducing msbits value for other formats (with
> >> the msb offset) at the moment.
> >> 
> >> For sanity, increase PCM protocol version, letting the user space to detect
> >> the changed behaviour.
> >> 
> >> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> > 
> > Hmm, the idea is nice, but I hesitate to take this as is.
> > 
> > Basically the kernel should keep the backward compatibility, and this
> > won't (although the feature is very minor).
> > 
> > IMO, it'd be safer to check user_pversion and applies the new behavior
> > only with it being >= 2.0.17, for example.
> 
> It's not so easy. The user_pversion is detached from substream
> (pcm_file structure) and propagating this value to all related
> functions creates really ugly code.
> 
> If you won't accept this ASIS, I propose to add new flags to the
> hw_params structure to alter the msbits behaviour. But I can hardly
> see any impact to the user space. The affected format/msbits
> combination was never used in the kernel drivers. It's more like a
> clarification than a fix.

OK, then let's take this.  I checked the major sound backend apps, and
they don't care about msbits, so the influence must be pretty low.


thanks,

Takashi
