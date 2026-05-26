Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596C3BFAD7
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774311; cv=none; b=D1Xr34EbVu31XkKHjHPk4kubvWaz+p7ztD4OFT/wa4ZORu1CnAVnL1tF/Djt3Tq/a/EnuGgK5yMMjAfleEoFHY2JhD5Mc/ewL0CpWmrwUeyAp6jqWCz8vkZS3bAs6yDgE3pe01ozEtOv6MX9unIDh8HWEAZycMUE5IujlJTkMio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774311; c=relaxed/simple;
	bh=8BD/z0tEDsLiH5ZyWfcrvPOmjD/r3B9XK/QMfOjoeL4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OCBSCzl94UjiHnK9vk19O2cnIhwaXI+0yGcQtXVpOivwUzGxfiQrQd64dNOEpU1p+Acaag/f0H7xHd2iNvEhxlk8QNSkMgeR9M7j2TChtb7DWvdJjOfrm7JoGZ5UPeP6+5Paz2iDK0oGDLkVymwj5jd8KWV3kHvpwEgc80UbfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SiJurFb6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l9UwV8Uv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SiJurFb6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l9UwV8Uv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SiJurFb6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l9UwV8Uv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SiJurFb6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l9UwV8Uv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E17375AC2;
	Tue, 26 May 2026 05:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779774307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXl8nPCpcDwmvaw2xW6p7murOipvoPiQsmmrPiGX7fA=;
	b=SiJurFb60B4igbokxRPdDoXYUsWDUm5BlBS8PySl0qQG4Y74pERtGECzqyL3JaksLXIVxX
	v7MxUdnnjc1+56GyZ6QnyIN9PudD9XIRkhIfKs9umSrjpT9EtrMUpjuQkE5Kf4X639l0Cx
	ME5lThGOxJlvyl93d56Gd7uHNqSznw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779774307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXl8nPCpcDwmvaw2xW6p7murOipvoPiQsmmrPiGX7fA=;
	b=l9UwV8UvBvLpbREFi7GPOzc9E8w3yfmpenpXIQiyrGJCj2zoeZsEUEZjzSzjiGOh3GRV5U
	zuo7cn1yeVNQkrDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779774307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXl8nPCpcDwmvaw2xW6p7murOipvoPiQsmmrPiGX7fA=;
	b=SiJurFb60B4igbokxRPdDoXYUsWDUm5BlBS8PySl0qQG4Y74pERtGECzqyL3JaksLXIVxX
	v7MxUdnnjc1+56GyZ6QnyIN9PudD9XIRkhIfKs9umSrjpT9EtrMUpjuQkE5Kf4X639l0Cx
	ME5lThGOxJlvyl93d56Gd7uHNqSznw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779774307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXl8nPCpcDwmvaw2xW6p7murOipvoPiQsmmrPiGX7fA=;
	b=l9UwV8UvBvLpbREFi7GPOzc9E8w3yfmpenpXIQiyrGJCj2zoeZsEUEZjzSzjiGOh3GRV5U
	zuo7cn1yeVNQkrDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44DBF5A04D;
	Tue, 26 May 2026 05:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /mckDmMzFWrhHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 05:45:07 +0000
Date: Tue, 26 May 2026 07:45:06 +0200
Message-ID: <87wlwqzpul.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on firmware 2417
In-Reply-To: <ahUytAir51SvJjd7@m.b4.vu>
References: <ahIWTueUlWA5xiV+@m.b4.vu>
	<87a4togd7d.wl-tiwai@suse.de>
	<ahUytAir51SvJjd7@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 26 May 2026 07:42:12 +0200,
Geoffrey D. Bennett wrote:
> 
> On Mon, May 25, 2026 at 09:28:38AM +0200, Takashi Iwai wrote:
> > On Sat, 23 May 2026 23:04:14 +0200,
> > Geoffrey D. Bennett wrote:
> > > 
> > > Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
> > > gain parameter by 4 bytes, from offset 0x2a0 to 0x2a4, breaking the
> > > "Direct Monitor X Mix Y" controls.
> > > 
> > > Special-case the offset in the get/set config helpers when the
> > > running firmware is 2417 or later.
> > > 
> > > Fixes: 4e809a299677 ("ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> > > ---
> > > Tested on a Scarlett 2i2 4th Gen by writing to "Direct Monitor 1
> > > Mix A Input 01" and observing the USB traffic with usbmon:
> > > 
> > > - Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
> > > - Firmware 2417, patched driver:   write targets offset 0x2A4
> > > - Firmware 2128, patched driver:   write targets offset 0x2A0
> > 
> > Applied now to for-linus branch.
> > 
> > It seems that this can be merged without conflict to for-next that
> > contains already your previous series.  Let me know if any adjustment
> > is needed at merging this with the previous one.
> 
> Thanks. Although they don't conflict, they are equivalent, so no need
> for both. I think my previous series is the better way long term, so
> can you drop the new patch when you merge to for-next? Or should I
> send a revert? Or do you have a different preference?

It was already merged, so I'll revert it on for-next.
Thanks for confirmation.


thanks,

Takashi
