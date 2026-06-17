Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C139E6F0
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687164; cv=none; b=QYy8diOLdamr9H3BQTKlBV0G9BJJwvKvloG0RZNrb93+pJxpKOANZrzfO2SbIlfSo9L9dUhasfJe0Zc9mQtcmD3pHj3NCSP8Wo2dQwSRhzc/344ISRx3CA/Jpy005Ofn10JaIXNpj3lSejcO00gczuI2umrHe+sisdZWe6GmYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687164; c=relaxed/simple;
	bh=U6eRIySrEDPOZu5nC96VnIG8+9H+kRgQWHG8wNHLBqk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/KHgJhfsHqwWnErn5rgdX036VrgJPTS91wSCBszgfZ5RxGI46or48G+oQ5vViVK2FEr6GnmYmTcUgBbIgeS67asviKyijQp4j9Qcmqx5lffsMA+bJBPj1TY5a/0S1sADYs4nowseCyV45FxPV3IPG4M/7ALlm8rR8fms0+NNlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ayiob+wm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDZXlHDf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ayiob+wm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDZXlHDf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ayiob+wm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDZXlHDf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ayiob+wm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDZXlHDf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7398375C50;
	Wed, 17 Jun 2026 09:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Flmzr8P3z1W7qdXf+C5mrdAg4k28y8GhSwWNkKrjn4U=;
	b=ayiob+wmE8emGcVDtOjUFLexmj6LRTED97kevIHYtpBOqmq4NHcXHB8FMaI710lp2HjIJj
	a53PLv7C7Zhs8bfMLCcFxLRPaimUmR2K5cATuAOfFISqMqWQ3ZU8zCAdZ6Cg66Gq9+Qx8S
	wsqmE2gYPXvzdrORJORZthRf/c+q/18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Flmzr8P3z1W7qdXf+C5mrdAg4k28y8GhSwWNkKrjn4U=;
	b=tDZXlHDfDGKHCO7M0Qa6ejSfZFHm/jQy9YKK9rSWiAKTHxJvRkJWdiuLnuCdmNATKzbhnW
	LOKlzTwRQ8ZZ0CAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ayiob+wm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tDZXlHDf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Flmzr8P3z1W7qdXf+C5mrdAg4k28y8GhSwWNkKrjn4U=;
	b=ayiob+wmE8emGcVDtOjUFLexmj6LRTED97kevIHYtpBOqmq4NHcXHB8FMaI710lp2HjIJj
	a53PLv7C7Zhs8bfMLCcFxLRPaimUmR2K5cATuAOfFISqMqWQ3ZU8zCAdZ6Cg66Gq9+Qx8S
	wsqmE2gYPXvzdrORJORZthRf/c+q/18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Flmzr8P3z1W7qdXf+C5mrdAg4k28y8GhSwWNkKrjn4U=;
	b=tDZXlHDfDGKHCO7M0Qa6ejSfZFHm/jQy9YKK9rSWiAKTHxJvRkJWdiuLnuCdmNATKzbhnW
	LOKlzTwRQ8ZZ0CAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F733779A8;
	Wed, 17 Jun 2026 09:06:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2VA5BnljMmqpUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 09:06:01 +0000
Date: Wed, 17 Jun 2026 11:06:00 +0200
Message-ID: <87o6h9pmdj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flags for SC13A
In-Reply-To: <20260617025234.3344935-1-aichao@kylinos.cn>
References: <20260617025234.3344935-1-aichao@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7398375C50
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 17 Jun 2026 04:52:34 +0200,
Ai Chao wrote:
> 
> The SC13A ( VID 0x1ff7, PID 0x0f81) not support reading the current
> sample rate and results in an error message printed to kmsg. Set
> QUIRK_FLAG_GET_SAMPLE_RATE to skip the sample rate check.
> 
> Quirky device sample:
>   usb 3-5.2.4.1: new high-speed USB device number 11 using xhci_hcd
>   usb 3-5.2.4.1: New USB device found, idVendor=1ff7, idProduct=0f81
>   usb 3-5.2.4.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 3-5.2.4.1: Product: SC13A
>   usb 3-5.2.4.1: Manufacturer: Linux Foundation
>   usb 3-5.2.4.1: SerialNumber: 000002
>   usb 3-5.2.4.1: Found UVC 1.50 device SC13A (1ff7:0f81)
>   usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
>   usb 3-5.2.4.1: Warning! Unlikely big volume range (=4096),
>     cval->res is probably wrong.
>   usb 3-5.2.4.1: [5] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
>   usbcore: registered new interface driver snd-usb-audio
>   usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
>   usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Applied now.  Thanks.


Takashi
