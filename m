Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780D155389
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773189; cv=none; b=MVzCURhYPtkiRR024Oo8NXNfRPW0c1QT9rTrswxOS5LCToqwumtuj9xkGOjlC51nNZdJCRLMcYAznWupLw8sMpSlSPJSl6wKFfK29GjYREAdBt4ajvzBrxlD3Gq6NiOQtQqi2NT8+f+Mc5QlSsdaFKELM1yMmNU1GQ4eztb0CDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773189; c=relaxed/simple;
	bh=L0e4JFzU8e4jQ+kPzfCRPydB9hU8l34KjN5tR5cxBFM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWi105r+MyOnbtmFvu2LwIm1rfwqnm/Vv3cawTPTPrSAoTcya0HxpFnjHXdm9uy+FS8XbuYNzvtZiUu8/4uWIEg4xGcNHPaBq7esbKgSpjCiWZuqwajSxyPIz8l+w5xZ67uglqE0K7IQ9cBe5gVhfr0EGgqjcDPKld/IpFv1Iwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xoTKO9dl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BMFRQvht; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xoTKO9dl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BMFRQvht; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xoTKO9dl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BMFRQvht";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xoTKO9dl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BMFRQvht"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0564B33AEB;
	Wed,  7 Jan 2026 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767773182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUqGaApACRwuHkpA47476WgTAHJN6ohMVfGZyxQCGRg=;
	b=xoTKO9dluiboxZYvqqylauS5sOem8sFGHUJm3CGsKxNIIu9ALf4XWwMn7iFkG+m9HzXsDc
	j201iFi4grpdI7T23a99CftChGkutEMiB5/Fin6aYCNYIZNsfOUls6d6FecEt6DrzovoHD
	ZgL8xV1qrq8/DWpNqS9ztb5uSl+9gIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767773182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUqGaApACRwuHkpA47476WgTAHJN6ohMVfGZyxQCGRg=;
	b=BMFRQvht0MPErzT7NR2wfweHRM6nY5f2xLxlx+eCuC3rOxDAmAH70HpUUUtIurLdeYjh86
	sasiAh3UPYME/YCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767773182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUqGaApACRwuHkpA47476WgTAHJN6ohMVfGZyxQCGRg=;
	b=xoTKO9dluiboxZYvqqylauS5sOem8sFGHUJm3CGsKxNIIu9ALf4XWwMn7iFkG+m9HzXsDc
	j201iFi4grpdI7T23a99CftChGkutEMiB5/Fin6aYCNYIZNsfOUls6d6FecEt6DrzovoHD
	ZgL8xV1qrq8/DWpNqS9ztb5uSl+9gIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767773182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUqGaApACRwuHkpA47476WgTAHJN6ohMVfGZyxQCGRg=;
	b=BMFRQvht0MPErzT7NR2wfweHRM6nY5f2xLxlx+eCuC3rOxDAmAH70HpUUUtIurLdeYjh86
	sasiAh3UPYME/YCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC6183EA63;
	Wed,  7 Jan 2026 08:06:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T9h7MP0TXmk3SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Jan 2026 08:06:21 +0000
Date: Wed, 07 Jan 2026 09:06:21 +0100
Message-ID: <87ikddetj6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Nikhil Mahale <nmahale@nvidia.com>
Subject: Re: [PATCH] ALSA: hda - fix function names & missing function parameter
In-Reply-To: <20260106185951.2179242-1-rdunlap@infradead.org>
References: <20260106185951.2179242-1-rdunlap@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.755];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.25

On Tue, 06 Jan 2026 19:59:51 +0100,
Randy Dunlap wrote:
> 
> Use the correct function names and add a function parameter description
> to avoid kernel-doc warnings:
> 
> hda_jack.h:97: warning: Function parameter or struct member 'cb' not
>  described in 'snd_hda_jack_detect_enable_callback'
> hda_jack.h:97: warning: expecting prototype for snd_hda_jack_detect_enable().
>  Prototype was for snd_hda_jack_detect_enable_callback() instead
> hda_local.h:441: warning: expecting prototype for _snd_hda_set_pin_ctl().
>  Prototype was for snd_hda_set_pin_ctl() instead
> 
> Fixes: cdd03cedc5b5 ("ALSA: hda - Introduce snd_hda_set_pin_ctl*() helper functions")
> Fixes: 5204a05d70d9 ("ALSA: hda - Add DP-MST jack support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied to for-next branch now.  Thanks.


Takashi
