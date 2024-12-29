Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8322594AD
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735461703; cv=none; b=ss67BGeAaKBXoC6z8wRbcnLAiPVQt+LeeJyycJy95AkjZyG/j1pcJqDaA0MptRWs1jXQDs58aIerDxwXW2UBr4cr1/fZu3j3zhCklfTlLFhiZ6yrI/SIxQIU9f947h7biHsXLsBTh76yeeasDc0Wj+NxVxWDlD9w9fFwRvMQZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735461703; c=relaxed/simple;
	bh=0z5QFF4/DwBPf8xP9L+rD71DelfzELVKouoGf/OOcfE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xbqb3MSFNNC3PZKi2TazDtnR03eNuYLdIXlNKLQArMp9Ohc8vg8c+Ehb83oqvrWh7oXH4m4Styb/UvlLuPzzfk3HTLPQ2cCS95mtzoWOpZoGYoURmVUIMOc45Pkdzy1s8cTQwzcuIzPSasuKfeu6epDaAeCCyYYE1MWZ2I3bL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dCpvluAu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tstctesh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dCpvluAu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tstctesh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dCpvluAu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tstctesh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dCpvluAu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tstctesh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF07C5CAD0;
	Sun, 29 Dec 2024 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735461699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWIxLr22YEBIb7RgjF+vtB7+2HrFqsy6oJgDxlHCz1o=;
	b=dCpvluAuJnl89qohJqOWRmT/kkPuWE4/7uQTr1qd9G9uEkxcGLi3ptL0rFbgFyfzGHZk0R
	8jKjmn+QfBxRzZ4wrBjWq0Px8vFtVd6kPAOaI6a42OBjgQyJgOxNGc0BY3VFCrc3G8J7M5
	xpPYZVDwVNyeHNjMSaB5d9JsRY/W8I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735461699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWIxLr22YEBIb7RgjF+vtB7+2HrFqsy6oJgDxlHCz1o=;
	b=tstcteshjw5klC6WCXf0ktXKuQ+/2Mp76ElJuseTde7KJCBKEGy7H8tbsYWibGpbXBqbll
	3JPAvoAHpaUmFtDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735461699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWIxLr22YEBIb7RgjF+vtB7+2HrFqsy6oJgDxlHCz1o=;
	b=dCpvluAuJnl89qohJqOWRmT/kkPuWE4/7uQTr1qd9G9uEkxcGLi3ptL0rFbgFyfzGHZk0R
	8jKjmn+QfBxRzZ4wrBjWq0Px8vFtVd6kPAOaI6a42OBjgQyJgOxNGc0BY3VFCrc3G8J7M5
	xpPYZVDwVNyeHNjMSaB5d9JsRY/W8I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735461699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWIxLr22YEBIb7RgjF+vtB7+2HrFqsy6oJgDxlHCz1o=;
	b=tstcteshjw5klC6WCXf0ktXKuQ+/2Mp76ElJuseTde7KJCBKEGy7H8tbsYWibGpbXBqbll
	3JPAvoAHpaUmFtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F9B713A30;
	Sun, 29 Dec 2024 08:41:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GsxCIUMLcWcBRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 08:41:39 +0000
Date: Sun, 29 Dec 2024 09:41:39 +0100
Message-ID: <87ldvydgos.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: Add driver for big Scarlett 4th Gen interfaces
In-Reply-To: <cover.1735159288.git.g@b4.vu>
References: <cover.1735159288.git.g@b4.vu>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 25 Dec 2024 22:23:06 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> Merry Christmas!
> 
> This patch series introduces a new Focusrite Control Protocol (FCP)
> driver that provides equivalent functionality to the existing
> Scarlett2 driver, but splits the implementation between a minimal
> kernel driver and a user-space component. My initial user-space
> implementation supports the new Scarlett 4th Gen 16i16, 18i16, and
> 18i20 interfaces, but the new FCP kernel driver can be used with any
> device supported by the Scarlett2 driver (as an opt-in).
> 
> With these new interfaces, I started out by trying to extend the
> existing Scarlett2 driver but found that that wasn't practical. The
> control locations (struct scarlett2_config offset field) have
> previously varied between firmware versions (which is why I added the
> "Minimum Firmware Version" requirement for previous 4th Gen and
> Vocaster devices), and the situation was worse with the new 4th Gen
> devices, with every new firmware version moving the controls.
> 
> While the device provides a map indicating control locations,
> implementing the required JSON parsing in the kernel isn't feasible,
> necessitating a user-space implementation.
> 
> The new approach in the FCP driver significantly improves both
> maintainability and paves the way for future enhancements:
> 
> Firstly, the kernel component of the FCP driver is <10% the size of
> the Scarlett2 driver, with the obvious maintainability advantages;
> cloc reports:
> 
> File                            blank     comment        code
> sound/usb/mixer_scarlett2.c      1765         852        7152
> sound/usb/fcp.c                   174          64         645
> 
> Secondly, changes that aren't feasible to implement in the kernel due
> to backward compatibility constraints will be able to be implemented
> in user-space, with end-users easily able to choose an older version
> of the controls if needed. For example:
> 
> 1) The largest interface has >500 ALSA controls just for the matrix
> mixer (one control for each entry in the N×M matrix). This would be
> better done as N controls with M values each, especially since the
> device supports writing a row (all input gains for one mixer output)
> at a time.
> 
> 2) Similarly, the mux table entries have a control per entry, but
> they're all written at once, so it would be better to have a single
> ALSA control for the whole mux table.
> 
> 3) The interfaces have 3 independent mux tables (one per sample rate
> 48kHz, 96kHz, 192kHz), but supporting them isn't feasible in Scarlett2
> due to backward compatibility constraints.
> 
> 4) Users of the Scarlett2 driver frequently request higher-level
> controls like stereo-linking, pan, mute, and solo. These would be very
> challenging to implement in the kernel while maintaining backward
> compatibility to the existing controls, but again, it's easy to have
> configurable controls in user-space.
> 
> I did consider the alternative of a small user-space helper that just
> reads the map (this is the direction I was heading with my previous
> commit 9930c26 ALSA: scarlett2: Add support for device map retrieval)
> and uploads the offsets to the driver, but this would add even more
> complexity to the driver while gaining none of the possible benefits
> of a user-space implementation. Since user-space implementation is
> unavoidable, moving as much functionality there as possible provides
> the cleanest and most maintainable solution.
> 
> Hence, I present for your consideration the following patches:
> 
> 1) The new FCP driver implementation, handling only the essential
> kernel-space components (base protocol and level meter)
> 
> 2) An option enabling Scarlett2-supported devices to use the FCP
> driver, providing an opt-in migration path forward
> 
> The accompanying user-space implementation is available at:
> https://github.com/geoffreybennett/fcp-support

Thanks for the patches.  The argument about kcontrol sizes sounds
convincing to have a more flexible implementation with hwdep.
As far as the backward compatibility is kept, I find it's OK.

But, the implementations need more consideration.
I'll comment on each patch.


thanks,

Takashi
