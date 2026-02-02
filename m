Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB051126BF1
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026611; cv=none; b=YY83fSNBJ//UbIMA2c48HxevmywYiAp8aFTZvSmOL4h3gMvFVrgv3pMMJjQuWRKHYXMGsE2A/UbDDVQnrNnGfGEoVuf9pvFxOq5Ed1pslHMRfGg/gzCzFEBzFQugjpViFvTuWahQok6ACO5c+5LnM+p3bCqxdZbOveATpJuEAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026611; c=relaxed/simple;
	bh=5OagL9S999NFdwTmdiHF+tcWyFfEbOFqt7k08FcaxnA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGaGLeSd0ryhCS9URQi9D3gRWeEofUyIdVC67dNpYZd3eqH7gjl+M0RrwB3RncQDXZo3XhlzrJVVK0ZMZfsKleNDO+tCa3LNJcFKyteXhE5bWVq/u60hSa8M7MB4YkxocUjJi89YW4mmaR7HwPaIRz8syqvPdI1/0VYjq/+2sAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=izgK728k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gWTQvdtc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=izgK728k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gWTQvdtc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="izgK728k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gWTQvdtc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="izgK728k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gWTQvdtc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 102CC3E6FA;
	Mon,  2 Feb 2026 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770026608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eG6zWB3VjXFrbqBgYWhUnR42f6pKsrOi6MXnOwHIoVs=;
	b=izgK728kiqL6Y2BRq3fbAkBYCQcC01JDlxf9SKMmA4e26S//PXRxWy8vdcMJwrk0tVKbKI
	PyET5GRXGkTFZC6oo9lhBds80N68rKckRnDpU799i1x1Kw1lMkz8eKscgsvFUXXpDM5k67
	iF1wPyE3dq/J7+gU7QO8QuGJYtRXaHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770026608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eG6zWB3VjXFrbqBgYWhUnR42f6pKsrOi6MXnOwHIoVs=;
	b=gWTQvdtcioR268HoIU9H2DflA6FwdwjxlkN9U21vEn8TfmLOl7OWpzpeYvPRiWfRFF6WKU
	QBmqqBRUKwZbYcBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=izgK728k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gWTQvdtc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770026608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eG6zWB3VjXFrbqBgYWhUnR42f6pKsrOi6MXnOwHIoVs=;
	b=izgK728kiqL6Y2BRq3fbAkBYCQcC01JDlxf9SKMmA4e26S//PXRxWy8vdcMJwrk0tVKbKI
	PyET5GRXGkTFZC6oo9lhBds80N68rKckRnDpU799i1x1Kw1lMkz8eKscgsvFUXXpDM5k67
	iF1wPyE3dq/J7+gU7QO8QuGJYtRXaHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770026608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eG6zWB3VjXFrbqBgYWhUnR42f6pKsrOi6MXnOwHIoVs=;
	b=gWTQvdtcioR268HoIU9H2DflA6FwdwjxlkN9U21vEn8TfmLOl7OWpzpeYvPRiWfRFF6WKU
	QBmqqBRUKwZbYcBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEE9C3EA62;
	Mon,  2 Feb 2026 10:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3oM7MW92gGlBZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Feb 2026 10:03:27 +0000
Date: Mon, 02 Feb 2026 11:03:27 +0100
Message-ID: <87ms1r1mz4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samuel Dionne-Riel <samuel@dionne-riel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add generic quirk for Bass speaker DAC avoidance
In-Reply-To: <20260201231216.1655154-2-samuel@dionne-riel.com>
References: <20260201231216.1655154-1-samuel@dionne-riel.com>
	<20260201231216.1655154-2-samuel@dionne-riel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,dionne-riel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 102CC3E6FA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 02 Feb 2026 00:12:14 +0100,
Samuel Dionne-Riel wrote:
> 
> This change is for the follow-up commit, where the match on the specific
> device (Minisforum V3 SE) is added.
> 
> This pattern (re-routing the bass speakers off of a DAC without volume
> control) seems common enough that having a "model" to match against and
> quickly use to verify may be worthwhile.
> 
> The alc285_fixup_thinkpad_x1_gen7 routing was selected, amongst the
> different options, as it should allow tuning the ratio between both
> speaker set.
> 
> The routing was verified using `hda-verb`, and picking either 0x00 or
> 0x01. Either routin made the volume of the bass speakers controllable.
> 
>     hda-verb /dev/snd/hwC1D0 0x17 SET_CONNECT_SEL 0x01
> 
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> 
> ---
> 
> It may be worthwhile to clean-up behind and make the other fixups
> re-routing `0x17` from `0x06` to either `0x02` or `0x03` also use the
> same routing. It's a bit confusing, determining which routing to choose
> when adding one for a device.
> 
>  - alc289_fixup_asus_ga401
>  - alc295_fixup_disable_dac3
> 
> Might need to be checked (and re-used within a chain):
> 
>  - alc287_fixup_yoga9_14iap7_bass_spk_pin
>  - alc245_fixup_hp_spectre_x360_eu0xxx
>  - alc245_fixup_hp_spectre_x360_16_aa0xxx
> 
> I might be missing some, if for example they are handled through pin
> fixups, or other fixup mechanisms.
> 
> I don't have the experience needed to know for sure if the cleanup would
> be appropriate. So please excuse the lack of follow-up on that.
> 
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

Indeed it looks like that we can cleanup a lot regarding this DAC
routing fix-ups.  Though, *_thinkpad_x1_gen7() has more workarounds
about the control element renames -- which needs to be verified
whether the very same workaround is applicable to other cases.

IIUC, this kcontrol names (DAC1/DAC2) match with your device
configuration?  Could you give alsa-info.sh output?

In anyway, I don't think it's needed to split to two individual
commits.  You can fold into one patch.


thanks,

Takashi
