Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604840BCB4
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622693; cv=none; b=ojrGhJxDnWNolYBcsBvP7FxSmX9nc7l2TuWx+Za2H11clxzv3XD/H/R9kZhE/0NBivtNVz29tiDjApqJx1II37WjN6v8fyXM71TbMT4l40pJi+BEahe92ZDhO/SV0ZjHkpKsHqESaqwhhoYrueiFAChCJSbWFh0GiKR2OJ5fPJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622693; c=relaxed/simple;
	bh=brlas2FaQaPcJUlKApbzD6WDwd9EI1y/io/QGfzrx6w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwPQur8SaiPsb8Y5rGWwDqLcFg0j+/vSEK2IIwnYV5Rgmuf4spTM6Smt4tA4RbbuOfUIMpi6xchx4HcerRqMlxQ9Z6pg2fULgqO1hAx6TV0i1DyOaD5YJmvSoKqiXd1+2Fu74tE9QbP8IXP7Wcco0wNYR6LXQP0DdCrPOATrwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iputIgPI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fQRLRJPW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r2GSGMYL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BtXxtKi9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iputIgPI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fQRLRJPW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r2GSGMYL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BtXxtKi9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D9243EA1;
	Thu, 13 Aug 2026 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786622620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjzsdUTDyRKsTaOePvW2+FOok5soOP5mYKgp/pjBqM0=;
	b=iputIgPIlgyh02PRZT/+ZnMAjkLQJgLF+Gk1+xDSv5l5yII4rXp82tyyBCYzn4zUBwII55
	laHRUHb/XPOmoPcgDj4qTIGi75vEPKdnsvomVCUF/B0++qa/xOCqwn8IkjO/7EUvkoo8ey
	9w0uliyjjMlAgaAHdUmpO7+xlaUrPl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786622620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjzsdUTDyRKsTaOePvW2+FOok5soOP5mYKgp/pjBqM0=;
	b=fQRLRJPWpYB7cqLPzylZ4sCE4YrTGCxaqLzHicjxMYOJDKol1VjoWy8t2EWXzoZzMJdof2
	yrhFsRLxwZco0AAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r2GSGMYL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BtXxtKi9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786622616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjzsdUTDyRKsTaOePvW2+FOok5soOP5mYKgp/pjBqM0=;
	b=r2GSGMYLCGDYxuKY0ncGQEbStk+z95NllgNDr22q4v+ULg55sUZZYO3fyxxBOpFNlbT8xV
	fzPhiPO0N/vmMfcEVBp+lvOw7s6T+fy+Yd986uk0126wkIz+tYEaq5vCzfVdyM3OQLZbny
	kCVVeuTxaWam9MPFkoMS6uSEh9tNZo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786622616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjzsdUTDyRKsTaOePvW2+FOok5soOP5mYKgp/pjBqM0=;
	b=BtXxtKi9rJpBFgR7RztdFt4M58IXNo9NkiSlemnnL/Wjbpamnsgv7boPB0ESalXODCduL9
	it8FbojYoXnCYMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39E2B77DE6;
	Thu, 13 Aug 2026 12:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O6frDJiyfWoCOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Aug 2026 12:03:36 +0000
Date: Thu, 13 Aug 2026 14:03:35 +0200
Message-ID: <87ldaaxm5k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bramwel Barack <bramwelbarack89@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Add mute LED quirk for HP 250 G8 (0x85f3)
In-Reply-To: <20260812192832.69240-1-bramwelbarack89@gmail.com>
References: <20260812192832.69240-1-bramwelbarack89@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5D9243EA1
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 12 Aug 2026 21:28:32 +0200,
Bramwel Barack wrote:
> 
> The HP 250 G8 Laptop PC (subsystem 103c:85f3) using the Realtek ALC236
> codec requires a specific quirk to enable the mute button LED.
> Currently, the audio mutes in software, but the physical indicator
> light remains unlit.
> 
> Adding a quirk entry to the alc236_fixup_tbl with the
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup correctly maps the
> LED to the mute state via COEF index 0x07.
> 
> Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
