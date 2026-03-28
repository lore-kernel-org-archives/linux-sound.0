Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563C738E13E
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774703652; cv=none; b=eR1xCkBwGnP/rROXTio47FUNnomSA1wNULXpx+GTGbT+UJ44LuKJX/jPDTZEN4P16TIzodrTXW0u3OZk63OsRXzrn7ICIRNDZU+rBq0Z0/2Zwkd1zA3VOOU/TiZ+hVqWpO9vAjSay0kmuvv8tadxWY9L0YrdaZwL06ZAXidl4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774703652; c=relaxed/simple;
	bh=IFTRdAfwTKP+rUqVd7+XNkaeJSz42dKkIdZAkB2I8yo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubM/88T/le+Cwae8zvU4mai37XzypxlflHNi+nDhj51kMmjrtTZleHhF/IF2cGwdFI8NBKuHV4iQ+NKuj9kGbLErOen+s0WrIjtfaxbW2UjoYdj5PWqmrS6T+Ns2GeoNpEYjqaxq+KiVCZH5pSgOfaR9lEpusFE1k4PTx60dhrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RXIMkxL2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pEeQasHt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RXIMkxL2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pEeQasHt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RXIMkxL2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pEeQasHt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RXIMkxL2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pEeQasHt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A30A25BD3E;
	Sat, 28 Mar 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774703643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4/h70CIEBoUcSPi1za1N5fHr/YRV7VAdw7MxOhN/Aw=;
	b=RXIMkxL2U9rVnM35pAsEj1rg4kbhR/6AVhIIVSmfG1dJ2V8YmqRAVlQaV3iobbakEjKVtA
	9nTELrHVABIrLqtF7kCDFpigw9KbT+zvuywS+rm+oDh7P7MafaDibBsoB5E2hsQAsQZPAv
	K8VYUaWGCTKrUQabnOUs0X6E6/pYe5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774703643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4/h70CIEBoUcSPi1za1N5fHr/YRV7VAdw7MxOhN/Aw=;
	b=pEeQasHtlBHvG+gyX5V+cNqq3uIljdF20tUbiVNGP2FMFwhcq6n8MHO3Zo7w0WQM+dP3Xx
	A62iumSP69GDIJCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774703643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4/h70CIEBoUcSPi1za1N5fHr/YRV7VAdw7MxOhN/Aw=;
	b=RXIMkxL2U9rVnM35pAsEj1rg4kbhR/6AVhIIVSmfG1dJ2V8YmqRAVlQaV3iobbakEjKVtA
	9nTELrHVABIrLqtF7kCDFpigw9KbT+zvuywS+rm+oDh7P7MafaDibBsoB5E2hsQAsQZPAv
	K8VYUaWGCTKrUQabnOUs0X6E6/pYe5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774703643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4/h70CIEBoUcSPi1za1N5fHr/YRV7VAdw7MxOhN/Aw=;
	b=pEeQasHtlBHvG+gyX5V+cNqq3uIljdF20tUbiVNGP2FMFwhcq6n8MHO3Zo7w0WQM+dP3Xx
	A62iumSP69GDIJCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74A404A0A3;
	Sat, 28 Mar 2026 13:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EDVdGhvUx2lmCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 13:14:03 +0000
Date: Sat, 28 Mar 2026 14:14:03 +0100
Message-ID: <87y0jcumec.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: asihpi: detect truncated control names
In-Reply-To: <20260328102808.33969-1-pengpeng@iscas.ac.cn>
References: <20260323070310.55878-1-pengpeng@iscas.ac.cn>
	<20260328102808.33969-1-pengpeng@iscas.ac.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sat, 28 Mar 2026 11:28:08 +0100,
Pengpeng Hou wrote:
> 
> asihpi_ctl_init() builds mixer control names in the fixed 44-byte
> hpi_ctl->name buffer with sprintf().
> 
> This is not only a defensive cleanup. The current in-tree name tables and
> format strings can already exceed 44 bytes. For example,
> 
>   "Bitstream 0 Internal 0 Monitor Playback Volume"
> 
> is 46 characters before the trailing NUL, so the current sprintf() call
> writes past the end of hpi_ctl->name.
> 
> The generated control name is used as the ALSA control element key, so
> blindly truncating it is not sufficient. Switch the formatting to
> snprintf() and emit an error if truncation happens, showing the
> truncated name while still keeping the write bounded to hpi_ctl->name.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied to for-next branch now.   Thanks.


Takashi
