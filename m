Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D15212548
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451659; cv=none; b=tmubFUT5Rtv+OTMCHm8tnA3lcBJ+MIC2CRo8c8vTZJraDRbVDJsHT9YQ0b8bf1IFqEbko1xYI4bkiitnJJcw/mWoxm1d2qrw3+k6xe0cp4tsV8wORT9f3eDGby1+zo9zWrrCcHDeklFQKJVqgChX58OU1ch54vjfNPk1a3ptl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451659; c=relaxed/simple;
	bh=6PVaGGDRStmqWRstCxX6KrV76X2fTpw1khxg3gXyEKc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M+ndEf4QRqn4TuufBUhatMnowO0sm//7XNe+hq66qGpOi965yErZAcuGGaeQKPJHSrg7i76cCewk/nyJhEGYoIXPwyWa+7Zod8MZltq3PNOypGY6enObFFrCBe6W6S6PwgGQachcXdDgHPkQD8ZWMfZ7HpT9NkkbrCmOLn2Mga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mc94lJvG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8BVtfAWU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DvSlno/K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DL3ts8oW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mc94lJvG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8BVtfAWU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DvSlno/K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DL3ts8oW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 752E3798C5;
	Sun, 19 Jul 2026 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784451656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuCGuweiFhobU2D+Naz3Q5FBj7adjh3PfHasyur61Aw=;
	b=mc94lJvG/7oGXJwaeqjexhp5/vnO+0M2hr4+6UffM6nglNXAdTaG46VFcX+v2cfIw81l19
	goEOdLTRFFA4Lu54AR/k93I0cGzjNiZWObdcmUk9DB+w7TdJO+Y3cD/AUnB3SlgNi6Ww/A
	nJhaqoLtpnWfXWxGftAXWQvP50Ipxtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784451656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuCGuweiFhobU2D+Naz3Q5FBj7adjh3PfHasyur61Aw=;
	b=8BVtfAWUVpvjcTzQP6L7UMo0EfujjdrX3eb1zIl3gCagSbRm/DxDFKzGHEaXpPR1Xp7ga2
	ySPaDgYTe+fd4PBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784451655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuCGuweiFhobU2D+Naz3Q5FBj7adjh3PfHasyur61Aw=;
	b=DvSlno/KANizd1hDQKMcTrsxAlD2UHWD15MBgMp4Vy2Czc6Psq5Yhu9W8aD9iOb0SSk4jY
	9rrwb5hCkd2G90f2vbPBtIHubrjgCts3p/eGs9e3+rG2nSB9dQFKpPTUH+lOFLzBtk4g34
	PpK5g4U5+ObDdHdLysf2wMbC/iy3hBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784451655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuCGuweiFhobU2D+Naz3Q5FBj7adjh3PfHasyur61Aw=;
	b=DL3ts8oWdAlVnbBzhfuzwc4ITpqxhZwTpgUHlbBZK8sLJoURltuwBSj9t3KjvDepS7kvXt
	qnO5cY8fAAASBZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55596779AA;
	Sun, 19 Jul 2026 09:00:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5RirE0eSXGqQVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jul 2026 09:00:55 +0000
Date: Sun, 19 Jul 2026 11:00:54 +0200
Message-ID: <877bmrs69l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Grant Diffey <gdiffey@gmail.com>
Cc: linux-sound@vger.kernel.org,
    ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] More quirks for M-Audio Fast Track Ultra.
In-Reply-To: <CACckToXHuiq4RYeoBfpbui_wNCYSgjRmOiDFZH1EW_1VQLr3cQ@mail.gmail.com>
References: <CACckToXHuiq4RYeoBfpbui_wNCYSgjRmOiDFZH1EW_1VQLr3cQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 17 Jul 2026 16:50:24 +0200,
Grant Diffey wrote:
> 
> Hi all
> 
> 86aa1ea1f15ce broke the fast track ultra... patch adds a quirk for 'broken
> GET_CUR'  which is absolutely required to be able to configure this
> interface.

Which controls are affected?

> I've also applied the IMPLICIT FEEDBACK quirk as I believe this card should
> be treated as implicit feedback like the C600
> 
> This should probably be applied for the Fast track ultra 8R as well but I
> don't have one to test.

Could you resubmit in a proper format?

Please post & submit to linux-sound@vger.kernel.org instead of here,
and always put maintainers to Cc, at the next time.


thanks,

Takashi

> 
> 
> Regards
> Grant
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 41149561aa06..ab5d008a2748 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2320,6 +2320,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>  	DEVICE_FLG(0x0763, 0x2031, /* M-Audio Fast Track C600 */
>  		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
> +	DEVICE_FLG(0x0763, 0x2080, /* M-Audio Fast Track Ultra */
> +		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>  	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
