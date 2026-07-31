Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640A489873
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480044; cv=none; b=rtKND2VCgOOLZvESIkm28snzX5+aymPaHsDHoxK4eBmukaL3oqE/n1L8+7HWhTitwtRiOLVq/5u/iCfX3G+xD56hud6+Z79TT/HMy2/SOwZL8SRxFBB5cAbk2AUJs0lqv1xqJyjx4VU0JQiDtwBzJYTxWVxOZBOFxWrnGx4nRVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480044; c=relaxed/simple;
	bh=BWgC5UgPCaeNjoS/T/ON/haiA498AVslPzFKx3refOw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYWQ2PeL3U3DmTGriLptrKc2TCgUZKH75JVSM64trCwq5uzZ84B21mC/flfILXtLfmpJqSezR9ZhlzSBjc/gLGo7YIowftfIdUh9dvDsw86UKq4SqdmzXrjJw604Jug0pUsnM/TTOkobqfPMoErXZax1evQixfziuaT1ObrTMMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TFohkBj3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YjwUXseX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gf2FIjXA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rJfMP2d3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TFohkBj3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YjwUXseX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gf2FIjXA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rJfMP2d3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A33D7DDF3;
	Fri, 31 Jul 2026 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785480037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itJjti+59e8HASZL0LRRl98pYeXPJxxOcd5KLMN+qJM=;
	b=TFohkBj38Zz1gB4LnCgK0GunSQlVI+aOdVIzJA2VG/e+Ime+EsJ0BzGIVtUcHLAH58dVO4
	2b6Zfosem8h3OoGxFxqTFPNrz5LisEKFeMI8Jhov6KI8+idcofAup7nbltOl45mVLVS7sl
	BWHXR5cAutRJe+x+sbCo1qucr9GoFKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785480037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itJjti+59e8HASZL0LRRl98pYeXPJxxOcd5KLMN+qJM=;
	b=YjwUXseXfuBWwSwW8huElavhnB6kOJoFTIcbJ+bd9630C7FgZ8814h6WoYrHVrF7NyjpRM
	7a7CNYOnwFGx39BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Gf2FIjXA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rJfMP2d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785480033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itJjti+59e8HASZL0LRRl98pYeXPJxxOcd5KLMN+qJM=;
	b=Gf2FIjXASY/IFIvcvpTkmrfXRac6hYQKWbCIYTxW0NWGjdRQ/F6s8xP3D80qma4QWwNf9r
	oOcvzwuvabRWVKNdTmFCruMXZyMLLgabgPZDJmNuHRGAGResoTLwtMjF/uQ4mlyQUzzmZZ
	0WLwbiKhpHWEFQcoP98K7tpheqhl4vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785480033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itJjti+59e8HASZL0LRRl98pYeXPJxxOcd5KLMN+qJM=;
	b=rJfMP2d3bEyH7RQCChyMCVRwUTokBtVbjjx8HOTMcBmmmxpRLIbJpFmJK/NWo7atc/4FzJ
	tFI1v7nDpl/vBCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CB0B779B0;
	Fri, 31 Jul 2026 06:40:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VIZyEWFDbGoSMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 Jul 2026 06:40:33 +0000
Date: Fri, 31 Jul 2026 08:40:32 +0200
Message-ID: <87bjbn1x27.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ian Bridges <icb@fastmail.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Add hda_append_suffix() local helper
In-Reply-To: <amuQK0k9uIalPCxA@dev>
References: <20260730161518.641254-1-tiwai@suse.de>
	<amuQK0k9uIalPCxA@dev>
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
X-Rspamd-Queue-Id: 6A33D7DDF3
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 30 Jul 2026 19:55:55 +0200,
Ian Bridges wrote:
> 
> On Thu, Jul 30, 2026 at 06:14:03PM +0200, Takashi Iwai wrote:
> > As strlcat() shall be deprecated in future, provide an alternative
> > just for a simple purpose -- append a suffix string to the given
> > string buffer -- and use it at appropriate places.  The code isn't
> > really efficient, but we don't ask for speed here, so let it be.
> 
> The patch was tested as follows:
>  - Applied on today's for-next (f817bac425c5) on top of the two jack
>  name cleanup patches. W=1 build of sound/hda/, no new warnings.
> 
>  - A userspace harness compared hda_append_suffix() against
>  both the kernel strlcat() and the strncat() form in jack.c,
>  exhaustively over buffer sizes, fill levels and suffix
>  lengths, comparing every byte of the buffer. All cases
>  were byte identical, including truncation.
> 
>  - A QEMU boot with intel-hda and hda-duplex, comparing the PCM
>  stream names, the codec proc dump and the full control
>  element list between base and patched kernels. The captures
>  were byte identical.
> 
> Ian
> 
> Reviewed-by: Ian Bridges <icb@fastmail.org>
> Tested-by: Ian Bridges <icb@fastmail.org>

Thanks for checking.  Applied now to for-next branch.


Takashi
