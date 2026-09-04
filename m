Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13E3D75BE
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508261; cv=none; b=JHPZ9oMgdeC2p+FU8Tl4AX3ReYLF2F2TgeXbn3oWk597U3aYOVB0yIHMpomPfVkUjsLCakYlzT54nvlayga1La8/9u4/A8zznBHpKdOV7nGLHNaynyD4jrhOovPY70NFEfgPYu7TOHP9/BTUN0afgZB0XYIM8XOEcUF7zejiS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508261; c=relaxed/simple;
	bh=4agTsLLr9AYEsEkq2B8uWLhbB3jHUa8ZdYBjJ+DShNA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bn1l4mN9SbLlCZTVToJN1lyTI1Vh97nI9ZAg29tDKqlQTNa7X7Osf6nPifCk/Z/PhwzHBBRHjDZUx0D8AZQeR5sQCx7dbXNdaGYziTh9Imtx/RX0zHxQhaBm8sN3nWjBNbMDZkMCGT/ErJO8fuagjYSYYnhonXJscc2Y0KDXSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SZ2TyN8J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yXDGN3v0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UFZy23gO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eqich8IH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SZ2TyN8J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yXDGN3v0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UFZy23gO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eqich8IH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C784522B2B;
	Fri,  4 Sep 2026 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788508254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yABdqs37snls1eKYYFczOz2P4+3juG+08angIzmhCow=;
	b=SZ2TyN8JwRMu6Ipmh3cLTq/gCxpc9q82FE+9yxEInpDKH3Hrm1+94/E3YVyo7CIrmGf8OQ
	PTW6TngwSaJGswrxFGaCBMu0aGXiCYsWEOyv3NqsvNTQ8juwM1nynmWsaydp9AzB/OBI2q
	azf8UHLTqUuSM4HMXSfLpo7Bm6ccR7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788508254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yABdqs37snls1eKYYFczOz2P4+3juG+08angIzmhCow=;
	b=yXDGN3v0J65kFejtNAOLX6jJXpo9+5ij7LYCi/pAwGWGP6g+CbEkJ/SeRIDk0ZZX0TaVRV
	CEVS8t3gBoqtB4BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788508249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yABdqs37snls1eKYYFczOz2P4+3juG+08angIzmhCow=;
	b=UFZy23gOkhvqCa8ij8WSwYo6g6n+DhDxyW+cYvk9J7jj+mgfHA7X+PtZIeMUNlDa6HNhj2
	tfLbwtFICqaj3FfJO25bM44yXWT6JXRbWLmDcfYOqBPzXSrStTbCv64GjyoiubNHtPVv+O
	tytzyYV2d+P7n1QWwBWReLRKjSXhkAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788508249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yABdqs37snls1eKYYFczOz2P4+3juG+08angIzmhCow=;
	b=eqich8IHeoqwkkVraIwwjUWs0mxEfSLdhNG3YZGnsVeVjTOhbgVAFnrdkyID9oxdYKphpJ
	UKG7UM7xCWTT1pCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DE6713678;
	Fri,  4 Sep 2026 07:50:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B0mvFVl4mmpCJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Sep 2026 07:50:49 +0000
Date: Fri, 04 Sep 2026 09:50:48 +0200
Message-ID: <87a4px78vb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 01/23] ALSA: compress: pin card module while stream is open
In-Reply-To: <20260904073134.29648-2-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
	<20260904073134.29648-2-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,oss.qualcomm.com,vger.kernel.org,linux.intel.com,linux.dev,nxp.com,amd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]

On Fri, 04 Sep 2026 09:31:12 +0200,
Peter Ujfalusi wrote:
> 
> Take a module reference in snd_compr_open() and release it in
> snd_compr_free(). This pins the card driver module for the
> lifetime of an open compress stream and prevents card removal
> while the stream file is still in use.
> 
> Adjust the open() cleanup paths to drop the added module
> reference only when it was acquired, and keep release ordering
> safe by dropping the module reference before freeing stream
> data.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>

While we're at it: the compress-offload seems missing the call of
snd_card_file_add() and snd_card_file_remove() at open/close, too.
By adding those, the unexpected syscalls are guarded in the core side
after disconnection by replacing file ops.


thanks,

Takashi
