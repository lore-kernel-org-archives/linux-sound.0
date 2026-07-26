Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6821346AE1
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048899; cv=none; b=TOGgESWbQY/8FkaFjWv5jRayL9eoGO9lKW7G482+alyYiamCZpZobry1n88KEZ+wRupwXYBPtqr3DakInZGo3vHNjrGEVcQwKqqGbKEX/8T6VY0OgpVPnzAuptWEk09/uD6KYKocUKhiKqS/4PMlRyjFE0Iznblh9cGn6kKCsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048899; c=relaxed/simple;
	bh=23iV1XE6RR306EsYqQJhyNQ4Plp4xJv7y7hYzpnQi4k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttnd4nBc8Wl6RsyOiIMcnJHHici94GUWrqRjCbsg5Lc3EvQvneo+a2EdTymHtRXFF0ZA5hwSN9xUROlDG9TPVzhkKAeSewJdBfu4522niJUTpBvsVP1N6tjfij2XfgAJp3lMkQQiCWgN+I/hkpmaV60zRzdkO5CwF0hTBXa7FQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P+BuhNxa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FnMNm4u7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZzvDYKoP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=peb+xlTt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P+BuhNxa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnMNm4u7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZzvDYKoP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="peb+xlTt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E1F037D06D;
	Sun, 26 Jul 2026 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785048895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2sRme0UtVH7lAkh+fSvjCBCCmGeX7X02K1kZzMrpAg=;
	b=P+BuhNxaY3ZR+gvRnBZ88qIsL+dGpMSWbDtESBQ0Vj7pGfv2GRt2HajPRY+tgw5uVitjoc
	bO6cXRGI2+KeiEdpfYB0J0v7XmywWMJW25UY1Wnt7WRM3oTJfsxtFOtu8ByLsR1cWu4Z17
	jGq58Y/PuJft3xH72E+FHkxQzzseMA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785048895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2sRme0UtVH7lAkh+fSvjCBCCmGeX7X02K1kZzMrpAg=;
	b=FnMNm4u7KdC9Zj9EtTlXUjERRQbCj/9oGk/wW9c6VClvoP7j6trmXb8NxBuyg/b0opq8NM
	uh04DK/Y4yUDabBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785048894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2sRme0UtVH7lAkh+fSvjCBCCmGeX7X02K1kZzMrpAg=;
	b=ZzvDYKoP+qeF+dDh7TqK/8rahEN1N6WqjJGjsuyNcWdE68I+J64NgcE37eL74Jk5UYnGA4
	W0ciqBZ7oSfjRaaZrRAQvXlnKOdnhYLGVrfcq7DX7V14oDybPVdUfLjNk9BOJ9KEYsNI0m
	xR/KdNcZkQ85xQs8jrrkqwuftUY6jM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785048894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2sRme0UtVH7lAkh+fSvjCBCCmGeX7X02K1kZzMrpAg=;
	b=peb+xlTt6LWhFTjZ8R8cZ8IoxeU3I0AR3+VQms/Xnofkyd39fs5kPNcUiYwJGeZ8INtUMy
	OjIKqcSnwEwe86AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B46CE779B9;
	Sun, 26 Jul 2026 06:54:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2LbUKj6vZWqOdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 06:54:54 +0000
Date: Sun, 26 Jul 2026 08:54:54 +0200
Message-ID: <87h5lmb5q9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Rong
 Zhang <i@rong.moe>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk for JKY Technology Q2A
In-Reply-To: <TYUPR06MB6217566CFD33F57D3AE46816D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217566CFD33F57D3AE46816D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[vivo.com:email,rong.moe:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 24 Jul 2026 14:46:33 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> Note: This device's VID conflicts with Apple's (0x05ac).
> 
> usb 1-1: New USB device found, idVendor=05ac, idProduct=110b
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: Q2A
> usb 1-1: Manufacturer: JKY Technology
> usb 1-1: SerialNumber: 330270D2251225
> 
> Suggested-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
