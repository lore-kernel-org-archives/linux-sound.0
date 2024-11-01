Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E11F839F4
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449081; cv=none; b=uk45COo3m748uP8BVxixdkp1NwDTA/Oy3BHe8d326nDsnoiUJGuBM98B8ZfK3qDNZLTExkuTS1KS4EZM1DpDbLTFLmm9KdjxWR8QujhRTK5G4IMeOdraGA10cr0Vdd6rzQSBmatJCAQhrt6IonlBCV49dgwTh4dKtEolt3QUb4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449081; c=relaxed/simple;
	bh=B+S8KAMe7UkMm5Dqf7b8fMYzV7MgdjTAwHQ/+Rc57cw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GDDzTf6O/0cZ2BUxqqjk4Iq4B2mb2Nqq2blKlWtgARw7RJ3pnBWQ95qm4p0PXm3xXqPKmvSITmpBkemA8QAama1am1lD3POP1Z8MSYnUSAhCbW9qeOz0i3gdpLsYiKjHJ6wpt/d/XkWe1hftk+wMnuINYh4dr56VyVg9CaSqyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xvfS3oDM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGlxifVy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xvfS3oDM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGlxifVy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvfS3oDM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGlxifVy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvfS3oDM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGlxifVy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1833721CC4;
	Fri,  1 Nov 2024 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730449071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8ifPx82Sr9oDi7sY2uddjD1KZ0N4ONXvx0D0MUWaSo=;
	b=xvfS3oDMF0zMWxybL4w7BBMXHeCQIfdTW3pkjQusfUa+VeCszTF3Bg7l6zEgxCkDLxjcnt
	xgjIWp0t0nHTROMZsFKwrqT6f1j7Y3Q+Qd259TerNBx3K4K+mmNkLiy1tNpz91RV+p7+Gw
	4pfJD/yPazFnp5mRbnjSEM7JIQQxPFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730449071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8ifPx82Sr9oDi7sY2uddjD1KZ0N4ONXvx0D0MUWaSo=;
	b=cGlxifVyNN2o4N1Il+Jqh1twEpSi//BfdVxUPZfIB+pFt4DanVK6jpsf5G2l6g7Xcb5eF2
	EfBZCaVISPxJJKAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xvfS3oDM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cGlxifVy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730449071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8ifPx82Sr9oDi7sY2uddjD1KZ0N4ONXvx0D0MUWaSo=;
	b=xvfS3oDMF0zMWxybL4w7BBMXHeCQIfdTW3pkjQusfUa+VeCszTF3Bg7l6zEgxCkDLxjcnt
	xgjIWp0t0nHTROMZsFKwrqT6f1j7Y3Q+Qd259TerNBx3K4K+mmNkLiy1tNpz91RV+p7+Gw
	4pfJD/yPazFnp5mRbnjSEM7JIQQxPFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730449071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8ifPx82Sr9oDi7sY2uddjD1KZ0N4ONXvx0D0MUWaSo=;
	b=cGlxifVyNN2o4N1Il+Jqh1twEpSi//BfdVxUPZfIB+pFt4DanVK6jpsf5G2l6g7Xcb5eF2
	EfBZCaVISPxJJKAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E410F13722;
	Fri,  1 Nov 2024 08:17:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j6PZNa6OJGc4KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Nov 2024 08:17:50 +0000
Date: Fri, 01 Nov 2024 09:18:55 +0100
Message-ID: <87ikt7v028.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
	<87o730uttl.wl-tiwai@suse.de>
	<5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1833721CC4
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Thu, 31 Oct 2024 17:43:18 +0100,
Jaros³aw Janik wrote:
> 
> On 31.10.2024 17:21, Takashi Iwai wrote:
> > Hm, so the beep works even if the HD-audio device is runtime-suspended
> > before shutdown?  Also, beeping at suspend/resume works no matter
> > whether runtime-suspended or not?
> 
> Well, to what I recall - my (current) Thinkpad has never beeped on
> shutdown, other than that - without your "extra muting" patch - yes -
> beeping in every other circumstances works no matter if HDA controller
> is in PM suspend or not; this is what I've got used to for many years of
> using Thinkpads.

Do you mean about the beep emitted via thinkpad_acpi stuff or the
normal beep via terminal etc?  The latter must work even with the
patch, but the question is only about the former.  And that's the case
for the shutdown beep tone.

You can pass snd_hda_intel.beep_mode=0 option to disable HD-audio
beep, verify the device being runtime-suspended, and check whether the
beep via thinkpad_acpi still works (after reverting).

> And one more thing - with your patch - beeping is not muted on my laptop
> completely, you can still hear it if you are in a quiet room, it's just
> very "weak".

It might be because there can be two routes of beep tone; one via
HD-audio and another internally.


thanks,

Takashi
