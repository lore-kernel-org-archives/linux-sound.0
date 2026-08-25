Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81E4328B5E;
	Tue, 25 Aug 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650152; cv=none; b=nOWiBD18m3Y1Z+XKzMTJ2BNIoar8GSst8EigI57r1Euq+UyK4cJkNGksPneJGW0p/CL98/OVRxar6DVd/1HXTFJ9S2wJth0GX1R/9JP8BKXrEIq9S6QrR2VPJtLuh6LrbB1wA4JObhQB9s9hCYjT92yKyTlWzo0V1Y9AGyFCP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650152; c=relaxed/simple;
	bh=eN1MpFmM9zLkl+bOV7xIlC4Sdt42NrEPn9QXuZZLLY0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4mEgygMBgNp5tIfLX0F6XiQQKwe5KgenNXcoJpIZg2TlL/1JsUwc5eT9sxjHf4020ZA8VY8SmTjQziNR0lbV5HdAbZtJRzWXD5R2oMv5VD8YdnOcv6dS5PvFYg6cLF9w4AucdrArIyJjLe+1LpBjy1veaFwZoxPW51cB1cLDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MPoIIxyi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NvHL7I8V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I0ZY0sd8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ed/I+pMc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MPoIIxyi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NvHL7I8V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I0ZY0sd8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ed/I+pMc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3231C86D8C;
	Tue, 25 Aug 2026 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787650138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iw9Q3PlXBx81Acuhil+HhOtPysW/j1ATJA0EDp2TMT4=;
	b=MPoIIxyiiN1TBDgdEMmFgLZviE+KaqvS+bTvVipTTW3qF3MwOOl7CW0C5/CRSbjDD3Dxbt
	apyvd/BtCLWmpGxIHLjgnfi1z76FZeUsReeKEBXM3lOO/Eg41trRjA23aF+Fcxl2EEcZla
	wo/aPAVDmg6qQdO2oKLKpFIO8JTSgWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787650138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iw9Q3PlXBx81Acuhil+HhOtPysW/j1ATJA0EDp2TMT4=;
	b=NvHL7I8VfCqzrk0pt1DENaNeAu0PnMnY9QCsrdVOwLfxw1cB/Df9hNL1+frZslpT69q1/A
	ftX+GGPd4gC9e4Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I0ZY0sd8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ed/I+pMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787650134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iw9Q3PlXBx81Acuhil+HhOtPysW/j1ATJA0EDp2TMT4=;
	b=I0ZY0sd89IxrStbM7VHnSMV/RIxTNY4YtLWsQZPHKrnKxF4iBjMIbJl4e4xqp0UOnA52eG
	TX6hzy84Jm+jmliTQthXIKUMV9/tW62HerF4qx0y9zWeh/eygXVBzXA+d08aWn3E1t7wD9
	vJDZF3IWNXXh0eiHrEMAzrDd+Wl1F78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787650134;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iw9Q3PlXBx81Acuhil+HhOtPysW/j1ATJA0EDp2TMT4=;
	b=ed/I+pMcBEK4pZXKVc49X9ZZ1neZIKf2RW6IJi8x3wve7vTMYemrl8qfhNMmFPuIMFLhNJ
	t31tm66Ur7RRLmBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18A6B13331;
	Tue, 25 Aug 2026 09:28:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bhJcBVZgjWr7SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 09:28:54 +0000
Date: Tue, 25 Aug 2026 11:28:49 +0200
Message-ID: <878q5utupa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
In-Reply-To: <20260825091303.1619519-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
	<20260825091303.1619519-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3231C86D8C
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 25 Aug 2026 11:13:03 +0200,
songxiebing wrote:
> 
> Hi Takashi,
> 
> 0x19 is configured as a mic pin, in cx_update_headset_mic_vref, it
> executes cx_process_headset_plugin only after confirming that a mic
> present is detected. A 4-pole headset is detected as either CTIA or
> OMTP and sets 0x24, but the 3-pole mic case is not handled, so a
> setting of 0x24 is added here.

OK, then you'd need to explain more in the patch description.
It implies that the patch corrects the debug output, too.

And, this also opens another door: why do we read those registers at
all?  Now you always set the pin control 0x24 no matter what the
connection type is.  So the whole headset type detection becomes
practically moot; it's used only for showing a debug print.


thanks,

Takashi
