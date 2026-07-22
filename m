Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90B4D90BE
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719732; cv=none; b=GREZK18rRB4HyceblR1BvT7oVD263YbGvRFmhMWrU5Bl+QTnC6I+2eN78Pgf4XADBy7VnmU8GcNKeuovxe2J/vCk1Yr57eMoOf7o3g4DeBjggGM8X88pU56k4sUMytDiRpIivm4irdmn0aqYuDaX92KYkUUIOm4/IA+Cm1eOwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719732; c=relaxed/simple;
	bh=K2h5anIGkmP/hRe9pkbgaOzDhrtq2GuYhfqB4sSwVF4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAjvCd65ZccdsPfx/LAgqhXvEC43DBozGXSutwCsCxI+MiejMfaWlFcaEFHy1K1BnztmDQCjGxMws8KPSdknT/ByJBLR7MBMOmb8DEAYJdR8eSTO/rGnHVaALN01Ri0zmP7Pdot2yMJ5tDjn2VMyO04+ue5Vin65zEUTj+p0v38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IRr7S1nN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ru5jwWO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IRr7S1nN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ru5jwWO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IRr7S1nN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ru5jwWO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IRr7S1nN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ru5jwWO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D1FF3E09;
	Wed, 22 Jul 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rz+uDPs4AFzchJXW8jRxgyjlSbkJ38RuURhuZEKa5O0=;
	b=IRr7S1nNt/gbU/G9qxMqzhR9h63xvO3KIZZDdxu/nSYLQ3J84kb0EUEllnTj3+sgUrfHSL
	0bWgE7HjNcgICn4jDBq3PkI43SyNIWvAvCzMqYA9Q3bF7MRgKoghs6HIOMV0HqcjSjS/Na
	SnDkkouTMAgFEtuE2y/5CRn7euOmETc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rz+uDPs4AFzchJXW8jRxgyjlSbkJ38RuURhuZEKa5O0=;
	b=+ru5jwWOuYplox2yE8OBJnmVLWzu44Nr3NZUC4KRSshDQh/Qji/Ag6zNi0AROMuyesNtfD
	EcSEFwUAUmhgRFAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rz+uDPs4AFzchJXW8jRxgyjlSbkJ38RuURhuZEKa5O0=;
	b=IRr7S1nNt/gbU/G9qxMqzhR9h63xvO3KIZZDdxu/nSYLQ3J84kb0EUEllnTj3+sgUrfHSL
	0bWgE7HjNcgICn4jDBq3PkI43SyNIWvAvCzMqYA9Q3bF7MRgKoghs6HIOMV0HqcjSjS/Na
	SnDkkouTMAgFEtuE2y/5CRn7euOmETc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rz+uDPs4AFzchJXW8jRxgyjlSbkJ38RuURhuZEKa5O0=;
	b=+ru5jwWOuYplox2yE8OBJnmVLWzu44Nr3NZUC4KRSshDQh/Qji/Ag6zNi0AROMuyesNtfD
	EcSEFwUAUmhgRFAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3424779B0;
	Wed, 22 Jul 2026 11:28:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TW0vMWipYGrINAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jul 2026 11:28:40 +0000
Date: Wed, 22 Jul 2026 13:28:40 +0200
Message-ID: <877bmngt5j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for Generic USB Headphone
In-Reply-To: <TYUPR06MB6217CBB68C8F868C076A4353D2C12@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217CBB68C8F868C076A4353D2C12@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 22 Jul 2026 06:07:07 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=0124, idProduct=0c21
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: USB Headphone
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20210726905926
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
