Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0B3FB048
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002481; cv=none; b=uF2A8hPGtZwfSN5j+muW8DyjNO7fZqfnv4UUBFDFGxBHjo0ChfXDrCrsLNwot/MNAFF/NGCTfDUKNcEUmDookG81z/p6KtmUKsWjV6pyatieN6ELXVaUV+85uW9uhmznr1/L9sLlS6hsWfheLRBchwk7eEqeo55g4bvIP3hjFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002481; c=relaxed/simple;
	bh=oXi0Od6l26zusaay1wPO8nW8TT49l701VZ9rolfdomI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJ3Na0dl9yJIlEZ7sjJvh0y/V8pDIrjCfVmoZ61ASQJ9v/SRypxGwj5rLJy765QZc78RNHgAJP37lkGsUV9D48viy44V98Xf0JkPq6bpqpVVpE9ZcyJFnFE5E16DUxCgbEe0HK1Z8rYspXRDEeJvH/EcDlv150tpICBxRR2XJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UHOBR+9y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eQReTogi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ATTG8/Za; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yMPiNxSs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UHOBR+9y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eQReTogi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ATTG8/Za";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yMPiNxSs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C056C759C2;
	Tue,  9 Jun 2026 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781002477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nv+IdCoyRHabvOZkGMT1v5TPEPOGzLsBlGZphA4w/v8=;
	b=UHOBR+9yTySVgi6zSrkv8oN4SzCIoiUw0YYXPoeaPLGE0SWtl6fcT4Px2/2UVtXvTjSuEL
	01d/lVXtG20EkknD0YCQaE0D5pXIJPz6nhlKiCyTFgcUkEkjII0ObJbVbLFZsp/8Jko4T0
	dRovYSNQH4FPLvD/JkIBSc59TLjJJBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781002477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nv+IdCoyRHabvOZkGMT1v5TPEPOGzLsBlGZphA4w/v8=;
	b=eQReToginKUEcJw2CL191arHhhveDWuWkj7hMm4kdwbRuzKEpLZcnvsrZIs+jGvZqi6+c7
	FToV0NjlN7xY9qBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ATTG8/Za";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yMPiNxSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781002476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nv+IdCoyRHabvOZkGMT1v5TPEPOGzLsBlGZphA4w/v8=;
	b=ATTG8/ZaerT3k/27fneSDFJOWZmShbf5JRB+m+l+umrG61uz7Vd6U5glb20X/LkL/hnuqI
	CeKmxBJnTDzTMHzlfdDud6chybRePRRUy7hzOJOWAwcW4YLt32grEY5ULPcucHzUaeKHwM
	fn7sh+8B+j/Oa7crLH2YMPOF4j/JvtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781002476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nv+IdCoyRHabvOZkGMT1v5TPEPOGzLsBlGZphA4w/v8=;
	b=yMPiNxSsZIF0sl+DYxjc4p87bGiKwBdS449zux+8GjwecFpxFgE/ChLC8g+3qQT0X5AGe7
	51GT8K81Ivs3xdCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3A89779A7;
	Tue,  9 Jun 2026 10:54:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RYVbJ+zwJ2rRdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jun 2026 10:54:36 +0000
Date: Tue, 09 Jun 2026 12:54:36 +0200
Message-ID: <87ecig6l1v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Moritz Baron <moritz.baron@stud.uni-hannover.de>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel@i4.cs.fau.de,
	Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8
In-Reply-To: <20260608202055.206744-1-moritz.baron@stud.uni-hannover.de>
References: <20260608202055.206744-1-moritz.baron@stud.uni-hannover.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C056C759C2
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uni-hannover.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 08 Jun 2026 22:20:54 +0200,
Moritz Baron wrote:
> 
> The Lenovo Yoga Pro 7 14IRH8 (ALC287 codec, subsystem ID 0x17aa:0x38b1)
> has bass speakers on pin 0x17 that are not routed through a DAC with
> volume control. This causes the bass speakers to play at full volume
> regardless of the volume slider position.
> 
> Apply ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN which corrects the DAC
> routing for pin 0x17, enabling proper volume control. This is the same
> fix used for other Yoga Pro 7 models with identical audio topology
> (14APH8, 14AHP9, 14ASP10, 14IAH10).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217949
> 
> Co-developed-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
> Signed-off-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
> Signed-off-by: Moritz Baron <moritz.baron@stud.uni-hannover.de>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index dcbc669842e0..9b1e65f6d161 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7711,6 +7711,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	 * use codec SSID to distinguish them
>  	 */
>  	HDA_CODEC_QUIRK(0x17aa, 0x38cf, "Lenovo Yoga Pro 7 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
> +	HDA_CODEC_QUIRK(0x17aa, 0x38b1, "Lenovo Yoga Pro 7 14IRH8", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),

Your machine seems to have a different PCI SSID (17aa:3852) from the
entry above, so it's not appropriate to put here.

Instead, put one before the entry of 17aa:3852 below, with a brief
comment that it's for avoiding the confliction with the PCI SSID
17aa:3852.

>  	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
>  	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),

... the conflicting entry is found here above.


thanks,

Takashi
