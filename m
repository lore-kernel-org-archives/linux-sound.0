Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7D4A7C80
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595239; cv=none; b=SbGs8zdZQSKidTRx8q8aBLueAakei9L2NkzxJUFqreYi9PNbadyN/1snnPoWvKNVGnBFIp9fyYsU7CTP1h52XCUC2wM2YdwQ33Cq0N/tip/SQqSHZpTsnwv00xxQBtYTD1G0p7AzzwrZZlmRhLUkb5116t+Y7+HNU4dy3iqTmow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595239; c=relaxed/simple;
	bh=6BdLpYdM19Do7inftwrez+WLsmKZhI5k4/WePvjkTI8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0gWUyaO2SUH7C9k5SXDvRiAImymlIDblVuA6uLb2VJeGaoefESvZR3aBM3K0Z0QBGmg5MqqszpyLvXs1/n/R88fbaMofiTbdw6L98QoCZyxk7m8G21luXKNkI01DDcHoXqCrkW02rdwCGqRe30uDFPcH5rEpSEWlqAwTwUAtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fnTF3jYU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ess0tVgH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eHCqSWT/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TbFdWD2x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fnTF3jYU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ess0tVgH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eHCqSWT/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TbFdWD2x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E97631F79F;
	Mon, 28 Sep 2026 11:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ft6L3or5lxvkYR0fuT0uClFtROlg3J7y92tz1MO2nvk=;
	b=fnTF3jYUUacsQMX85EMZoG11rocEFz28fcoDThmMIjup3eSwJFRPFU3x3BrBxhemKZKqMm
	ObgVp+vBmckiZk2z3Esg5ExIrQYxym12LQGsLN+vvoATF2WVSek8Z44zz5e+2eN4uPTVIo
	kC6XyFGZsFJeSFPOU7tAXrvC8d4D8TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ft6L3or5lxvkYR0fuT0uClFtROlg3J7y92tz1MO2nvk=;
	b=ess0tVgHvSkqzR74jyQu7+CfsAO650wYycQOncSOgWqBB+CklZIY9kyb4e+xqHovSzufh8
	7yzC4ui6XBLwCcBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="eHCqSWT/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TbFdWD2x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ft6L3or5lxvkYR0fuT0uClFtROlg3J7y92tz1MO2nvk=;
	b=eHCqSWT/FPA+1+FDkpNQ/LuH46FmPsgAvV9gtuQt8KL2hdkz2Amz+nMGS4XzflYeRQChtT
	MyFd5L/kHtwuHiRbeIGXp5yGI17mPa5az14GxMRCCRn76tvfsRn0NQEC4/o9VaUSMclHjm
	JSWTBJMhRr99S5+ugpYKpTxY35JxXWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ft6L3or5lxvkYR0fuT0uClFtROlg3J7y92tz1MO2nvk=;
	b=TbFdWD2x5sp5genrM9lFO0+O3NvfefxuKyH8deeDN9PC2McoENJHxVvOO18RGEde3J+7Jh
	tb+5Fcx9xy23MLCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8807C133F3;
	Mon, 28 Sep 2026 11:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N5pQF5tQumr8QgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:33:47 +0000
Date: Mon, 28 Sep 2026 13:33:46 +0200
Message-ID: <871pad7gpx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hernan Ganzo <gp@sneemgp.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Limit internal mic boost on HP Pavilion 15 (103c:2164)
In-Reply-To: <20260921205538.41192-1-gp@sneemgp.com>
References: <20260921205538.41192-1-gp@sneemgp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E97631F79F
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 21 Sep 2026 22:55:38 +0200,
Hernan Ganzo wrote:
> 
> The HP Pavilion 15 with the ALC3227 codec (SSID 103c:2164) exposes the full
> four-step internal mic boost on pin 0x12: nsteps=3 with stepsize=0x2f, that is
> 0, 12, 24 and 36 dB. Combined with the ADC capture gain of +30 dB the analogue
> cascade reaches 66 dB, and the internal microphone clips on the ambient noise of
> a quiet room; the upper two steps are unusable at any useful input level. This
> is the defect class ALC269_FIXUP_LIMIT_INT_MIC_BOOST exists for.
> 
> The machine matches no SSID quirk and falls through to the pin table, which
> selects ALC269_FIXUP_HP_MUTE_LED_MIC1 through a pin signature shared with
> several other HP models. Add an SSID entry instead, using
> ALC269_FIXUP_LIMIT_INT_MIC_BOOST_MUTE_LED: the existing fixup that applies
> alc269_fixup_limit_int_mic_boost() and chains to the same mute LED fixup, as
> already done for 103c:218b. The boost becomes 0 or 12 dB and the LED handling is
> unchanged.
> 
> Tested on the affected machine by selecting the same fixup through the model
> string (snd-hda-intel.model), which bypasses the SSID and pin tables, with the
> driver confirming the selection:
> 
>   snd_hda_codec_alc269 hdaudioC1D0: ALC3227: picked fixup limit-mic-boost (model specified)
> 
> With that, Internal Mic Boost reports Limits 0 - 1 (0 or 12 dB) instead of 0 - 3
> (0 to 36 dB), so alc269_fixup_limit_int_mic_boost() clamps this codec's internal
> mic pin as intended. Note that /proc/asound/card1/codec#0 keeps printing the
> unclamped hardware caps (nsteps=0x03): that file reads codec parameters uncached
> by design, while the fixup overrides the driver's cached parameter that the
> control is built from.
> 
> This does not by itself make the default capture volume sane -- the remaining
> 12 dB on top of the +30 dB ADC gain is still hotter than this machine's usable
> operating point. It removes the two unusable steps from the hardware range, which
> is what a quirk of this class can do.
> 
> Signed-off-by: Hernan Ganzo <gp@sneemgp.com>

Applied now.  Thanks.


Takashi
