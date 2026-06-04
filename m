Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985939DBE8
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561276; cv=none; b=Jjl+OwVpUpQXUheZX3EUK98TEpkIl2h8xBzq+P1OIl1/mXqEgm9RXnpiZyGkWHpZCMoPgVxvEg8IKESXaGlBmUWsNdTXUGmHzn13jwEXmBsHsX5N9Hcf9rhpnkLy9bPDOfg/qG3s8hg2in11BtUS5W5uE5c6gNfqqAKt+iNXs3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561276; c=relaxed/simple;
	bh=oIVFq2W13F67kqa0rmqTUbGvpUxmePtWG0LFd/T5qNM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHJnNE4Zv43mbSxhG0p8HR+5PWR69XRo05QmukKZyKl/hm+nLPiu/rqg3alwaaimhBNjOL/04MV8342Rw87C7A5hkDUbtRWx4reHif9YjAGiCfZvCTYCIAsrCzu7XMvh1vYUjXTidn/QhAWmlUbuxJgi6VNG2dbNg5z3YTSjRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IX8+/dn8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sWIpeyhC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IX8+/dn8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sWIpeyhC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IX8+/dn8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sWIpeyhC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IX8+/dn8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sWIpeyhC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D45756ADEE;
	Thu,  4 Jun 2026 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780561272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UY4/pMd32RXSBk/eOmKNiL8GJ39HWsjBJ73UXVQEB5I=;
	b=IX8+/dn8qXhjJb+0vkIKwy2QzdNy3wJAXfFBwGxtvdEPbJ6KFpHmbC9MtUGcTAMxYKcaKQ
	lzGHZFrCCz6KJ7qGsTroQBMUeGm7NC1VJOOY419T5AMZcBBXQ2FGXAkEZCo1iWajYDtZkE
	GETfEUihxDCIyfurbhCS6M2B0BlIkN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780561272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UY4/pMd32RXSBk/eOmKNiL8GJ39HWsjBJ73UXVQEB5I=;
	b=sWIpeyhC+0EZkS/znOMXRtOtUAbBlT3BI9ijhQqrYu5ukksgsq6Y2xLTnJ6kxaFH68tgkN
	+CEDsbI7tXcrxVBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="IX8+/dn8";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sWIpeyhC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780561272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UY4/pMd32RXSBk/eOmKNiL8GJ39HWsjBJ73UXVQEB5I=;
	b=IX8+/dn8qXhjJb+0vkIKwy2QzdNy3wJAXfFBwGxtvdEPbJ6KFpHmbC9MtUGcTAMxYKcaKQ
	lzGHZFrCCz6KJ7qGsTroQBMUeGm7NC1VJOOY419T5AMZcBBXQ2FGXAkEZCo1iWajYDtZkE
	GETfEUihxDCIyfurbhCS6M2B0BlIkN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780561272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UY4/pMd32RXSBk/eOmKNiL8GJ39HWsjBJ73UXVQEB5I=;
	b=sWIpeyhC+0EZkS/znOMXRtOtUAbBlT3BI9ijhQqrYu5ukksgsq6Y2xLTnJ6kxaFH68tgkN
	+CEDsbI7tXcrxVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A56FC779A8;
	Thu,  4 Jun 2026 08:21:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MoABJ3g1IWqvBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 08:21:12 +0000
Date: Thu, 04 Jun 2026 10:21:12 +0200
Message-ID: <87a4tawwav.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH 0/3] ALSA: scoped cleanup improvements for ALSA core
In-Reply-To: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
References: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
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
X-Rspamd-Queue-Id: D45756ADEE
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Thu, 04 Jun 2026 06:48:11 +0200,
Cássio Gabriel wrote:
> 
> This series converts a few local ALSA ownership patterns
> to scoped cleanup helpers.
> 
> - The first patch uses __free(kvfree) for temporary user control buffers
> in the ALSA control core.
> - The second patch promotes the existing local snd_card_unref cleanup
> helper to the common ALSA core header and uses it for temporary card
> references in the control layer.
> - The third patch applies the same idea to the temporary OSS sequencer
> MIDI use-lock reference added for embedded SysEx event lifetime handling.
> 
> These are cleanup/hardening changes only. No functional change is intended.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (3):
>       ALSA: control: Use scoped cleanup for user control buffers
>       ALSA: core: Add scoped cleanup helper for card references
>       ALSA: seq: oss: Use scoped cleanup for temporary MIDI use lock

Applied all three patches to for-next branch.  Thanks.


Takashi
