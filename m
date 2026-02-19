Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274F2DC352
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771499288; cv=none; b=pSV+NjOxX8N2HCHNSx9nbAZv4WPSHqQ4+PvcCl0GPmTmmmAIRoZki5hq8bxSULODG2K5M133TPBBdxqRCqS0TIKOGASg54f9J7D8t6zgvQvnxiIobpeA3dZCXKxeQsJ4qxyWalro3G4LT9M9+z5hyDuCvhBjlO/X80C0D7b3XAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771499288; c=relaxed/simple;
	bh=Q68gS/nH3/I/k3xKx+/DuG1zq5jf5Ki7VwxZINFN7FM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saoiVJ1fbva3Lrp6MS6eR/f5bdHWh8ahZnxHgs9Xx9JA4l1iZWjTKvflfddX8I3ic+0nxSXpANyR9it0SkU763pvv4aHLIafF9yMClcuuFAOQToJ4atEkGfYrIks7OOuPH9vcHVYr871LN6kDszM7It12Sfc/uLU34og/PP/1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QkD/MTa+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dRTIP7cx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QkD/MTa+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dRTIP7cx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QkD/MTa+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dRTIP7cx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QkD/MTa+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dRTIP7cx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B5F53E6F3;
	Thu, 19 Feb 2026 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771499284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=maTQZnWTSRxJ56k0jycEiQstTIJ6/4fKqeMg5h6ypUo=;
	b=QkD/MTa+21lK/svDBme32RyS92A7KfuHgatd8ez2uMpgClMcLTcPzAAiwMWPs34GxXmqW8
	/GJ9sVHP3bDQ1bCtm0Wo7zhcsdWw+iM2H/MxErrD/GamdUVMQgFOApHwesf3t7XwI2P/Kq
	vmS+6r0nZ4/uHB70cFUP5DQ+sKCLMMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771499284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=maTQZnWTSRxJ56k0jycEiQstTIJ6/4fKqeMg5h6ypUo=;
	b=dRTIP7cxrDWkPjmiKdwaOVrbxnDA7En+EmO5JfV8WFsFkLWOsaV7vpVRizuWlJqWblUENc
	SJknN+9V0PeL61BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="QkD/MTa+";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dRTIP7cx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771499284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=maTQZnWTSRxJ56k0jycEiQstTIJ6/4fKqeMg5h6ypUo=;
	b=QkD/MTa+21lK/svDBme32RyS92A7KfuHgatd8ez2uMpgClMcLTcPzAAiwMWPs34GxXmqW8
	/GJ9sVHP3bDQ1bCtm0Wo7zhcsdWw+iM2H/MxErrD/GamdUVMQgFOApHwesf3t7XwI2P/Kq
	vmS+6r0nZ4/uHB70cFUP5DQ+sKCLMMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771499284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=maTQZnWTSRxJ56k0jycEiQstTIJ6/4fKqeMg5h6ypUo=;
	b=dRTIP7cxrDWkPjmiKdwaOVrbxnDA7En+EmO5JfV8WFsFkLWOsaV7vpVRizuWlJqWblUENc
	SJknN+9V0PeL61BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE6FD3EA65;
	Thu, 19 Feb 2026 11:08:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5Hs9OBPvlmkPGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Feb 2026 11:08:03 +0000
Date: Thu, 19 Feb 2026 12:08:03 +0100
Message-ID: <87o6llq9d8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
In-Reply-To: <CABtds-0DS24GY7e_ST9uRLYoVNvJRwNE7XLz2tLFqibe9SFifA@mail.gmail.com>
References: <CABtds-0DS24GY7e_ST9uRLYoVNvJRwNE7XLz2tLFqibe9SFifA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4B5F53E6F3

On Wed, 18 Feb 2026 21:37:16 +0100,
Sean Rhodes wrote:
> 
> On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
> emit an audible pop when entering or leaving runtime suspend.
> 
> Mute the speaker output paths via snd_hda_gen_shutup_speakers() in the
> Realtek shutup callback before the codec is powered down.
> 
> This is enough to avoid the pop without special EAPD handling.
> 
> Test results:
> - runtime PM pop fixed
> - still reaches D3 (PCI 0000:00:1f.3 power_state=D3hot)
> - does not address pops on cold boot (G3 exit) or around display manager
>   start/shutdown
> 
> journalctl -k (boot):
> - snd_hda_codec_alc269 hdaudioC0D0: ALC233: picked fixup for PCI SSID
>   7017:2014
> - snd_hda_codec_alc269 hdaudioC0D0: autoconfig for ALC233: line_outs=1
>   (0x1b/0x0/0x0/0x0/0x0) type:speaker
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Kailang Yang <kailang@realtek.com>
> Cc: Chris Chiu <chris.chiu@canonical.com>
> Cc: Edip Hazuri <edip@medip.dev>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Tested-by: Sean Rhodes <sean@starlabs.systems>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

This still failed to apply, unfortunately.  The line is folded
unexpectedly.

Please test posting a patch locally at first (post to yourself and
check whether you can apply it via git-am).  Once after it's working,
try to submit to the upstream ML.

If it's too hard to achieve by some reason, just let me know.  We can
use attachments as a last resort, too.


thanks,

Takashi
