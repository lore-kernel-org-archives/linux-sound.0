Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7B1B414B
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733305416; cv=none; b=u/KjqR/yVGoMMOTZ2gLznnxTFd3jKC5aYIlQl4RFEavcqWtvJH3wGsSliR0vF1UpPuvhJ0LWIOFqMj8fub6nlRSvZraF/XdoHmYzPK5c2zBsjOmYFOuGzU+2P1ysJBuOy4gmYAgqCZ7MFCps4BhHTJCobouLHAVktvPmuK6x0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733305416; c=relaxed/simple;
	bh=av4tYX65gLAXkc1bE6kW2Zz7MIVZdQg7kqRJ6NtuB4I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMlr8qVEUf215+YjDImt7zLybb3xdp0q64c3BKoJVawb97+KTsZmSNlbuIKjWHeA2klIZVxq6nLY2IHltqQScnTptVZcujzKf97f9lodRxPFInPja095BO+XQMa6R9SMorDIkXOsGLvq6zGacRyA160sxaJdY/Vmm61/PsHfSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HqBWdOfB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KykWytqH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HqBWdOfB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KykWytqH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HqBWdOfB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KykWytqH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HqBWdOfB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KykWytqH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EACE2110A;
	Wed,  4 Dec 2024 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733305412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQKq5NIS3sM6mIDlvaQbJ5oE8WmrwB2aRTKPLrtM8Jk=;
	b=HqBWdOfBMZTrLbJ5mzi50w+cOKQUzdOfGcH6MwYmyxVvLVyeiBs+yrlq5sXXNhk9ijl4kD
	SFTWr/Tvhp/uu3I+kciBewsFHuI57kKY/aKJzWorUCU3YqIF3n/5FYVkxfEXehXRzN8k7j
	jWOwOiBrVuIMNc3aaZU43akIxi/NJJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733305412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQKq5NIS3sM6mIDlvaQbJ5oE8WmrwB2aRTKPLrtM8Jk=;
	b=KykWytqHm4jP3r3DGu0eLGKDAFHzQYRW+6BNzAUvUrcty++WLHTLONz7py8dEHLqM2EFBJ
	SZrE6qHlqcbkM0Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733305412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQKq5NIS3sM6mIDlvaQbJ5oE8WmrwB2aRTKPLrtM8Jk=;
	b=HqBWdOfBMZTrLbJ5mzi50w+cOKQUzdOfGcH6MwYmyxVvLVyeiBs+yrlq5sXXNhk9ijl4kD
	SFTWr/Tvhp/uu3I+kciBewsFHuI57kKY/aKJzWorUCU3YqIF3n/5FYVkxfEXehXRzN8k7j
	jWOwOiBrVuIMNc3aaZU43akIxi/NJJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733305412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQKq5NIS3sM6mIDlvaQbJ5oE8WmrwB2aRTKPLrtM8Jk=;
	b=KykWytqHm4jP3r3DGu0eLGKDAFHzQYRW+6BNzAUvUrcty++WLHTLONz7py8dEHLqM2EFBJ
	SZrE6qHlqcbkM0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62AA4139C2;
	Wed,  4 Dec 2024 09:43:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cSPSFkQkUGdScQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Dec 2024 09:43:32 +0000
Date: Wed, 04 Dec 2024 10:43:32 +0100
Message-ID: <87plm7wzp7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kailang@realtek.com
Subject: Re: [PATCH] ALSA: hda/realtek: Remove needless comment lines
In-Reply-To: <20241204093928.15988-1-zhangyongzhen@kylinos.cn>
References: <20241204093928.15988-1-zhangyongzhen@kylinos.cn>
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
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 04 Dec 2024 10:39:28 +0100,
Yongzhen Zhang wrote:
> 
> -/*
> - */
> -

Too cryptic description :)

And, instead of removing, better to put proper comment instead.


thanks,

Takashi

> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>  sound/pci/hda/patch_realtek.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 4ba9e647250b..b73b1a51a23d 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -890,9 +890,6 @@ static void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports)
>  	}
>  }
>  
> -/*
> - */
> -
>  static void alc_fixup_inv_dmic(struct hda_codec *codec,
>  			       const struct hda_fixup *fix, int action)
>  {
> -- 
> 2.34.1
> 
