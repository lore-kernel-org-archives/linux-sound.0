Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B12D94A4
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094531; cv=none; b=i07ndWqKcnsXhkVLaVvdEGOYc0VZmG+H6ofO5oQH7AnN8GXSrNm/XRDn0/ynt1ozymBIk/Gg3kObJWPeKbH/1UyG3kyrlmPFoevsC/LHdLRT1pmFqGYliO2DmfCRZwsrAqKifIesyAwKsTd1EoChxmHWOkxqo2WuslCDF5Hn3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094531; c=relaxed/simple;
	bh=P4RcCQ/XXi5UDUAuO0AlpBxOVBSiWtlr7SgtcgjqXiQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHwT4rVUu7mNqMjPYf4DznawEO7kiQmaPqFk5yQe3gHGms5L4EmZnY/AGMXgmCbIsCAHUEclBP/fNoOhdYHxMwTWFIic08chuBfveK+Kwq1E0i4K18ov/Y1SK8YCKP/7r3yFDjwOjoZbSpKb1iSXYPPsF3Uf3BonIFpL1ZLNCAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IQo7IYeA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1o2avMM5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IQo7IYeA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1o2avMM5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IQo7IYeA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1o2avMM5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IQo7IYeA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1o2avMM5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 962451F74B;
	Wed, 13 Aug 2025 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755094527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uX5teMKwGPEobo4yqVYgz8Wbj9Pr+zjt1GRKLtDE7Q=;
	b=IQo7IYeAkdwX3luWZRGGg5KJwqVsvJDJhpnCyk9jsD/gFUKHuWP5/J4GsOGnrHjCoAyEe2
	7CoF+upx8Co5zTs59NuN6sr/X+qLCuvhxfkdCLBKsxfXHhz5EGMl6CWZGIygFvVcSBf4Ub
	BbslIcbBIDOhblsUyVCple88oHaNbE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755094527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uX5teMKwGPEobo4yqVYgz8Wbj9Pr+zjt1GRKLtDE7Q=;
	b=1o2avMM5/P0Kyvrc2ak6gcaiWYJp7RI1ZTiyS1EBwsdZH3lOJN2msbzknWBsI8RcKMNMEG
	u5OkjZTyEoDjeFCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IQo7IYeA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1o2avMM5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755094527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uX5teMKwGPEobo4yqVYgz8Wbj9Pr+zjt1GRKLtDE7Q=;
	b=IQo7IYeAkdwX3luWZRGGg5KJwqVsvJDJhpnCyk9jsD/gFUKHuWP5/J4GsOGnrHjCoAyEe2
	7CoF+upx8Co5zTs59NuN6sr/X+qLCuvhxfkdCLBKsxfXHhz5EGMl6CWZGIygFvVcSBf4Ub
	BbslIcbBIDOhblsUyVCple88oHaNbE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755094527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uX5teMKwGPEobo4yqVYgz8Wbj9Pr+zjt1GRKLtDE7Q=;
	b=1o2avMM5/P0Kyvrc2ak6gcaiWYJp7RI1ZTiyS1EBwsdZH3lOJN2msbzknWBsI8RcKMNMEG
	u5OkjZTyEoDjeFCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60A0C13929;
	Wed, 13 Aug 2025 14:15:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9wldFv+dnGhWagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 14:15:27 +0000
Date: Wed, 13 Aug 2025 16:15:26 +0200
Message-ID: <87ms83wbnl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	Richard Gong <richard.gong@amd.com>,
	Juan Martinez <juan.martinez@amd.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: hda: Add ASRock X670E Taichi to denylist"
In-Reply-To: <20250813140427.1577172-1-superm1@kernel.org>
References: <20250813140427.1577172-1-superm1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 962451F74B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 13 Aug 2025 16:03:08 +0200,
Mario Limonciello (AMD) wrote:
> 
> On a motherboard with an AMD Granite Ridge CPU there is a report
> that 3.5mm microphone and headphones aren't working.  In the
> log it's observed:
> 
> snd_hda_intel 0000:02:00.6: Skipping the device on the denylist
> 
> This was because of commit df42ee7e22f03 ("ALSA: hda: Add ASRock
> X670E Taichi to denylist").  Reverting this commit allows the
> microphone and headphones to work again. As at least some combinations
> of this motherboard do have applicable devices, revert so that they
> can be probed.
> 
> Cc: Richard Gong <richard.gong@amd.com>
> Cc: Juan Martinez <juan.martinez@amd.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  sound/hda/controllers/intel.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index fcf67e97a546a..1bb3ff55b1151 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -2077,7 +2077,6 @@ static const struct pci_device_id driver_denylist[] = {
>  	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1043, 0x874f) }, /* ASUS ROG Zenith II / Strix */
>  	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb59) }, /* MSI TRX40 Creator */
>  	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb60) }, /* MSI TRX40 */
> -	{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1022, 0xd601) }, /* ASRock X670E Taichi */

Hmm, it's a bit awkward situation.  I believe this will make the
problem of the original fix back.

But, the original bug was merely error messages and memory wastes, and
the PCI SSID looks also not specific to the mobo vendor, so we can
start as a revert, but we'd need yet another fix to cover the original
problem.
Maybe some additional DMI check.  Oh well.  Such mobo vendors should
be cursed if they don't assign the proper PCI SSIDs...


Takashi
