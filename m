Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7566939F168
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605079; cv=none; b=gId43YEpiq2i7+Vvxu68/WhE/72poC2FpI1zKULfBVqjF9SFcT4hccAgmqfIpLiJcqxN/otdhi8je35+x8+rhjXUf5RatsMCZ1n/V3Yv3oGFtgWdwJ+RiF+RsWwfsUa9SruCAyO4CV/TH+maX0PBpywt5RkElwQ2cCDWAhp2QpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605079; c=relaxed/simple;
	bh=7RlnZdhA7uamiXHsycR7O/nWFTkw9qzssD9u+koSR3U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OI/hVfgfD7TFAe1si3HpmdrS9Epi7QyBFamF9et5taXjTbVk6TKFpVCBs3xiP9y3RRGp/KAwNDCOWZr+yRXuIHgYsGFGlVrCqTHG8bK+VDVTfki55lKrCkD6FeG3bhu7feaW4BKJkA2d4/H1X0gqvUhXQ/wIdxoVbwCwc3qgz6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KTwRcpxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OWTpjBik; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KTwRcpxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OWTpjBik; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KTwRcpxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OWTpjBik";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KTwRcpxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OWTpjBik"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B37875BCF9;
	Fri, 27 Mar 2026 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774605075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ5ZHIJgkmzhH34zhbu/mQUJCE8Eudb5jNAyR9JJpzk=;
	b=KTwRcpxWvZ8cCtXgMpTmo3zVQY5TBpQS8uhf/1h+Ei17pEkfrXwc8PAsuNypTr6cNAa4t8
	SNQTRXi2Q8XdbTPwI1PBdgs5EveGrJO+KAuo5Dh4wC3jBmYDBrIYy4dd9KConWbN78AN8c
	jW1p3u9hjrXCvsHVRla+vWvYxiLPwDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774605075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ5ZHIJgkmzhH34zhbu/mQUJCE8Eudb5jNAyR9JJpzk=;
	b=OWTpjBikYS6ntXXMuR7vWd8Cl4EFP1KWw1+6/85VTC3+fVMT/+WnYWexPtjFI5BE5JYngm
	QQCfzqaEUW3EsmBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KTwRcpxW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OWTpjBik
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774605075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ5ZHIJgkmzhH34zhbu/mQUJCE8Eudb5jNAyR9JJpzk=;
	b=KTwRcpxWvZ8cCtXgMpTmo3zVQY5TBpQS8uhf/1h+Ei17pEkfrXwc8PAsuNypTr6cNAa4t8
	SNQTRXi2Q8XdbTPwI1PBdgs5EveGrJO+KAuo5Dh4wC3jBmYDBrIYy4dd9KConWbN78AN8c
	jW1p3u9hjrXCvsHVRla+vWvYxiLPwDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774605075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ5ZHIJgkmzhH34zhbu/mQUJCE8Eudb5jNAyR9JJpzk=;
	b=OWTpjBikYS6ntXXMuR7vWd8Cl4EFP1KWw1+6/85VTC3+fVMT/+WnYWexPtjFI5BE5JYngm
	QQCfzqaEUW3EsmBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6111E4A0A2;
	Fri, 27 Mar 2026 09:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YMZsFhNTxmmcNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:51:15 +0000
Date: Fri, 27 Mar 2026 10:51:14 +0100
Message-ID: <87a4vtsir1.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB17X USB Audio
In-Reply-To: <PUZPR06MB6224CA59AD2B26054120B276D249A@PUZPR06MB6224.apcprd06.prod.outlook.com>
References: <PUZPR06MB6224CA59AD2B26054120B276D249A@PUZPR06MB6224.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B37875BCF9

On Wed, 25 Mar 2026 07:26:48 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: new full-speed USB device number 2 using xhci-hcd
> usb 1-1: New USB device found, idVendor=001f, idProduct=0b23
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: AB17X USB Audio
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20241228172028
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
