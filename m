Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016013BBA09;
	Mon, 17 Aug 2026 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953516; cv=none; b=OTom3rBBfCZM2EjK3uxHwDPzcWuUMpId+P8M47U3SGAaRRBsSsONKAiH5tdyOTY6pc8DtSFsg6v4WoMPgUc+rzgchq9e+eclTkKIT1fq+4yzSdhqPepggqoBD1xBWsi8nKj6gzF6U/c0GT684EsKyJXU/0GiLgccMatATE2vA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953516; c=relaxed/simple;
	bh=02bGehaMprnuLfSN+5mcKUkj1JxN97nfHpsBq4klDyc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/5DgmOAj9Ss7nyEMcYnrH7RjC78ktzinL+j00rUMmkwA2ahWRaa/UcQqunK/mWLCKMhzA7z9SLpa01UKUVia3uoCs/RtnnIYdbrlG64mv8E/P4LeRmUhh3yLkk+XhAH9pQK4aGPJGjY1wwYsJ45o7b3d8RDK8hkgX2uje/27eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uZ2wDhPS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=19+ukaJg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sNxgkffw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=neybIBcX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uZ2wDhPS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="19+ukaJg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sNxgkffw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="neybIBcX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CED1C83EC7;
	Mon, 17 Aug 2026 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786953509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiSGP+ei1Bq5X2XUmSr6tSSFWrzgJ5NsrvszctVrHY8=;
	b=uZ2wDhPSRbZOsXfHIjekobEfXym+qt+9hNgB7sbCITqaGIQe8byDpGMsjD6PbWhnJM6C0Q
	Tj5ZcbBv/oN0gyA/b2/OLMZGivnXDI2o0qHBwkFYxw74HwvpqQB7sNfocCe0j25jgLTDjy
	F8rAN7QwDrp8HX+2s3yCmKE8IY3a2zY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786953509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiSGP+ei1Bq5X2XUmSr6tSSFWrzgJ5NsrvszctVrHY8=;
	b=19+ukaJgLU4YcPWy17JNBSezCEPk9RDmT4CqO+nee0dvPHf7FdIofiJVc/JDRt9ep1b/eg
	trV6Iyz4JbXi+mBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786953504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiSGP+ei1Bq5X2XUmSr6tSSFWrzgJ5NsrvszctVrHY8=;
	b=sNxgkffwbPPCB3tZWdBfYRZCthrGWdCERmCASEB2pQT7VM3HRGdgz9hQAQ5gleLyIr7+BV
	+f5RDKtYHuIYmdfIB7ckdLApTJ3eD9sFIoZ3ewN4T9WxaHl7x+M+MRm8La0L3lPLb3ZOtF
	S65zYUbw0YacvHUqKh3fzJX/psj2Z4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786953504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiSGP+ei1Bq5X2XUmSr6tSSFWrzgJ5NsrvszctVrHY8=;
	b=neybIBcXbKBl5dFVGWJnH4nYxP+LOdkOa4lnOaUok52E+24Suq3UVWsFANmXVFwM6WLY+E
	MMueclh4/ejuR6BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E94F79368;
	Mon, 17 Aug 2026 07:58:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dEjWIyC/gmorZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Aug 2026 07:58:24 +0000
Date: Mon, 17 Aug 2026 09:58:24 +0200
Message-ID: <871pbxmb4v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk ordering
In-Reply-To: <333f1933-3cd5-448a-ad9d-14eb27d765c9@kylinos.cn>
References: <20260814125937.788663-1-zhangheng@kylinos.cn>
	<87v79acpjd.wl-tiwai@suse.de>
	<333f1933-3cd5-448a-ad9d-14eb27d765c9@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 17 Aug 2026 09:25:14 +0200,
Zhang Heng wrote:
> 
> 
> From 9ee7af1cfe25ab0000000000000000000000000 Mon Sep 17 00:00:00 2001
> From: Zhang Heng <zhangheng@kylinos.cn>
> Date: Mon, 17 Aug 2026 10:00:00 +0800
> Subject: [PATCH v2] ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk
>  ordering
> 
> The Yoga Slim 7 14AKP10 has a PCI SSID of 17aa:38b4 but a codec SSID of
> 17aa:391a. The current quirk table contains a PCI quirk for 17aa:38b4
> (for the Legion Slim 7 16IRH8) which matches first, so the codec-specific
> quirk for 17aa:391a is never applied.
> 
> This results in the wrong fixup being used (CS35L41_I2C_2 instead of the
> correct bass speaker fixup), leaving the internal speakers misconfigured
> or silent.
> 
> Remove the 17aa:391a entry from its PCI-SSID-sorted position and add it as
> an HDA_CODEC_QUIRK directly before the 17aa:38b4 entry, because it must
> match on the codec subsystem ID rather than the PCI SSID and it has to win
> over the colliding PCI quirk for the Legion Slim 7 16IRH8.  A comment is
> added to explain the out-of-order placement, following the same style
> already used for the 17aa:38bb and 17aa:38f9 codec-SSID overrides.
> 
> With this change, the correct ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN is
> applied, restoring speaker output and auto-mute functionality.
> 
> The original quirk added in commit e6c888202297 ("ALSA: hda/realtek: Add
> quirk for Lenovo Yoga Slim 7 14AKP10") matched on the PCI SSID 17aa:391a,
> but this model actually exposes PCI SSID 17aa:38b4 (shared with the Legion
> Slim 7 16IRH8), so that quirk never matched and the bass speaker remained
> silent.  Fix it by matching on the codec SSID and placing the entry before
> the colliding 17aa:38b4 PCI quirk.
> 
> Fixes: e6c888202297 ("ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 14AKP10")
> Cc: stable@vger.kernel.org
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221298
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
> Changes in v2 (per review feedback from Takashi Iwai):
>   - Move the 17aa:391a HDA_CODEC_QUIRK to before the 17aa:38b4 entry so
>     that it actually takes precedence over the Legion Slim 7 16IRH8 PCI
>     quirk; the v1 placement (after 17aa:38b4) could never be reached.
>   - Add a comment explaining the unexpected, out-of-sort positioning.
>   - Add Fixes: e6c888202297 (the original non-matching quirk) and
>     Cc: stable@vger.kernel.org so the real fix is backported to v7.0.x.

This looks like an attachment, and I suppose it's accidental.
Could you resubmit properly?


thanks,

Takashi
