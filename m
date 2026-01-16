Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE231A7F8
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768572989; cv=none; b=ZPzRL6Aq4X+suxTfeQuWIyIhcjLVx9rQT3GWoL1qIrtrQqXZdxo3UgYWox+RigQ1Q6CNm1vQXTKDZwL5FE/ktHRaDTSPc3dTvvMwL29avs/pYK7vrltNtx1uYuiWDp0vMjzW31XyGXtzrDvNhTY3xLZAI477wPGdxl2XuutcTnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768572989; c=relaxed/simple;
	bh=JXnvl9eXQpGDiSYtIuAQSPbmLJAVxqDrsbm7TM25PUY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jop+yoTH6PODyugsvUFKKqqtR8lEBKjQQdKfOaLw0pDg0IQB3uLK3YD0qNrNqKK8HDVKKYQRTeqAsmV+LNF0bb+F4cUR5/hWh+D2hqzX9nN0uetYzMW7zyKyD8okZjssaHh5dI5cqI4ZSqQ4MTYC98dL7YxR3CZHED8H2nwDOes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=io8PZQss; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7J2hDkRM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=io8PZQss; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7J2hDkRM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="io8PZQss";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7J2hDkRM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="io8PZQss";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7J2hDkRM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3139D5BE12;
	Fri, 16 Jan 2026 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768572986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0PUF98q8e97mjPtVYybta1R7qWJXm+Rdu1n9/h2MiE=;
	b=io8PZQss8hnB5c+1goJknPwzJbWHJtuv8+vm4zcgXdw1hOn25GXHRlt7eol4CLezzMbCcA
	s7V3M2AvBMUzX0H/osFDN40td5EDBCwPiZ63z3TLCxkE/53d543+tRk8d2wMaBMsyokFyz
	VmhQVX9MOuGaCK2rRcn1bFgz8aBAVZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768572986;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0PUF98q8e97mjPtVYybta1R7qWJXm+Rdu1n9/h2MiE=;
	b=7J2hDkRMCQbUckT9l0NB1I87mfKgUhHqXS3PA/lbDT5dddCLfCAPM+MdmtTNAFQBod9tr2
	cJ14jyJ3pfQFWDAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=io8PZQss;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7J2hDkRM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768572986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0PUF98q8e97mjPtVYybta1R7qWJXm+Rdu1n9/h2MiE=;
	b=io8PZQss8hnB5c+1goJknPwzJbWHJtuv8+vm4zcgXdw1hOn25GXHRlt7eol4CLezzMbCcA
	s7V3M2AvBMUzX0H/osFDN40td5EDBCwPiZ63z3TLCxkE/53d543+tRk8d2wMaBMsyokFyz
	VmhQVX9MOuGaCK2rRcn1bFgz8aBAVZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768572986;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0PUF98q8e97mjPtVYybta1R7qWJXm+Rdu1n9/h2MiE=;
	b=7J2hDkRMCQbUckT9l0NB1I87mfKgUhHqXS3PA/lbDT5dddCLfCAPM+MdmtTNAFQBod9tr2
	cJ14jyJ3pfQFWDAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFC063EA63;
	Fri, 16 Jan 2026 14:16:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gM9YNTlIamkMXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Jan 2026 14:16:25 +0000
Date: Fri, 16 Jan 2026 15:16:25 +0100
Message-ID: <87o6mtd4na.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>,	"perex@perex.cz"
 <perex@perex.cz>,	"tiwai@suse.com" <tiwai@suse.com>,	"pav@iki.fi"
 <pav@iki.fi>,	"jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com" <roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
In-Reply-To: <75B330C7B5DC3241+2e4c56a1-e16e-4e1d-a491-1f5f4bdd2587@uniontech.com>
References: <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<75B330C7B5DC3241+2e4c56a1-e16e-4e1d-a491-1f5f4bdd2587@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.01
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vivo.com,perex.cz,suse.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3139D5BE12
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 16 Jan 2026 07:36:42 +0100,
Cryolitia PukNgae wrote:
> 
> 
> 
> On 1/16/26 14:33, ºúÁ¬ÇÚ wrote:
> > Audio control requests that sets sampling frequency sometimes fail on
> > this card. Adding delay between control messages eliminates that problem.
> > 
> > usb 1-1: New USB device found, idVendor=2fc6, idProduct=f06b
> > usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > usb 1-1: Product: MOONDROP Moonriver2 Ti
> > usb 1-1: Manufacturer: MOONDROP
> > usb 1-1: SerialNumber: MOONDROP Moonriver2 Ti
> > 
> > Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> > ---
> > 
> > Changes in v2:
> >  - Reordered by PID
> >  - Link to v1: https://lore.kernel.org/all/TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com/
> > 
> >  sound/usb/quirks.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index f38330b095e9..2d9f28558874 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -2390,6 +2390,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
> >  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
> >  	DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
> >  		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> > +	DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
> > +		   QUIRK_FLAG_CTL_MSG_DELAY),
> >  	DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
> >  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
> >  	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
> 
> LGTM
> 
> Approved-by: Cryolitia PukNgae <cryolitia@uniontech.com>

I guess you meant Reviewed-by?


thanks,

Takashi
