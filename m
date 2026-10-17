Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8483287518
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225758; cv=none; b=e8mcQvN1bDlnsGE+Lv1/n+oeo1pJCssB29DRbjsl98/BKSNwB4g7hkHxFN8ygHsM3+SMcas106OCbxc3E9NuPeEHdypLhWaZPiaroJmbjGgzyyQ+3kzoVFY0oJPNKOwvvfiO9xXa+/mM2VLVcC8ej+MDfVaLXrlDqeIGdXUwquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225758; c=relaxed/simple;
	bh=wO+pbX1XKdTEWAXuMjlZ4dy+EGAi6GS4deofr3MA3sA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNZo2s+lEeeI8VtyoNuk2guLfwYFVy4sPfdOXIC0aZuUNaGjVMIe8H0e8xw5kcysfzirdbTbSLBySJsXWnoQF2WGp0vYf8DcEWZom1k0LnLc8NAhzFUvjvEQKd0LvhsqHc/wy/q+ePrRWx4RAhimPe1lOdnl72ZzfdC3nhJlurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w3fHMTVD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aAQScV8T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w3fHMTVD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aAQScV8T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w3fHMTVD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aAQScV8T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w3fHMTVD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aAQScV8T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC45821CB7;
	Sat, 17 Oct 2026 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jaQFlENt9K6awWBNG37mr5lh28o4fVvHclzb3qAursU=;
	b=w3fHMTVDanlEwIACOcyCGKQlOPXIy1pxEblPj5lLK4scSKjhV2q/FsuZvbfrVRMm1qB1CT
	ij+f49PJe5+/VR+ijpZiAUvYqowjDIGAwHkSKaacTDI33KwPqikFqVHsJCG26kstrwzAN0
	zoY1qkBYehGxkDZzMTHpvP8hmTTBLf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jaQFlENt9K6awWBNG37mr5lh28o4fVvHclzb3qAursU=;
	b=aAQScV8T41+ijUPI2z4q98Fh1AbRc1djKZtnKA5AtFccwyf/F9b34OKLtR3Bv1oOCsGocQ
	i7hsmD1YMqrPxWBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w3fHMTVD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aAQScV8T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jaQFlENt9K6awWBNG37mr5lh28o4fVvHclzb3qAursU=;
	b=w3fHMTVDanlEwIACOcyCGKQlOPXIy1pxEblPj5lLK4scSKjhV2q/FsuZvbfrVRMm1qB1CT
	ij+f49PJe5+/VR+ijpZiAUvYqowjDIGAwHkSKaacTDI33KwPqikFqVHsJCG26kstrwzAN0
	zoY1qkBYehGxkDZzMTHpvP8hmTTBLf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jaQFlENt9K6awWBNG37mr5lh28o4fVvHclzb3qAursU=;
	b=aAQScV8T41+ijUPI2z4q98Fh1AbRc1djKZtnKA5AtFccwyf/F9b34OKLtR3Bv1oOCsGocQ
	i7hsmD1YMqrPxWBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A273133A7;
	Sat, 17 Oct 2026 08:29:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YTFBHNsx02qpJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 08:29:15 +0000
Date: Sat, 17 Oct 2026 10:29:15 +0200
Message-ID: <87h5ik20is.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Giovanni Maria Mazzone <giovannimariamazzone@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP 15s-eq3xxx mute LED
In-Reply-To: <20261016174627.362872-1-giovannimariamazzone@gmail.com>
References: <20261016174627.362872-1-giovannimariamazzone@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DC45821CB7
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 16 Oct 2026 19:46:27 +0200,
Giovanni Maria Mazzone wrote:
> 
> The HP Laptop 15s-eq3xxx (SSID 103c:89fc) uses the Realtek ALC236
> codec. Its speaker mute LED is driven by COEF index 0x07 bit 0, which
> is exactly what the existing ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 quirk
> implements. The sibling models 15s-eq1xxx (103c:8706) and 15s-eq2xxx
> (103c:887a) already carry this quirk, but the eq3xxx SSID was never
> added, so the LED never follows the mute state.
> 
> Add the missing SSID to the quirk table.
> 
> Signed-off-by: Giovanni Maria Mazzone <giovannimariamazzone@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
