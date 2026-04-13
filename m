Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF072C027C
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776058638; cv=none; b=qBMeWuQzqnq5DjrBfDkJNaHh/UBiLaTnHthCPOcdCZJyxRlEB/NnJ200Pjycu0SJKkjZUPj9xRwBDPKUbAEfl3xotxQunK63P2ZiGk5v7m/CQVlRgtNMBKl033VnIGFhg2p9n+8DvzUbMlDVtP8nbzxzGBwmVuH5T767g6659MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776058638; c=relaxed/simple;
	bh=+N9x7r+eIydoN871LS1n35oazrqkSAcZjb+tA/+1V84=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0mGi1vvGb9k/TWdUz9deFyENckW3svfVgLgV9QlOUXG25pHfUcTdGDmtk7iglcAuRwz2MxGGzRbSFLnnEXRjc7ll+6ur2wcqtDrAExtAwjA0DO1LdgFq2233ALFeQL7+5otPKD7RZyOjkJxpAeThX21maNuUnC9aWYSfn5Mrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HXNS/hn+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2flZkSeJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lDEynsVi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vo77gKLD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HXNS/hn+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2flZkSeJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lDEynsVi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vo77gKLD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6162A5BDB2;
	Mon, 13 Apr 2026 05:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776058634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBDLDSXTssOHQ5gKW6j17D3ZRkt5p2fJL4EMKClrfTE=;
	b=HXNS/hn+jUzoXHeH2qoCtyyZcRUUfUZBbw1vGuZPQ2p/2vlmh/hz3OgbTgmbYcgoJP76qk
	csYdBW7FYRNoIkC4rEghGO4ZIrq6tdupOecIwEo4AlA0CAEZKnQ5UJRe+A1qKFjx6IfkKk
	G93dNhemTdfTBJ8kZIE2m6/kAVWWZdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776058634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBDLDSXTssOHQ5gKW6j17D3ZRkt5p2fJL4EMKClrfTE=;
	b=2flZkSeJsm8RgR3YXqQZ4w7zMYFTsX53NWqx2rynhP5twfcgEW4hLhPP4XpaBYEAoOLvXd
	at8B4ELYmJfElWAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776058633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBDLDSXTssOHQ5gKW6j17D3ZRkt5p2fJL4EMKClrfTE=;
	b=lDEynsViu4xRseXscOTFz/L9XE04XT1tIl0d9k7f3eiNYyAisr4d7swm/BCdalsAC8VjMr
	EpfcNONVjeMTZjRXkK/OSBdt0c7Jf3UFbH5zycPJgEjeKtxdw6vmzpvxs82t8MrMA4v/d6
	y6sOPXv75RHrHRAOII+nw8qQSX9KVtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776058633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBDLDSXTssOHQ5gKW6j17D3ZRkt5p2fJL4EMKClrfTE=;
	b=Vo77gKLDQz2nQZWD5vCcI8eeEmLUDFz563efkSHxHl7Id5ICmLgnhviFpjTrHBR8jXAvw5
	vXYMtOapAHQFKkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D5D64AD0E;
	Mon, 13 Apr 2026 05:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Of2tCQmB3GnuYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 05:37:13 +0000
Date: Mon, 13 Apr 2026 07:37:12 +0200
Message-ID: <87jyubwhdj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dzidmail <dzidmail@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 14-ea
In-Reply-To: <20260413011854.96520-1-songxiebing@kylinos.cn>
References: <20260413011854.96520-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Mon, 13 Apr 2026 03:18:54 +0200,
songxiebing wrote:
> 
> HP Spectre x360 Convertible 14-ea0xxx (2021 model or so)
> doesn't make produce sound,The Bang & Olufsen speaker amplifier
> is not enabled.
> 
> Root causing:
> The PCI subsystem ID is 103c:0000 (HP left it unset), while the codec
> subsystem ID is 103c:885b. The vendor-wide catch-all
> SND_PCI_QUIRK_VENDOR(0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED) matches
> 103c:0000 before the codec SSID fallback is reached, so
> ALC245_FIXUP_HP_X360_AMP never applies.
> 
> So add the quirk in alc269_fixup_tbl.
> 
> Reported-by: dzidmail <dzidmail@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221341
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>

Applied now.  Thanks.


Takashi
