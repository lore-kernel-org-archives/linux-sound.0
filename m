Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D448BD45
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999899; cv=none; b=e6bNwB16Qi13R1tQM1O0oJNndseijlAjemnWg34ozJi/Qxt6JM1366oCsbmvK9GUhCCbXxIrwhmMObyavHPhfeVJqLE72RdIFoQS8BZnGsZgNcllTrpPG4YBKBvSr7puld3FgB5uvoYn0RqWoH7KRE8hNdFS0ki+pllv0DRDTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999899; c=relaxed/simple;
	bh=UC1Ffr1n272R0dAz7SSv/0RFzZSWMjbAczGC4aRyYNY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1ByzGUXuNl2g6ETfKRBjdgu2nitpqmAk2tZ0Q8yxxBqqPwha8mhWvkrzOcmMePpJp9DJKFXg0FlNO4aIgXz/ZlAtwJ7A5YS0wH32t2zJPy3ZYFAHI81W/MuZ2BcNU+yRBltw7v9oMn7VcqmD5OBIjY4q1+MIeIlxgjRhpICefQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xk+PsrDl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J+b2ypKu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xk+PsrDl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J+b2ypKu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xk+PsrDl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J+b2ypKu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xk+PsrDl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J+b2ypKu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 462626B7A5;
	Tue,  5 May 2026 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777999893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rIH1iowf6DbHklu986D1Y5xnMTJQlsOfXeZ7zhUcfzI=;
	b=xk+PsrDlwtElQXNDGQ010Xez7uEls0PUd5zw0Ezg2KQ7rTdu1sf8Zlt+5GxlMXWsxElGTL
	ECboPoRHxK8+3WqbCMcZ8hQ6SlvdLKLHiwqOtwrtNCcyXB5ulcW+GJSUa5Al61J/2vkOXR
	ugho39RAH17Aiwq383x0to/QLpnPjys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777999893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rIH1iowf6DbHklu986D1Y5xnMTJQlsOfXeZ7zhUcfzI=;
	b=J+b2ypKu8rN+SrHW4gpwDjyrHtEWqLOpPvVGFIJCe1TmG08zgziR1s+TfmWCBmwtoBiNXx
	spIUQz3eUUbod8DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777999893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rIH1iowf6DbHklu986D1Y5xnMTJQlsOfXeZ7zhUcfzI=;
	b=xk+PsrDlwtElQXNDGQ010Xez7uEls0PUd5zw0Ezg2KQ7rTdu1sf8Zlt+5GxlMXWsxElGTL
	ECboPoRHxK8+3WqbCMcZ8hQ6SlvdLKLHiwqOtwrtNCcyXB5ulcW+GJSUa5Al61J/2vkOXR
	ugho39RAH17Aiwq383x0to/QLpnPjys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777999893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rIH1iowf6DbHklu986D1Y5xnMTJQlsOfXeZ7zhUcfzI=;
	b=J+b2ypKu8rN+SrHW4gpwDjyrHtEWqLOpPvVGFIJCe1TmG08zgziR1s+TfmWCBmwtoBiNXx
	spIUQz3eUUbod8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D2CC593A3;
	Tue,  5 May 2026 16:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GCcABhUg+mmUHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 May 2026 16:51:33 +0000
Date: Tue, 05 May 2026 18:51:32 +0200
Message-ID: <87mrydu7e3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rodrigo Faria <rodrigofilipefaria@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
In-Reply-To: <20260505154228.11040-1-rodrigofilipefaria@gmail.com>
References: <20260505154228.11040-1-rodrigofilipefaria@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Tue, 05 May 2026 17:42:28 +0200,
Rodrigo Faria wrote:
> 
> Add a new fixup for the mute LED on the HP Pavilion 15-cs1xxx series
> using the VREF on NID 0x1b.
> 
> The BIOS on these models (tested up to F.32) incorrectly reports
> the mute LED on NID 0x18 via DMI OEM strings, which lacks VREF
> capabilities. This fixup overrides the LED pin to the correct
> NID 0x1b.
> 
> Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>

It's almost fine, but ...

> +/* Override wrong pin to NID 0x1b (F.32 BIOS reports 0x18 via DMI OEM string)
> + * on HP pavilion 15-cs1xxx laptops */

Try to keep a comment in the standard coding style.
And...

> @@ -6907,6 +6926,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8548, "HP EliteBook x360 830 G6", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
> +	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
>  	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
>  	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),

The entry is sorted in PCI SSID order.  Try to put at the right
position.


thanks,

Takashi
