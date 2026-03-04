Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB234CFB9
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640783; cv=none; b=o2VFqlohb1guSeScZKqmQTQoUhs46LKuckcjrnZL5/DYEmvNGt0qZT+igKdtadpmmdKg9vyl3LtTau2PJU76Ojs7VSk4CmtARvjEDN2fCr8vgHGoZ+oJX2llaFASjWZul/SAyAR6vjjAqpMTPxemdsp65vyf76V/wAmJ0qcglAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640783; c=relaxed/simple;
	bh=5/+qQy7Z3GJYPZZ89PP/KMyi8DvgoF3UiTDlsOz+rJo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SM4YB47Zwh8jGrC4idgMKwA3IB0rp+LJeB84GtL57vIs+w7OYSHJFB2caQ5qNBpJfjQLZ3Wn2TFvq4FeuYfdYQ6FZWh+p59yEGpZY9vWWUVlmVsMJ7tV3GCyKoVF9ejHO1hLEtHZPoeWyon6Vsij/RrLx9ngJtsDz0kFJFF3Abo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ouh4/RN/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1iNB0pRm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ouh4/RN/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1iNB0pRm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ouh4/RN/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1iNB0pRm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ouh4/RN/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1iNB0pRm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 458263F8D8;
	Wed,  4 Mar 2026 16:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772640780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vcN3E0bOEFqlYZPfqhDd6nxPLl11xuY0OXjSSYE09vg=;
	b=Ouh4/RN/BAd2GAUR084laYmXq0G4kVxbyE53OWjeD1iyjm2mNW5rhXChm5zn3UtAaury28
	IvF0oQw49Ip7eYa9pviknlGbAb/9sZbLyfS9GFkOS4/YQEYdahpzo7nZFT4lyZTHfn04js
	wwhPpxqZRAJviqWCNS+uHD+axWnPZTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772640780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vcN3E0bOEFqlYZPfqhDd6nxPLl11xuY0OXjSSYE09vg=;
	b=1iNB0pRmEeIRz3ZvFr0k1ePzBsucmmn68CVyvfxPse4RNgUJqzit3teAhp/23gk1r/etj8
	UXpblhuKqeIU2eDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772640780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vcN3E0bOEFqlYZPfqhDd6nxPLl11xuY0OXjSSYE09vg=;
	b=Ouh4/RN/BAd2GAUR084laYmXq0G4kVxbyE53OWjeD1iyjm2mNW5rhXChm5zn3UtAaury28
	IvF0oQw49Ip7eYa9pviknlGbAb/9sZbLyfS9GFkOS4/YQEYdahpzo7nZFT4lyZTHfn04js
	wwhPpxqZRAJviqWCNS+uHD+axWnPZTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772640780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vcN3E0bOEFqlYZPfqhDd6nxPLl11xuY0OXjSSYE09vg=;
	b=1iNB0pRmEeIRz3ZvFr0k1ePzBsucmmn68CVyvfxPse4RNgUJqzit3teAhp/23gk1r/etj8
	UXpblhuKqeIU2eDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13A163EA69;
	Wed,  4 Mar 2026 16:13:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /ymjAwxaqGkXBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Mar 2026 16:13:00 +0000
Date: Wed, 04 Mar 2026 17:12:59 +0100
Message-ID: <87fr6fzi7o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] firmware: cs_dsp: Fix fragmentation regression in firmware download
In-Reply-To: <0a2e0299-600e-4159-be0c-dd641c87e116@opensource.cirrus.com>
References: <20260304141250.1578597-1-rf@opensource.cirrus.com>
	<87fr6fvd25.wl-tiwai@suse.de>
	<0a2e0299-600e-4159-be0c-dd641c87e116@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Flag: NO

On Wed, 04 Mar 2026 16:35:24 +0100,
Richard Fitzgerald wrote:
> 
> On 04/03/2026 3:17 pm, Takashi Iwai wrote:
> > On Wed, 04 Mar 2026 15:12:50 +0100,
> > Richard Fitzgerald wrote:
> >> 
> >> Use vmalloc() instead of kmalloc(..., GFP_DMA) to alloc the temporary
> >> buffer for firmware download blobs. This avoids the problem that a
> >> heavily fragmented system cannot allocate enough physically-contiguous
> >> memory for a large blob.
> >> 
> >> The redundant alloc buffer mechanism was removed in commit 900baa6e7bb0
> >> ("firmware: cs_dsp: Remove redundant download buffer allocator").
> >> While doing that I was overly focused on the possibility of the
> >> underlying bus requiring DMA-safe memory. So I used GFP_DMA kmalloc()s.
> >> I failed to notice that the code I was removing used vmalloc().
> >> This creates a regression.
> >> 
> >> Way back in 2014 the problem of fragmentation with kmalloc()s was fixed
> >> by commit cdcd7f728753 ("ASoC: wm_adsp: Use vmalloc to allocate firmware
> >> download buffer").
> >> 
> >> Although we don't need physically-contiguous memory, we don't know if the
> >> bus needs some particular alignment of the buffers. Since the change in
> >> 2014, the firmware download has always used whatever alignment vmalloc()
> >> returns. To avoid introducing a new problem, the temporary buffer is still
> >> used, to keep the same alignment of pointers passed to regmap_raw_write().
> >> 
> >> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> >> Fixes: 900baa6e7bb0 ("firmware: cs_dsp: Remove redundant download buffer allocator")
> > 
> > FYI, if the data isn't always large, kvmalloc() could be a better
> > alternative, which is a hybrid for both speed and size, too.
> > 
> > 
> > Takashi
> 
> I originally did that, but as this is a bugfix for backporting I decided
> not to risk introducing a change inside a bugfix. The original code was
> vmalloc() so I have corrected back to what the original code did.
> 
> vmalloc() appears to allocate whole pages, on PAGE_SIZE boundary but
> kvmalloc() could allocate on a smaller boundary. I know that kmalloc()
> memory is claimed to be be DMA-safe. But I don't want to risk fixing one
> regression and introducing a new regression into stable kernels.
> 
> It's on my to-do list to have a look at using kvmalloc(), and possibly
> skipping the buffer if the source data is already aligned on
> ARCH_KMALLOC_MINALIGN. But that's for future kernel releases.

OK, then the change sounds reasonable.  Thanks for explanation!


Takashi
