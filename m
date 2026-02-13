Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2C24E4A8
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770995526; cv=none; b=Y3podJDvJJ2IvwTRV0OT/6Ag+tEzMyNAmcdMbkNCyq1eQnQVCAarAyhScoj6DmVIvnkn68llhLtcc5xyNzNqrzmYwxV9j2Y6HmpPX9Ae5OHhOomeQfNpv8donI5jNKyGXa1cmwfa8i4KNuGaCLWCOMEGMSABzErvLo5OkbNs1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770995526; c=relaxed/simple;
	bh=7U4CUZSxAynVDQoFjE+zvKC5UKsFyz2ffjEmmtncxHA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=caP4x82zj89URS9FCJSC1+gPxpe8/hpnHbU57Kf7Zcyb3XQ2H2maYWTJCaQmfJ0lKbQx4s08095cdspKAIf5E6N6++W57sWgfJm1xgwHVtOwoySuqwr8uK2DYbpp+n8fl/Skecj7Q5+oA6YqANd8AReQNz8MaEL0ZzHrYhZdlSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tMaIq4uS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=91pVjTCs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ubyl74mN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qSRWAQFr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tMaIq4uS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="91pVjTCs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ubyl74mN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qSRWAQFr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE5A13E6F6;
	Fri, 13 Feb 2026 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770995523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFuxRyJ2+72Q15Flm0pAqhgEe7QN8I9BzaGJRRPqYL4=;
	b=tMaIq4uSs/Nsh3lmQY/tR/ySuGTBsKrOO7MPk5C8svJN9kIfk3f0Qm+59sZR9z2YAzZsvl
	pTdkX6u7Tg4cP0UUKH7NlyPaxcngV08viTqSr8CagwHSV2HKOeoj1TLpHkJTGgKye8yJNy
	CLPqOPFJK6xYIqoFmV9hyPORRUXtlt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770995523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFuxRyJ2+72Q15Flm0pAqhgEe7QN8I9BzaGJRRPqYL4=;
	b=91pVjTCsl96tbs4TxImzD5OHEFqdKGgW58m9fJurpW6x/Ec8uLP3Kq/vAOXn/foeuPeWnJ
	IFBac+BuvdpVZUBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ubyl74mN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qSRWAQFr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770995522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFuxRyJ2+72Q15Flm0pAqhgEe7QN8I9BzaGJRRPqYL4=;
	b=ubyl74mNH02OiFPaTKvY6N8Jv5wqC4ZoCDBoUihuT9pAcVZZIMrBsi2LYkWnB7oUHGx3M3
	gUnjt9e0VmbHf8kEMpUHTZAYGcszNALlXN2s34tgQGSI/DjWZ/HiVsg902w34y+dBWjgAP
	P3eROTsNjolc2ZScoucCxFULZVN0i/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770995522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFuxRyJ2+72Q15Flm0pAqhgEe7QN8I9BzaGJRRPqYL4=;
	b=qSRWAQFrRLWxbnlLAK+XzO0b7xMq9UzsJzTdalubMG8y0ahBBN05n9D6jLw1prTrQLFCrk
	qQi8IK/HWrZGBfAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E2403EA62;
	Fri, 13 Feb 2026 15:12:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qTGVHUI/j2kuHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Feb 2026 15:12:02 +0000
Date: Fri, 13 Feb 2026 16:12:02 +0100
Message-ID: <87jywgu18d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rob Hermann <supgeek@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	kailang@realtek.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker output on ASUS ROG Strix G512
In-Reply-To: <20260213143941.29696-1-supgeek@gmail.com>
References: <20260213143941.29696-1-supgeek@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: AE5A13E6F6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Fri, 13 Feb 2026 15:39:41 +0100,
Rob Hermann wrote:
> 
> The ASUS ROG Strix G512LW (subsystem ID 0x10431f21) with ALC294 codec
> has no speaker output on Linux. The internal speaker amplifier requires
> specific codec coefficient writes that differ from the existing
> ALC294_FIXUP_ASUS_SPK quirk values.
> 
> The required coefficients were identified by comparing codec register
> dumps with and without working speaker output:
>   - Coefficient index 0x0f needs value 0x7778 (vs 0x7774 in existing quirk)
>   - Coefficient index 0x40 needs value 0x0800 (vs 0x8800 in existing quirk)
> 
> Without this patch, speakers are completely silent. Headphones and HDMI
> audio work correctly.
> 
> This affects at least the following models:
>   - ASUS ROG Strix G512LW (i7-10750H, RTX 2070)
>   - ASUS ROG Strix G512LV (reported on Fedora forums)
> 
> Link: https://discussion.fedoraproject.org/t/asus-rog-strix-g512lv-speakers-do-not-work-headset-works-fine/74918
> Link: https://forum.endeavouros.com/t/asus-rog-strix-g15-g512lw-no-audio-through-the-speakers-alc294/72857
> Signed-off-by: Rob Hermann <supgeek@gmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 15 +++++++++++++++

Thanks for the patch.  But your patch seems based on an old kernel
code.  The HD-audio code was reorganized and in the recent kernel it's
found in sound/hda/codecs/realtek/al269.c.

Please try to rebase to the latest kernel tree, retest whether
everything still works, then resubmit.


Takashi
