Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5778299
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239057; cv=none; b=QtuDHaNGyEQIDHLQZZmdZIsQiZWtnMXZis45bS1/R1jYbaiO2+CW0w8SVn+ZqS/4iCie84aBzEc0p/ixyHW+dajz9rrn4dsfYwjo8hU45GI84ZN2EcsKDzvHcNN0lC1Q0XkGkgjdBCss59lbH3FzHTy8x9WTwMykUjN3ScImins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239057; c=relaxed/simple;
	bh=NC+qtZrug8c0Jfn0CW3a6wj3pFA/bSooZq3Y1ynVYko=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWXYLkTcvzC6JuAZ4Kq6lcmOl+TUOrJRGXCSSMusKNieZ3a/UUFmWMx1dGlmaWK3FSWM57c2/G1OxpoVydp4eCzwukPvlb4pxgK8Kj04pkRhA+ZsFrAbxNjCBq2ieNlNxsQZR5OccB220gP43Hte+CHOW8INnd9cw+7VbClUr8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=co+1ZWLM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i15I3/S1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IXglOW6x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pAX2HSoc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="co+1ZWLM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i15I3/S1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IXglOW6x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pAX2HSoc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7F8037555;
	Tue, 12 Mar 2024 10:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710239053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiEq3xlMRDEWR+yfQiqLsLs4G2h+H99K+r0zNaIhDDw=;
	b=co+1ZWLM0I3Sc/v0IDi5kQwFOmPpEIerOE8mUJi8mQaxiQBRkBS2xC9jvnNkLDhdzDz8Wx
	cZxGvSzc2bn/2areA+HwVsemD5KPUw22zWvFmyH06etymb3NXIkOpoOyC4kM94X48s/Baw
	2mGgT8dnB6kcjPAw1n74OMBJlCYJ3ic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710239053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiEq3xlMRDEWR+yfQiqLsLs4G2h+H99K+r0zNaIhDDw=;
	b=i15I3/S1jcWjy7MftU+LsaflhbCafioFK8aodeRPbVaNpL4qQuoa6AstPAipEkRM2sG4MJ
	Q19jeGPwEPXk/rBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710239051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiEq3xlMRDEWR+yfQiqLsLs4G2h+H99K+r0zNaIhDDw=;
	b=IXglOW6xwiiK/1xqMQRolxllM0KL6uiEJ63Culm55j54oNardak4SmY9hVXnOaEfvi/Tiu
	mDDN2FwNtyidgNMrKgrBL24/9t4jxWy8Jp32DCP6UNihnNSmxDtBksf4UZy1lzK7QzqVty
	RMufElryWMhgfMjb9ctlrLoacXoYOqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710239051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiEq3xlMRDEWR+yfQiqLsLs4G2h+H99K+r0zNaIhDDw=;
	b=pAX2HSoccyO0hA3SYjjzUNFMzWCxWwqlFQSCHvgb8AB3oooArnE0Yg3HEqjmm3RHgS/90V
	vXsalhI+e0qKElAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D19A5137C4;
	Tue, 12 Mar 2024 10:24:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fEilMkst8GVZSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Mar 2024 10:24:11 +0000
Date: Tue, 12 Mar 2024 11:24:11 +0100
Message-ID: <874jdb7np0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?f=E6talize?= <faetalize@proton.me>
Cc: Takashi Iwai <tiwai@suse.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH V3] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
In-Reply-To: <fYpNFBsL1RgCO3Ag9BWsfndkd5Z3toPsW6hMfNG8EDFj4V4RaDXsZQ5CC-YxMR8ekj-sqGx7RMbuXlRZhq8q6prm1nn4VVUAgyJaA-qvY6c=@proton.me>
References: <fYpNFBsL1RgCO3Ag9BWsfndkd5Z3toPsW6hMfNG8EDFj4V4RaDXsZQ5CC-YxMR8ekj-sqGx7RMbuXlRZhq8q6prm1nn4VVUAgyJaA-qvY6c=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IXglOW6x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pAX2HSoc
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.51 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,proton.me:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-0.994];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -5.51
X-Rspamd-Queue-Id: E7F8037555
X-Spam-Flag: NO

On Tue, 12 Mar 2024 02:18:28 +0100,
fætalize wrote:
> 
> Some HP laptops have received revisions that altered their board IDs
> and therefore the current patches/quirks do not apply to them.
> Specifically, for my Probook 440 G8, I have a board ID of 8a74.
> It is necessary to add a line for that specific model.
> 
> Signed-off-by: Valentine Altair faetalize@proton.me
> ---
> V2 -> V3: regenerated diff using git.
> V1 -> V2: No changes.

Almost good, but just a few things:

- The alc269_fixup_tblp[] is sorted in PCI SSID order;
  put the entry at the right position
- Signed-off-by line should be in the format "Real Name <real@xxx>"
- The address in the From line should match with Signed-off-by line;
  if the mail set up is difficult to change, you can put "From: ...."
  line at the beginning of the patch itself, too.

Could you resubmit with those corrections?


thanks,

Takashi


> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a1facdb..f04c3c1 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9890,6 +9890,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC q", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
