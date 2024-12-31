Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBBD18787A
	for <linux-sound@vger.kernel.org>; Tue, 31 Dec 2024 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735645445; cv=none; b=mwPR359xCF8gVku9LrLLItHx0YzBdG5WbojrjHTEp3J61lWkwv9N7wU3hdwBLKVTnp0qyD43ILApsa0loGlZYxsdwDUgZbCugYoKUuamR1iRDjd4X+4//RjgmBol0IvVoDqzVb9YcXDCCyYYtxly9ELoXBP5IR+J2v7Tyg9/i3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735645445; c=relaxed/simple;
	bh=kQZJs+jbx+jv/A6RdlB+iw4NL8wYl+ycN02xn4mgH+Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6n5X4cPTUyhdcmR/q3mnYdsuK3TnqCqeEMeVsHrSMOaZINJ+2nkphSLWE37P6v/tfza3U++mwQhUgOCcoqyCqSD3JVR4nbxRxR883VwPDHOx/1DaTnwbtYZfdJggFlEYyQqAsJaF6EaIAZRRW806R7OgRbfnW/S5Oy3MjsREnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=inU6IV7Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pF1UJKGO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=inU6IV7Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pF1UJKGO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="inU6IV7Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pF1UJKGO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="inU6IV7Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pF1UJKGO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 576891F37C;
	Tue, 31 Dec 2024 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735645436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s95psgozbtaT8eeWjamEseri/3fFQRolGKGzC+e+7h0=;
	b=inU6IV7ZoGB2BSl6nqdTzSiwf5UtgCayR9P0vhQfHASZnnMy1EP3WlZijTO0FkXW7+6t3l
	p2DmcpCn0fi3kpRIaBG2Fm65kb2TiZeGt51HJZRH2W770+ZXhgc8L5rI2VutOOlc+GivXV
	HlNmMa1dRlAuKxMjmKl2tlijwAZsFWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735645436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s95psgozbtaT8eeWjamEseri/3fFQRolGKGzC+e+7h0=;
	b=pF1UJKGO1S91SVVevtxlvzklmGkOMNva2YHzKv6ZYTzVctAJF36DxwdWDEyPvtO9uNIUxy
	8p3nuvx+xFwym2AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735645436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s95psgozbtaT8eeWjamEseri/3fFQRolGKGzC+e+7h0=;
	b=inU6IV7ZoGB2BSl6nqdTzSiwf5UtgCayR9P0vhQfHASZnnMy1EP3WlZijTO0FkXW7+6t3l
	p2DmcpCn0fi3kpRIaBG2Fm65kb2TiZeGt51HJZRH2W770+ZXhgc8L5rI2VutOOlc+GivXV
	HlNmMa1dRlAuKxMjmKl2tlijwAZsFWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735645436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s95psgozbtaT8eeWjamEseri/3fFQRolGKGzC+e+7h0=;
	b=pF1UJKGO1S91SVVevtxlvzklmGkOMNva2YHzKv6ZYTzVctAJF36DxwdWDEyPvtO9uNIUxy
	8p3nuvx+xFwym2AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 029F813A30;
	Tue, 31 Dec 2024 11:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AamxOPvYc2eLJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Dec 2024 11:43:55 +0000
Date: Tue, 31 Dec 2024 12:43:55 +0100
Message-ID: <87msgculfo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Schaefer <dhs@frame.work>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux@frame.work,
	"Dustin L. Howett" <dustin@howett.net>
Subject: Re: [PATCH] ALSA hda/realtek: Add quirk for Framework F111:000C
In-Reply-To: <20241231045958.14545-1-dhs@frame.work>
References: <20241231045958.14545-1-dhs@frame.work>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 31 Dec 2024 05:59:58 +0100,
Daniel Schaefer wrote:
> 
> Similar to commit eb91c456f371
> ("ALSA: hda/realtek: Add Framework Laptop 13 (Intel Core Ultra) to quirks")
> and previous quirks for Framework systems with
> Realtek codecs.
> 
> 000C is a new platform that will also have an ALC285 codec and needs the
> same quirk.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux@frame.work
> Cc: Dustin L. Howett <dustin@howett.net>
> Signed-off-by: Daniel Schaefer <dhs@frame.work>

Thanks, applied.


Takashi
