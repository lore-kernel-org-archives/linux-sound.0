Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B2B45C6F1
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842638; cv=none; b=gkY2CSAfJ6StE3gMYgiHTR/j2vmZc2tljGr5tqvZULZakuWeJpGAamODooXj0oztXLeYfqF/L1KdnrwGq52B4m1Iz6FYViPpVTYy6PjZd1vHt8/8COfTUkUaNEiOFMR3XAm8vN2x3pZv7+4gUcxU8fEVTStUXlz1+4CdMMjzf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842638; c=relaxed/simple;
	bh=xZkU3ot5oww99g7PWk6A05wShfd5Ro6Udb2WCYd+z9M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aottkmwBMQvcSk7Uej6jbA3Zv8RTtmwR6JC9uh4qKepNW8YHrEccjoc1ridmE+JA7Vakqtar4t64JFbZNpcy0PCWkAftLp+Axd/ODSczi9k/mX2Qt3bI72pEhdT60K6PDYahdYHX6qd8a/Heq+4C/2WuMdredji6oR0pajpml3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QEOdkw8i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gIQp9WZS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0oJwBUFi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IGinkNCa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QEOdkw8i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gIQp9WZS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0oJwBUFi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGinkNCa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 261AE402A;
	Tue,  4 Aug 2026 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785842630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEsycDSyI6G9amIlyt1JO8FMQOQl6v7PeFzetpaSCc8=;
	b=QEOdkw8ieVwR5A0ybDSeZ7d3kUpB/J0uhKln4lTfahzqX373HFzYzw9QhThknGRMhS23AV
	1CuWTBRoWWmhYmMdYheI9Jiv1Q8fnVUsZtMV77rsx/VkKZy449Qph0OiLNcwWm+xdmBNG/
	780O+uvS2UYwqEXboZQdo1lLaoSBNxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785842630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEsycDSyI6G9amIlyt1JO8FMQOQl6v7PeFzetpaSCc8=;
	b=gIQp9WZS/2XuO0fPi7mRDGx55uC37oiycxDY1hz39dhOt/+z3twgMlHqmgWNhwPXtDBJYp
	cXTVxJ5QVUJmGiCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785842626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEsycDSyI6G9amIlyt1JO8FMQOQl6v7PeFzetpaSCc8=;
	b=0oJwBUFime37qpjjWkBUMB8FJ3WyDB9FTmR0LEV3axoO/q+BPW/dGZ+4tzxbLMVAFFOftj
	1hSwKil7X4TYMeCRpZfwV6yMjYU4QU1FmpWiLKRv8EkY6B1LEf6Q9RNnf9pQfoMZIpW720
	TWx1j1FnvmPgLd2DT7ipWtDgUdKZJcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785842626;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEsycDSyI6G9amIlyt1JO8FMQOQl6v7PeFzetpaSCc8=;
	b=IGinkNCaU0kqZ9KCjmAtTk75C9HtyDtIrIHkwCYA8x8QwdG57z9sHJ5aYUdtG6xpDh0UjF
	IT6T4ZcGakGhwUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEA56779BB;
	Tue,  4 Aug 2026 11:23:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EoU0McHLcWp8CgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 04 Aug 2026 11:23:45 +0000
Date: Tue, 04 Aug 2026 13:23:45 +0200
Message-ID: <87se4ui0xq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pengyu Ma <mapengyu@gmail.com>
Cc: Marco Giunta <marco_giunta@outlook.it>,
	damien.dagorn29@gmail.com,
	kailang@realtek.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	songxiebing@kylinos.cn,
	tiwai@suse.com,
	zhangheng@kylinos.cn
Subject: Re: [PATCH 1/3] ALSA: hda/realtek: Use AW88399 I2C fixup chain on Legion machines
In-Reply-To: <CALSz7m2msK78ffGQAW0gyFKLFsh8JWTtoFEgZ-U4V9OPmL2sSQ@mail.gmail.com>
References: <CALSz7m1PvKUrYvdXfQdA01gfZPh=1eW+1n6HTkxzmk4azn6CHQ@mail.gmail.com>
	<IA1PR19MB7712F02961FF50333D5055B5FCD72@IA1PR19MB7712.namprd19.prod.outlook.com>
	<CALSz7m2msK78ffGQAW0gyFKLFsh8JWTtoFEgZ-U4V9OPmL2sSQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[outlook.it,gmail.com,realtek.com,vger.kernel.org,perex.cz,kylinos.cn,suse.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 03 Aug 2026 11:27:48 +0200,
Pengyu Ma wrote:
> 
> On Sun, Aug 2, 2026 at 2:34 AM Marco Giunta <marco_giunta@outlook.it> wrote:
> >
> > Hi Aaron,
> >
> > With the added context from your reply, I did some more testing of
> > your patches on my Pro 7 16AFR10H and I can confirm issues 2-4:
> >
> > * With the current upstream code, plugging in a headset locks
> >   the mic to the headset input and marks the internal mic as
> >   unavailable/disconnected. Your mic fix resolves this; internal
> >   mic remains selectable and functional with a headset plugged in.
> >
> > * Headset inline buttons (play/pause) work with your patches but not
> >   with the current code.
> >
> > As for issue 5, it's true that the "SKU not ready" warning is caused
> > by the 0x1d pincfg override, which, though harmless in practice,
> > I'm happy to drop.
> >
> > These are real issues that I missed because my testing focused on speaker
> > output and basic internal mic functionality, not headset behavior
> > specifically. Apologies for that, and thank you for catching them.
> >
> 
> Hi Marco,
> 
> Thanks for confirming the internal-mic selection and headset button fixes.
> 
> 
> > That said, I still believe the correct approach is to add these further
> > fixes to the existing Legion-specific chain rather than the generic
> > AW88399 function. Would you be open to preserving:
> >
> >         [ALC287_FIXUP_LENOVO_LEGION_AW88399] = {
> >                 .type = HDA_FIXUP_FUNC,
> >                 .v.func = alc287_fixup_legion_16iax10h_aw88399,
> >                 .chained = true,
> >                 .chain_id = ALC287_FIXUP_AW88399_I2C_2,
> >         },
> >
> > where alc287_fixup_legion_aw88399 now includes the DAC override,
> > mic boost limit, suppress_auto_mic, and headset mode setup in one
> > self-contained function? This preserves the generic/model-specific
> > separation while incorporating the new fixes.
> > More generally, I'd appreciate your thoughts on my comments on the
> > series' architecture, as this affects how any combined fix is structured.
> >
> 
> The current chain reuses existing Realtek helpers for the required mic,
> headset, button, and DAC handling.  Its inherited XPad setup applies to
> these laptops because they expose VPC2004.  The ThinkPad helper returns
> when the ThinkPad ACPI nodes are absent.
> 
> > Regarding the DAC routing: I understand 0x03 also has a volume amplifier,
> > but 0x02 matches the Windows driver configuration and is the established
> > pattern in alc269.c for this exact codec and pin. I still don't see a
> > practical benefit to routing 0x17 to 0x03 instead.
> >
> > Regarding 4.0 channel maps: I remain unconvinced this is useful.
> > Even with speaker-test -c 4, all it achieves is the ability to play
> > tweeters and woofers independently, which no real-world content or
> > use case requires. The correct profile is stereo 2.0 with both driver
> > types playing together.
> >
> 
> Thus 0x02 receives FL/FR and 0x03 receives channels 3/4.  Forcing 0x17 to
> 0x02 collapses both speaker pins onto one DAC and gives the parser the wrong
> output configuration.
> 
> The four speakers provide users a choice of output profiles.  For ordinary
> stereo content, 2.0 is the preferred profile because both speaker pairs
> receive FL/FR.
> 
> > Regarding the jack rename: I understand the symptom: GNOME prompts the
> > user to choose between headphone and headset on every plug event.
> > I don't see this on KDE, which suggests it may be a
> > desktop-environment-specific behavior rather than a kernel issue.
> > Is there a reason this can't be handled at userspace level, rather than by
> > renaming the kernel control to something semantically incorrect for
> > hardware without a dock? Alternatively, can we find a different solution,
> > or more simply a different name?
> >
> 
> The jack rename gives the headphone output a distinct ALSA jack identity so
> PipeWire does not group it with the headset-mic route.
> 
> > I'm open to collaborating (e.g. with a Tested-by tag) on a v2 that
> > combines your headset/mic fixes with the existing DAC and
> > architectural approach. Would that work for you?
> >
> 
> Let's wait for the maintainer's review to see if there is more.

Not much from my side, but I just prefer receiving a solution that
satisfies both of you :)

So, if any, let's try a v2 patch set.  We still have a bit of time for
7.3 release.


thanks,

Takashi
