Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F003126C2
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 06:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772087916; cv=none; b=a89GXSs/MKYiTXLlFz9GNmkEgEEl0UtMfLFxu+hX37ygijYTujeyNocEgSx5XaGV0FyfKJgtT41Zq24xe++d2Qh3j8+KxrhPM6U6EZwE79ACyWJvsPLSx4R23cBREb/L39RXDOX38yNU6fWHk56rvMWsDzgYKthLoToCwQwuj4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772087916; c=relaxed/simple;
	bh=UIY0kYUyOyPAz4gqVV5uoOkMGIg4Z4TOy9p1aJfnzhM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUyTPqPNZb8Dw2Z9vXhXuNR1DaoSfjfr4DcMZ0RYWqyWj+6/hwAHovpWlZNV+OfY04542XIh0oWD3QSs51OBbClY5pKzbRvz6hWf+0Yit3U8il5PZe1bxOsbNLCXXB4D0fHDP+FCXxcCsC5nOCT9k79OZVYk1n/+WQdKbXiBiws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DhdjL5mD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sZLCyv9r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DhdjL5mD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sZLCyv9r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DhdjL5mD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZLCyv9r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DhdjL5mD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZLCyv9r"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72BE45BF0F;
	Thu, 26 Feb 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772087913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNBnHy6Wt6KIMmNtQkTGAQl4rker7iQYbWNqsGDyPpU=;
	b=DhdjL5mD5pZl/Eo1E+xfVy879vCFScHVAsayfvtanGJC5FRjPFZaszhqqIysGrqNFAXkc1
	+IatCbnLyRVFkZ1SPg3HG+D3CF6CSUN7esyWl4gmGrdC6GADJKS22KlIO73LZPn9VfVjDC
	YcXdKISgXTJ+VErmlRrolP6qFzI5CpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772087913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNBnHy6Wt6KIMmNtQkTGAQl4rker7iQYbWNqsGDyPpU=;
	b=sZLCyv9rqzZTCma2CuI8noJhiPRpVEg7ApHg0pg2yKN0BSxcudR+YOw/st7ppaCDzd/ei3
	mGGMRwtSzV2/46CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772087913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNBnHy6Wt6KIMmNtQkTGAQl4rker7iQYbWNqsGDyPpU=;
	b=DhdjL5mD5pZl/Eo1E+xfVy879vCFScHVAsayfvtanGJC5FRjPFZaszhqqIysGrqNFAXkc1
	+IatCbnLyRVFkZ1SPg3HG+D3CF6CSUN7esyWl4gmGrdC6GADJKS22KlIO73LZPn9VfVjDC
	YcXdKISgXTJ+VErmlRrolP6qFzI5CpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772087913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNBnHy6Wt6KIMmNtQkTGAQl4rker7iQYbWNqsGDyPpU=;
	b=sZLCyv9rqzZTCma2CuI8noJhiPRpVEg7ApHg0pg2yKN0BSxcudR+YOw/st7ppaCDzd/ei3
	mGGMRwtSzV2/46CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ECA33EA62;
	Thu, 26 Feb 2026 06:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u1tFCWnqn2kTJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 06:38:33 +0000
Date: Thu, 26 Feb 2026 07:38:32 +0100
Message-ID: <87a4wwc8lz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jun Seo <junwoo93s@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jun Seo <jun.seo.93@proton.me>
Subject: Re: [PATCH] ALSA: usb-audio: Use correct version for UAC3 header validation
In-Reply-To: <20260226010820.36529-1-jun.seo.93@proton.me>
References: <20260226010820.36529-1-jun.seo.93@proton.me>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[proton.me:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO

On Thu, 26 Feb 2026 02:08:20 +0100,
Jun Seo wrote:
> 
> The entry of the validators table for UAC3 AC header descriptor is
> defined with the wrong protocol version UAC_VERSION_2, while it should
> have been UAC_VERSION_3.  This results in the validator never matching
> for actual UAC3 devices (protocol == UAC_VERSION_3), causing their
> header descriptors to bypass validation entirely.  A malicious USB
> device presenting a truncated UAC3 header could exploit this to cause
> out-of-bounds reads when the driver later accesses unvalidated
> descriptor fields.
> 
> The bug was introduced in the same commit as the recently fixed UAC3
> feature unit sub-type typo, and appears to be from the same copy-paste
> error when the UAC3 section was created from the UAC2 section.
> 
> Fixes: 57f8770620e9 ("ALSA: usb-audio: More validations of descriptor units")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jun Seo <jun.seo.93@proton.me>

Thanks, applied now.


Takashi
