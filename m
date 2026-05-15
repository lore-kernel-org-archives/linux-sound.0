Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604237F8B9
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826901; cv=none; b=fmnW8FNQP0Mxgk2bUjRrL3iELpmdrH/ThxsY6XV84wxgbo28ahbHtXYWP1HPEiSGt4BmegawO9/EzuOthDTZ58tot0Q5+LJeSA5GAO8C9SHYUBoOc2jP9Gve8vQ7AeFovIPtJMwJAEyM+bm309s5dHDmfD+xytoJSIVpEs3q3Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826901; c=relaxed/simple;
	bh=MxmQuiO9MKcHOqKM6QcZQj4QBMpATPAQuI1YocATPwE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXs/OgrNJT+/f1k5EjJ29F/A1P/DdphHmjexqzFRTimhHf9DN1zMo2OUNKLB3uHZRDsJQNHTOYWVdB9R7jxoZoZTKuTzQ5jFgEtGivVXFg4l6PGMxKMZ8qbFtlDT4Ijde+bId2Sb4p+1WU9dlCaVA676l1PlHgkh+86UQ9ac5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G2MGg+8J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NiO3u8hZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FrTaH0ZK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mWxyLrDz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G2MGg+8J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NiO3u8hZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FrTaH0ZK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mWxyLrDz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E55146B802;
	Fri, 15 May 2026 06:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778826899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csRwOUCnU7N/kqYVbANGW27ZgCSvvvRLu9bUtBUsn8c=;
	b=G2MGg+8JREWAQpL6Or5Y8y8N7LOvye6+GDjfoxtuoKbI6BJ6Jt5Q+Gpb/Chq9/nJGY6dW2
	WK2lLDHT13j/0KhPtLXMSV6gKGqID0iPqwBZeQgnyV6zN9D2V7euUNBGFOiDkkNqJVundo
	guCdV84NpMxrOy5lQYMIDoM+6N7i27A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778826899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csRwOUCnU7N/kqYVbANGW27ZgCSvvvRLu9bUtBUsn8c=;
	b=NiO3u8hZ/+NUwk97CaZE2EdmRj4UPf+FFxlXWBPMcFDQGogyjlSOsE7L/OPoMB+kWCbXwx
	dwD2TLPXJuEJJdBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778826898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csRwOUCnU7N/kqYVbANGW27ZgCSvvvRLu9bUtBUsn8c=;
	b=FrTaH0ZKf25wWqMRd75OkzodKdc66HAcFHva8wwQLAu5Q92LJgGxepjtd/diiFd1qRnWH7
	56wWdU9cXXbDinhXT/zcxvFvsUO6+eOiO8Gjx6vUHiIZgXXDqZfoec/muPlVhjaNLRjzXx
	alSUMp7EMULJq6s6VwSGUqA16O/CNQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778826898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csRwOUCnU7N/kqYVbANGW27ZgCSvvvRLu9bUtBUsn8c=;
	b=mWxyLrDzIZv7BiuGKbzfQ6u2FPfpJSRu/KjrhflyKDZ/an+iVbEplz01v19I+8yq9GFKjn
	a3OxfCl60Ivok0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3529593A9;
	Fri, 15 May 2026 06:34:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9QRUJpK+BmpmPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:34:58 +0000
Date: Fri, 15 May 2026 08:34:58 +0200
Message-ID: <87mry1uqnh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for TTGK Technology USB-C Audio
In-Reply-To: <TYUPR06MB621720E4E8F99A42E162FD51D23D2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB621720E4E8F99A42E162FD51D23D2@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,vivo.com:email]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Fri, 08 May 2026 14:49:34 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: new full-speed USB device number 2 using xhci-hcd
> usb 1-1: New USB device found, idVendor=3302, idProduct=17c2
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: USB-C Audio
> usb 1-1: Manufacturer: TTGK Technology
> usb 1-1: SerialNumber: 170120210706
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
