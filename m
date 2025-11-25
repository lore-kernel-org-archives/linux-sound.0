Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403DE21D3F2
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054180; cv=none; b=GssEMpffcIUD9Qao2v+XQSgwtiT02c3fSWWWNvf6oiZ53OZKqVA59Hwbi88/eHPlXBC4YogqYyye+aKG8+Tlpl42Rw8fSvkdeCsGWRN3zzLygrN2nXxe6t7j9GFi5fFnY5/pMmUAyqf5qhAQQAxLvZn4cL+PAJ3WU1yi6tp599w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054180; c=relaxed/simple;
	bh=GcTHKou4V41c4EAnauP2p6Nfy/3i/XqIokpxztroyBE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q9b2Mw6JxMXpQTTLLWLcKF2tzGfcI9gAeKMqsODBj2xcBRJSoqTL/NsPuHb5Saj58oyFCbbks+HVLdv3zKvdkgaemWVuNSSGQWvxj/zzAnNxPBLuzwi8w3yIVmA6jF7BROLSe91FoUbvF2o4u7wie+Ut278DBvwmlArJAE+6Muc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHLLsVU6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a21lZnaj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHLLsVU6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a21lZnaj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHLLsVU6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a21lZnaj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHLLsVU6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a21lZnaj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4DA9D225FB;
	Tue, 25 Nov 2025 07:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764054176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OVAjKZj0/JSpsnbaEItvZQjcPhlrHC/Hwyo08h+xCgA=;
	b=OHLLsVU6qwb04TAgFJcdmZrAwbwydSUWk8AhuW3D966CmWsFzHptam4sLEiEOecsRGgCyz
	ALt7fJr38EoQdKnZMyuEzR6xiOYhLovLFipydRoh77IClJLWcq4uauWeQstCDVrEyGF4dG
	h/sqISWh8PdIixnq+v247H3fqY1Fiu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764054176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OVAjKZj0/JSpsnbaEItvZQjcPhlrHC/Hwyo08h+xCgA=;
	b=a21lZnaj7EZHSgVZEpCGAtun/lyQ5pnIHIMFwyWfSFaLL6juGWzbM8EV9e0iHqmEF+zzGt
	4gN68EifvHszHhCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OHLLsVU6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a21lZnaj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764054176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OVAjKZj0/JSpsnbaEItvZQjcPhlrHC/Hwyo08h+xCgA=;
	b=OHLLsVU6qwb04TAgFJcdmZrAwbwydSUWk8AhuW3D966CmWsFzHptam4sLEiEOecsRGgCyz
	ALt7fJr38EoQdKnZMyuEzR6xiOYhLovLFipydRoh77IClJLWcq4uauWeQstCDVrEyGF4dG
	h/sqISWh8PdIixnq+v247H3fqY1Fiu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764054176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OVAjKZj0/JSpsnbaEItvZQjcPhlrHC/Hwyo08h+xCgA=;
	b=a21lZnaj7EZHSgVZEpCGAtun/lyQ5pnIHIMFwyWfSFaLL6juGWzbM8EV9e0iHqmEF+zzGt
	4gN68EifvHszHhCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2331C3EA63;
	Tue, 25 Nov 2025 07:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3l2yBqBUJWkQMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Nov 2025 07:02:56 +0000
Date: Tue, 25 Nov 2025 08:02:55 +0100
Message-ID: <87a50appb4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
In-Reply-To: <20251124180501.2760421-1-me@harin.net>
References: <20251124180501.2760421-1-me@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4DA9D225FB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Mon, 24 Nov 2025 19:04:55 +0100,
Harin Lee wrote:
> 
> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
> DAC for 7.1ch output, and a CS5364 ADC. This model differs
> significantly from other CA20K2-based variants.
> 
> Since official driver support for this hardware was discontinued a long
> time ago, this patch series enables the card to be used on modern
> platforms.
> 
> This patch series was developed using QEMU vfio tracing, and PCIe BAR
> dumps. Tested with analog output (up to 192kHz) and line/microphone
> input (up to 96kHz) at various sample rates.
> 
> Changes in v3:
>  - Patch 5: Rename ALSA mixer control to "Analog Playback Route" as
>    suggested by the maintainer
>  - Patch 5: Fix 'rca_state' type to 'unsigned int' in
>    dedicated_rca_put()
>  - Patch 6: Add comments explaining the port mapping logic for
>    SE-300PCIE
> 
> Harin Lee (6):
>   ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
>   ALSA: ctxfi: Add ADC helper functions for GPIO
>   ALSA: ctxfi: Use explicit output flag for DAIO resources
>   ALSA: ctxfi: Refactor resource alloc for sparse mappings
>   ALSA: ctxfi: Add support for dedicated RCA switching
>   ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)

All six patches applied to for-next branch now.


thanks,

Takashi
