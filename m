Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F414F9E2
	for <linux-sound@vger.kernel.org>; Thu, 21 Nov 2024 15:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732203565; cv=none; b=W4hQZNARkZ0EkiHgAivVbasNVqdxNBYl1R4RVsBrWE1TePN3Kvmufdr8k6YAqsP6Slw7P5gnqYP2pS8SswLTCSubyDbb3Txm7gx38DDN0NHjUrsayZEhFEyb7gH0Z2tvb14Qi0CrIo137DHS2wl6IG4RhP3RjbC4gFfjDG8M+Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732203565; c=relaxed/simple;
	bh=CpjGuWOOymYz4UAsHQnJtaduGBHGxD6ynQGbdFA/7uk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrI2SoIvuJM0Ra+bQtJFWvnseZIIHFNmKzLxOaU9v6KD1IWzHoPrMx8zINJVc2NMvPd5CkZqi1p2/tQs0PY5PCI6g8vxfGDWg08ZZSiyxPoIXL5I5ICPbpXcgajKtzLl1EW4RiDLpJKiMmqecUFoLloh+UHZUJjoafpNkRkIcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KAl9rhOg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LhJsN+mE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KAl9rhOg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LhJsN+mE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KAl9rhOg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LhJsN+mE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KAl9rhOg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LhJsN+mE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0ADC71F443;
	Thu, 21 Nov 2024 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732203562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwH/fS885cTxPt05cd083O9w071EjdF6tI8Mp5rmSv8=;
	b=KAl9rhOgt0VoRSByg/D6FOJ8z2HY88qp06qtAIQsjj/CFJAGl+0kDVw5V9HjrdODr/U6/v
	Mg+32KBEg+ssc4TcTXth3Kt/rnRsLvpGZUbd5klbmsFDGpajdLtyUcIyfPbR8ql1PZyEiX
	Otn5D3+TD5ocKnxoJOU+VhwnxoHayRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732203562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwH/fS885cTxPt05cd083O9w071EjdF6tI8Mp5rmSv8=;
	b=LhJsN+mEHL8AQcUemOpFhzzjB925ExXy19hcrZb8cXgmzArvdl//4pMXqaMjj1/vX4HXZE
	pHax5z9WQaGv69BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KAl9rhOg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LhJsN+mE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732203562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwH/fS885cTxPt05cd083O9w071EjdF6tI8Mp5rmSv8=;
	b=KAl9rhOgt0VoRSByg/D6FOJ8z2HY88qp06qtAIQsjj/CFJAGl+0kDVw5V9HjrdODr/U6/v
	Mg+32KBEg+ssc4TcTXth3Kt/rnRsLvpGZUbd5klbmsFDGpajdLtyUcIyfPbR8ql1PZyEiX
	Otn5D3+TD5ocKnxoJOU+VhwnxoHayRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732203562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwH/fS885cTxPt05cd083O9w071EjdF6tI8Mp5rmSv8=;
	b=LhJsN+mEHL8AQcUemOpFhzzjB925ExXy19hcrZb8cXgmzArvdl//4pMXqaMjj1/vX4HXZE
	pHax5z9WQaGv69BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5E3B13927;
	Thu, 21 Nov 2024 15:39:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0UXFMilUP2fyUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Nov 2024 15:39:21 +0000
Date: Thu, 21 Nov 2024 16:39:21 +0100
Message-ID: <871pz438ba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <4ca8fe7a-a81c-4a46-8795-60f7f5d1771d@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
	<87o730uttl.wl-tiwai@suse.de>
	<5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
	<87ikt7v028.wl-tiwai@suse.de>
	<74e49336-4552-4224-9b14-204d4264d647@gmail.com>
	<871pzuujkc.wl-tiwai@suse.de>
	<18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
	<87a5e9g68w.wl-tiwai@suse.de>
	<e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
	<877c96szig.wl-tiwai@suse.de>
	<98af4276-927d-474e-a78f-7c6f0bae3090@gmail.com>
	<87jzcz5jww.wl-tiwai@suse.de>
	<13b257a1-8336-4286-b801-bb09082bd316@gmail.com>
	<875xoi5qto.wl-tiwai@suse.de>
	<af71370b-e68b-4dad-ae04-8b9f5742568e@gmail.com>
	<878qtec56p.wl-tiwai@suse.de>
	<4ca8fe7a-a81c-4a46-8795-60f7f5d1771d@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0ADC71F443
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Thu, 21 Nov 2024 02:15:43 +0100,
Jaros³aw Janik wrote:
> 
> On 20.11.2024 16:09, Takashi Iwai wrote:
> >> The speakers are completely silent once you connect headphones,
> >> regardless of Speakers Volume / Mute Switch settings.
> > 
> > Even if you turn off "Auto-Mute Mode"...?  If yes, check the widget
> > NID 0x10 and 0x1f in the codec proc file
> > (/proc/asound/card*/codec#*).  The former should have the output amp
> > value like 0x40, and the latter should be pinctl 0x40 (output).
> > You can override the values directly via hda-verb, too.
> 
> Yes, speakers are always silent when headphones are connected,
> regardless of Auto-Mute Mode and even if Speaker Mixer is set to max and
> unmuted (which translates to 0x40 for NID 0x10 in my
> /proc/asound/card0/codec#0).
> When it comes to Pin-ctl of 0x1f - it is "0x40: OUT" as you said it
> should be, unless Auto-Mute is enabled and headphones are connected
> (it's 0x00 then); but it doesn't change anything - if you plug
> headphones - speakers are quiet.

Aha, that's an interesting information.  Then basically Auto-Mute Mode
control is useless on your machine, and can be omitted.


Takashi
