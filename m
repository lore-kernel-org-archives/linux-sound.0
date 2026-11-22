Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335523;
	b=45OrHXiwXC6hgm+bLOIXxIOcKMjjASRAWD5UaUwqoXuAjkWym8tZlMkDDosMmth1P4d3
	 GeBjHda9i/8QcgH7M7ISU7WfCqVwaex7loSjPdvCAuq3O/gF6YwEZg9UzGkfLw7QAWj88
	 KS5hT/261+4uo5+9ChbCGiGk2MHA4hdk00MfjXJRsV3pbA2hMlY6mpcaWuulolq9kzUkF
	 IgbBhWBgmir2x6xQFOPxpQEhAh9LOESq6jPDLJUfKAJHnglu/BPIS8wLpMDf8DzCngS4z
	 O068rOCvbTdqnro12NXPqErrJa4jUkpDRThteF9wQBA7I7s6bbZd4WR+DtB095um1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335523;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=B+oHbu/U6t4CgiQoqkT8im8xPXQyPjadvQ4+l6HZyjs=;
	b=o3zrfBawe0eaVoyyUvqRSyu02Gp8jN6fi4/WajqWg3Ez5Xgj6pSLW6X1pOaZ2UBfHlGW
	 CTdsTtt7GPJpcWZTZ99oip/gSU0iocGCh6UsxS8NFEOHKLXoSP81Hfpb1I7yZQ8cmpBPD
	 mt+1h+HFHECDlWopFJc2gLKUzzXdHIhkctw521uGP4eRPjulr5UbYMf4U1EqXvNP9BItq
	 QZwKyM6rGrung6yEshlTFkx1Zc9hIbKcKJ382FOgqSLMEWneaBj8A0bpF4qxUPgqRVXqk
	 MZIJsSVs7101ujLiRZ9HKfFnCM9tMG4VcI/Oeo9tt+lS9v5C3cpKqjT4yqMIUhnoFcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rTf5auyG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aA4JjvQz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rTf5auyG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aA4JjvQz;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE3606A335
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CE3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rTf5auyG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aA4JjvQz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rTf5auyG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aA4JjvQz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 067C5222CE;
	Sun, 22 Nov 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+oHbu/U6t4CgiQoqkT8im8xPXQyPjadvQ4+l6HZyjs=;
	b=rTf5auyGKIm1kLcVbOJfdrWeiqde2R/RO3MrwZmsJekLB8bJ2oPeTjrInvRRVesV86plD5
	0xxV8Qe2uQJgsrAJvqOxDarOTmxuDhF6gug0OdEIWpLjAm4HprMuDAzWu305EOZNChNhQv
	QhW9w8pCk/PbDOiSAqFugx1LvOB1sdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+oHbu/U6t4CgiQoqkT8im8xPXQyPjadvQ4+l6HZyjs=;
	b=aA4JjvQz9RR0Hq3KAjFeDwcrMiQ6G1zmUaxN3KjtmFb27Wp5qTfDL85TX9pIkFpmBpb6cm
	fGD620DhKZIokOCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rTf5auyG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aA4JjvQz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+oHbu/U6t4CgiQoqkT8im8xPXQyPjadvQ4+l6HZyjs=;
	b=rTf5auyGKIm1kLcVbOJfdrWeiqde2R/RO3MrwZmsJekLB8bJ2oPeTjrInvRRVesV86plD5
	0xxV8Qe2uQJgsrAJvqOxDarOTmxuDhF6gug0OdEIWpLjAm4HprMuDAzWu305EOZNChNhQv
	QhW9w8pCk/PbDOiSAqFugx1LvOB1sdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+oHbu/U6t4CgiQoqkT8im8xPXQyPjadvQ4+l6HZyjs=;
	b=aA4JjvQz9RR0Hq3KAjFeDwcrMiQ6G1zmUaxN3KjtmFb27Wp5qTfDL85TX9pIkFpmBpb6cm
	fGD620DhKZIokOCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9162B1342D;
	Sun, 22 Nov 2026 08:18:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0+ATGWClAmsuaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 08:18:40 +0000
Date: Sun, 22 Nov 2026 09:18:40 +0100
Message-ID: <878q2l6zz3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrea Di Pietro <andreadipietro084@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LEDs for HP OmniBook 7 14-hg0xxx
In-Reply-To: <20261121174326.16369-1-andreadipietro084@gmail.com>
References: <20261121174326.16369-1-andreadipietro084@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 067C5222CE
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spam-Score: -12.51

On Sat, 21 Nov 2026 18:43:26 +0100,
Andrea Di Pietro wrote:
> 
> Use ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS for PCI SSID 103c:8f07
> (HP OmniBook 7 Laptop 14-hg0xxx) so both mute and mic-mute LEDs
> work alongside the dual CS35L41 I2C amplifiers.
> 
> Signed-off-by: Andrea Di Pietro <andreadipietro084@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Notes for maintainers:
> 
> PCI SSID 103c:8f07 was previously listed as "HP Agusta G7KX" using
> ALC287_FIXUP_CS35L41_I2C_2. On my HP OmniBook 7 Laptop 14-hg0xxx
> (DMI: "HP HP OmniBook 7 Laptop 14-hg0xxx/8F07"), dmesg shows the CS35L41
> DSP firmware path referencing "HP_Consumer\CY25\Agusta\Official_release",
> confirming that "Agusta" is the internal codename for this platform.
> 
> Switching to ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS keeps the dual
> CS35L41 I2C initialization intact while chaining
> ALC245_FIXUP_HP_X360_MUTE_LEDS, which exposes and drives both
> hda::mute and hda::micmute properly on this hardware.
> 
> Please confirm whether updating the existing 103c:8f07 entry in-place
> is safe across any other variants sharing this SSID.

This should be fine, as it's a code name as you guessed.

Applied now.  Thanks.


Takashi
