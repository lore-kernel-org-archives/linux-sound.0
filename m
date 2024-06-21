Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05320173326
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718964391; cv=none; b=X7PmA6KihGqvlHrKR1Ro8mjuLZV4baVsjKUFsva/sGW6dTWwj+AFnOgSzZZHI2XM5LyAu0XLcafG9vXdITFGqHXCDvQBBl2dCWTvMow2i2cvlD4BBR5Yjzvk5oocU4yKsZrBspYEHr8WikyAGwLbwdRdPoctWqTDEWAnps0CSBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718964391; c=relaxed/simple;
	bh=K8Gjtz4p3mFVWTsmzsEF38e/9ayAdIUAOkfwSfibwH0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDxh1Hn6Pe6PF+Yxs1Hc+CCihQyAsBuuGcuiuNZiBfywu7B8ubTU74E4Pn2lf23lcIA24Ge+6JDulTs6Y/f1N8B8sjV+9KXWlw9o90Lr6AHs2dGcEkJ6qWD/Si+j/m33uswhs+rpl8CTQnLtFsM0nYRYvF+UK8YmtpKvJ7mRF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IjHZaRAj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8ajjSy9v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J3BEVE8d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7F3YKemg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IjHZaRAj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ajjSy9v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J3BEVE8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7F3YKemg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E87DB21A8B;
	Fri, 21 Jun 2024 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718964387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvLRUJUznkHQYloVb8GH2klTpFMlojrcMgPcX0dqE7s=;
	b=IjHZaRAjSm7iHGJXSoo9tunHMxgCWfN98LS6/mcHZqkuztw4K1b7g3sy9BxhEpneECkhjk
	0tEKoAZ+WOGWgs0FL8XXj+4n3/KPPHzeKQxjZuJSkB2B/vY08HNS6WD4PcxhOLsSqaPH/L
	lbjFC55aa6y/MCBC1mTRFT5tDJsue+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718964387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvLRUJUznkHQYloVb8GH2klTpFMlojrcMgPcX0dqE7s=;
	b=8ajjSy9vGqkNIok3wtllHMcp+su8Y8rJnRpQPIp8YMXszNLTmoj+Bakn7iIliSHfZQ93t6
	j/2PZYibICJG3pBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=J3BEVE8d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7F3YKemg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718964385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvLRUJUznkHQYloVb8GH2klTpFMlojrcMgPcX0dqE7s=;
	b=J3BEVE8dlMIqPauO5I76lHlJv8H1reEYQ7fW1kzyjX6sv0WDkx+rJvrEpof1k14s4dTyDb
	jKlpnhEAe87GGKieyZXSFPqHH0maCeNn31qybJE0nWvehR6cZwjAWcckovFOOa+7ZSBIPQ
	beyi7INR9YeMe3OK1rMehMVRh0Sk6HE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718964385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvLRUJUznkHQYloVb8GH2klTpFMlojrcMgPcX0dqE7s=;
	b=7F3YKemgUZQ6F+GV2pJKde1RKQr/lfa4eZRClLAJ+ygc8yls5DRoWiS+5RNdRZWYoprlE7
	GLdHaOmvxSwm9gBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FFC513ABD;
	Fri, 21 Jun 2024 10:06:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZInbJaFQdWY3TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Jun 2024 10:06:25 +0000
Date: Fri, 21 Jun 2024 12:06:51 +0200
Message-ID: <87a5jezk1w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<linux-sound@vger.kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: Use imply for suggesting CONFIG_SERIAL_MULTI_INSTANTIATE
In-Reply-To: <40b32545-ea8c-4120-a024-cb5da63a39ac@opensource.cirrus.com>
References: <20240621073915.19576-1-tiwai@suse.de>
	<40b32545-ea8c-4120-a024-cb5da63a39ac@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,cirrus.com:email,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E87DB21A8B
X-Spam-Flag: NO
X-Spam-Score: -5.51
X-Spam-Level: 

On Fri, 21 Jun 2024 11:13:46 +0200,
Richard Fitzgerald wrote:
> 
> On 21/06/2024 08:39, Takashi Iwai wrote:
> > The recent fix introduced a reverse selection of
> > CONFIG_SERIAL_MULTI_INSTANTIATE, but its condition isn't always met.
> > Use a weak reverse selection to suggest the config for avoiding such
> > inconsistencies, instead.
> > 
> > Fixes: 9b1effff19cd ("ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202406210732.ozgk8IMK-lkp@intel.com/
> > Closes: https://lore.kernel.org/oe-kbuild-all/202406211244.oLhoF3My-lkp@intel.com/
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >   sound/pci/hda/Kconfig | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> > index e59df40a0007..a3cf0725fc43 100644
> > --- a/sound/pci/hda/Kconfig
> > +++ b/sound/pci/hda/Kconfig
> > @@ -162,7 +162,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
> >   	depends on ACPI || COMPILE_TEST
> >   	depends on SND_SOC
> >   	select FW_CS_DSP
> > -	select SERIAL_MULTI_INSTANTIATE
> > +	imply SERIAL_MULTI_INSTANTIATE
> >   	select SND_HDA_GENERIC
> >   	select SND_SOC_CS35L56_SHARED
> >   	select SND_HDA_SCODEC_CS35L56
> > @@ -179,7 +179,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
> >   	depends on ACPI || COMPILE_TEST
> >   	depends on SND_SOC
> >   	select FW_CS_DSP
> > -	select SERIAL_MULTI_INSTANTIATE
> > +	imply SERIAL_MULTI_INSTANTIATE
> >   	select SND_HDA_GENERIC
> >   	select SND_SOC_CS35L56_SHARED
> >   	select SND_HDA_SCODEC_CS35L56
> Sorry about that. Thanks for fixing.
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> (Though I think this points at a bug in serial-multi-instantiate
> dependencies. When SPI support was added it was made mandatory
> to have both I2C AND SPI. But you shouldn't need to build in a
> subsystem if you don't have any devices of that type.)

Yeah, the condition there could be relaxed, I suppose.

But the use of imply isn't bad for a case like this, so let's go
forward with this fix.


thanks,

Takashi
