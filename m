Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6F3537E6
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651082; cv=none; b=oJlZpRUJIGNtBS97u5KCtDDBXveywgbbplU9lw+tzmk0Pi6yUPg024lOhnyWDWHLbs93PWQDH1p1mSWeR4dlM5aaUEntAVbL+W0NwcqWgX22I+bcfCTDZuomVvcXqii3xWp9Sjm+qX3zKsYkbhkMIBv3k1BuOzaswwXrEl8KEkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651082; c=relaxed/simple;
	bh=jOgZdToQLqKMSF24AL60+gD6XJUKSbuPxJ5S/kP8K1Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXeBYBZqujAvlQzI3kFPzbnNizpq9U4g16LAwD7dK3bSUZVvB1lWNCRCiO5/Owk6EvDVXIn90OTf6Kjgb6ds6GfgWn1jH6AZNJF1PT9ogMa5u8H2kquOheHEuvagbg02alwkLVV37IESdkKUdpR3b5MUsAWlMtqBMok+2IL3CTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JaCCDEKO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rIbuTvZb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JaCCDEKO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rIbuTvZb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JaCCDEKO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rIbuTvZb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JaCCDEKO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rIbuTvZb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0B4C4D1C7;
	Mon, 16 Mar 2026 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773651079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCK/755VfhRSchSrXncmHVbO0AF8pHwaCKSPnbB6Vls=;
	b=JaCCDEKOAFXED1B2gSN+iZS1AVSp2vGBz2bsg/ixPVt9R+wsFHzeqAPh6tjSDj9hF6FWE/
	yT+1vsLnM7XZT0OAP1WQEJq9bIkJpSmtt/LOimWjVVD+3UqfSyZUGVxlup1K+3ktu7LD6S
	dAAnI4oCcTkXS6+82J29sF5Bu5q03ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773651079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCK/755VfhRSchSrXncmHVbO0AF8pHwaCKSPnbB6Vls=;
	b=rIbuTvZb/MPeHMxBwZBV41jXPR52Qfp4AkB68yRl3RTxE7Mt3S0087zqj/OHXQ7QNNq2Bl
	VjFdus5BvHMo38DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773651079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCK/755VfhRSchSrXncmHVbO0AF8pHwaCKSPnbB6Vls=;
	b=JaCCDEKOAFXED1B2gSN+iZS1AVSp2vGBz2bsg/ixPVt9R+wsFHzeqAPh6tjSDj9hF6FWE/
	yT+1vsLnM7XZT0OAP1WQEJq9bIkJpSmtt/LOimWjVVD+3UqfSyZUGVxlup1K+3ktu7LD6S
	dAAnI4oCcTkXS6+82J29sF5Bu5q03ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773651079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCK/755VfhRSchSrXncmHVbO0AF8pHwaCKSPnbB6Vls=;
	b=rIbuTvZb/MPeHMxBwZBV41jXPR52Qfp4AkB68yRl3RTxE7Mt3S0087zqj/OHXQ7QNNq2Bl
	VjFdus5BvHMo38DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A01254273B;
	Mon, 16 Mar 2026 08:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t6mYJYfEt2l7dAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 08:51:19 +0000
Date: Mon, 16 Mar 2026 09:51:19 +0100
Message-ID: <87bjgo9myg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: usb-audio: SKIP_IFACE_SETUP regression on Focusrite Scarlett 2i2 (1235:8006)
In-Reply-To: <abcGli7C40kr72mB@m.b4.vu>
References: <abcGli7C40kr72mB@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Sun, 15 Mar 2026 20:20:54 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> A user reported distorted/silent audio on 6.19.7 with a Focusrite 1st
> Generation Scarlett 2i2 (1235:8006), caused by 38c322068a26 ("ALSA:
> usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP").
> 
> The Feedback Format (from /proc stream0) changes from 16.16 to 17.15
> when SKIP_IFACE_SETUP is enabled. The user confirmed that removing
> SKIP_IFACE_SETUP fixes the issue.
> 
> This device doesn't have the internal mixer, Air, or Safe modes that
> the quirk was designed to protect, so it doesn't benefit from the
> skip.
> 
> I'm not sure if there's a better fix than explicitly listing all the
> devices that I tested?
> 
> E.g. replace:
> 
>         VENDOR_FLG(0x1235, /* Focusrite Novation */
>                    QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
>                    QUIRK_FLAG_SKIP_IFACE_SETUP),
> 
> with ~23 of these:
> 
>         DEVICE_FLG(0x1235, 0x8203, /* Focusrite Scarlett 2nd Gen 6i6 */
>                    QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
>                    QUIRK_FLAG_SKIP_IFACE_SETUP),
> 
> What do you think?
> 
> Report: https://github.com/geoffreybennett/linux-fcp/issues/54

We can put DEVICE_FLG() entries for the known Focusrite devices that
shouldn't to set QUIRK_FLAG_SKIP_IFACE_SETUP before the VENDOR_FLG()
entry that keeps *_SKIP_IFACE_SETUP flag?


thanks,

Takashi
