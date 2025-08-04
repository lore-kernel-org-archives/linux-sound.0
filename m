Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E8880B
	for <linux-sound@vger.kernel.org>; Mon,  4 Aug 2025 18:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754330597; cv=none; b=sryfh5T4E2W71cwQoZ80EC6BYYAC5ZZ0U2Flc+2BncjSH3Vgl3cw6fVsa3KIURPCtEBu853ga/hXjz/CCVvrT2GVRSO07d3HxM3Nmv0C9Df489j09a3Ez4gk/1bme9sH5JFoFEp/27gvXBZkDAMxtEKhgdWbZDNKd3uxy9VlbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754330597; c=relaxed/simple;
	bh=5vdopfzOlmBBqp5RrfGg09zBTHWprxzs9Px1FvWvhgQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TR5dxtdbZ5LeMGVwU+NNKksLuI5eN7sc25FAPQEaGL3yHg50y42Ti3jzXB2vcyesaKCixMYyxzE64xrlewlnesJjaKSnLXKhfdRnPPvL8dflNQYjXDARNWqGWZk6pYSu6ADlF97bv4Pd9jrUT80Tn9HX2OcV/dh/OgKW79KE5E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzNTXtnd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fq7AfiWq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzNTXtnd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fq7AfiWq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzNTXtnd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fq7AfiWq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzNTXtnd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fq7AfiWq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C42F1F38C;
	Mon,  4 Aug 2025 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754330592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMST0bVlyrbTvevVIVHtAabMw8SoKm7mDTKAnsBWK2U=;
	b=JzNTXtndacy+1GGgsXdGUxlNvDQkTqPJ0CDCpXWSOmahbmygDkVAro//smAFFgBMb18AIS
	gx33BM//6QSMQ9b5LwOtNyCmzWQ6iJZfq4Cou43k3EE7jG1pAsacQ7DTBpWRhPLLwD6XJE
	a78uQfw+vIBy7+QvCrtUK+J3yT4GRVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754330592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMST0bVlyrbTvevVIVHtAabMw8SoKm7mDTKAnsBWK2U=;
	b=Fq7AfiWqgyUl76sPC0M6eYKg9vYVAhSajN5Oye6iQojMLApVafqzxWcVefC+cdju4SKTum
	40jCfatoD90TeQDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JzNTXtnd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fq7AfiWq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754330592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMST0bVlyrbTvevVIVHtAabMw8SoKm7mDTKAnsBWK2U=;
	b=JzNTXtndacy+1GGgsXdGUxlNvDQkTqPJ0CDCpXWSOmahbmygDkVAro//smAFFgBMb18AIS
	gx33BM//6QSMQ9b5LwOtNyCmzWQ6iJZfq4Cou43k3EE7jG1pAsacQ7DTBpWRhPLLwD6XJE
	a78uQfw+vIBy7+QvCrtUK+J3yT4GRVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754330592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMST0bVlyrbTvevVIVHtAabMw8SoKm7mDTKAnsBWK2U=;
	b=Fq7AfiWqgyUl76sPC0M6eYKg9vYVAhSajN5Oye6iQojMLApVafqzxWcVefC+cdju4SKTum
	40jCfatoD90TeQDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 613A0133D1;
	Mon,  4 Aug 2025 18:03:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vPIzFuD1kGhYJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Aug 2025 18:03:12 +0000
Date: Mon, 04 Aug 2025 20:03:11 +0200
Message-ID: <87jz3j0xsw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Croft <thomasmcft@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add LG gram 16Z90R-A to alc269 fixup table
In-Reply-To: <20250804151457.134761-2-thomasmcft@gmail.com>
References: <20250804151457.134761-2-thomasmcft@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8C42F1F38C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Mon, 04 Aug 2025 17:12:07 +0200,
Thomas Croft wrote:
> 
> Several months ago, Joshua Grisham submitted a patch [1]
> for several ALC298 based sound cards.
> 
> The entry for the LG gram 16 in the alc269_fixup_tbl only matches the
> Subsystem ID for the 16Z90R-Q and 16Z90R-K models [2]. My 16Z90R-A has a
> different Subsystem ID [3]. I'm not sure why these IDs differ, but I
> speculate it's due to the NVIDIA GPU included in the 16Z90R-A model that
> isn't present in the other models.
> 
> I applied the patch to the latest Arch Linux kernel and the card was
> initialized as expected.
> 
> [1]: https://lore.kernel.org/linux-sound/20240909193000.838815-1-josh@joshuagrisham.com/
> [2]: https://linux-hardware.org/?id=pci:8086-51ca-1854-0488
> [3]: https://linux-hardware.org/?id=pci:8086-51ca-1854-0489
> 
> Signed-off-by: Thomas Croft <thomasmcft@gmail.com>

Applied now.  Thanks.


Takashi
