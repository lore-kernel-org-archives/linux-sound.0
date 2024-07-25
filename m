Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D251BC43
	for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897908; cv=none; b=OIAxeM5U5MH9TQWofq0uyiB0xU3fbBsEds2Exfz7Fa5NPEDVG+ydXj2vvwiConZswHN6VtzDKjPZZbd2YLB8fhJx/Q98o9J43O2YfFe2QAHEUrIYZ1HSKNh7PHlfMFQVE4IBWsv80Wb5JvMfmDZ/NvPMy3CsyRzgGWhS+Zcf5q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897908; c=relaxed/simple;
	bh=irUhsQsVJa/q8uEUilfQJJChRIeyzr7UBoT4QmQxC/w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDcP3BksGkayuH72nZaYJ9rY4JsbcuGMzvKbWM7spXrFqklcKNPURBmOuQftwYZuGT4L+7fndLwcwu56rg7HNp0kRypS2O4dh6rr21wd28xzBzDeFIg4r8QJYt3A/F3AbDid449LfmFaxfoWEvsyVdJHz+9gsj3G90rKReoETiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rN+ahx+u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B899kCof; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rN+ahx+u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B899kCof; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rN+ahx+u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B899kCof";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rN+ahx+u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B899kCof"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D0C321983;
	Thu, 25 Jul 2024 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721897899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6S36l/DyCy5VLAML44EOwRkpi6B3fnWr2eh3iVBTWKo=;
	b=rN+ahx+u4+U3+Oog59S+qZ585nGWbIkNQGMcJVUPedNvV/1NcSE4R5Nwd2HVbanTGHD9/v
	XTfNu4QfAVN5WPUeWC9MG6KJFKDC9VI0AQG/ihjuXfAmeT+zDRGgRIG11DZrcyVQ/ydb7G
	sQX0yzGnLmSLnW/oeKB5jd3F5ReWnH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721897899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6S36l/DyCy5VLAML44EOwRkpi6B3fnWr2eh3iVBTWKo=;
	b=B899kCofSEee9fShtFRitM2va6aFHSLT3qTqXHDdC1cCvoNbv5rczc5dPMIeERAiwOOS96
	Yg9f83lhDKnGsuDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rN+ahx+u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B899kCof
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721897899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6S36l/DyCy5VLAML44EOwRkpi6B3fnWr2eh3iVBTWKo=;
	b=rN+ahx+u4+U3+Oog59S+qZ585nGWbIkNQGMcJVUPedNvV/1NcSE4R5Nwd2HVbanTGHD9/v
	XTfNu4QfAVN5WPUeWC9MG6KJFKDC9VI0AQG/ihjuXfAmeT+zDRGgRIG11DZrcyVQ/ydb7G
	sQX0yzGnLmSLnW/oeKB5jd3F5ReWnH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721897899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6S36l/DyCy5VLAML44EOwRkpi6B3fnWr2eh3iVBTWKo=;
	b=B899kCofSEee9fShtFRitM2va6aFHSLT3qTqXHDdC1cCvoNbv5rczc5dPMIeERAiwOOS96
	Yg9f83lhDKnGsuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BA5613874;
	Thu, 25 Jul 2024 08:58:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nqYjEasTomZRLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jul 2024 08:58:19 +0000
Date: Thu, 25 Jul 2024 10:58:54 +0200
Message-ID: <87ed7hkfu9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nick Weihs <nick.weihs@gmail.com>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Implement sound init sequence for Samsung Galaxy Book3 Pro 360
In-Reply-To: <20240725054722.42597-1-nick.weihs@gmail.com>
References: <20240725054722.42597-1-nick.weihs@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6D0C321983
X-Spam-Score: -3.31
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]

On Thu, 25 Jul 2024 07:47:22 +0200,
Nick Weihs wrote:
> 
> Samsung Galaxy Book3 Pro 360 sends a large amount of data to the codec
> through hda processing coefficients.  This data was captured using a
> modified version of QEMU, but the actual content of the data remains
> opaque to me.  Elliding any part of the data seems to cause sound to
> not work.
> 
> Signed-off-by: Nick Weihs <nick.weihs@gmail.com>

Thanks, applied now.


Takashi
