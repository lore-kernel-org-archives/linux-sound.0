Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389978F39
	for <linux-sound@vger.kernel.org>; Sun, 11 May 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746973509; cv=none; b=PS0k2snnh2bOXtK/57D9Ug9V6d1DG6nw597zS/rCFvX7rHNo5j/1vjSjoE14mN4/nbnxCJwOcpitE0yHYmY+l5K08xlo+wy2sZ5H62UXUR0RYpuqveqU0ql0HJR6pTCC2tUi1xZHGanoOmVyuWvvAP6VxaYpDIWnA52yN83ynO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746973509; c=relaxed/simple;
	bh=KC2xo71ONDVOgw4C4U1suwNxWVeRU129e3yOMqQaqOI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5HSrU7PONYrUe0O4HxuqQY8rZ+BycXZufy15PicEHKlvsS3QRWOcD/srim3qLb4y7RchLCK1eNlXIe+V0mIoHkvePoe5GJEh0w22XxrkX64qIlC8VOwyIYiWlzluYePfRCuTVJe/bR/CryvlBEBUVFEVryN8AxaapyJwtkxhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WwrQVBnI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ByE6m0pg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WwrQVBnI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ByE6m0pg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WwrQVBnI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ByE6m0pg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WwrQVBnI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ByE6m0pg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 994E31F390;
	Sun, 11 May 2025 14:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746973505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxDTP0EDR7ip7XkSg613yfxaK3yphbHh1lsogGF8TuA=;
	b=WwrQVBnI84SeP87OOw3EF94ToW6wRht4CiY2MmjSr1Vhe6ZScP2n1q5rPiO9nH2EAzOzZS
	FpEJFBleJ4h+5Ii6JUkG3MqlDuJNbCIyEKtZv+LFzRsgB+Nmxo4zL3gMFrhzCpiPwpTJfl
	HiPyRBDUbDJuLk1lV2ftM5TP8ufLRi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxDTP0EDR7ip7XkSg613yfxaK3yphbHh1lsogGF8TuA=;
	b=ByE6m0pgyp8amTjvq2wozUi9AvvDox2lfVnLOKDVz2Ji6sm5fUqsPktZcqkBRFjNCyD83b
	cbBGArzrUY+fKkAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746973505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxDTP0EDR7ip7XkSg613yfxaK3yphbHh1lsogGF8TuA=;
	b=WwrQVBnI84SeP87OOw3EF94ToW6wRht4CiY2MmjSr1Vhe6ZScP2n1q5rPiO9nH2EAzOzZS
	FpEJFBleJ4h+5Ii6JUkG3MqlDuJNbCIyEKtZv+LFzRsgB+Nmxo4zL3gMFrhzCpiPwpTJfl
	HiPyRBDUbDJuLk1lV2ftM5TP8ufLRi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxDTP0EDR7ip7XkSg613yfxaK3yphbHh1lsogGF8TuA=;
	b=ByE6m0pgyp8amTjvq2wozUi9AvvDox2lfVnLOKDVz2Ji6sm5fUqsPktZcqkBRFjNCyD83b
	cbBGArzrUY+fKkAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CE2813690;
	Sun, 11 May 2025 14:25:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y6pCGUGzIGhScQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:25:05 +0000
Date: Sun, 11 May 2025 16:25:05 +0200
Message-ID: <87ikm7xm0u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: wavefront: remove snd_wavefront_xxx()
In-Reply-To: <87msbmpqls.wl-kuninori.morimoto.gx@renesas.com>
References: <87msbmpqls.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Fri, 09 May 2025 02:36:31 +0200,
Kuninori Morimoto wrote:
> 
> There is no snd_wavefront_xxx() implementation, and no one is using it.
> Let's remove it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks, applied now.


Takashi
