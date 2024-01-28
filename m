Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766F2208D5
	for <linux-sound@vger.kernel.org>; Sun, 28 Jan 2024 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706443807; cv=none; b=CXoEa5IPlCcWweVrRpAbPblyfODUxTVdnHDEwgJ38kXQgMCt+exGOB5Pd8nyNg+AOjmuDjc/CUbibyckKPIAlCWNXs1VkdZuDNH/dnvnHPkkivfdd5ftd8sCfpFYCVd2LG9/l6hOEL1k5yOZRHXko/9AH6fg2VrIgrUKr7nLcU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706443807; c=relaxed/simple;
	bh=D0uL3lH0FVrQXu93KAKOmdSWdLEBHIK4IfRiqatNGn8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GOMKElWDkpGJeQfGYbSuTKGJJsBB/YhjGA+0BhcW2vHvHRspArYaPxpiMtqFIGXy4tgtz5masZSTWljG+++IohNQPR+OwjNxA+OL5/bWClcoup9Zm2Qr8CTr/o2WrNydOrErVxs+/0ibb/38rlmRi1Vg/9MWlASZsi39G+MK7nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EJ+7YIgF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fmf6Flud; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EJ+7YIgF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fmf6Flud; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EJ+7YIgF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fmf6Flud";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EJ+7YIgF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fmf6Flud"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25ABF1F785;
	Sun, 28 Jan 2024 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706443798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=EJ+7YIgFF2mlm0Jcwv5iGiRyAFkvjjqHGP48wbx00rwOdD/98RD3RRhHEeUtI/TXpVeRe3
	H9ikwmXMVC+y2UbYTW4vsP4HVq5cRfkihowWkZ6mJS4Sw69EDDWEOPvMexNEtbCWSXUcrH
	9d9lBlPu6V7D42pWBpSFC52/Pxdu4vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706443798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=Fmf6FludLUw2YGaCcFNUmjxLmJ9xV6JHpvAKl1vCY4lYTjhYUhm1k6Q9xYvFXxnTtL9+cV
	Zz2reP0XTs0cnECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706443798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=EJ+7YIgFF2mlm0Jcwv5iGiRyAFkvjjqHGP48wbx00rwOdD/98RD3RRhHEeUtI/TXpVeRe3
	H9ikwmXMVC+y2UbYTW4vsP4HVq5cRfkihowWkZ6mJS4Sw69EDDWEOPvMexNEtbCWSXUcrH
	9d9lBlPu6V7D42pWBpSFC52/Pxdu4vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706443798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9R1exAl60BblNjDcdNrpospLKobUXh6fuNHr7QGsvE=;
	b=Fmf6FludLUw2YGaCcFNUmjxLmJ9xV6JHpvAKl1vCY4lYTjhYUhm1k6Q9xYvFXxnTtL9+cV
	Zz2reP0XTs0cnECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB4CB12FF7;
	Sun, 28 Jan 2024 12:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MOGYNxVEtmXwCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Jan 2024 12:09:57 +0000
Date: Sun, 28 Jan 2024 13:09:57 +0100
Message-ID: <8734uhoe0a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Jaroslav
 Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Skip setting clock selector for single connections
In-Reply-To: <3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
References: <20240123134635.54026-1-alexander@tsoy.me>
	<87mssw6sry.wl-tiwai@suse.de>
	<3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EJ+7YIgF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fmf6Flud
X-Spamd-Result: default: False [-2.02 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.71)[98.73%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 25ABF1F785
X-Spam-Level: 
X-Spam-Score: -2.02
X-Spam-Flag: NO

On Sun, 28 Jan 2024 11:35:51 +0100,
Alexander Tsoy wrote:
> 
> ÷ ÷Ô, 23/01/2024 × 15:14 +0100, Takashi Iwai ÐÉÛÅÔ:
> > > On Tue, 23 Jan 2024 14:46:35 +0100,
> > > Alexander Tsoy wrote:
> > > > > 
> > > > > Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the clock
> > > > > selector
> > > > > inquiry for single connections") we are already skipping clock
> > > > > selector
> > > > > inquiry if only one clock source is connected, but we are still
> > > > > sending
> > > > > a set request. Lets skip that too.
> > > > > 
> > > > > This should fix errors when setting a sample rate on devices
> > > > > that
> > > > > don't
> > > > > have any controls present within the clock selector. An example
> > > > > of
> > > > > such
> > > > > device is the new revision of MOTU M Series (07fd:000b):
> > > > > 
> > > > > ššššš AudioControl Interface Descriptor:
> > > > > ššššššš bLengthšššššššššššššššš 8
> > > > > ššššššš bDescriptorTypeššššššš 36
> > > > > ššššššš bDescriptorSubtypešššš 11 (CLOCK_SELECTOR)
> > > > > ššššššš bClockIDššššššššššššššš 1
> > > > > ššššššš bNrInPinsšššššššššššššš 1
> > > > > ššššššš baCSourceID(0)ššššššššš 2
> > > > > ššššššš bmControlsšššššššššš 0x00
> > > > > ššššššš iClockSelectorššššššššš 0
> > > > > 
> > > > > Perhaps we also should check if clock selectors are readable
> > > > > and
> > > > > writeable
> > > > > like we already do for clock sources, but this is out of scope
> > > > > of
> > > > > this
> > > > > patch.
> > > > > 
> > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=217601
> > > > > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > > 
> > > Thanks, applied.
> 
> It looks like this patch will bring back problems with Behringer mixers
> [1]. So we probably should revert. The mentioned case with MOTU M
> Series should be also covered by "Support read-only clock selector
> control" commit.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=199327

OK, care to submit a patch to revert it?


thanks,

Takashi
