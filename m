Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D862539061D
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740381; cv=none; b=LeESZMHW3Rj6mEvEYX/yExUp0WV6s3sueRq0cXnOBz2xmQxPkDIqUjeOMA7eUSOueLYAoKCb9apdHL4qbx4TQFamYNrGmFxma/0Oy2eo4TG4W5vr88eT36yi+JBvwdf++/aZdkgRH6zacUv6GIXPQtj8CIZRjOu6xr8OrdDEFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740381; c=relaxed/simple;
	bh=re4v6eqGfR49L0zrQVStyvzO0aM7Dabe9A9pmZNgMC0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4Qo70qdAB9FKOB2+fs4L7pPFbp6sF9TVLAGaGfVl02GLf8tUEL1CHAZ6Q5FN5XxLRDZ+FJLRVZVKxy4NW4XwFloIvWVp7exyyCG7nrCK+52yWu+JEwDIgV+aSZSih1h2kRQv6+eZcZKtlp0J0CMHTh33q9oZhZWh1d27oJlqV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uQ8YbB5Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7V/r8bif; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LV6BPkX/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ixSda9aT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uQ8YbB5Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7V/r8bif";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LV6BPkX/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ixSda9aT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8E917EF2E;
	Mon,  3 Aug 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9It7NWjHx0f0uiroHk3Q7aaSGLlFSEc0qaSpRWbhJCw=;
	b=uQ8YbB5Zilr343ACJLnTxEv5aE8KEEFFzJWbh1ZyGl4iScE5ofYDu+2MaXm7rp4GahGOjU
	96nGZjhwQBEonfo+dyHtPh5gjaHJzl74rKZLnT4xi/uSRGRH7nKJ/AlZ8XV/tdbXeFYSrq
	9tP2iyxTahwiDKqE8WWJVoUf/jdqskY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9It7NWjHx0f0uiroHk3Q7aaSGLlFSEc0qaSpRWbhJCw=;
	b=7V/r8bif98a54izFUKJ2RNeR9eDNfr1sYDwLE1bhPVT4EGZiUgmUfE2Rcg6LFDRc7Mf5bX
	SCh3Vce/QPSepRAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9It7NWjHx0f0uiroHk3Q7aaSGLlFSEc0qaSpRWbhJCw=;
	b=LV6BPkX/zaHloXl+4+/W9gAlPIcqjGAsk9fQ2sT4HIBDLjzprVuh26l2gTqvLFEPmqKuWv
	zg/d4AOShUOXY3kxqfYFenrppxagYk1t+crEj34Sr2/jEppKpOgBVMGPYUozcjp9YAOgz/
	wx/uhvx+yg6V46SDu3yBXB6jT+0VV2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9It7NWjHx0f0uiroHk3Q7aaSGLlFSEc0qaSpRWbhJCw=;
	b=ixSda9aTamfNbNicfHiQhlaiknQviK1o4GDjYgJcLqCxFFCZCl0YYjuF9Quzxj0c21U9yF
	uGuIw6gmtvYogVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A5A3779A1;
	Mon,  3 Aug 2026 06:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4fRwJFE8cGqNBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 06:59:29 +0000
Date: Mon, 03 Aug 2026 08:59:29 +0200
Message-ID: <87bjbjbsfi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian van den Berg <faxuser@proton.me>
Subject: Re: [PATCH] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Logitech PRO X 2 LIGHTSPEED
In-Reply-To: <20260731-uac-lg-pro-x-2-ls-v1-1-268eaefe66ab@rong.moe>
References: <20260731-uac-lg-pro-x-2-ls-v1-1-268eaefe66ab@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,proton.me:email,suse.de:mid,rong.moe:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 31 Jul 2026 15:45:05 +0200,
Rong Zhang wrote:
> 
> The UAC mixer of the Logitech PRO X 2 LIGHTSPEED has broken mixer
> GET_CUR behavior but otherwise works fine.
> 
> Add a quirk table entry matching VID/PID=0x046d/0x0af7 and apply the
> MIXER_GET_CUR_BROKEN quirk flag to make the mixer usable again.
> 
> Quirky device sample (after applying the quirk flag):
> 
>   usb 3-2.1: New USB device found, idVendor=046d, idProduct=0af7, bcdDevice= 1.00
>   usb 3-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 3-2.1: Product: PRO X 2 LIGHTSPEED
>   usb 3-2.1: Manufacturer: Logitech
>   usb 3-2.1: SerialNumber: 0000000000000000
>   usb 3-2.1: 2:0: broken mixer GET_CUR (-18944/0/256 => -2662)
>   usb 3-2.1: 6:0: broken mixer GET_CUR (-18944/0/256 => 0)
> 
> Suggested-by: Brian van den Berg <faxuser@proton.me>
> Reported-by: Brian van den Berg <faxuser@proton.me>
> Link: https://lore.kernel.org/all/370007e6-b73b-4bfc-8410-a860781c7ad7@proton.me/
> Signed-off-by: Rong Zhang <i@rong.moe>

Thanks, applied now.


Takashi
