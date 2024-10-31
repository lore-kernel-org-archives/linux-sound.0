Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B7119341D
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366048; cv=none; b=qCCRjfcH58XduBpksbgDAaip3sUqIkUDVdxX1l7ISxEHz8NuMiDLPsivYywQFboE6Ya+zTHF9sp5YQNZbDJAWy7a4sdDbtmfStLyc/jd0IQioBaUX/MQZ9l01cRBXf8VP4njY2jqgfcQCIH08h+0gtvMRvUUsReNk0/5CjPf4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366048; c=relaxed/simple;
	bh=VymRJx8mT8fWCIfBuBNsKL9IF9/cZJ4pQwwvx4fXuLY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWcCqPDo7h6WMGbuFrsv4pD657s17c+oBIbEBQirYMTaMPs10nnQXKIDQqQbqVwM3l3KsjWrZPzma/ggCpWmYspQWQjqEOOV4wFFkJCk4v7TfZelxxCpsOAm31beobToCD6F4ZlV2m1LqicfSIphrbnKnCJ2ziyT9b2JJYv6UE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DkCDvFxE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7I/2tfJw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DkCDvFxE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7I/2tfJw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DkCDvFxE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7I/2tfJw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DkCDvFxE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7I/2tfJw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3743F21DC9;
	Thu, 31 Oct 2024 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730366044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHkafEhF/ARsQmvb7dyTahZtJ46TPYYyVQE66kDq6VQ=;
	b=DkCDvFxEGIFGkR/NI6lHPspEShio6DAp9pzIHVsIq3EJCvtbdYSr9/ddnaB1im4J8cYmx2
	tG0+/ex2UMq+rXXqbfbOZe6YCqvii/SrBWYQEuFcalcMcVgZKvbhMZlpW7H5pMEkkt6Muq
	MKGjxenXlcLUgSfVPFebGbYnhh3kJPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730366044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHkafEhF/ARsQmvb7dyTahZtJ46TPYYyVQE66kDq6VQ=;
	b=7I/2tfJwavdVup3LS9HLcldjqRHREL3OxARYPm9+imGUSCcepRFmKlyyj7w/NrjPZ0+SMA
	6FvDMo7iyUbP4KDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DkCDvFxE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="7I/2tfJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730366044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHkafEhF/ARsQmvb7dyTahZtJ46TPYYyVQE66kDq6VQ=;
	b=DkCDvFxEGIFGkR/NI6lHPspEShio6DAp9pzIHVsIq3EJCvtbdYSr9/ddnaB1im4J8cYmx2
	tG0+/ex2UMq+rXXqbfbOZe6YCqvii/SrBWYQEuFcalcMcVgZKvbhMZlpW7H5pMEkkt6Muq
	MKGjxenXlcLUgSfVPFebGbYnhh3kJPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730366044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHkafEhF/ARsQmvb7dyTahZtJ46TPYYyVQE66kDq6VQ=;
	b=7I/2tfJwavdVup3LS9HLcldjqRHREL3OxARYPm9+imGUSCcepRFmKlyyj7w/NrjPZ0+SMA
	6FvDMo7iyUbP4KDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19706136A5;
	Thu, 31 Oct 2024 09:14:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0s/iBFxKI2eJJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Oct 2024 09:14:04 +0000
Date: Thu, 31 Oct 2024 10:15:08 +0100
Message-ID: <87r07wws4j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3743F21DC9
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 30 Oct 2024 18:18:11 +0100,
Jaros³aw Janik wrote:
> 
> In Comment 17 of the following bug report:
> https://bugzilla.suse.com/show_bug.cgi?id=1228269
> user tigerlily had complained about "audible blip on shutdown" on a
> Thinkpad laptop, that led to a commit 4f61c8fe3520 ("ALSA: hda/conexant:
> Mute speakers at suspend / shutdown"), which mutes speakers on system
> shutdown or whenever HDA controller is suspended by PM. The
> aforementioned "blip" is a feature, not a bug however - Thinkpad's ACPI
> firmware uses short beeps / beep sequences as notifications in response
> to various events (enter/leave suspend or hibernation, AC power
> connect/disconnect, low battery, etc.); these can also be triggered by
> writing to /proc/acpi/ibm/beep, see details here:
> https://www.kernel.org/doc/html/v5.4/admin-guide/laptops/thinkpad-acpi.html#acpi-sounds-proc-acpi-ibm-beep
> The firmware doesn't touch any mixer, so depending on current mixer
> settings these beeps can be loud, silent or even muted completely,
> whatever has been set by the user.
> 
> The patch in question interferes this badly:
> - suspend/hibernate/shutdown related events are muted altogether because
>   HDA controller is in suspend mode when they occur (or snd_hda_intel
>   module has been closed in the event of system shutdown)
> - other events work "randomly", e.g. you can hear AC plug/unplug beep
>   if something is playing audio at the moment, otherwise the HDA
>   controller is likely in suspend mode, so you can't hear anything
>   (unless you disabled PM in snd_hda_intel module).
> 
> That said - let's revert this; this is what 1st commit does, the 2nd
> commit is somewhat optional - it removes helpers introduced to implement
> this muting, as they are no longer used.

As it's a regression, it's OK for the first revert, but the function
is useful for other purposes and other devices, so I'd like to keep
it.  I'm going to apply only the first patch.

> PS. Don't forget to have this backported to LTS kernels, please.

This should be taken usually automatically as long as Fixes tag points
to the right commit.

Per reading the patch description, though, the behavior appears to be
pretty unreliable, as it depends on the runtime suspend.  We may
control the runtime PM better if we know that the beep must be
submitted; or it's even possible to runtime resume/re-suspend upon
beeping, too.  But it's maybe too complex than needed.


thanks,

Takashi
