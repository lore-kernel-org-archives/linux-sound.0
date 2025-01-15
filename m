Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53371DB12F;
	Wed, 15 Jan 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930517; cv=none; b=LnPw5vSWTULanlh3joLqXptkGz7IX37PJm8FNoUlPMVXqBbnLtY4ERlFz/IpWB4RkMTR6VVd23FBXR5f17ncvu0byl5zZ0claYtDd9J3gM8wiRs6B1nxpwR9CNwP03RG+P6TZ5M4byLYJ0wv6cWsNKV9wLNa120dbAdRJ70oAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930517; c=relaxed/simple;
	bh=VHNTUc6ppaIeqj6o/TozxN3OPTX2TJsP+wj6GJffoAo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGMLBVCo0Qw01HdMg17/PTTcRFvgGUvARO+k+WavAtWkkCMiLgfB4OtqdvCmyRXNqIdDcmUx0KD1aC6XWYbkFCoDP5TSlVJ27tb/04sPXBM4UcmbJYljELEDS42dBZqNo5JbQ1OyRwTdF8P27i63LEc61tWmH1mNF2pwJhUMZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uAemm8Ff; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q7/FFOvx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tABtW9n9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WFGKp9x1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uAemm8Ff";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q7/FFOvx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tABtW9n9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WFGKp9x1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D831F21A5C;
	Wed, 15 Jan 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736930514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HnWWV0lMfK8TSeFcawZqs9sodHHLQe4k65o1ukUUxc=;
	b=uAemm8FfI0AjD+sly8DTtr3rOYPisvNgp7M35bZp9j9uY4I2NM/DExpzfJzvs3PJRvkPAI
	5P9OlFAjKvk9UN1+Tkp4PnRSsg+gVJuQHIIsBOvBX6DpEUcwS/XZdk9BWRLIiuXy5GEmUD
	3E6YUS532dINJUXkb9Rj/teUNJcRKFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736930514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HnWWV0lMfK8TSeFcawZqs9sodHHLQe4k65o1ukUUxc=;
	b=q7/FFOvxjbq5gmCji2LvK6JjJRABocK/JpkvEc//E8hPQ7xyjlV0QqI1Hc8fqTThwwCPQN
	Cci5rSgHvftFfPBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736930513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HnWWV0lMfK8TSeFcawZqs9sodHHLQe4k65o1ukUUxc=;
	b=tABtW9n90e4rF+tK6tlurrAy3uvIJxYaxkXobJfPQ9SGFJUBXwBNyxgrRtlcf2ib4oeYHJ
	C3vqG0bgVsBYBwwSteXZHw6StDnu2Nef18s/GQ1Q7O8j1QeBGpNATTNuqbzBGIpc/tV0Kx
	v4/TrQQ07ArXZzFTH5WB9t8lLJR1CD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736930513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HnWWV0lMfK8TSeFcawZqs9sodHHLQe4k65o1ukUUxc=;
	b=WFGKp9x1CpxMqZlxJPG8CHuU4+HoIOZWO8vfQLr1TXKWDCO0N4QOAEpNWROyNUKQRSyLpP
	XW16QcpkI5MFv8Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B77513A6F;
	Wed, 15 Jan 2025 08:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J1HeINF0h2cXCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 08:41:53 +0000
Date: Wed, 15 Jan 2025 09:41:53 +0100
Message-ID: <875xmglb8u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>,
	"mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>,
	"wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>,
	"cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"bsevens@google.com"
	<bsevens@google.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: =?GB2312?B?tPC4tDo=?= [PATCH] ALSA: usb-audio: Add delay quirk
 for USB Audio Device
In-Reply-To: <TYUPR06MB6217CFAAB5BFD9308351BD32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217F6DFCF671E7B0E001D9ED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<878qrcld30.wl-tiwai@suse.de>
	<TYUPR06MB6217CFAAB5BFD9308351BD32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,asahilina.net,gmail.com,kylinos.cn,linaro.org,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 15 Jan 2025 09:30:14 +0100,
ºúÁ¬ÇÚ wrote:
> 
>  Hello linux kernel expert:
> 
> > On Wed, 15 Jan 2025 07:45:33 +0100,
> > ºúÁ¬ÇÚ wrote:
> > >
> > > From: Lianqin Hu <hulianqin@vivo.com>
> > >
> > > Audio control requests that sets sampling frequency sometimes fail on
> > > this card. Adding delay between control messages eliminates that problem.
> > >
> > > Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> > 
> > Could you give a bit more specific name / model to both the subject and the
> > quirk comment?  Then it'd be more helpful for people who read / check the
> > changes later.
> 
> We used this sound card to connect to the phone, and only saw the following information in the log, without specific sound card model information:
> 
> usb 1-1: New USB device found, idVendor=0d8c, idProduct=0014, bcdDevice= 1.00
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> usb 1-1: Product: USB Audio Device
> usb 1-1: Manufacturer: C-Media Electronics Inc.
> usb 1-1: usb_probe_device
> 
> We currently do not have an effective way to obtain the detailed model of this sound card. We are very sorry.

Well, you can put such info in the patch description.  It's already
helpful to know whether it's an an unknown / unnamed product.


thanks,

Takashi
