Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC071B4247
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760797532; cv=none; b=QwHfSilQIAQmzcj8gHep9SxaPXUXV6z4Si7hkJuHJZwIVlb88s7kpxuEkXiOm30MfpP5cbKd55LVRUE415aLflnTd4TIBhWwCtodNcQkAgf2y8cc0a1rnnJkZNHm9zlFPXdIvsC3G3OqJgZAGaF4Aoew/9tIFVhYwvqN8f8yRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760797532; c=relaxed/simple;
	bh=1tDpicsE8yfdQfdraCAfzdazqYsLNVDA2mmSTTF+vrY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=synhXpcjZyPQXeBrcqIf7+ormCz+LhDk/Oo4ms6Iob3X7Kl8VVOIg2EWVAP4A0Q5YK2Xs8uucFi7DuaBeybvc3525/WXwHwzOCb5RleDgB0xRtkc/XNEVSuwb6P6vM4C8C3XQkdwdhPzW5QVVaCqu7o2tOwgZ3aaeCznKWcWSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sz1dmUAi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1RMAZ/qC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yY+1ZITA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zrSRLSJ0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sz1dmUAi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1RMAZ/qC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yY+1ZITA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zrSRLSJ0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B6A021AA6;
	Sat, 18 Oct 2025 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760797524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sem2qp69q0NCDKkzO93ZTz1ygpheBLXj8Bz1d/aGsM=;
	b=sz1dmUAiSkOuq8crbPE+0tlbrAWVJcAcETr5YPp6OgYErZgC3CSEOXDVXxnUkDZ6BozXf7
	4TLh8SSoxIPJnfHe/Uy9+9LIbBeD/5RK31BY+EL0C/hBoZ9lcfbRZVpq9cQbrX9RPNweuU
	KA6nCwW+qXEN99HsJnNurwxS6enjpdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760797524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sem2qp69q0NCDKkzO93ZTz1ygpheBLXj8Bz1d/aGsM=;
	b=1RMAZ/qC0Kz8RjUE1i1Lqw8dfG2BeHj6VbtuTrot/9AmR4lmIFddYOJurk9kBy0VmPxQz9
	eppa/Y9049uS9zCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yY+1ZITA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zrSRLSJ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760797520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sem2qp69q0NCDKkzO93ZTz1ygpheBLXj8Bz1d/aGsM=;
	b=yY+1ZITAT1LS3Ik3k6uZcNUQzYQAItwMLkg1fX85MDpSajzAaYqTqK54B+YN8998nXDglW
	w/9uYctY7J0ogqmptDVChGVF22sjQQenUaFfk+EZZEeXGSQ5dlNGL3bMgABa1GpfT0gQmf
	q2eMH3MV1DavkU0QQFnlF/WdrwqCLtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760797520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5sem2qp69q0NCDKkzO93ZTz1ygpheBLXj8Bz1d/aGsM=;
	b=zrSRLSJ0SX7Ntw6OXQo5uZWGZj7qCiTpJt72XlFNs3t6GQD5SWPzE+4thsByltQBObea6J
	HQ2SlvLGvrkYOBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77E751386E;
	Sat, 18 Oct 2025 14:25:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id caA1G1Cj82jAEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Oct 2025 14:25:20 +0000
Date: Sat, 18 Oct 2025 16:25:20 +0200
Message-ID: <87qzv0478v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: J-Donald Tournier <jdtournier@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
In-Reply-To: <CAHgym8KY1S83uXXvefsE8NPt10=S+eNRG05zQPXHJ3+XHM+R-Q@mail.gmail.com>
References: <CAHgym8KY1S83uXXvefsE8NPt10=S+eNRG05zQPXHJ3+XHM+R-Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9B6A021AA6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 18 Oct 2025 16:20:44 +0200,
J-Donald Tournier wrote:
> 
> This laptop requires the same quirk as Lenovo Yoga9 14IAP7 for
> fixing the bass speaker problems.
> 
> Use HDA_CODEC_QUIRK to match on the codec SSID to avoid conflict with
> the Lenovo Legion Slim 7 16IRH8, which has the same PCI SSID.
> 
> Signed-off-by: J-Donald Tournier <jdournier@gmail.com>

Thanks.  But, unfortunately, now I noticed that your mailer broke the
tabs and spaces, so the patch can't be applied cleanly.

Could you try to send via git-send-email?  If it doesn't work, use an
attachment as a last resort.


Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> index 214eb9df6ef8..93fa4b888fef 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7078,6 +7078,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P",
> ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
>         SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P",
> ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
>         SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
> +       HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1
> 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
>         SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
>         SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
> ALC287_FIXUP_CS35L41_I2C_2),
>         SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8",
> ALC287_FIXUP_CS35L41_I2C_2),
> --
> 2.51.1.dirty
