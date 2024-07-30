Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5418F2E8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722321548; cv=none; b=LKNiFpjubZf+S0jnYH+0i2K93jXXrcTFVXFWtO2G4JUlwL0VC/qaAjgdH67wt61TDjsKUoapgFxtIaSEct0B9dpwVTA55Hbuy8Pz4rjdE450fu/kJa3704qtRVQYs8pNju8OoKDyJ35RAGz/hVwsfVXzvRxiinwrYyWVTkaWsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722321548; c=relaxed/simple;
	bh=Yf7i66Qc/+RoI3ASj5goGD77ZovQzuOfEAMR1ZrCelI=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZcUH5hMdv4r8gwWQe2KumRPIWk8PoXqiUGVXCT3o1q7RtWe8y0dSjecO3k6MuPKGHryXkvKFcEcOnAoBB0BO+A/iODgeP9vFheSy6nFPxnpfJsLGfJ7/UQVPwS/+G4T344sBu41kEa8zhb0WYdzHg5dQE/kXILZUe1/oCDORdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xd8n/95x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=twkkZfS/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xd8n/95x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=twkkZfS/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xd8n/95x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="twkkZfS/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xd8n/95x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="twkkZfS/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0E471F7D6
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722321544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rTROBYK0lCqVCYXiv7LQOE5fqz5Rz0tx6/q7oY4fWJQ=;
	b=xd8n/95x+BK28YXViwG4nFbNRgoVwNeMEgdDcHCUb+VMK5zx44AI8vWPK0n+D0Ocrp/Yim
	87qy1Pkrr64kz3Othsh5F4k0frjZtW/vRdYvLK0Mijxfph5sL1OtLZu6DyzpNtHMu6QjPZ
	/oJq3+68Bf0nItNU8L6g6stbOol41JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722321544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rTROBYK0lCqVCYXiv7LQOE5fqz5Rz0tx6/q7oY4fWJQ=;
	b=twkkZfS/3RHgCEkP60SxPJYPh2/KNtSVk8f/O92oLFAGkYyfcxOUo3bXg7x8BoQAn8NhMy
	DziUh6KKVRhnDDAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722321544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rTROBYK0lCqVCYXiv7LQOE5fqz5Rz0tx6/q7oY4fWJQ=;
	b=xd8n/95x+BK28YXViwG4nFbNRgoVwNeMEgdDcHCUb+VMK5zx44AI8vWPK0n+D0Ocrp/Yim
	87qy1Pkrr64kz3Othsh5F4k0frjZtW/vRdYvLK0Mijxfph5sL1OtLZu6DyzpNtHMu6QjPZ
	/oJq3+68Bf0nItNU8L6g6stbOol41JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722321544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rTROBYK0lCqVCYXiv7LQOE5fqz5Rz0tx6/q7oY4fWJQ=;
	b=twkkZfS/3RHgCEkP60SxPJYPh2/KNtSVk8f/O92oLFAGkYyfcxOUo3bXg7x8BoQAn8NhMy
	DziUh6KKVRhnDDAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89FB513297
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 06:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TJ0CIIiKqGbAYQAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 06:39:04 +0000
Date: Tue, 30 Jul 2024 08:39:40 +0200
Message-ID: <87cymv9ydv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use non-SG allocation for the communication buffers
In-Reply-To: <20240729120951.6601-1-tiwai@suse.de>
References: <20240729120951.6601-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.10

On Mon, 29 Jul 2024 14:09:50 +0200,
Takashi Iwai wrote:
> 
> The azx_bus->dma_type is referred only for allocating the
> communication buffers like CORB/RIRB, and the allocation size is
> small.  Hence it doesn't have to be S/G buffer allocation, which is an
> obvious overkill.  Use the standard SNDRV_DMA_TYPE_DEV_WC instead.
> 
> Looking at the commit history, this change was done together with a
> workaround of memalloc fixes, and it must come from misunderstanding
> of the data used there.
> 
> Fixes: 37137ec26c2c ("ALSA: hda: Once again fix regression of page allocations with IOMMU")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

This turned out to be a possible breaker.  The current wc page
allocator has specific workarounds for x86 that doesn't use the DMA
API, and this won't work with IOMMU.

Another fix for x86 is needed to correct the WC page allocation
behavior at first.


Takashi


> ---
>  sound/pci/hda/hda_intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index b33602e64d17..ad474ca9b24e 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1809,7 +1809,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
>  
>  	/* use the non-cached pages in non-snoop mode */
>  	if (!azx_snoop(chip))
> -		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC_SG;
> +		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
>  
>  	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
>  		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
> -- 
> 2.43.0
> 
