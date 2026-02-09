Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D3736215C
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628786; cv=none; b=UIn3YJCKBJbIhZpT8ZRDbhig1BsYJYwD6sjOAOVDbOqjsx4nVY6U1dSl5jkXHvmf2oLgIGi8DpyDypAFb3DpBrxiy9CdShYs6BLmjUJJKoSZNAa/HMVS3mtxvwL7MIz7PNvSIrxdCDebP9H7FIdpW9G8RRwvEN087Ae+QAIKAQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628786; c=relaxed/simple;
	bh=l5/JsWqCRG9ccbCEEKstad5DFr0PtSqqhc8/YwfGEG8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9CH5fF/rzYb34qnlX5hu+I6nkjEy83rNVoN7Fb35S8OdMAdoGepnm4N0muyjgK8kT5BXmM3QVXfsWjCblim+9wC3FOUT90Sbp/WBY8P7VTC4SQnjs/eo62UGM+xa2ltrpooIh1Mnge50PPdXE26miktZLNBiy/eM0XHdJT0t7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jtldP5Q+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RxYH2u4L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bTKbXzsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ASjr6Oim; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jtldP5Q+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RxYH2u4L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bTKbXzsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ASjr6Oim"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF2C73E6C4;
	Mon,  9 Feb 2026 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770628785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+e/Y23UdrLltjUhOa2gVeePaiaRA65RdiPkJQux5yTM=;
	b=jtldP5Q+bI5BXLHpOOFF4h9xULy5CXC7rsxQtjhP4hfNtfGLXPJy8iRQu8YOJJbyKgkWod
	Gu6Jzs60KRIFeSTJIg7zFW9tpw6EWPav3ne+Y9VctbssvWNanSmtXH7MrSrMHSn1cTByHQ
	Wo8LYhy93VlTkvOtGzxApPRkUGXmVc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770628785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+e/Y23UdrLltjUhOa2gVeePaiaRA65RdiPkJQux5yTM=;
	b=RxYH2u4LRlUQIzJGmVILJJ7iqsrSaMDSOcK7+zkFYNuvR+DUgq/MigtuPy55se1ghEx+Bs
	f0ixWRtXJDIEfVAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770628784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+e/Y23UdrLltjUhOa2gVeePaiaRA65RdiPkJQux5yTM=;
	b=bTKbXzsrMCXzHPhghfMbYRoChDLG0sOM4XDv4ublpwVudQEQD0EyVPwiDVoYwJy5+BFV4s
	2Mp/eBVEiy1PMs4Uh5otMQn2sXBaZjXJVdp4YUwLmoEhjz4L/KMnKS1ywxf7DR5v1NpbDL
	AhzrvtdF10oSOR7hgxpfWbxJLLHoWno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770628784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+e/Y23UdrLltjUhOa2gVeePaiaRA65RdiPkJQux5yTM=;
	b=ASjr6OimMNqoK6EWChn9oGIsnhpNjcc7fh+6wd4ssJDmwPXQ71qhILPbS/Nk5RC0V9q3aQ
	aTguEQgygIRspUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B3463EA63;
	Mon,  9 Feb 2026 09:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vXW/ILCmiWlLXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 09:19:44 +0000
Date: Mon, 09 Feb 2026 10:19:43 +0100
Message-ID: <87h5rq2s0g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net"
	<jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
In-Reply-To: <TYUPR06MB6217522D0DB6E2C9DF46B56ED265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217522D0DB6E2C9DF46B56ED265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 09 Feb 2026 09:38:29 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=001f, idProduct=0b21
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: AB13X USB Audio
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20210926172016
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Thanks, applied now.
But...

> 
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)

Those lines must be after the delimiter line '--'.
I guess you accidentally removed that line.
Please check at the next time.


Takashi
