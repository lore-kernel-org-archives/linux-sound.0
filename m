Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203B31C56D
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955203; cv=none; b=IWNt85A6O0/0e7JXYLCMJ4VWZyg1JvSnKMXfyxBqwtrV8ig0JpNGkoHmo7XQGHhVnMFPuhLEQz6GbcAnQpYrYHDXZAafJswRyyTfsJrcnCmPl+FRfckzVW4+90jVLmahX1lW4C6pNAouC8Fkp1zco46dj9rG0wkahOpKIo6uPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955203; c=relaxed/simple;
	bh=9h73d6OWHX5cNHMA+NifURT16N2a2qnqFyK5QdJxx9k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3xyqrMdykjvKYecmdROzP+Avk9Qj6CR8v7+vQHlirNi4kvEJw5uaxwt63IcTL1euNNvgxv1AiBwdRG7daAPofmQ9wsV2T32BAnqtTJ4M5qB8Cxmrs6HV/q9MWmh/8Qu0gHYw99VF/qiEesImzoHSRZhYoCCXmVQ570XmyQ3uAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ue4q023Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Du7ozxZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sh3PrIU8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vOWMbMFK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ue4q023Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Du7ozxZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sh3PrIU8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vOWMbMFK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D80127750E;
	Mon, 13 Jul 2026 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783955200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLWeeK9TFxZGuve9uVHeaf2VfoJa9XfT4svdcD2eQCk=;
	b=ue4q023YEckLc0b+tg9kUFebVcAA2heOfkdm+i8ufAoGqbSJM5f99wLyxYjGjfkAWXLHg5
	2INv0RGLBJPtRs23hi040RJaVOjIZnohQwNJ6bQafoF+VotAqw7oiM0ehRl31W4MurF7Vl
	UVa023rCgJbFSysmfwd+isvfFbbbfYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783955200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLWeeK9TFxZGuve9uVHeaf2VfoJa9XfT4svdcD2eQCk=;
	b=8Du7ozxZ3a0gQLchGx57yoLVE3eV10TtRiRCZfduMUN0jFka5RXV5+qNV/RrxA9kDAJ0jz
	si7iff5ARiNV7sAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783955199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLWeeK9TFxZGuve9uVHeaf2VfoJa9XfT4svdcD2eQCk=;
	b=Sh3PrIU8neRXmaII7ueS+l7ncTmQ95//jaWJ7K8oX9yDZhaKxWpK/yFhF5tsND3jcOEmlB
	Fenqf8mwLU9hgkBgJId10eL01hH1bQks8bnKzygcnt3Orld+UBKa6s/Dyda+5ZF3BCXe/M
	Zog7exO98Rp9pHPhVG1sOYav2A2eeHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783955199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLWeeK9TFxZGuve9uVHeaf2VfoJa9XfT4svdcD2eQCk=;
	b=vOWMbMFKuCL+BVeQNisPidE9ICEJV+75qoX5sjlQ873A/IY1EBMsnvAwLuM9XUQao8uuc0
	XJiAbnjgL2QxnMDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7651779AE;
	Mon, 13 Jul 2026 15:06:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oKinJ//+VGoQVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 15:06:39 +0000
Date: Mon, 13 Jul 2026 17:06:39 +0200
Message-ID: <87y0ffx728.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for iBasso DC-Elite
In-Reply-To: <TYUPR06MB6217D8FF419F24378196FCEFD2FA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217D8FF419F24378196FCEFD2FA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,vivo.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 13 Jul 2026 14:35:50 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> usb 1-1: New USB device found, idVendor=2fc6, idProduct=f0b5
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: iBasso DC-Elite
> usb 1-1: Manufacturer: iBasso
> usb 1-1: SerialNumber: CTUA171130B
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
