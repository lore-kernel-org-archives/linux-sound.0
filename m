Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BBE2D6E4D
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 16:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396239; cv=none; b=oLxC9OYX07EmzZJ58uDVlO/y3QggTWdvMfubr3Qgi+HQHe2kLhL6L6iSRPT2gDr+R3cVXVgE4Zr7u+/P7VjjqEwYDmDUNzpSW++1aRpYZB5D65wSZsD22SUhl2Bn6DRblH8fzgLGw/+UwReIPMXeyng/0Nf4nQ6UyCFtaskWTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396239; c=relaxed/simple;
	bh=gAp+6GTQMBBClkP7ZW7GSW08Oo5z6QZ8KWMu7uI+NjI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/uWfZPaklPBK426jf21sJvMzO96Tr6Zof8lucXDi4iQeeOQVzc1L5GhoqHN8SN6UW/ZCrBD7hPxqTiEL6TzTEGWIXoURM879LSBu6VDXeMXts3EhHkLuFryDUctNTxDMM4eNEWP8urP5H/czjXfmZHvqSm14OosGGf2l1D6fis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GT+5A8Sq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ncjZgdny; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GT+5A8Sq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ncjZgdny; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GT+5A8Sq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ncjZgdny";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GT+5A8Sq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ncjZgdny"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 561F8211EB;
	Mon, 17 Nov 2025 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGud/zhYmxm3ux8SJQtVinmYAPq70MoYyELt36MdhG8=;
	b=GT+5A8SqYrIsuSjTP4iuGUiYvaSQOltypbpUHpjjUZQmU1DhtPG+2GubTGlMqCS0f+/Rq0
	UHeSbQK1GyMYEjwANCvMpXrIv0iC20kq5a6YLbtzspFxF12XUBDBQBR3rJaXwxOpTUQXd2
	VSWFjomZj+3GSUvzmsyLwVFPvDC20FU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGud/zhYmxm3ux8SJQtVinmYAPq70MoYyELt36MdhG8=;
	b=ncjZgdnyF0HtVE8I4LCU+L2bkGYiXBVAFCm/0POGLBAm0ORHa2KOvQCloP+7dlr1rydKTZ
	wEqjltAp7irQLiAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGud/zhYmxm3ux8SJQtVinmYAPq70MoYyELt36MdhG8=;
	b=GT+5A8SqYrIsuSjTP4iuGUiYvaSQOltypbpUHpjjUZQmU1DhtPG+2GubTGlMqCS0f+/Rq0
	UHeSbQK1GyMYEjwANCvMpXrIv0iC20kq5a6YLbtzspFxF12XUBDBQBR3rJaXwxOpTUQXd2
	VSWFjomZj+3GSUvzmsyLwVFPvDC20FU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGud/zhYmxm3ux8SJQtVinmYAPq70MoYyELt36MdhG8=;
	b=ncjZgdnyF0HtVE8I4LCU+L2bkGYiXBVAFCm/0POGLBAm0ORHa2KOvQCloP+7dlr1rydKTZ
	wEqjltAp7irQLiAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FC013EA61;
	Mon, 17 Nov 2025 16:17:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AGqECotKG2nXGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Nov 2025 16:17:15 +0000
Date: Mon, 17 Nov 2025 17:17:14 +0100
Message-ID: <87jyzofxbp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	<tiwai@suse.com>,
	Richard Fitzgerald
 <rf@opensource.cirrus.com>
Subject: Re: [PATCH] fix cs420x MacPro 6,1 inverted jack detection
In-Reply-To: <20251114.173541.1765928837929818015.rene@exactco.de>
References: <20251114.173541.1765928837929818015.rene@exactco.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.994];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 14 Nov 2025 17:35:41 +0100,
René Rebe wrote:
> 
> Turns out the Apple MacPro 6,1 trashcan also needs the inverted jack
> detection like Mac mini patched, too.
> 
> Signed-off-by: René Rebe <rene@exactco.de> 
> 
> diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
> index 06e046214a41..dcd58f0b8bdf 100644
> --- a/sound/hda/codecs/cirrus/cs420x.c
> +++ b/sound/hda/codecs/cirrus/cs420x.c
> @@ -643,6 +643,7 @@ static const struct hda_quirk cs4208_fixup_tbl[] = {
>  static const struct hda_quirk cs4208_mac_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x106b, 0x5e00, "MacBookPro 11,2", CS4208_MBP11),
>  	SND_PCI_QUIRK(0x106b, 0x6c00, "MacMini 7,1", CS4208_MACMINI),
> +	SND_PCI_QUIRK(0x106b, 0x7800, "MacPro 6,1", CS4208_MACMINI),
>  	SND_PCI_QUIRK(0x106b, 0x7100, "MacBookAir 6,1", CS4208_MBA6),
>  	SND_PCI_QUIRK(0x106b, 0x7200, "MacBookAir 6,2", CS4208_MBA6),
>  	SND_PCI_QUIRK(0x106b, 0x7b00, "MacBookPro 12,1", CS4208_MBP11),

The table entries are sorted rather in PCI SSID order.
Could you try to put at the right position?

Also, please put a proper subject prefix, e.g. "ALSA: hda/cirrus: fix
cs420x MacPro ....".


thanks,

Takashi
