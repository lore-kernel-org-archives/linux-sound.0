Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831C4122D
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710172283; cv=none; b=SmYm/lSsogAXxwp7mY4v4EKcW/piy1yj0Y0p0LpFCLlUAzgVs8Z7e6tZ3CgFnfpDSXgs+yDUp43NT67uXrPefLEwmuh7I0b7baEgRkzBeZyiJj2HWm1rQD9niMthatIGrZTD+v8o+xqsUIJG+JxRNLO3YvYdT93lQExQ9kXTQIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710172283; c=relaxed/simple;
	bh=iL71k+wuodw/wKJq363VmTYyqcbvj+DLHzbUvqEuV9g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRyjSIsQU86rgJuVfbJuUdKhgjVy/NEHQd5q1riRq1iC6TPqZ1Y+POZc0sbKozQQ8lCsd4CfEPnjA2zIkkZtmUkTrMwdALkGwjlhqJ96yJ/CkwU6ZPxmme2M18tCpn+Lxtc09iBI7P5n8WLuB2Jwn7phlLFAdBJg4tXaIc3cKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z0w6nsjn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=saCDQWad; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z0w6nsjn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=saCDQWad; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z0w6nsjn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="saCDQWad";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z0w6nsjn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="saCDQWad"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1654D2209D;
	Mon, 11 Mar 2024 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710172280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmc98DluW3LhEdJHJs9DMwbC/mt6kI946XwcCOb+5TI=;
	b=Z0w6nsjnWhYaRa3MUw1aDxxATP5A4pRPrhhT0+wrzs7YDwVYyllPQvaOajnIrpXw1R7qjL
	L1fmwRGDSZoA2iJiRS9WLZbz4m38tdmtkCJ0hU5hkXN12OBdWAQoGRMl8S4nf7IK00TXlp
	RdtpjPgkW17A4MBU0i6ivRB9t9zaE30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710172280;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmc98DluW3LhEdJHJs9DMwbC/mt6kI946XwcCOb+5TI=;
	b=saCDQWad5iOSxBcebHwuH2YNzUXFe/QZxHC+VyuAKTQ6TUCxSi4AUFzQ/6M7Ph72+4/hhD
	jHyJuKywxJ7KKmDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710172280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmc98DluW3LhEdJHJs9DMwbC/mt6kI946XwcCOb+5TI=;
	b=Z0w6nsjnWhYaRa3MUw1aDxxATP5A4pRPrhhT0+wrzs7YDwVYyllPQvaOajnIrpXw1R7qjL
	L1fmwRGDSZoA2iJiRS9WLZbz4m38tdmtkCJ0hU5hkXN12OBdWAQoGRMl8S4nf7IK00TXlp
	RdtpjPgkW17A4MBU0i6ivRB9t9zaE30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710172280;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmc98DluW3LhEdJHJs9DMwbC/mt6kI946XwcCOb+5TI=;
	b=saCDQWad5iOSxBcebHwuH2YNzUXFe/QZxHC+VyuAKTQ6TUCxSi4AUFzQ/6M7Ph72+4/hhD
	jHyJuKywxJ7KKmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBA10136BA;
	Mon, 11 Mar 2024 15:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5zTTM3co72WwCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 15:51:19 +0000
Date: Mon, 11 Mar 2024 16:51:19 +0100
Message-ID: <87sf0wrclk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?f=E6talize?= <faetalize@proton.me>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH] fix volume mute and mic mute LEDs on HP probook 0x8a74
In-Reply-To: <_svHAlMKMyPfAYW80GE0F2Nh_0nIyML552foHvCW2Zr7rT4bgt9wKaTVDP77iOL2CCoFzh0uuvwEXRAgSH-DqNwTyZaRY9fIs9bCb5763Zw=@proton.me>
References: <_svHAlMKMyPfAYW80GE0F2Nh_0nIyML552foHvCW2Zr7rT4bgt9wKaTVDP77iOL2CCoFzh0uuvwEXRAgSH-DqNwTyZaRY9fIs9bCb5763Zw=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z0w6nsjn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=saCDQWad
X-Spamd-Result: default: False [-2.31 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 URIBL_BLOCKED(0.00)[suse.de:dkim,pm.me:email];
	 RCPT_COUNT_FIVE(0.00)[5];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
	 BAYES_HAM(-3.00)[100.00%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -2.31
X-Rspamd-Queue-Id: 1654D2209D
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 11 Mar 2024 14:05:55 +0100,
fætalize wrote:
> 
> > --- linux-6.8/sound/pci/hda/patch_realtek.c.orig 2024-03-11 11:59:02.989267710 +0000
> > +++ linux-6.8/sound/pci/hda/patch_realtek.c 2024-03-11 11:54:16.764227013 +0000
> > @@ -9890,6 +9890,7 @@ static const struct snd_pci_quirk alc269
> > SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> > SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
> > SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> > + SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC q", ALC236_FIXUP_HP_GPIO_LED),
> > SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> > SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> > SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> 
> Some probook models have a different board ID, which aren't encompassed by the patches. 
> on my probook 440 g8, this patch fixed my LED lights which now activate correctly upon mute/unmute.
> 
> Signed-off-by: Valentine Altair <faetalize@pm.me>

The fix looks trivial, but to be merged to the upstream, could you
resubmit in a proper format?
  https://docs.kernel.org/process/submitting-patches.html

Or, if it's too hard, I can fix by myself, as this is a really trivial
change, too.


thanks,

Takashi
