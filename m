Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762368;
	b=gigAeNZqMdvqZpPFtloFEHq1/RfqyxYfXAluZWV6nZ1iWxg4xFeZfgXRONhpQ3PLScov
	 W5x1/arBgQRN4sN2jXcUEpljAkP5pDroZNRYsh7qNBwfJk6d8bx3DJhr6shKp2hvhYDkQ
	 WRjEXpVccibHBSoBOyGU6ngK5ibq7EiBpFqG3Qg7UWBCsB5aazbYI7wrsvtlldc+Gyg2o
	 bd/W+j+QTAlRnuoV+Ua0QaYQmLgUPAWWE8tgalmh7AWmfbh5FH4OyXxcQB3oXna6aBmiq
	 u+ta2cNF8dbd6msSFNnF8XTfWkJ2IOEctL221uVsdvPkbPJPNcYJ2SCNF/2mKSAP56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762368;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=WnHTbZ1S+YTxiGlo8UNPcVwauiFXejU8S2lqWUn9X1I=;
	b=p30VSBPN98RenHyuYdkmLBvjhAfzBRDzp3Ne4V4YXZyJJsdYhj38UVS80edglPaerlH3
	 xvZvNI8VPGcckliH8lXakTHIaq9wq1XTLJvCKR9tG9okECT34zCTG3Lzju+UGSrKGHZ2e
	 9CgwrE11ySRUs8Wjb/cLLlPgj5Q6TF0niuGwjn86nUp7B+yYEPHhtPCHQ5P27FHS5Bt+c
	 xwPL+QM1MbbkCSB5bcuzLKB3CmpowBdearJJa2IEdB0x98yroIqby8XBTBwXSiap0ycw5
	 5153s2r6WS+maZSgES4o3NfzgESRjLONC9WyPgHtazIM+w3zG0XVtwuAKyhLzQnaFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LeSZkNaE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WAICFAyz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="ar/Qkd0Z";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pagLSGJ0;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745E606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 13:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0745E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LeSZkNaE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WAICFAyz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ar/Qkd0Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pagLSGJ0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DDC88220CD;
	Fri, 23 Oct 2026 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnHTbZ1S+YTxiGlo8UNPcVwauiFXejU8S2lqWUn9X1I=;
	b=LeSZkNaEc1fkieIeamzOFe0c6sUAxNYhuN395Xo5iHs5OdIhrgIZ69cB9Ncfgsvk+jsUvn
	5Kjho9ecZnfyWEaiuzofHG7Vjg9rnNHMDvxXPhiDLtI2Q1tRO7wdbtUH/VfImesJaXGoQV
	whMDsBZQbxYlqdxZpSw6ChoC2FWXNh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnHTbZ1S+YTxiGlo8UNPcVwauiFXejU8S2lqWUn9X1I=;
	b=WAICFAyzhlPqo0schtjOnawuovP1jeb9PNQkquHZx+cgt5bS/CMM9S9Udv3sQhCj3y9s/A
	g9TUajYfE+VxkqAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ar/Qkd0Z";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pagLSGJ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnHTbZ1S+YTxiGlo8UNPcVwauiFXejU8S2lqWUn9X1I=;
	b=ar/Qkd0Zro+DXNnainLCs2i3j8Xrga9tkTAuRDFw3fllRroZVNvT2ijeUmp6M8UAtHzLIW
	gMhwGn/HI1TgukRwc7Xz8yPQ79E6snFYHkckBN8G9LhcSjrKF3iGvEb4rRaNwlqPS9QzVl
	n+yBlkodWu9oJcs7CaQeZRvlo2JqOk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WnHTbZ1S+YTxiGlo8UNPcVwauiFXejU8S2lqWUn9X1I=;
	b=pagLSGJ0/g71J6r98rb5qZcHNhsAiVVPt5stLPoitMuCZK75tAeKYwk5qiIRttmpmwrPET
	/R95x/NLaijV/OCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2E22133F6;
	Fri, 23 Oct 2026 13:32:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YxYhHv1h22rmTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:32:45 +0000
Date: Fri, 23 Oct 2026 15:32:45 +0200
Message-ID: <87o6cka6f6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Volodymyr Lurin <volodymyr.iurin@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: Add mute LEDs quirk for HP Pavilion Plus 14-EW1XXX.
In-Reply-To: <20261022023839.504841-1-volodymyr.iurin@gmail.com>
References: <20261022023839.504841-1-volodymyr.iurin@gmail.com>
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
X-Rspamd-Queue-Id: DDC88220CD
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Thu, 22 Oct 2026 04:38:39 +0200,
Volodymyr Lurin wrote:
> 
> The HP Pavilion Plus 14-ew1xxx with subsystem ID 103c:0x8c31 needs the
> ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT bit LED quirk to control speaker
> mute LED and ALC245_FIXUP_HP_GPIO_LED quirk to control mic mute LED.
> 
> Define new ALC245_FIXUP_HP_PAVILION_14_EW1XXX_LEDS fixup that combine
> existing COEF(ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT) and
> GPIO (ALC245_FIXUP_HP_GPIO_LED) fixups. Add the missing quirk entry.
> 
> Tested on the affected hardware: both the mute and mic-mute key
> LEDs respond correctly to the keyboard hotkeys after this change.
> 
> Based on tests, to control mute LED, it is sufficient to
> flip coef bit #3. While ALC245_FIXUP_HP_X360_MUTE_LEDS works too
> (combines ALC245_FIXUP_HP_MUTE_LED_COEFBIT and ALC245_FIXUP_HP_GPIO_LED),
> it also flip coef bit #2, and side effect of this "flip" is not clear.
> So separate chained quirk introduced to be of safe side.
> 
> Signed-off-by: Volodymyr Lurin <volodymyr.iurin@gmail.com>

Applied now.  Thanks.


Takashi
