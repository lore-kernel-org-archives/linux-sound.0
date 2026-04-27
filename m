Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1527230C368
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292452; cv=none; b=lvitY4wFytQOXYxkUChipsT52J46O6YpDN3bSAmIdfjanX9d0v41bUPSHDua8pj1LM6D41BEJd8WTCMMnEr0BNTzKuswdi6plil7UcfpbtJ4dqQKscRKcgUWlwdvMG55LBsdN+AVMnivUYtxmzBizAg6SkGYWuII5deQ0ps3IiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292452; c=relaxed/simple;
	bh=I+sSQrGnFg7uXM8WMzKok2xZaU8VuYoB5k974gbi17Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e85z2662HqCxGFRKmLUqUf6c02EeB9YeapPEcf3mf/r+YpU0a/n3RPMECSW5x0PUOYWByqi0fOH0gxT210aF8hb15cYJrMLWzTmrftDU7QBFBx+T9JiZbC8J8aWxKyhZp1ML3zu5Oqr95tlKa0DE1A6J6W5c4uI4YqHk5LIoL3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Js4+REhG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iAuvspl2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Js4+REhG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iAuvspl2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Js4+REhG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iAuvspl2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Js4+REhG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iAuvspl2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5C7296A824;
	Mon, 27 Apr 2026 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/pm6Dp1/1Kbfhrmb4B0Vz0Z+pChB/b593DGbioa7nY=;
	b=Js4+REhGvOn8J4iTt80WY2BjuDGFPf3E0jEQ42nElWI4BERd1jSy54uve0yC3pbELPPz/u
	F3xsjTTYdQovCrEb2SVnzopPi9tHe3Zj+BQ0MVXewqOr3GKDGnPOSQLVJ8o8e5eLnsdnt9
	JFIyXDzDR2wFJrllZ+AGA8WIeebEn64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/pm6Dp1/1Kbfhrmb4B0Vz0Z+pChB/b593DGbioa7nY=;
	b=iAuvspl2bhZcskXp/y8o/XsMSW4X6g8XupN35arTGGwmuimNPjcgTKLDuG9uumCiUOmiMf
	K67S1J6ZtAoEunAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/pm6Dp1/1Kbfhrmb4B0Vz0Z+pChB/b593DGbioa7nY=;
	b=Js4+REhGvOn8J4iTt80WY2BjuDGFPf3E0jEQ42nElWI4BERd1jSy54uve0yC3pbELPPz/u
	F3xsjTTYdQovCrEb2SVnzopPi9tHe3Zj+BQ0MVXewqOr3GKDGnPOSQLVJ8o8e5eLnsdnt9
	JFIyXDzDR2wFJrllZ+AGA8WIeebEn64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/pm6Dp1/1Kbfhrmb4B0Vz0Z+pChB/b593DGbioa7nY=;
	b=iAuvspl2bhZcskXp/y8o/XsMSW4X6g8XupN35arTGGwmuimNPjcgTKLDuG9uumCiUOmiMf
	K67S1J6ZtAoEunAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A3C8593B1;
	Mon, 27 Apr 2026 12:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /uljCKFU72lSEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:20:49 +0000
Date: Mon, 27 Apr 2026 14:20:48 +0200
Message-ID: <87cxzkzja7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor on firmware 2417
In-Reply-To: <ae0tEsi8dKm1akJd@m.b4.vu>
References: <ae0tEsi8dKm1akJd@m.b4.vu>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 25 Apr 2026 23:07:30 +0200,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
> gain parameters, breaking that control's functionality.
> 
> The driver already has per-device scarlett2_config_set tables
> describing each parameter's offset, but only one table per device, so
> there was no way to express "this offset changed at firmware version
> N". This series adds that capability and uses it to fix the 2i2 Gen 4.
> 
> Patches
> -------
> 
> 1/3: Replace the device info's single config_set pointer with a
> config_sets array of {from_firmware_version, config_set} entries, and
> resolve the running config_set at probe time once the firmware version
> has been read. Each device gets a single entry matching its previous
> min_firmware_version (or 0), so this is a no-op preparation step.
> 
> 2/3: Drop the now-redundant min_firmware_version field from
> scarlett2_device_info; config_sets[0].from_firmware_version carries
> the same meaning. No functional change.
> 
> 3/3: Add a second 2i2 Gen 4 config_set with DIRECT_MONITOR_GAIN at the
> new offset, gated on firmware >= 2417. All other offsets are
> unchanged.
> 
> Patch 1 is a prerequisite for patch 3. Patch 2 isn't a strict
> dependency, but it removes a now-redundant field, so patch 3's Cc:
> stable trailer names both 1 and 2 as prereqs by subject (please
> substitute SHAs at apply time). Patch 2 can be dropped from the stable
> backport if you'd prefer.
> 
> Tested
> ------
> 
> Verified on a Scarlett 2i2 4th Gen by writing to Monitor 1 Mix A Input
> 01 and observing with usbmon:
> 
> - Firmware 2128, patched driver:   write targets offset 0x2A0
> - Firmware 2417, patched driver:   write targets offset 0x2A4
> - Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
> 
> Regards,
> Geoffrey
> 
> Geoffrey D. Bennett (3):
>   ALSA: scarlett2: Allow selecting config_set by firmware version
>   ALSA: scarlett2: Fold min_firmware_version into config_sets
>   ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417

Applied all to for-next branch now.  Thanks.


Takashi
