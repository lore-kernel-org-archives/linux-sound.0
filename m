Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C81CB522
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115394; cv=none; b=qusqKw3+g9umvBs9DgcEnHTpItqeWofFsrUNLxtGI6gusL6bGU4vwekbU4iYpuxbEciseL+cMGOhwdDYqfPiK83HHWIkAeDZqr3YgvhVr73dgm3debV1yu0rd0oxTrB7m+UMJxKpY+NJgMUwrcDnAhm12+f+tzDQsIBhkP6tBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115394; c=relaxed/simple;
	bh=Www8Xm4NgI7LT7xAQmiC3Kcx/w/iRxaXFB+05JrlM/k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqZnSOw5dUn5fw14b4i/r3FTJ90TKwrVgoTFUkDmBzzNE+gZ0pPs2CGYAgKG7L8t8WogJIhiTuYBcQ4jaf45CGmOe9Qnyu/kvA0tVep+0Yb1t0mDF370Tgq5SlGvIsUQyACLjGloWCYxcW5/8ywFmygsn4GtuQnLJpMe0wc/rqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S/o3WzIc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aE1KiITE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cs3E3Ru4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v8aw+HNc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S/o3WzIc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aE1KiITE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cs3E3Ru4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v8aw+HNc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE7101F79B;
	Wed, 20 Nov 2024 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732115391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBI+gy0rzl/berD2GSSKOTv9bnMW0iDIeq03C6MbFU=;
	b=S/o3WzIc1kurhY2GCPa1apFGW18XucGW3yJIwquJpo/MJwrs3aPeLYcbysBhBR1SbOSTQa
	jGpn+mWGUBx4TfCJF6LAYezpbILnIhhBV2DDZSHcK5U1VVMgdhtNLcc+HKgUb1Jvz9hZz3
	Zim9UJJ9XMbn9GBz5x8ZKvni59V5/Sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732115391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBI+gy0rzl/berD2GSSKOTv9bnMW0iDIeq03C6MbFU=;
	b=aE1KiITEsiol6p7DPgI4JSkaLdecWcU/M6BzOh1U8YWFdeXBl5pfEMwTvYpkZYuyd7sC/a
	MwzBMYONEHCcj9Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732115390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBI+gy0rzl/berD2GSSKOTv9bnMW0iDIeq03C6MbFU=;
	b=cs3E3Ru4Q7o/gN1+TYDgMR6dHcvj9d77DgBDrjKbvPVogx45UF0YxOJWwPkvcLMw8LgG09
	pk+sueVDYcf8r1zqfInruF5ZY87ruwiDa6l1k1ZSD07yeD/4Fz0TYcUFn5ZCalX5wnrieV
	+OcuCoYOxyaflSOvvW+EygPgCF9BumE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732115390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBI+gy0rzl/berD2GSSKOTv9bnMW0iDIeq03C6MbFU=;
	b=v8aw+HNcKJ8TZclx9Y91WDNdSxC06LjH6zGr+x/VH51Nz7dhdmwIiKBrN1NEbtBM/NE48R
	01v2rJE5A0JamhDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA29513297;
	Wed, 20 Nov 2024 15:09:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fwG0NL77PWfaPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 15:09:50 +0000
Date: Wed, 20 Nov 2024 16:09:50 +0100
Message-ID: <878qtec56p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <af71370b-e68b-4dad-ae04-8b9f5742568e@gmail.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Wed, 20 Nov 2024 16:00:07 +0100,
Jaros³aw Janik wrote:
> 
> On 20.11.2024 08:04, Takashi Iwai wrote:
> > On Wed, 20 Nov 2024 02:29:59 +0100,
> 
> >> And one more thing - both beep types are audible on the headphones even
> >> if Headphones mixer is set minimum and Headphones Mute Switch is set to
> >> mute (if Master is unmuted, obviously)
> > 
> > Hm, that's odd.  At this moment, do you hear from the speaker?  Or
> > Speaker Playback Switch is off?
> 
> The speakers are completely silent once you connect headphones,
> regardless of Speakers Volume / Mute Switch settings.

Even if you turn off "Auto-Mute Mode"...?  If yes, check the widget
NID 0x10 and 0x1f in the codec proc file
(/proc/asound/card*/codec#*).  The former should have the output amp
value like 0x40, and the latter should be pinctl 0x40 (output).
You can override the values directly via hda-verb, too.


Takashi
