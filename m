Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809B022A7F0
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784573385; cv=none; b=WzhjvbjBLwLRIctaogjIRt2zOxu1w9gVypZNx9DZRQDyu9PkdLhu1+P1sOA/sGXOSHsDYNhWsFS7085qrlxS0ck94Htvlx4A0aQbz8iXvVQSkF5Zi2kw1uqvLrxXOcd4e1EfC2wip0StDmr2V68ZtjAOoeZpaatkJkpt9wX1RXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784573385; c=relaxed/simple;
	bh=vFn4Y6AehN6hi4PTOPpsSyA+hm/6le4XuPsU0dm6RhA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIaARcLLfwfmpnxhsVUL6XkfE+OcQfjCIdpcPC6/sax90FIwZGoY+DwemADI7qYY2lOC/hFJo+QmfnVizwCpvk/LRKO7lrUg9hRCtJK26p5862+BFxUH7mh4L970FzypS1NNX91KXnADR0yfwZ9/lkfRyE+38aHW0/9vM2NrxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jq8l6Cvo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GU60vTW6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QhqDl+ns; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TYJbzcfe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jq8l6Cvo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GU60vTW6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QhqDl+ns";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TYJbzcfe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2BFEC7A132;
	Mon, 20 Jul 2026 18:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784573376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMc5UzY3qhZkJCSAeV02p85gCIcRwakrhcE1iAyuWHQ=;
	b=jq8l6CvoWJBp5D1tnEzgN8ld0RP5u35V+l+Ly60SthVSIkFcy84OxkLB7Enx5K+GR/qvJA
	NHffe4e3wioc9YSGF06buUUbfpwAJD8rKLD8i9jG0mKgVofYf+CkmqUfridVnmLJCUK1ZY
	rMGbZ8XObnR2M5USyIft9XouK0U8kTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784573376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMc5UzY3qhZkJCSAeV02p85gCIcRwakrhcE1iAyuWHQ=;
	b=GU60vTW6hiVJ3mj0rDxYRGSKf371tRyCpX8+bbEysLigt7xZcPwzxvB4VmPzSRxGkLF7Z5
	i0nSzlJ+2qefhjDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QhqDl+ns;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TYJbzcfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784573375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMc5UzY3qhZkJCSAeV02p85gCIcRwakrhcE1iAyuWHQ=;
	b=QhqDl+nsCysp8nWZ3luwstY+3e55eTxai3sUeN+72Dj0DjZGdFGUOyPeThJk8donLiZ1tV
	TDPKcsH5qm0jLSUVXgSeP4WUlRAVepol9WtjcojYsNkVvk/5h7wTcs7v3LMPAs/jnfa7mr
	QR9eCz1cga7Bj+w2O5/05e990BeXheE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784573375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMc5UzY3qhZkJCSAeV02p85gCIcRwakrhcE1iAyuWHQ=;
	b=TYJbzcfeliRQ8SeRvkw6Iss6SroIGj+Fz1gALH9dmZHwpfRgbRALK64HszYY/m22z03qW2
	N7BpUZRYzdLesnBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF0E3779AA;
	Mon, 20 Jul 2026 18:49:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jd1TNb5tXmp5TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 18:49:34 +0000
Date: Mon, 20 Jul 2026 20:49:34 +0200
Message-ID: <87y0f5pkch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: philippdev5396@outlook.de
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH] ALSA: hda/tas2781: clear cali_data.total_sz when calibration read fails
In-Reply-To: <20260720-tas2781-calfix-v1-1-3a5fa6ad90bc@outlook.de>
References: <20260720-tas2781-calfix-v1-1-3a5fa6ad90bc@outlook.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.de];
	FREEMAIL_ENVRCPT(0.00)[outlook.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,outlook.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2BFEC7A132
X-Spam-Score: -3.51

On Mon, 20 Jul 2026 11:41:51 +0200,
Philipp Oster via B4 Relay wrote:
> 
> From: Philipp Oster <philippdev5396@outlook.de>
> 
> tas2563_save_calibration() assigns cali_data.total_sz before it reads the
> per-device calibration data from EFI, but its error paths return without
> clearing it again. cali_data.cali_reg_array is left all zero, because the
> function returns before the register addresses are assigned.
> 
> On the first playback tasdev_load_calibrated_data() does
> 
> 	if (!data || !cali_data->total_sz)
> 		return;
> 
> which passes, since total_sz is still non-zero. It then issues five
> 4-byte bulk writes to p->r0_reg, p->r0_low_reg, p->invr0_reg, p->pow_reg
> and p->tlimit_reg, all of which are 0. Register 0 decodes to book 0 /
> page 0 / register 0x00, so the auto-incrementing block write zeroes
> registers 0x00 to 0x03. Register 0x03 is PB_CFG1, which holds AMP_LEVEL,
> so the amplifier gain is set to its minimum and the speaker stays silent.
> 
> This is reproducible on a Lenovo Yoga 7 14ARB7 (two TAS2563 on I2C,
> ACPI INT8866) whose factory calibration was never written to UEFI, so the
> EFI read fails with EFI_NOT_FOUND. The two woofers driven by the
> amplifiers are silent while the tweeters driven directly by the ALC287
> play. Reading the amplifier registers over i2c shows PWR_CTL = 0x00
> (active) and the TDM slots correctly programmed by the RCA profile, but
> PB_CFG1 = 0x00. With this change PB_CFG1 keeps its power-on default of
> 0x20 and both woofers play.
> 
> tas2781_save_calibration() in tas2781_hda.c already clears total_sz on
> failure; do the same for the TAS2563 variant.
> 
> Signed-off-by: Philipp Oster <philippdev5396@outlook.de>

Applied now.  Thanks.


Takashi
