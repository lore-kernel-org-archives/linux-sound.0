Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F02E62C0
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629686; cv=none; b=Q7edxRA2j8sv1FnKZmoqz9e42pOZGuOTBDMcHPdPLVDesFqj1KVuPtB5tAmCLzDmzrLPGxXS7SM3S5Q0IJI8vz/91RivOBn12sjwXrSzox3bMNV2On4Lf+K3WTv+Hg+et1J8zOYrSB2yDkpTKYs+j3rSPDo7k0jD3jV7QdZTykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629686; c=relaxed/simple;
	bh=Epwy6dQUfbvxy4PK7qJYFc1c362d2JWMfyrhB0RSGpY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srj4WF8cLBuWRqsPHHyPCaGIl/IK1L6mqPneMHYGCMK5SEmp28CaYMsHqB/x9bMlkjPuapCxbevp5CxuFsEzcE99woFB3iejQlXa3TOT9nyvUpxtm0fHSmP90ctR4xCJxQKgUhYPqOhRJFAkucups1f0l4iIQyeFmQlAhOYoADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ys3GVSu7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qLbcpiDx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ys3GVSu7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qLbcpiDx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ys3GVSu7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qLbcpiDx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ys3GVSu7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qLbcpiDx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9EE1F5BCD8;
	Mon,  9 Feb 2026 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEV0fJaKkvjHMF1mHhbNGC/tmO6e/s1c6VHfB/GTsdU=;
	b=Ys3GVSu78iyxvzDuyC4g5CbW7nyStDW1R/oq3BOKlzmOgChObQ6pfeGm6GeNWm61jSnUsE
	CkEMmr5rKLp4x1+XOWlhF02g/YkLrlUzH91wOeGwxXhnvPyHHGo1wC2R6Rdzf9isSL8J0b
	YlmhGaudpFeqvK8n7+ViHNyZ6CA66Iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEV0fJaKkvjHMF1mHhbNGC/tmO6e/s1c6VHfB/GTsdU=;
	b=qLbcpiDxl/udM/vkEx9S2AeknRWyg6zdbCAnQPef0jbFv6nuCEe9KbAkK11nQdtHbSrEw6
	Vu6Nth4F6uLOc7Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEV0fJaKkvjHMF1mHhbNGC/tmO6e/s1c6VHfB/GTsdU=;
	b=Ys3GVSu78iyxvzDuyC4g5CbW7nyStDW1R/oq3BOKlzmOgChObQ6pfeGm6GeNWm61jSnUsE
	CkEMmr5rKLp4x1+XOWlhF02g/YkLrlUzH91wOeGwxXhnvPyHHGo1wC2R6Rdzf9isSL8J0b
	YlmhGaudpFeqvK8n7+ViHNyZ6CA66Iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEV0fJaKkvjHMF1mHhbNGC/tmO6e/s1c6VHfB/GTsdU=;
	b=qLbcpiDxl/udM/vkEx9S2AeknRWyg6zdbCAnQPef0jbFv6nuCEe9KbAkK11nQdtHbSrEw6
	Vu6Nth4F6uLOc7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5149C3EA63;
	Mon,  9 Feb 2026 09:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BPmZEjOqiWlHSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 09:34:43 +0000
Date: Mon, 09 Feb 2026 10:34:42 +0100
Message-ID: <87cy2e2rbh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: =?GB2312?B?tPC4tDo=?= [PATCH] ALSA: usb-audio: Add iface reset
 and delay quirk for AB13X USB Audio
In-Reply-To: <TYUPR06MB621791C06D1E683E87FBA590D265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217522D0DB6E2C9DF46B56ED265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<87h5rq2s0g.wl-tiwai@suse.de>
	<TYUPR06MB621791C06D1E683E87FBA590D265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 09 Feb 2026 10:26:50 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Hi  Takashi:
> 
> > > Setting up the interface when suspended/resumeing fail on this card.
> > > Adding a reset and delay quirk will eliminate this problem.
> > >
> > > usb 1-1: New USB device found, idVendor=001f, idProduct=0b21
> > > usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > > usb 1-1: Product: AB13X USB Audio
> > > usb 1-1: Manufacturer: Generic
> > > usb 1-1: SerialNumber: 20210926172016
> > >
> > > Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> > 
> > Thanks, applied now.
> > But...
> > 
> > >
> > >  sound/usb/quirks.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > Those lines must be after the delimiter line '--'.
> > I guess you accidentally removed that line.
> > Please check at the next time.
> 
> I accidentally deleted it. Do I need to modify it and resend the patch?

No worry, I already applied with the manual edit.


thanks,

Takashi
