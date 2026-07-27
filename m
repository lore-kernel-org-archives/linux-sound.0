Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043D41A4FE
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160494; cv=none; b=rsIZnn3S9scmajx1LN7f/Rl2k1wcHrtCpQ4pzPxyyCzWTWJlESp/wLKZW6x2MFs6oYsLzy1uuWN6DgrYs96JC2cJlI4ZGexWIVHU+AdszBxOx6tghm0xH8+ABq4X2w8tCIlJOqwGFyqOHzzpH+TJW1kNWTTpdllgtsYI8oGvalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160494; c=relaxed/simple;
	bh=sFrrgUKzMof5B+VPmslO7WHXpevCcOnmBYYkSt2sv8w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6Xo4GS912XkQ8Dbq1hrnKFbZMdtPbNiWUmPy0kqVZrJWa8PbV0Qxz4El6lx0kRlKquLtvFNM7sDlj0CdvxWiNs7H7RExi+tb+Q7hAMCLRmtRjY/oSyoqJP5AJQ8Bob4XGPQxbYt+KdIaX9nMsV7lDsCtHhCfeTLi1OlJ5MuoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KyHnHYOO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTPAqLGp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0AwkG0t5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bPBV6Lcz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KyHnHYOO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTPAqLGp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0AwkG0t5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bPBV6Lcz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1813E7BD6F;
	Mon, 27 Jul 2026 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785160486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSZm4u8vpcG2jH3ttpbaeJeRrcL1TQ4PCMa9vn3S2Q4=;
	b=KyHnHYOOdkwQNL9drwkAT7LSD85O4rZA2zGfpjgbnjgBMKx/PgughuBwp+wgsv8os6sYik
	adrmTFtD02L65/lbyISomI2yiipQmYv/pjpQa6l8u4Lo5l3CphfyfYOqTba/3tJgv3VFMz
	eyZxb9eVh3d9DYy/P9KAQ4qjXsWjqno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785160486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSZm4u8vpcG2jH3ttpbaeJeRrcL1TQ4PCMa9vn3S2Q4=;
	b=mTPAqLGp4bAkz1VlaEuM/GsbuTNj0nHq1nUVVV5q4I0WApiDZAiPWCvlYgJ+ZXdG3QRRX7
	L1OBMBlmrmaTiXCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785160482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSZm4u8vpcG2jH3ttpbaeJeRrcL1TQ4PCMa9vn3S2Q4=;
	b=0AwkG0t5MLsUvIelFsyDOa3xNpYPAbYpuxgy9yPHmbRrGYbA2hzZURE/Hjftb9KfMTKY8R
	9WUp5OHLtgjz+uWMT7i/4v22VG0dhN5yZscmZ2kGvMdMOgD84m1KQDwJxqaVllJCFPZX3k
	OJikZb+uK9ODUduaYYUJK33d1gHQBck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785160482;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSZm4u8vpcG2jH3ttpbaeJeRrcL1TQ4PCMa9vn3S2Q4=;
	b=bPBV6LczUAK48bGVm7HMFsx5eqt/g62mT/3Kmlk4EtGKSx4tYLZH95AC+R1fvW6FnVftMt
	9JkkUWahsifgOwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E77FE779C1;
	Mon, 27 Jul 2026 13:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NQ7oNiFjZ2qwIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Jul 2026 13:54:41 +0000
Date: Mon, 27 Jul 2026 15:54:41 +0200
Message-ID: <87mrvc8rmm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Diesen <michael.diesen@posteo.de>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for HP Dragonfly Folio G3 2-in-1 (103c:8a05)
In-Reply-To: <20260727091920.4634-1-michael.diesen@posteo.de>
References: <874ii84j3p.wl-tiwai@suse.de>
	<20260727091920.4634-1-michael.diesen@posteo.de>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 27 Jul 2026 11:19:21 +0200,
Michael Diesen wrote:
> 
> The HP Dragonfly Folio G3 2-in-1 also ships with PCI SSID 103c:8a05.
> On this unit the ALC245 codec reports subsystem id 103c:8a06 - the SSID
> that is already covered by commit 0a10faad5ca5 ("ALSA: hda/realtek: add
> quirk for HP Dragonfly Folio G3 2-in-1") - while the PCI SSID that
> SND_PCI_QUIRK matches against is 103c:8a05:
> 
>   snd_hda_codec_alc269 ehdaudio0D0: ALC245: picked fixup for PCI SSID 103c:8a05
>   cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8A06
> 
> The existing entry therefore never applies here, the four CS35L41
> amplifiers on SPI are not registered and the internal speakers stay
> silent.
> 
> Add the same fixup that the 8a06 entry uses: the four amplifiers bind
> and the speaker mute LED (codec GPIO 0x04) works.
> 
> Signed-off-by: Michael Diesen <michael.diesen@posteo.de>
> ---
> v2:
>  - Resend using git send-email. v1 was mangled by my mail client (tabs
>    converted to spaces, long context lines soft-wrapped) so it could not
>    be applied with git am. Sorry for the noise, and thanks for the
>    pointer - I tested this one by mailing it to myself and applying it
>    with git am before sending.
>  - Use ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED instead of plain
>    ALC245_FIXUP_CS35L41_SPI_4. In v1 I claimed this was a non-2-in-1 SKU
>    that does not need the LED handling. That was wrong: DMI reports the
>    machine as "HP Dragonfly Folio G3 2-in-1", i.e. the same model as the
>    8a06 entry, and the speaker mute LED stayed dark with plain SPI_4.
>  - Name the entry identically to the 8a06 one, as it is the same machine
>    with a different PCI SSID.
> 
> On the mic-mute LED: alc285_fixup_hp_gpio_led() also drives GPIO 0x01 as
> mic-mute LED. That LED does not respond on this unit. Poking the codec
> GPIOs directly with hda-verb shows 0x04 toggling the speaker mute LED,
> while neither 0x01 nor 0x02 has any effect, so the mic-mute LED does not
> appear to be wired to the codec here. It does not work without the quirk
> either, so this is no regression, and it matches what the 8a06 entry
> already does - hence I kept the shared fixup instead of adding a new one.

Thanks, applied now.


Takashi
