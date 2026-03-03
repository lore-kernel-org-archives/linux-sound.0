Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9D37BE9E
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531141; cv=none; b=oMCyAVZSmngr/8fchbFjHRlrXJ6VAazTrQJ/LP8rwNa+qEip89/vlhK/Z8jfRKTpAUD9HAca6Gw6gg3xQ0pm++IIMZtx3o8ev0vgsj2dat+icl2pr0e0WJB1sfE0dfRLE7GZXlEdYTXZj1Ygwus/r7zMROkeEcsMq0Y3QLcM9os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531141; c=relaxed/simple;
	bh=FfzuCNV7yn5gA4+P1QRqjIi2VlSypftuIKBnZMUL/LA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOHNHJkdKYDCkFDEzg9r2Ay76QdNKXJYVnuX44yLDzgNjwnqZ9IN5eGbeNVn6hhBq3ctfVY+gdXE7PXZP27hgxc7O/w0FEJPrPiIJwaz97QakfIsXeT7SL/iASXQ9HPbkcOmJSR0IS6kr9w/MZ4th1+XmXVPDGwDzRX83BzkObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OBZdDjQS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8rrFhQtA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OBZdDjQS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8rrFhQtA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OBZdDjQS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8rrFhQtA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OBZdDjQS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8rrFhQtA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6BFEC5BE1A;
	Tue,  3 Mar 2026 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772531138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0OpAVuToLEgJpOPlQKxhYVAiIuYBjrnelb+yAnBKNc=;
	b=OBZdDjQSgyNJLxq1Hs6O3LPf7Byg7mQdigoITFagi0Emz+CFiBqQEO0v1aYu4q4PEHtnvf
	4pvOrb+og4R7byLTExsgOnKbtgWvNC//n8sAWcZH8PEfDTE264xCs72buEvcB24ZqmxI5g
	IEgIzBWgiVifUxQqLSWdhsfZ/Pch00M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772531138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0OpAVuToLEgJpOPlQKxhYVAiIuYBjrnelb+yAnBKNc=;
	b=8rrFhQtAtKHq46ZZchDJb5lCPYWrm3fli8xZUfejJ1SGoqTKAev75vQI9P1yogmrXt28Yx
	eWPtzgFtDH8cA+CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772531138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0OpAVuToLEgJpOPlQKxhYVAiIuYBjrnelb+yAnBKNc=;
	b=OBZdDjQSgyNJLxq1Hs6O3LPf7Byg7mQdigoITFagi0Emz+CFiBqQEO0v1aYu4q4PEHtnvf
	4pvOrb+og4R7byLTExsgOnKbtgWvNC//n8sAWcZH8PEfDTE264xCs72buEvcB24ZqmxI5g
	IEgIzBWgiVifUxQqLSWdhsfZ/Pch00M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772531138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0OpAVuToLEgJpOPlQKxhYVAiIuYBjrnelb+yAnBKNc=;
	b=8rrFhQtAtKHq46ZZchDJb5lCPYWrm3fli8xZUfejJ1SGoqTKAev75vQI9P1yogmrXt28Yx
	eWPtzgFtDH8cA+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33D533EA69;
	Tue,  3 Mar 2026 09:45:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DOxIC8KtpmkNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 09:45:38 +0000
Date: Tue, 03 Mar 2026 10:45:37 +0100
Message-ID: <87h5qxjlfi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/senary: Ensure EAPD is enabled during init
In-Reply-To: <20260303081516.583438-1-wangdich9700@163.com>
References: <20260303081516.583438-1-wangdich9700@163.com>
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
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, 03 Mar 2026 09:15:16 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The driver sets spec->gen.own_eapd_ctl to take manual control of the
> EAPD (External Amplifier). However, senary_init does not turn on the
> EAPD, while senary_shutdown turns it off.
> 
> Since the generic driver skips EAPD handling when own_eapd_ctl is set,
> the EAPD remains off after initialization (e.g., after resume), leaving
> the codec in a non-functional state.
> 
> Explicitly call senary_auto_turn_eapd in senary_init to ensure the EAPD
> is enabled and the codec is functional.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> 
> v1->v2:
> Change the email address to be consistent with the Signed-off-by line.

Thanks, applied now.


Takashi
