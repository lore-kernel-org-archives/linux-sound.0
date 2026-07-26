Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920129AAEA
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049093; cv=none; b=Ge+m472Zi1GVpZS5ytRXOA7T+g8J032wUE4snjQiIxb2Cvqz4R3+yF6X/AS2BQ7iOsBbbClxCWjQHz1AUCisLHRmdDEgEePJ4+uDWhvRo+UYRHc73kXAe0PysWZCVxaBFKRPSm2JQlEXhWelMMyqajgNSgpSoKHFL9qfqZjI9JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049093; c=relaxed/simple;
	bh=+9SGA77IKi6/17NNV/Zs0Eum/Q5OhZR6I7MXk+Z/iw0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBE96jv/OjswqFwS0H8F30Qz/lfPMNSqOUb25BksXFFFLlSMO9LhbdkfPk7xmTlICLmHa0HzTk1dS9VwJSlE+scFx4zLMbET5Ba2M2+XSMHhblgkJ/QS9PiY88SjJbuRAwKSFW2Bn3/Y9jxmxtkogZ+sJdvSlv1vIsQwDJkYP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hwsR8CfJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PBP7Z294; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D0RHRwU2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2HexbXj/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwsR8CfJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PBP7Z294";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D0RHRwU2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2HexbXj/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E005E4D23;
	Sun, 26 Jul 2026 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785049089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iDkVFBgTQwCMsAoPfSJOR/EjT76NxCsR7ych7MdGqY0=;
	b=hwsR8CfJvcvta8kLvZ3QIKDrdpwjY5rvGuOyOXtqi94BW06rIxJ0Masag1Hj4e74y8i2o2
	+DOBtUhosHv/jYt5LfhggpbDDupByeEWuNFuYBqCifNipMWDecXptO/r5TPC8U/d1oOPpr
	aoC2koYOUiSNXZVUYGtKQtGT+E5xSv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785049089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iDkVFBgTQwCMsAoPfSJOR/EjT76NxCsR7ych7MdGqY0=;
	b=PBP7Z294wtOyhNMrrP1RqwM47Pm9ki0gGD/7HNHtunyjC+WfZursTHk1APQJOeI34TVzfj
	P42+XyscT1eR72Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785049088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iDkVFBgTQwCMsAoPfSJOR/EjT76NxCsR7ych7MdGqY0=;
	b=D0RHRwU2GUPrevM3SSBeq/iyFfkv0SYGCEq44uNqHkLbwPaRJNVamBxKsRkDhgCeBspG+S
	UTdqFFPeiubPwoulmr2/pmLVnAvNkYOtzxNQ38pDwfdzcr7nfXxOrduG9WoQ4JNSe9/Led
	KAJC62ejdtCa+gjeKbGCnKNjPotPxUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785049088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iDkVFBgTQwCMsAoPfSJOR/EjT76NxCsR7ych7MdGqY0=;
	b=2HexbXj/8OPwpjHD/vudKAsKbMx8desbSJO/i/UZGTCFDLLcGyZJWMeA65t36y4O38tdEA
	yq8CHrIRJNUWCFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9A40779B9;
	Sun, 26 Jul 2026 06:58:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W5IRLACwZWpFegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 06:58:08 +0000
Date: Sun, 26 Jul 2026 08:58:08 +0200
Message-ID: <87ecgqb5kv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marcos Paulo Medeiros <maarcospm1996@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix headset mic on Acer Nitro 5 AN515-46
In-Reply-To: <20260725214131.25872-1-maarcospm1996@gmail.com>
References: <20260725214131.25872-1-maarcospm1996@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 25 Jul 2026 23:41:31 +0200,
Marcos Paulo Medeiros wrote:
> 
> The Acer Nitro 5 AN515-46 (SSID 1025:159e, Realtek ALC287) has a combo
> headset jack whose microphone does not work out of the box: the BIOS
> leaves pin 0x19 unconfigured, so no headset mic is created.
> 
> Apply ALC2XX_FIXUP_HEADSET_MIC, the same fixup already used by the
> sibling models AN515-57 (1025:1539) and AN517-55 (1025:1597), which
> makes the headset microphone work correctly.
> 
> Tested on an Acer Nitro 5 AN515-46 by overriding the model via a patch
> firmware with model=alc2xx-fixup-headset-mic.
> 
> Signed-off-by: Marcos Paulo Medeiros <maarcospm1996@gmail.com>

Thanks, applied now.


Takashi
