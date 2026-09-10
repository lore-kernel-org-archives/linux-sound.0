Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CC57268E
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063792; cv=none; b=fpt9mLzLkk4rw6P8St+KGOfkDxeelrJ2Qknc/11MYaMFqpEcPdEx3BSq0iCVKVD1djrc7wgw14gkAFXNRElm0FUlVkG+hV2lZEamT9PBVY+391GsDBQP5yqam/ufsM88BbhP5ixD4jLpoRoYYLPPsh1wCJHX95ShhXVAH51tBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063792; c=relaxed/simple;
	bh=TIY2DRwIUel2JmFzBcTRhTtlXPCv+8lD9fyY0kjNguI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9gj8dJyWF1NfGyequS+cPIR75+IsDjiP6KJmHNNmtfkyG1zKmZoagXuIk4hjvRCu1YZxxrjncI/GHItWG9+ay80A38tiyg+jrdRHtEnGqDPfhf5zSifmUQPVPkhHqQEMmjhOh1TfSVhPSFLcb5VBsHjzPdJURydk4NSFAgMrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cORVIucs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZ19D2ea; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KpOjbzWV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nu6ERrvU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cORVIucs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZ19D2ea";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KpOjbzWV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nu6ERrvU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 879CC21940;
	Thu, 10 Sep 2026 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789063782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLWAUBbJkkwy6xeYweWeyAwVekbsq8Rp/XPHLrn8e2M=;
	b=cORVIucssf6L02QEHzyo3WpBdqlaF8c83xm/h83g5BkR18i28n3HKEA1Gpd3pC6gOoMPV5
	DnHGpWNKC9L6Snl9Y9cHBxKLDiilWhlWYWaKxZZeNFhOzE//8N0awGFMLuPLrLK3hEWnbE
	qAD22TiVzZmquPz76f9SYmrZmIUgMkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789063782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLWAUBbJkkwy6xeYweWeyAwVekbsq8Rp/XPHLrn8e2M=;
	b=QZ19D2eaNJEzo01jJQV1CH/gGP1RvOgnmfCd7q12uOqtbQbc2Me3Klh6toiwaphPbWNPgk
	ORPEy2KqrO+odNDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789063778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLWAUBbJkkwy6xeYweWeyAwVekbsq8Rp/XPHLrn8e2M=;
	b=KpOjbzWVsBhXPkpdmci1hdt7ST8iS4hQ3GOHkS7eOTgu3bxMtctW7iCNkDCTymuRlGl9Mv
	gjLGxaOFIPzxYIPYap5D0WUmJ5N6050+yMfEJv1Ll1+VQJfmjkD/U5CSm/y+Z0agYkoo9y
	3BgsDRb1fghYMA1Da8p0fDr82+kVs5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789063778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLWAUBbJkkwy6xeYweWeyAwVekbsq8Rp/XPHLrn8e2M=;
	b=Nu6ERrvUZLd+STW5RPDuN1tznnrLjEChIFPokVOL+KDK9PEFzck2qiZxp1J6+9iDVimtU7
	ml33v5g5nhVh+sBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DAC81326D;
	Thu, 10 Sep 2026 18:09:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8sK1DWLyomrYNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Sep 2026 18:09:38 +0000
Date: Thu, 10 Sep 2026 20:09:37 +0200
Message-ID: <87o6e5j7vi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian Verde <verde.cristian2005@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add bass speaker quirk for Lenovo Yoga Pro 7 14IRH8
In-Reply-To: <20260910174251.22302-1-verde.cristian2005@gmail.com>
References: <20260910174251.22302-1-verde.cristian2005@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Thu, 10 Sep 2026 19:42:51 +0200,
Cristian Verde wrote:
> 
> The Lenovo Yoga Pro 7 14IRH8 suffers from missing bass speaker output and
> broken volume scaling (5% volume plays as loud as 100%). The system shares
> the PCI SSID 0x17aa:0x3852 with the older Lenovo Yoga 7 14ITL5, causing the
> ALSA driver to mistakenly match on the PCI subsystem ID and apply
> ALC287_FIXUP_YOGA7_14ITL_SPEAKERS. That quirk only powers on the amplifier
> without routing the 4-speaker DAC pins.
> 
> Add a fixup helper that disambiguates models by checking the HDA codec
> subsystem ID (codec->core.subsystem_id). When the Yoga Pro 7 14IRH8's codec
> SSID (0x17aa:0x38b1) is detected, apply ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
> which properly configures pin 0x17 as a speaker output and hooks it to the DAC
> volume controls. Fall back to ALC287_FIXUP_YOGA7_14ITL_SPEAKERS for older
> hardware sharing 0x3852.
> 
> Signed-off-by: Cristian Verde <verde.cristian2005@gmail.com>

This doesn't apply cleanly on the latest code.
Please rebase to sound.git tree for-linus branch (or at least 7.3-rc2)
and resubmit.


thanks,

Takashi
