Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4417D401
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715279307; cv=none; b=odNjExkusPwBub0TBpIYaXh90YDV7baZStW/tpxPe9VmPEjnEDq/pfmHd+eypREDn946+DshJlIYCb9XVfqCDIXIg31ZgF+AFz7RTEsKwGIp6lYlIyrFUMNJRkhOcn4PQ8UtmcUB0K6cX8sd7OqJxoHkcsCNHfHUCZyto8bdm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715279307; c=relaxed/simple;
	bh=jIQ6maw1siwcAKIAVoT7tUYMciD3mcFYgrMogy3aHQc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MuP5RYIviSxvt/301S+aCx0gaHjeLwYZk7nGiY4oh1QagwssIXMsVwSwxo/mUML8zLJAj6jKiqWXJdsLwrgHDQIE/k1zVbZgXidWfvxCgsLynkSfutH4GqO4Fwl9GeoUMBvq+9/NbSzVBtqw6nhe8EPwdM2LUjj60YnDW+gThrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k8LSG0hY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gB22M/8r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k8LSG0hY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gB22M/8r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k8LSG0hY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gB22M/8r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k8LSG0hY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gB22M/8r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 14AE738B2A;
	Thu,  9 May 2024 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715279298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzuP0u0i5vbLGm/2VG8/MjATB6NQLCS7dPvkndn8/KA=;
	b=k8LSG0hYWp+ZnPUFR5Vu+46JtgymWXOTl2ssQyHZ1sJqveDOhImiMcjpJW6Cn0DlBZEn1X
	FTe90Mjkxy6aS96P48xJykZ+FUgP9RhRUlvopZegHVs8Rz3gJAa/okt5DtmYtkjxUpOB64
	32j0cu4M3T8qYGkOT2R4MIndfUfJSH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279298;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzuP0u0i5vbLGm/2VG8/MjATB6NQLCS7dPvkndn8/KA=;
	b=gB22M/8rGgipt2aujZjqQdoH+eaCFBbBVrsOx5ZVZ9eZYdeRa7S/z0LwkvmX9JVif3PRHD
	dsQoNguVUjzkfMAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715279298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzuP0u0i5vbLGm/2VG8/MjATB6NQLCS7dPvkndn8/KA=;
	b=k8LSG0hYWp+ZnPUFR5Vu+46JtgymWXOTl2ssQyHZ1sJqveDOhImiMcjpJW6Cn0DlBZEn1X
	FTe90Mjkxy6aS96P48xJykZ+FUgP9RhRUlvopZegHVs8Rz3gJAa/okt5DtmYtkjxUpOB64
	32j0cu4M3T8qYGkOT2R4MIndfUfJSH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279298;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzuP0u0i5vbLGm/2VG8/MjATB6NQLCS7dPvkndn8/KA=;
	b=gB22M/8rGgipt2aujZjqQdoH+eaCFBbBVrsOx5ZVZ9eZYdeRa7S/z0LwkvmX9JVif3PRHD
	dsQoNguVUjzkfMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C229113941;
	Thu,  9 May 2024 18:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dVgILsEVPWahRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 18:28:17 +0000
Date: Thu, 09 May 2024 20:28:32 +0200
Message-ID: <87o79ealgv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
In-Reply-To: <dbee6345-1513-4b55-8f8f-d579d577a6d6@linux.intel.com>
References: <20240507135513.14919-1-tiwai@suse.de>
	<ZjpQm-hxLQtpgkUx@smile.fi.intel.com>
	<ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
	<87ikzod6bt.wl-tiwai@suse.de>
	<dbee6345-1513-4b55-8f8f-d579d577a6d6@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.intel.com,vger.kernel.org,gmail.com,nxp.com,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 09 May 2024 18:10:39 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 5/8/24 04:02, Takashi Iwai wrote:
> > On Tue, 07 May 2024 22:53:46 +0200,
> > Andy Shevchenko wrote:
> >>
> >> On Tue, May 07, 2024 at 07:02:35PM +0300, Andy Shevchenko wrote:
> >>> On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:
> >>>> Hi,
> >>>>
> >>>> this is a series of trivial cleanup patches for Makefile in sound/*
> >>>> (modulo ASoC -- which will be submitted later in a separate series).
> >>>>
> >>>> As Andy suggested in a patch review, *-objs suffix in Makefile is
> >>>> basically a mis-use nowadays for kernel driver modules.  They should
> >>>> be replaced with *-y suffix instead.  This is a result of systematic
> >>>> conversions, separated per directory.
> >>>
> >>> I briefly looked at this and since it's a mechanical conversion I don't see
> >>> any issues, so
> >>>
> >>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>
> >> Btw, make W=1 nowadays enables modpost checks, which complain about absence of
> >> MODULE_DESCRIPTION().
> >>
> >> Example:
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
> >>
> >> I'm not sure what the case now for ALSA, just FYI.
> > 
> > Indeed there are lots of code that miss MODULE_DESCRIPTION().
> ...
> > There are too many stuff in sound/soc/sof/* and I leave them to SOF
> > people (Cc'ed), while I'm going to submit the fix patches for the
> > rest.
> 
> ok, I'll take care of it. I wasn't aware this was a requirement.

It wasn't, but now became so :)


Takashi
