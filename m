Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C702F6160
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763621561; cv=none; b=nUqxdnbBD0FaRiPcAZr8/40mMaKchJiA6xEqcwOav75BYJp9HCCDjtwAkTS0/zDUoi2mO26b+LWeWd8i2rGDBVjI8o/NeADXyGEZp96x/y6BsKv2jLT8BHFsS6KfXTT9htdejhT12y16IY3J+5NJfO1hxng4HT9qcQX9B+P3i8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763621561; c=relaxed/simple;
	bh=t5HXQubMSSGhQcOXJaft73zFBg0lUHRnr3k+co0WlbQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfCZKEiLfnO2rt6dt0RXog5X12DlxdeeMmmO4Fe9Jn/oG7/ImG/7OMzp3DO6HfAkYFSOZPLolpc1wEUlu4KiMxp7AEEemSitqxv2HbYGkunQ4HLe8b3v7ldg1DV3dxhLg4pmhsaOo/yfM06Z8ykbI6Z7w0iM3aoyZXxNlX5oz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=winB5yV5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OklWxgQq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YDDLCw2a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bd5tU2ZE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="winB5yV5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OklWxgQq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YDDLCw2a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bd5tU2ZE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA5DE208B6;
	Thu, 20 Nov 2025 06:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763621557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKbpuRu0xRhfRd97ZqcXnOJ1LmmkcbisvBBQ0FScKTc=;
	b=winB5yV5W65dym3/wXhAUKul58QhNJDTFsy3ma/EvUeRgq/e+gDn/7qJak+HVVEW2ALNiQ
	GQHwUOHFk0EZ6d1SH48l3o+t5egJUVfHOVHou53+7s1MyJvTk0v6fmQ0F4njLpZDU/XjgU
	qUKdgq9seHNrFZQlphiB2me0AlTlTsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763621557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKbpuRu0xRhfRd97ZqcXnOJ1LmmkcbisvBBQ0FScKTc=;
	b=OklWxgQql7k9jzlmJTx57wR0V+terWiPbZ1tvh1WQfU48K8CN/KwtYg7aiJurxBHVcZeY1
	jERJdigMzBrxNBCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763621556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKbpuRu0xRhfRd97ZqcXnOJ1LmmkcbisvBBQ0FScKTc=;
	b=YDDLCw2a+vIDSb+zga/gK87YIMNynsxgA7SWz/4vI0uv8X0VHvgpKgAZnwvZoUki+RUVlh
	2ocljlO+vdSO28gCfOKMT24CVnveZ2M2mJd2W4Du5TTBKBTHqlhrOhhvehG5Ut2FmOlUQj
	0GVFztdOPtJedqSePxng92QIBdr3Y2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763621556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKbpuRu0xRhfRd97ZqcXnOJ1LmmkcbisvBBQ0FScKTc=;
	b=bd5tU2ZEnwzChaHHcL+E1Q4VQ3evJaSJ6LQuChXVWycP4hzoyWLl9Gzg3RbgybScBAKkJT
	6JoPmm26Gdt3K/CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9DC03EA61;
	Thu, 20 Nov 2025 06:52:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zUXkK7S6HmlhCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Nov 2025 06:52:36 +0000
Date: Thu, 20 Nov 2025 07:52:36 +0100
Message-ID: <87wm3lb3gr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-sound@vger.kernel.org,
	kailang@realtek.com
Subject: Re: [PATCH] fixup realtek/alc288 headphone for MS Surface 2, 3 and
In-Reply-To: <3D155CBD-5517-480B-AB15-22DDAA5EF282@exactco.de>
References: <20251116.162633.1272923634893984527.rene@exactco.de>
	<87ikf8fx70.wl-tiwai@suse.de>
	<20251117.210734.507304067570791021.rene@exactco.de>
	<87a50icaxv.wl-tiwai@suse.de>
	<877bvmc9hx.wl-tiwai@suse.de>
	<3D155CBD-5517-480B-AB15-22DDAA5EF282@exactco.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 19 Nov 2025 18:17:14 +0100,
René Rebe wrote:
> 
> Hi,
> 
> > On 19. Nov 2025, at 16:44, Takashi Iwai <tiwai@suse.de> wrote:
> > 
> > On Wed, 19 Nov 2025 16:13:32 +0100,
> > Takashi Iwai wrote:
> >> 
> >> On Mon, 17 Nov 2025 21:07:34 +0100,
> >> René Rebe wrote:
> >>> 
> >>> On Mon, 17 Nov 2025 17:20:03 +0100, Takashi Iwai <tiwai@suse.de> wrote:
> >>> 
> >>>> On Sun, 16 Nov 2025 16:26:33 +0100,
> >>>> René Rebe wrote:
> >>>>> 
> >>>>> The Surface Pro 2 and 3 have a strage frequency response and miss most
> >>>>> of the bass. I discovered connecting the HP out to the main DAC fixes
> >>>>> this.  Maybe the other is mono or whatever strangely mixed signal for
> >>>>> the built-in speakers?
> >>>>> 
> >>>>> I later noticed the Lenovo Ideapad 720S (AMD) exhibited the same
> >>>>> problem, so this may be a more wide-spread general bug w/ Realtek
> >>>>> codecs and the hda_auto_parser, ...
> >>>> 
> >>>> Usually in a case like this, we provide a fixed wiring by a static DAC
> >>>> table, or do some other tricks instead of directly writing a verb.
> >>>> 
> >>>> Could you give the alsa-info.sh outputs from those?
> >>> 
> >>> Sure, here is an slightly older 6.16 kernel I had at hand that did had
> >>> my fixes applied:
> >> 
> >> Thanks.  Could you give the output from the unpatched kernel, too?
> >> Just to make sure.
> 
> 
> Sorry, typo, I already had booted an old kernel without the patch.
> 
> > ... and if the purpose is to just swap DAC assignments between the
> > headphone and the speaker pins, a patch like below could work better.
> > (The entry is 
> 
> Something missing? But no worries I will try it out and swap entries if
> needed and send a final patch.

Yes please.  I just wanted to say that the entry PCI SSID was copied
from your patch.


Takashi
