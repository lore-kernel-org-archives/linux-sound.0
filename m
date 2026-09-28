Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472849D592
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593445; cv=none; b=BG25419xUxv6YTmc0qXNj28vPwZb1FBSqI6FtNrL8JfUXatJMKiDmaB3Y7NQfFKxZg0fgs5oRW8E3Zk3hXWPNlauk3XY3yHqph43O9l6Ph38kRxGyABzZgixWhMFFc16qfxSCRO2geGDa4m1tHcPMfU7czZ372pyM0dRmRpp1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593445; c=relaxed/simple;
	bh=FZE4ulrxhkOMzwFIblXN4PtHFzb45EcBoDV9gx6HIPw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DY5XYC0YgvuizZAMamlkbrMnCthiZNhtW5mRsnSzcaImAjxgtIxTJB1yznA+nuSGZ31L83s1o20A9Ej32CzIbth4UwmD4LXvs3/ZEDtujcr1YsqHrPQnMa+2ZP/kgzn84amPSgiFAn4kCXDiA682VKiUxEbvcFNSu/hWDIH5Qs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rII4iRcS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Asf9yg1G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BvnP6kUB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VhsYm1TO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rII4iRcS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Asf9yg1G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BvnP6kUB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VhsYm1TO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE7401F812;
	Mon, 28 Sep 2026 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS+Dw+XyCZeMmMbjNODh7E1ua0fVnJNxmUg/LnpqvPM=;
	b=rII4iRcSTeH0Xw0S+UDIr1BBXDkxgZFraWp37o4U9mUnlqqI9an3634doi1akuAxLmsPiy
	hTl2SolmWEDJN1lm77oG+C7Y9y1wORFEGFycxYJOy6QUZ3dadOSCZhWSlb0nqcw1gK4d9K
	2nDTn4lYDZ6+VBZhr0CyAoSN8BhawvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS+Dw+XyCZeMmMbjNODh7E1ua0fVnJNxmUg/LnpqvPM=;
	b=Asf9yg1GcTqz5ujF2wtQDgxKFLBKIXicdQiMjEo1VuxBYpGuwcffJVWiuvaWR/Jq7Pv5V1
	UXYbCHxZe0gPIgCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS+Dw+XyCZeMmMbjNODh7E1ua0fVnJNxmUg/LnpqvPM=;
	b=BvnP6kUBniAMvConwkI4FqkwTRD2US0+DTyxiSKDUG7qb/SypVRoc9xDKd3v1ixNmtgkUZ
	LL4TEZSD6mafL3EUxfV3TfhVOtidV52z1wObYe+CTXrc0+jyQkVsKouMMqN2r+maz2Un/Y
	mgqEMN5dfdu+HY3g98R3Brsh+oFjuCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS+Dw+XyCZeMmMbjNODh7E1ua0fVnJNxmUg/LnpqvPM=;
	b=VhsYm1TOO+Mr9t+y/wcAgWUyU6PF/BxSYKlw8NRY/roKNP170q4aUIMEaxD2vKURiKvT1b
	Auarj26vghamqPCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78CF7133F1;
	Mon, 28 Sep 2026 11:03:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JVv6E5lJumqiJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:03:53 +0000
Date: Mon, 28 Sep 2026 13:03:52 +0200
Message-ID: <87fqyt7i3r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jianyu Zhou <997536907@qq.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
In-Reply-To: <tencent_3AB9214FB134949B31E9C471BC3669117F05@qq.com>
References: <tencent_3AB9214FB134949B31E9C471BC3669117F05@qq.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 17 Sep 2026 08:58:29 +0200,
Jianyu Zhou wrote:
> 
> From 2adfedabfdd9f5ec800462b1f1c0859a198e63aa Mon Sep 17 00:00:00 2001
> From: Jianyu Zhou <997536907@qq.com>
> Date: Thu, 17 Sep 2026 14:34:46 +0800
> Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
> 
> The internal speaker of the IPASON SmartBook S1 (an Emdoor ODM laptop)
> stays silent under Linux, while the Bluetooth audio and the headset
> output work fine.  The same machine plays sound under Windows with the
> vendor driver, so the hardware and the amplifier are known good.
> 
> The BIOS reports the pin default of the actual internal speaker pin
> (NID 0x1b) as 0x411111f0, i.e. the default association 0xf, which means
> "unconnected".  The pin parser therefore drops that node already at the
> pin-configuration time, hence no mixer control is ever created for it
> and the pin is never driven, no matter how the output pin 0x14 is set
> up.  Enabling 0x1b makes the speaker work immediately.
> 
> The existing ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO quirk makes the
> speaker work, too, but it additionally rewrites the pins 0x14, 0x19 and
> 0x1a with Honor-specific values, which creates a bogus "Dock Mic" device
> that does not exist on this hardware.  Add a minimal fixup that only
> enables 0x1b as the internal speaker.  Touching 0x14 is not needed:
> with the pin configuration overridden at runtime, both keeping its BIOS
> value (0x90170110) and disabling it (0x411111f0) leave the speaker
> working, so 0x1b alone decides the output.
> 
>   Codec:       Realtek ALC256 (0x10ec0256), SSID 0x2782:0x0206
>   BIOS pincfg: 0x14 0x90170110  0x18 0x411111f0  0x19 0x02a19040
>                0x1a 0x411111f0  0x1b 0x411111f0  0x1d 0x4067b945
>                0x1e 0x411111f0  0x21 0x02214020
> 
> Tested on 7.2.0-1-MANJARO and 6.18.45-1-MANJARO, with both the SOF and
> the legacy HDA driver paths.
> 
> Signed-off-by: Jianyu Zhou <997536907@qq.com>

Applied now.  Thanks.


Takashi
