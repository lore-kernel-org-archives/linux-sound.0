Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2F3542F6
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306735; cv=none; b=LuFLraMVzfPt3zCjp0aS1jdvKybSctio2S5t0YmWlgoMg8Z3p+DHNgmW7rwswKwxgFI9lGzLdK5Zgiq5Y5NzLOFy6OWzMXLv1Cc1GfOneaH11wMq+wuZ7zgXAe8D40NCCZ21nXkE6XoCjUdGO5ynbSOXoVWygC4HN36wnR1vw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306735; c=relaxed/simple;
	bh=vkLTe+ItTxddXEWTgdf3uhcRRoZZE2nJ9dY655wF2vE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGvvvY8AKrEr4VlVu2UKko7Ru9Otk7FTgDGk/oK576i37eU8D0m0IqmtVAHbC/1r08WUeR3JZM/MrGuhcWwbyaYsxQR40u8nA/JBniOcMtEylt2twc/olbD1mW/PuCzZKjGpRoZCX0E5t/NeZdxHmOVk3UvKB96eOhpQNlghRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RYCTJZz9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gXJboa46; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2PBR3C+z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y+ospbXp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RYCTJZz9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gXJboa46";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2PBR3C+z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y+ospbXp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7FFC3E0F;
	Wed, 29 Jul 2026 06:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785306727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyaDvRvSyF+qgBqcXecAs8EbMJNmqc/1svvsCcFgCcs=;
	b=RYCTJZz9OYSdkN0qfddGTC2sCIX8JXTQWOHLsi0V7Z0S/FSC62+0LDImXu8IwMpiXXI6vR
	9vW1zYeJ3Rl+kuyStT6bPXe3Y4coH506orhjV3h1M6VHcdWtB9HwU42SQfzFYfIR18RKTE
	FkCOD3oYgOQucApC+nekXwF+uZZm0ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785306727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyaDvRvSyF+qgBqcXecAs8EbMJNmqc/1svvsCcFgCcs=;
	b=gXJboa46EmTkH4UW/10vDbyzRy9ATWnE1vm5/Q/MPbQLqneXRZ+1GokvF4O0w6PV+7vC7q
	G1cvazpHpTik9AAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785306723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyaDvRvSyF+qgBqcXecAs8EbMJNmqc/1svvsCcFgCcs=;
	b=2PBR3C+zr/zzF+zH/Al28YSd5+vOXZeaRRRqg9oPBOKPTzu6Vmgde8ManTMa6aQ49uCiKX
	n26iBUFLCop/K2uS00SOaKJpPSNxCP5lAEAcDd7dIA/3jVkosiW2F+LfkbT0uGs+IQTEu4
	DWTElu0mxUTSzcAcaNyAILO/qL70ysk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785306723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyaDvRvSyF+qgBqcXecAs8EbMJNmqc/1svvsCcFgCcs=;
	b=y+ospbXpd++OwL43kAA8DhvhTBpix/RrGmNHZWwc6k5EjnTyfL0YlYztXexikxTDAFKn3X
	c9LLUmnKb/6TwmDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83AF7779A1;
	Wed, 29 Jul 2026 06:32:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oXvxHmOeaWreXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 06:32:03 +0000
Date: Wed, 29 Jul 2026 08:32:03 +0200
Message-ID: <87pl065msc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add GET_SAMPLE_RATE quirk for C-Media CM6206
In-Reply-To: <20260728222239.62749-1-mikhail.v.gavrilov@gmail.com>
References: <20260728222239.62749-1-mikhail.v.gavrilov@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Wed, 29 Jul 2026 00:22:39 +0200,
Mikhail Gavrilov wrote:
> 
> The C-Media CM6206 (0d8c:0102) truncates the three-byte sample rate it
> returns for UAC_GET_CUR to its two low bytes.  After the rate has been
> set to 96000 (0x017700) the device reports back 30464 (0x007700).
> 
> At probe time the driver initializes every altsetting to its maximum
> rate, so altsetting 5 is set to 96000 and the warning appears on each
> plug-in, before anything has opened the device:
> 
>   usb 3-1.3: 1:5 Set sample rate 96000, clock 0
>   usb 3-1.3: current rate 30464 is different from the runtime rate 96000
> 
> That altsetting is the one parse_audio_format_rates_v1() already fixes
> up for this chip, so this affects every CM6206.
> 
> Only the read-back is broken, the rate itself is applied: a 1 kHz sine
> rendered at 96 kHz is recovered at 1000.2 Hz, and a silent fallback to
> 48000 would have been reported as 0x00bb80 rather than as the low half
> of the requested rate.
> 
> Add a QUIRK_FLAG_GET_SAMPLE_RATE entry for the device so the read-back
> is skipped.  Setting the same flag through the quirk_flags module
> parameter makes the warning disappear while the 96000 init still
> happens.
> 
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Thanks, applied now.


Takashi
