Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335588;
	b=RsL30XczuSXKqEfJohkiwtXjGEo+TWiHUuqBrguV88sMZ6eCQSth4sq3VNX6aBpkZaCI
	 H7auhBOWddrt4qn+BCdJeGY/oBCAyuSFzBe0kX3p70uHVclInLsI99IB0f5aALwt3gJDD
	 UOi04Bf9ZM0pJT5mNFLDvnNPH21QgnqERLjIv7APcf1mBFED4jtEQ/Atu8xrKeD1oUBsM
	 yy1s8dfE6Pr3G2dUadj/PCDIpMdBc3HQEo6h+5acpo3FeBARzfstS1b8bswuWImmWM4K2
	 OsxhS3bqYLCZICfvkpOf7WvCVzZaJrYtrMNW3/wIfC/k79yFhMVzAqHTAlMUJjkHn4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335588;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=vS5dxnzyw3GleSMZO2h1L1ySsjAYygJtvpCpiPHkHMo=;
	b=NzmpYDB5dlVQcJMkwkR/UwwOn9dg8uuVzpDU1AkgLb78Sp0pCdTeY7lYSq+SvMvV7qec
	 YExYPiD8NNMveBwsnk2igDkCkSpU9y8k7EgBF0VzCBFPuhxeMqFexEQHizEsaRD/Nve3X
	 xAG+q2SN5RoIfoY7NzlBMJAigXXZHBs4/FTuUf2Hhx3zSUJdYmw6tzf4duT8XDcIvCxG9
	 rsowEK7fbkTrmSeEzt5PUU9ktRD7xDpICRT9B6jb7oydES1cy2ln40GZwgSl1Zl63d45D
	 2PFT7Gg2PQMbSKl1UNZjSo4uOXsXmpBGvp+ng3FaPArXAMkD3aQ8hG5FzsTDgjHXm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="p/UOTEaW";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="b0Lte/pa";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="EM4gL/7J";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=U9A5nBBp;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9B606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C9B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=p/UOTEaW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b0Lte/pa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EM4gL/7J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=U9A5nBBp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD53E22295;
	Sun, 22 Nov 2026 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5dxnzyw3GleSMZO2h1L1ySsjAYygJtvpCpiPHkHMo=;
	b=p/UOTEaW3eM4aY3SUxcaLXeUvmZt38HqpjtXotnlO90DgZY1TPvLsue8V0tLIyS3j7T6NP
	YSsJg7vNTCqJ6V/seIlDkAa8L+ltEQ+DoUvPnnHnbXYYe9rDiLqLCUZ+MFVt/mv5LvuuSZ
	MzGtrWvANvCE5QjJX1ZUMaO8NLKBoYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5dxnzyw3GleSMZO2h1L1ySsjAYygJtvpCpiPHkHMo=;
	b=b0Lte/paoXlFw9+J3oSUPVnjdgfoZdUMMCubxwn0GL4ylNaT2RYzJ92Gp8VlYhLkmjIE7n
	13eJnLLspbPwQwAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="EM4gL/7J";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=U9A5nBBp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5dxnzyw3GleSMZO2h1L1ySsjAYygJtvpCpiPHkHMo=;
	b=EM4gL/7JqHIx2DTs42uvKrKFOtON9KSwdY+tFsw9wvbxox2ORkO3ForYInNMipu04SHENY
	eXvmU2KV9LTjrjXkjOfLp7xoFE7zceAaP0VdnWdePMQs4VzCaH4wbJQiSTZpoMRwU8uX+z
	1hH7mbmSmKVfkc5/Gc0wp2pG7ZEAT7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5dxnzyw3GleSMZO2h1L1ySsjAYygJtvpCpiPHkHMo=;
	b=U9A5nBBpgN54iCYcrejqQCN/qZZ0clpyWlS3dquXAaynI9g8PYjvY54rydw5SfUIZ4ETxO
	un/ifNhW7bvLkgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90AE61342D;
	Sun, 22 Nov 2026 08:19:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5/LKG6GlAmuMagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 08:19:45 +0000
Date: Sun, 22 Nov 2026 09:19:45 +0100
Message-ID: <877bi56zxa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Barnette <calmasacow@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: usb-audio: Add generic implicit feedback quirk for Elgato XLR Dock
In-Reply-To: <CAOUQ8cqsxCyU5DuHmvixd4cu6UFBfr1f+iXtK7HWfmo7HB=xsQ@mail.gmail.com>
References: <CAOUQ8cqsxCyU5DuHmvixd4cu6UFBfr1f+iXtK7HWfmo7HB=xsQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CD53E22295
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]
X-Spam-Score: -12.51

On Sun, 22 Nov 2026 06:36:41 +0100,
James Barnette wrote:
> 
> The Elgato XLR Dock (0fd9:00a6) returns digital silence from its
> microphone when the playback stream is started before the capture
> stream. Starting capture first works.
> 
> Enforcing the generic implicit feedback mode
> (quirk_flags=0fd9:00a6:0x20000) fixes it: with the flag set, capture
> returned valid data in both start orders, while without it every
> playback-first trial captured 0 nonzero samples.
> 
> Add a quirk entry for the device.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: James Barnette <calmasacow@gmail.com>

The patch is inapplicable because spaces/tabs are broken by your
mailer.  Could you correct your mailer setup and resubmit?
At best submit via git-send-email.


thanks,

Takashi
