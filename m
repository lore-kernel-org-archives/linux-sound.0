Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA4280A5A
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143631; cv=none; b=jpqS+wgE1+tT/oXpQuBHz2jikuZZvDOWXEcMh7pK38Sc2P8+pQNmOfkWE523mNyoVwlNb9f98BwvhwcKTQUZKXdMllkE7vc9W+MgdEbq1zcDZM8k+hdFuu3/Y78GDxe3GMEsHC020EEWLMh6VZLwgBM/fmCgnoZ2Na54cfQX+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143631; c=relaxed/simple;
	bh=U6aVkXG10vl1UVUCBp6fjE86Em8nm2wOS1r6i+c7e64=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdWvl6FbcqWzDmH/NC/QB5AHareaNePcZyZN5rFpoD/rD8KW/JfyGM0S8BN2uGOCduvy78BJrYX/IV2zz8aXvQgM0Lo6dBkv1xgbHxsqwegaJBOe//xCj30MEu3PM8iT3q9H36iFxetFvVMM6fmsSrg3Vw0okrBBdWpjwaescz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aOw7uQiJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/R1ZjyIN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DHcEl9a7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oqnzqEFW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aOw7uQiJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/R1ZjyIN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DHcEl9a7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oqnzqEFW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E30E22C9E;
	Wed, 26 Nov 2025 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764143626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuqZpI4tRGDoUDnbrF4p1J2JwtFWZIC5z8r6aV+9tyk=;
	b=aOw7uQiJZhw2gfAPnXkv35Exg+kUNl6TErrmadh53cwuTZ6oy6yYZcDow42gi0vYYIR1mu
	NpJB7WQ6Emz0LzYTalj1U6M7pzLRXkYr4Q9beyEjSVxUNAteFI2dcOWIMyjatP3BiTC2u+
	yYARx6OxhfBIASfnZe3xSM3N2uxZYqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143626;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuqZpI4tRGDoUDnbrF4p1J2JwtFWZIC5z8r6aV+9tyk=;
	b=/R1ZjyINyd7O9U50IB2Z2fiRiy/jdktgTHMx/eogIDPPcie6wOYEjP/GFSzVZHu/f9+oWe
	EzSBlYQuC8Fj/wDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764143625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuqZpI4tRGDoUDnbrF4p1J2JwtFWZIC5z8r6aV+9tyk=;
	b=DHcEl9a7pLn6V0XKirBoApl7juIjdIW9nBWTZeJ093ViV75IGCIhZ2p7+nIdJy5Al8FuWd
	xAekhUyw4hox5i75XG5ubOsDMRBvYFmEXLgMcrwP9gLN3TbC4yXUaKMvYndNbpgOZl2wEX
	OJUseXXXLC3PYfJrwH+q2W5L89mCcLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuqZpI4tRGDoUDnbrF4p1J2JwtFWZIC5z8r6aV+9tyk=;
	b=oqnzqEFWsKCOhMh13gAcp4Pwe3FGhDu/eb9yu77asOK7O+vgqr8Okuf6wey05/TnsxGYJk
	1SI8ClMBTQglvoBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BC143EA63;
	Wed, 26 Nov 2025 07:53:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jJrEEwmyJmnJNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Nov 2025 07:53:45 +0000
Date: Wed, 26 Nov 2025 08:53:44 +0100
Message-ID: <87zf89b56f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilyas Gasanov <public@gsnoff.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ilyas Gasanov <torso.nafi@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for HP ProBook 450 G8
In-Reply-To: <20251125235441.53629-1-public@gsnoff.com>
References: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
	<20251125235441.53629-1-public@gsnoff.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Wed, 26 Nov 2025 00:54:41 +0100,
Ilyas Gasanov wrote:
> 
> My laptop, HP ProBook 450 G8 (32M40EA), has Realtek ALC236 codec on its
> integrated sound card, and uses GPIO pins 0x2 and 0x1 for speaker mute
> and mic mute LEDs correspondingly, as found out by me through hda-verb
> invocations. This matches the GPIO masks used by the
> alc236_fixup_hp_gpio_led() function.
> 
> PCI subsystem vendor and device IDs happen to be 0x103c and 0x8a75,
> which has not been covered in the ALC2xx driver code yet.
> 
> Signed-off-by: Ilyas Gasanov <public@gsnoff.com>

Applied now.  Thanks.


Takashi
