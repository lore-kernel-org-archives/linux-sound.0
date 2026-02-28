Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BF1448D5
	for <linux-sound@vger.kernel.org>; Sat, 28 Feb 2026 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267087; cv=none; b=Cm6BQr2r8lPf+fbewkepJVcpAUYg8774QLrnDZxbCgySgjKGGpaS7Z9vIOu4rJsNziAlzDUIBAfE2jdrXebbi2VD6XmMdnUUjvaTy+hj3CYVxi2DHpOS72HpG2GUKZl0IPsRWz3CQcyGQiS6qRO/O8MoYErC7X0yCAPeJuBlPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267087; c=relaxed/simple;
	bh=GhmueDz7dfb5ZyDM1MB8QkL/8CASHhTCR9U32EE44to=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mV5HH2BuvWZfXeSfPh54I/NcUpgD7x4M6JYscWoT1aZcbwpeJIOYgb80cUXBOW6skQdwLripKUPtmxeCFTxsk4PX4H20vckcW/M+QOQtVlliKmsMeNNoAJwCR5mepJXyxqj/kdfVnaHGWx3aSNuUtcYUjLRReG7qUpS9azCZ+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sE2+C3D1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LGJOmxV9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sE2+C3D1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LGJOmxV9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sE2+C3D1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LGJOmxV9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sE2+C3D1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LGJOmxV9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 259E65BCF4;
	Sat, 28 Feb 2026 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvAscZNfUdVpSlaF6X0gPxwgk7FvkR2wbUiAaPjJ4X4=;
	b=sE2+C3D1zIniEA1DW/RxPfwqwW9c6GL78C65P3W/PuycNeVVLioWsKF7Y5ofcWLuGgnMwU
	d2BTGJQ1PpPubf5vFteHRNGDxNF6G7gVkOgOR8Tl4GUc7KCGA2kDXptBZ6lTpJxJeCvsaU
	KQD2ZjnI848JjVBAW4MLK1zR+VbMaas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvAscZNfUdVpSlaF6X0gPxwgk7FvkR2wbUiAaPjJ4X4=;
	b=LGJOmxV9y5INjX2MhNh6FXyKYn2Upwy3wZI/nEcNqJ1jOUftNWpcXG7qxERvPUot+gp/hJ
	JXAHymQOmaCuy9Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sE2+C3D1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LGJOmxV9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvAscZNfUdVpSlaF6X0gPxwgk7FvkR2wbUiAaPjJ4X4=;
	b=sE2+C3D1zIniEA1DW/RxPfwqwW9c6GL78C65P3W/PuycNeVVLioWsKF7Y5ofcWLuGgnMwU
	d2BTGJQ1PpPubf5vFteHRNGDxNF6G7gVkOgOR8Tl4GUc7KCGA2kDXptBZ6lTpJxJeCvsaU
	KQD2ZjnI848JjVBAW4MLK1zR+VbMaas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvAscZNfUdVpSlaF6X0gPxwgk7FvkR2wbUiAaPjJ4X4=;
	b=LGJOmxV9y5INjX2MhNh6FXyKYn2Upwy3wZI/nEcNqJ1jOUftNWpcXG7qxERvPUot+gp/hJ
	JXAHymQOmaCuy9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3F6C3EA65;
	Sat, 28 Feb 2026 08:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nP7XOUumomliRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Feb 2026 08:24:43 +0000
Date: Sat, 28 Feb 2026 09:24:43 +0100
Message-ID: <87ikbh6zsk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matt DeVillier <matt.devillier@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headphone pin verb
In-Reply-To: <20260226163055.825167-1-matt.devillier@gmail.com>
References: <20260226163055.825167-1-matt.devillier@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 259E65BCF4
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 26 Feb 2026 17:30:55 +0100,
Matt DeVillier wrote:
> 
> HP/Speaker auto-detect (VNID_HP_ASEL) has been off by default for every
> CA0132 device since the driver was added in 2012. vnode_lswitch is
> always initialized to 0 in ca0132_init_chip(), and no quirk or other
> code path enables it. As a result, headphone jack detection works only
> after the user manually turns on "HP/Speaker Auto Detect" in alsamixer,
> which is not obvious on laptops with combo jacks (e.g. Google Link,
> Alienware).
> 
> Change the default to follow the headphone pin config: if the pin verb
> has presence detect enabled (no AC_DEFCFG_MISC_NO_PRESENCE) and the
> codec supports it (AC_PINCAP_PRES_DETECT), enable HP_ASEL by default.
> This lets firmware (coreboot, UEFI, etc.) express whether the headphone
> jack supports insertion detection. Devices with combo jacks can default
> to auto-detect; devices with fixed/no jack leave it off.
> 
> Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>

Applied now.  Thanks.


Takashi
