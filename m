Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A730934D91C
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712162; cv=none; b=fhgxKi80Y86FhJkfVcOm5RUdvD2YdxhdBfB2A5OR8zCs9soiSHvf9UpI8AGY9r9Y1wCveyYBsGsC/ol0CQpo/e1xJSOv5gRx9sxWdFQ/TWw5MtArpQrTJWxOxxmW+2/RoEewmKRGjNxfWX0XZRW0c4aBaopNK4eK2W3WJwH7hwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712162; c=relaxed/simple;
	bh=YEoLbEGlmmoN9DjceYYdzq/x0fqGDgNXA8yYvm+Ln9I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t2lQ8yUBvuLdW3pG7Ak+vuh9jC9KoiqddxlpCahoA6STykb3Tti9P3K4QNwQuZBdGYwR52PRjcwaDXfBJv/D5YdYLSsiDO2x3g0Jf1bKtB8x543Ycu6KE9MLJCkEgCUMmgkjwXKGJKjS84kXMJb1Y86a9GyxiEo+bw9nD9VbWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yEqpOqON; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hohXUybN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yPASuc0b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s2eKv0SX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yEqpOqON";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hohXUybN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yPASuc0b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s2eKv0SX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6DB53F828;
	Thu,  5 Mar 2026 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772712159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upFlpjGn+0dDAeHWhcp9Z9hxKVbASNZBpY0wre+wULk=;
	b=yEqpOqONbr5AvcmuN5PUaMXJct1uubPe6iEh89Tc5VN1zZCWg3Kdx3J4a/HEwjNrfxAVYz
	/MNkNjzRoXrfaqtZF6NgfF1u/nikOC3lskJhtaE4oNsjUMk+Z3EYuOZxlK6ODYFOeb3S3t
	38LtcUoRacpOieMMNVQAqigHSzo530s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772712159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upFlpjGn+0dDAeHWhcp9Z9hxKVbASNZBpY0wre+wULk=;
	b=hohXUybN7R43Xys7RYybRyrr3yUmi3c6SbXcyyBNIaetq+Ei5/0hSMyPqXTTh1SrZ/VTSJ
	RMxkNaKFG+q1SfBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yPASuc0b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s2eKv0SX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772712158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upFlpjGn+0dDAeHWhcp9Z9hxKVbASNZBpY0wre+wULk=;
	b=yPASuc0bWLQ2/6a+b+c7hlfUYVVyKQHsf0BH//QVBX4dMGNAHreHLRg9+tj70Wr06uCBFD
	IRqu7yY7jx3lJZmBsGqx3SLfXs2vAgjx9rpCfth2Y6SeXd3+wJUuFrapYgBAsvl6IKuwDP
	i5orX7bbi7KNzRrkzPawaakS5Uh0JYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772712158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upFlpjGn+0dDAeHWhcp9Z9hxKVbASNZBpY0wre+wULk=;
	b=s2eKv0SXYVSxbZUQStOKn2V843i2OLyzJbyMrO8nu8RsGH10ZYSfPEeKRI4F9puR2C7pjP
	ye6H+/buqgstE8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93E053EA68;
	Thu,  5 Mar 2026 12:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Yz/UIt5wqWliVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 12:02:38 +0000
Date: Thu, 05 Mar 2026 13:02:38 +0100
Message-ID: <875x7axz4x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone
In-Reply-To: <20260305024958.49026-1-zhangheng@kylinos.cn>
References: <20260305024958.49026-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: C6DB53F828
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 05 Mar 2026 03:49:58 +0100,
Zhang Heng wrote:
> 
> The BIOS of this machine has set 0x19 to mic, which needs to be set
> to headphone pin in order to work properly.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220814
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/hda/codecs/realtek/alc662.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
> index 5073165d1f3c..e5c75f27fca2 100644
> --- a/sound/hda/codecs/realtek/alc662.c
> +++ b/sound/hda/codecs/realtek/alc662.c
> @@ -313,6 +313,7 @@ enum {
>  	ALC897_FIXUP_HEADSET_MIC_PIN2,
>  	ALC897_FIXUP_UNIS_H3C_X500S,
>  	ALC897_FIXUP_HEADSET_MIC_PIN3,
> +	ALC897_FIXUP_H610M_HP_PIN,
>  };
>  
>  static const struct hda_fixup alc662_fixups[] = {
> @@ -766,6 +767,13 @@ static const struct hda_fixup alc662_fixups[] = {
>  			{ }
>  		},
>  	},
> +	[ALC897_FIXUP_H610M_HP_PIN] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x19, 0x0321403f }, /* HP out */
> +			{ }
> +		},
> +	},
>  };
>  
>  static const struct hda_quirk alc662_fixup_tbl[] = {
> @@ -816,6 +824,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x105b, 0x0cd6, "Foxconn", ALC662_FIXUP_ASUS_MODE2),
>  	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
>  	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
> +	SND_PCI_QUIRK(0x1458, 0xa194, "H610M H V2 DDR4", ALC897_FIXUP_H610M_HP_PIN),
>  	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
>  	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
>  	SND_PCI_QUIRK(0x17aa, 0x1064, "Lenovo P3 Tower", ALC897_FIXUP_HEADSET_MIC_PIN),

Could you try to put at the right position in the sorted list?


thanks,

Takashi
