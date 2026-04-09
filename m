Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D03A3E83
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729132; cv=none; b=lslErmTX4ScPpZ36plOhpzGwB8uci3/IablQhwYXoA15C5zG2UUQmUniyi6gEnTFhlwk4sBo+JymPm4P2jpMOw1BxM12sWrCdCLGhateg0gnp5SvYfSqU+pen7rTw1BYDbFczEXUy3t2rS3oIkitA/dVkt0pQKcxY+/Qj3b2Xzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729132; c=relaxed/simple;
	bh=tSnnTrR6JhopuZnR92OH38uedO3MUzNSrddAcvoS9pg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcJDIHmVdS8kP7+OZJjErkUXmMus8euGXGmF4IQrJMUvgMu7YZ8K31H19r3QE3XXpeO6qfh8Pvr+mYhdEtruPRgKLNml8KqcTYbi2t+HjNos5dnKysvPRKS64w+cScOWBPdeb0LOtvXlTKr5PNnW+RdmN7BmQTrLO+hiPQn0dL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GsR0ydcT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rN5i41hC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GsR0ydcT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rN5i41hC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GsR0ydcT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rN5i41hC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GsR0ydcT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rN5i41hC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F7494EE97;
	Thu,  9 Apr 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775729129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9utL51azaM4QnnM5Q0M/ypoV25jipgGCKpO4mhQudu4=;
	b=GsR0ydcTSOCkTOp2cBKykfB9TlwQN0aUdoPiK+ufMW27KiI4c9GpuOEwib4krL4CYOoCUK
	vSLR3tdiNC0U+6jcJXgdEUng1qjN7Tz4XHJJbiFcU/Xhz6EilsCzIoQ4bsD4Clb6eSxh59
	aUvG3krkuF0r/onTe6Yc1TyqNeASlCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775729129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9utL51azaM4QnnM5Q0M/ypoV25jipgGCKpO4mhQudu4=;
	b=rN5i41hCnJDa7In8FEsXqnxG7KontiCHN5J4vwBEQEFBhk+qLdQBtOHYkXn5L9x+GU7d9k
	2XaRYMq1NklOXrAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775729129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9utL51azaM4QnnM5Q0M/ypoV25jipgGCKpO4mhQudu4=;
	b=GsR0ydcTSOCkTOp2cBKykfB9TlwQN0aUdoPiK+ufMW27KiI4c9GpuOEwib4krL4CYOoCUK
	vSLR3tdiNC0U+6jcJXgdEUng1qjN7Tz4XHJJbiFcU/Xhz6EilsCzIoQ4bsD4Clb6eSxh59
	aUvG3krkuF0r/onTe6Yc1TyqNeASlCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775729129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9utL51azaM4QnnM5Q0M/ypoV25jipgGCKpO4mhQudu4=;
	b=rN5i41hCnJDa7In8FEsXqnxG7KontiCHN5J4vwBEQEFBhk+qLdQBtOHYkXn5L9x+GU7d9k
	2XaRYMq1NklOXrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F34D94A0B3;
	Thu,  9 Apr 2026 10:05:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T2QtOuh512lqdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 10:05:28 +0000
Date: Thu, 09 Apr 2026 12:05:28 +0200
Message-ID: <877bqgjvo7.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for HUAWEI USB-C HEADSET
In-Reply-To: <TYUPR06MB62176A18EA7A9DD0AC2826BCD2582@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB62176A18EA7A9DD0AC2826BCD2582@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Thu, 09 Apr 2026 10:21:37 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: new full-speed USB device number 2 using xhci-hcd
> usb 1-1: New USB device found, idVendor=12d1, idProduct=3a07
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: HUAWEI USB-C HEADSET
> usb 1-1: Manufacturer: bestechnic
> usb 1-1: SerialNumber: 0296C100000000000000000000000
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Thanks, applied to for-next branch now.


Takashi
