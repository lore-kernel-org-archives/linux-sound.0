Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A69241C31E
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555598; cv=none; b=qU3UWJqzO2ZxRmj1SFc9ol+0o6kaHJuACguvVpzO0LxjM5XyDAGacUo0rnXkxHpMcntiNJuwTuxgAcCZgsaJQ/SgmdRToczyKkqUG6cb8gi7szfj96Q77OaFFgyazbaojSKAKDKerc2mQhJQubMlpeKUlahFAlShD7IIyIOQBzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555598; c=relaxed/simple;
	bh=CM2f3GqpgU/CN/NDA7w5MfSIt14rRwOpqjj11eIekK8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=anx8UDPGyBJsJ/xt2mLdCVAwbx5at4vyCc1TFdIxyEdr5Go5UKmkGHTI5FYA02aiM+S4H2HKDGyRbdQ7RHoVDA1Go4eFS7+aDkcwaqnhme6XOnVhEBJUNMGy5/RETfoS4YWr2k0I0+GzpoWun+9y3sls/gXC1/jlBCwfZdHeDRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wBM+cegJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d8MRLYZx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wBM+cegJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d8MRLYZx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wBM+cegJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8MRLYZx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wBM+cegJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8MRLYZx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 053B26A821;
	Thu, 30 Apr 2026 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777555596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Es6o5pOBFAxVD4w97atlebepKzZQZuOeplSP7bRoTMw=;
	b=wBM+cegJagzGJOqP57U1ug1MEzqphSDQFLAy3RWoxIVbcm7ywzUADGMmomFRMLKLW/2mQe
	+FUs63YO8Iy9ObOkCgCI4y4LbHk/9/VJyy9FsfOirEgCGR18sczcPkdlooAHZrJaPkbceu
	uNc2mM+fWTevqCbX/NMrGaMtAUetYic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777555596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Es6o5pOBFAxVD4w97atlebepKzZQZuOeplSP7bRoTMw=;
	b=d8MRLYZxCkqRlDzPL7X55RVuNVOIccwUByGupVvqzTXF3bg+FpjxoMPtgWuG+M//9aW7oq
	ykxjwpc6VxU5/kBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777555596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Es6o5pOBFAxVD4w97atlebepKzZQZuOeplSP7bRoTMw=;
	b=wBM+cegJagzGJOqP57U1ug1MEzqphSDQFLAy3RWoxIVbcm7ywzUADGMmomFRMLKLW/2mQe
	+FUs63YO8Iy9ObOkCgCI4y4LbHk/9/VJyy9FsfOirEgCGR18sczcPkdlooAHZrJaPkbceu
	uNc2mM+fWTevqCbX/NMrGaMtAUetYic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777555596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Es6o5pOBFAxVD4w97atlebepKzZQZuOeplSP7bRoTMw=;
	b=d8MRLYZxCkqRlDzPL7X55RVuNVOIccwUByGupVvqzTXF3bg+FpjxoMPtgWuG+M//9aW7oq
	ykxjwpc6VxU5/kBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5B62593B0;
	Thu, 30 Apr 2026 13:26:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id crbcLotY82nHNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Apr 2026 13:26:35 +0000
Date: Thu, 30 Apr 2026 15:26:35 +0200
Message-ID: <87zf2kmvec.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yuriy Padlyak <yuriypadlyak@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker silence after S3 resume on Xiaomi Mi Laptop Pro 15
In-Reply-To: <20260429220903.14918-1-yuriypadlyak@gmail.com>
References: <20260429220903.14918-1-yuriypadlyak@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Thu, 30 Apr 2026 00:09:03 +0200,
Yuriy Padlyak wrote:
> 
> The Xiaomi Mi Laptop Pro 15 (TM1905, subsystem 1d72:1905) ships with the
> Realtek ALC256 codec on Intel Comet Lake PCH-LP. After S3 resume the
> codec sets coefficient register 0x10 to 0x0220 instead of 0x0020 ― bit 9
> is erroneously set, which silences the internal speaker. Bluetooth and
> HDMI audio are unaffected because they use different paths.
> 
> This is the same mechanism fixed for Clevo NJ51CU by commit edca7cc4b0ac
> ("ALSA: hda/realtek: Fix quirk for Clevo NJ51CU"), but the existing
> ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME also reconfigures pin 0x19 as a
> front mic, which is wrong for this Xiaomi where pin 0x19 default is
> 0x411111f0 (disabled). Add a minimal fixup that only clears the stuck
> coef bit, and add the Xiaomi SSID to the quirk table.
> 
> Verified by reading coef 0x10 with hda-verb after resume (returns
> 0x0220), writing 0x0020, and confirming the internal speaker resumes
> output. With this fixup applied the bit is cleared on every codec init,
> including post-resume.
> 
> Signed-off-by: Yuriy Padlyak <yuriypadlyak@gmail.com>
> Cc: <stable@vger.kernel.org>
> Tested-by: Yuriy Padlyak <yuriypadlyak@gmail.com>

Thanks, applied now.


Takashi
