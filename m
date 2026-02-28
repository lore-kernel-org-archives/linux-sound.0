Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA71C860A
	for <linux-sound@vger.kernel.org>; Sat, 28 Feb 2026 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267242; cv=none; b=hf2i+Iqp85q83DCefnYMxZSblWdOEI73qFTuwCMz6y77T0K3Yf/J0PtO0Ph8EazyS5WA9UV/VLrLpww+jrnFiEv8j8Fltu9pRV0mGJOfig8MGL6HkB+cYRwm04/zLrwilnTkNKk9sP+kUIZQu0Y7m9TupcJI3CM8NtSJd7zb3/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267242; c=relaxed/simple;
	bh=1qtEo4wrHXgwCRUgZUPBNG5jL4onHppIJ99OMt39bOk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBRUcIRBrFs9/hxl2EwDxbh/idHgn2ZAtTMsRrYeOZDADtfmsDbVAhLpQ3cdrU17Dsg+sDnAGZgf286a9XIebxjPWl0UBU0I4bQ6+sJNzJLcxdZV1WiEhO1GQzjedrc/OsiA41nI61b9pNladfdV2wPiYEVSWy4xI2XsT7n8x0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zmHuHJnx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ku5tMdv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WGE+oGE1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BKBx8STg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zmHuHJnx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ku5tMdv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WGE+oGE1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BKBx8STg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF5B05BCF4;
	Sat, 28 Feb 2026 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20zavE6zDg3V4AqcigSNpz/M0x5yR4dq/UC9iPrN7Uk=;
	b=zmHuHJnxJAVnZAGDYVpLVtp+16Inh61uP7NvDKWH3x9oXyGx0Qg73YPtHp3kbJkwkEJ0sd
	y9x2+2KTIOKcI6v7DjiPADTsmP/go5rsji33wsnqvg19uPZBqRienatmBGc86/aHq7/GQo
	px6DHacnZURPpkrYcf3CBq+C+04ykZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20zavE6zDg3V4AqcigSNpz/M0x5yR4dq/UC9iPrN7Uk=;
	b=2ku5tMdvnqwGMxVwmCeMAxfnKBOoQc+gKSCfURPj1PdmPw7RjsiXpCOj93JxJORbMeatVs
	KoZeBmu+0kFPFZCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WGE+oGE1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BKBx8STg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20zavE6zDg3V4AqcigSNpz/M0x5yR4dq/UC9iPrN7Uk=;
	b=WGE+oGE1QdyOooxHdHH6NlnGRjF6ZDBUMYOxTFec6May7pa3FDhFg/wjQ5L5d92rHtRAf6
	HF8H2QHEbFiwUFiVg7tJgOoiZgXnyJsRFya6ssHfH3Ow8v5e/d/0R69H7fcdwdmJx4ZuHx
	5Pyd95THFtgJH8e7kuCYWTJScZEKtQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20zavE6zDg3V4AqcigSNpz/M0x5yR4dq/UC9iPrN7Uk=;
	b=BKBx8STg+QWJKEbEGtZBw2WcwXRHfACBw/kNpYPjkKtrqu13RuWwyf9+bNgADLVykGy76v
	htZFEWFdBmondyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 885DD3EA65;
	Sat, 28 Feb 2026 08:27:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xEnUH+amomk5RgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Feb 2026 08:27:18 +0000
Date: Sat, 28 Feb 2026 09:27:18 +0100
Message-ID: <87h5r16zo9.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
In-Reply-To: <TYUPR06MB621795D087BF2D594027C235D273A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB621795D087BF2D594027C235D273A@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CF5B05BCF4

On Fri, 27 Feb 2026 03:11:02 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=0624, idProduct=3d3f
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: AB13X USB Audio
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20210726905926
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Thanks, applied now.


Takashi
