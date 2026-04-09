Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332630CD89
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716126; cv=none; b=eQHn8075eT83YmwFtKtLe6U++YyEmb3XfjstCqNLoSo1ZbfYIT4My5ka/0XAIUnYdkdeTPbUaJ99g/fk00DxtMDq2Mwlelf2w7Q8cKnV7xp4svaPxPtMP2KUXy3WvLwsfxX0iqo1fojaHCW2bTYeEREd3+h4or242w6/eoeXTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716126; c=relaxed/simple;
	bh=drrU6+o91T1UKT56vLzyzSB+RmliUxywhQl8LjxZ/NE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M75Ofq2/Sk2QvngzBFKhaJmVqUWAIZEaWforFyCVXQ+SQQXPDLDD3eKJ+BIj9+4gD8mzRdRbDauxtjZGSJMsbsuh9MIl1mJw/2D6/rK6IkgjCjm7iSb/TkljVH6/Qg73+kYR+JF5qphgzGPLlQu6R7aQlBZ9/0JyIgDAiS/zr8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CNLdRCrc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nWfdQPu9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJxNN35n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XbbowLV/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CNLdRCrc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nWfdQPu9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJxNN35n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XbbowLV/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDDF95BD00;
	Thu,  9 Apr 2026 06:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775716123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dHImp15iM40QBqyWICGO2AG1BCiK4YT4U+DHIP6bbA8=;
	b=CNLdRCrcN2GcV4b7VeoQo6kRu03aNn4LaNQ9afOJd7lfD1POmFy0gH3oRk5lUckY8PI/Z5
	TVvEDFj4WiKNBZWP/QPrwnSBnCgRQXcFLrypuyrCY4f2/E+XpS20+YIpdvnGzs/qYG4Fc1
	vO0Nf2XGWcAl0uY4t1B/5tasEV6QrPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775716123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dHImp15iM40QBqyWICGO2AG1BCiK4YT4U+DHIP6bbA8=;
	b=nWfdQPu9d/VFptqjJtg/y5G2ba2LA510M0RaKFG4sKlLqdSJp66jhBVElDfnuW0bI4dg42
	y9Jp0NtNuKSLH6Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HJxNN35n;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="XbbowLV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775716122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dHImp15iM40QBqyWICGO2AG1BCiK4YT4U+DHIP6bbA8=;
	b=HJxNN35nulD+1jCYPkgE92Z65vS8EYP0wOUOdbG+GVu46n1bJ4ri6PCDJByxETk27JRVmB
	8Mx7Fi0/oKVq6kqri6f45BfNaPrpDXD2gFZBeMFY+sO6UgP1aTaAVM4ubzfcMI7W7royGT
	7wNpSEGT4G/8fQj/Rjms3XERE3x6aa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775716122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dHImp15iM40QBqyWICGO2AG1BCiK4YT4U+DHIP6bbA8=;
	b=XbbowLV/HGCI+mLI4TW/epTyidJhud6ZYHWEWVGphzXCBJf7cuEuimmLYqxkhsCK1hqNwr
	jiiKo58CTRNQ5HAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A070D4A0B3;
	Thu,  9 Apr 2026 06:28:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fbYhJRpH12kbFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 06:28:42 +0000
Date: Thu, 09 Apr 2026 08:28:42 +0200
Message-ID: <87tstkk5ph.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
In-Reply-To: <84e98864-5858-4bb7-b62a-5b4928f2065b@kylinos.cn>
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
	<873414lnyf.wl-tiwai@suse.de>
	<84e98864-5858-4bb7-b62a-5b4928f2065b@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: DDDF95BD00
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 09 Apr 2026 07:58:21 +0200,
Zhang Heng wrote:
> 
> hda-verb /dev/snd/hwC1D0 0x14 0xB 0x40
>  I think this command is meaningless, so it was not written.
> hda-verb [ALC662_device] 0x01 SET_GPIO_MASK 0x03
> hda-verb [ALC662_device] 0x01 SET_GPIO_DIRECTION 0x03
> hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x03
> sleep 1
> hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x01
> sleep 1
> hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x02
> 
> 
> This user actually used these commands and the audio output was normal.
> 
> The last two commands clearly trigger the falling edge of gpio_data 0x03,
> Referring to these commands, my patch writing should be normal.

With your code, you're writing GPIO bits 0x03 3 times at each init or
resume call; at first in alc_auto_init_amp(), then toggling high and
low in the fixup.  So the first write is obviously superfluous.

You should be aware of this behavior although the impact is rather
small.


Takashi
