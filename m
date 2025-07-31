Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA1FBA2D
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 05:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753939995; cv=none; b=d9x0EJpIju9EYM6fpreuP8/MuzX0xS8iYCpCxQxXttQRD1aqrGI6pbc344j6pAPqzQLPliodha27l81A39kyJk7WnlHAmpR9MaX2KiqO7OyqwlN2MnoLzaUTqXePkEpSCo0bghlBrxWJR6k0UuzXg/Gp2CpfXO/E+SuS0X8tnrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753939995; c=relaxed/simple;
	bh=iLqBfARbxTSpa6GlsRJZUFscWrjEGnnqE8xlXSu4L/M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/EpNlWn8UylkROgJHXhxmxtK9fk92pgMaMCvgREwK4SfN/CiqcaIsI25BngHfzzL7Xcu6AKn9FNSS2Y43UXvTcgx87/antXHs3wnAsXfetiaumLYje/Fe6qCOS7rPMeNrP1G6nJLSJlnpxdzqkb/gTQjbz4JARu9xln4ohOR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XpQP5gC3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7MVZPIyq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XpQP5gC3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7MVZPIyq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XpQP5gC3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7MVZPIyq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XpQP5gC3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7MVZPIyq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F2AD3211FD;
	Thu, 31 Jul 2025 05:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753939992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I96Wd8EP09tXRfOsUWDKKBHfhZMxhtBKCQ2kUco8oPo=;
	b=XpQP5gC3NMP/WXH0+mHBgdXvbDzOVQH2mmldpUSp6wZP5IPS4RsAYpifB1K45bEC4dOYZA
	xM9U3Oab8aNXlGobV9LCURey6AbDqngiC1K4HbIgR+Mpf9SwTQ9aPao/Ci3biR8dOUji0q
	rYI0Qo8bnm7hKYF9KG1FQjWRT4Zqn9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753939992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I96Wd8EP09tXRfOsUWDKKBHfhZMxhtBKCQ2kUco8oPo=;
	b=7MVZPIyqfaqr9Xm9HtfYlLvBGnp8Sc3Wb3InPSPMMK3K23SPqjjjB/MbbzZ8TScpklMYSP
	OXDzfIgiI+ydlSAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XpQP5gC3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7MVZPIyq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753939992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I96Wd8EP09tXRfOsUWDKKBHfhZMxhtBKCQ2kUco8oPo=;
	b=XpQP5gC3NMP/WXH0+mHBgdXvbDzOVQH2mmldpUSp6wZP5IPS4RsAYpifB1K45bEC4dOYZA
	xM9U3Oab8aNXlGobV9LCURey6AbDqngiC1K4HbIgR+Mpf9SwTQ9aPao/Ci3biR8dOUji0q
	rYI0Qo8bnm7hKYF9KG1FQjWRT4Zqn9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753939992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I96Wd8EP09tXRfOsUWDKKBHfhZMxhtBKCQ2kUco8oPo=;
	b=7MVZPIyqfaqr9Xm9HtfYlLvBGnp8Sc3Wb3InPSPMMK3K23SPqjjjB/MbbzZ8TScpklMYSP
	OXDzfIgiI+ydlSAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6F391378C;
	Thu, 31 Jul 2025 05:33:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qLJ6JxcAi2g1TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 05:33:11 +0000
Date: Thu, 31 Jul 2025 07:33:11 +0200
Message-ID: <877bzoudpk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arthur Marsh <arthur.marsh@internode.on.net>
Cc: tiwai@suse.de,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com
Subject: Re: ALC887-VD line-in not visible
In-Reply-To: <20250731032059.4750-1-user@am64>
References: <20250709160434.1859-12-tiwai@suse.de>
	<20250731032059.4750-1-user@am64>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[internode.on.net];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[internode.on.net];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: F2AD3211FD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Thu, 31 Jul 2025 05:20:57 +0200,
Arthur Marsh wrote:
> 
> Earlier this year I could use line-in on an Asus PRIME B350M-A motherboard,
> with dmesg reporting:
> 
>  snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC887-VD: line_outs=1 (0x14/
> 0x0/0x0/0x0/0x0) type:line
>  snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
>  snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
>  snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
>  snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x11/0x0
>  snd_hda_codec_realtek hdaudioC0D0:    inputs:
>  snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
>  snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
>  snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
>  input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:08:00
> .6/sound/card0/input6
>  input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:08:0
> 0.6/sound/card0/input7
>  input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:08:00.6/s
> ound/card0/input8
>  input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:08:00
> .6/sound/card0/input9
>  input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/000
> 0:08:00.6/sound/card0/input10
> 
> After the post-6.16 updates, I now get:
> 
>  snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: line_o
> uts=1 (0x14/0x0/0x0/0x0/0x0) type:line
>  snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0
> /0x0/0x0)
>  snd_hda_codec_generic hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0
> /0x0)
>  snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
>  snd_hda_codec_generic hdaudioC0D0:    dig-out=0x11/0x0
>  snd_hda_codec_generic hdaudioC0D0:    inputs:
>  snd_hda_codec_generic hdaudioC0D0:      Rear Mic=0x18
>  snd_hda_codec_generic hdaudioC0D0:      Front Mic=0x19
>  snd_hda_codec_generic hdaudioC0D0:      Line=0x1a
>  input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:0
> 8.1/0000:08:00.6/sound/card0/input6
>  input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:
> 08.1/0000:08:00.6/sound/card0/input7
>  input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/
> 0000:08:00.6/sound/card0/input8
>  input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:0
> 8.1/0000:08:00.6/sound/card0/input9
>  input: HD-Audio Generic Front Headphone as /devices/pci0000:00/00
> 00:00:08.1/0000:08:00.6/sound/card0/input10

Are you using the latest Linus tree for 6.17-rc1?
If so, there were changes related with HD-audio Kconfigs, and I guess
you didn't enable the specific HD-audio codec driver you're using
(e.g. CONFIG_SND_HDA_CODEC_ALC882).

Also, HDMI codec needs the additional Kconfig,
e.g. CONFIG_SND_HDA_CODEC_HDMI_INTEL, too.

I queued some changes to pick up those as default in for-linus branch
of sound.git tree for avoiding such a pitfall now.


thanks,

Takashi
