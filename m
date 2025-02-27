Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E411EB5F3
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647317; cv=none; b=YXoDgFIPr+RY7tvfRHmJ9vQOCNmvriVXr743YZkagc9oE/bHGizWrdbP0iXDwiV+pkQ+d50XRm74YREvmPCZik2g2S2+nsShrdKEaTGaktlFjBPvxIBJBKs2Vl5ZcC3El+24ypteKmq0nU4L9hYnHIfTAs9cmSCux1jDde0C+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647317; c=relaxed/simple;
	bh=tZzhL1Wrhwyi+glKlZwiIhFsYadgWIqkxDKf51DDCOo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2ZLjTsUIkuNlQ9pcfLYgyxHLDkeV8FcFCHmsZB+3kAQymDigXseKI2Hyx3w+utzGff/a24kh4/Kqb4aOmaR3JDyqOVRzhSNjhuhyrbd38BS2XxirAL85Ngl/SK+fbZ8/zZKTyASoOu7AQlicjUMgZEm4H0KsaxULwceuWVumOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PKOOUFwM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BPu9yKfQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PKOOUFwM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BPu9yKfQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PKOOUFwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BPu9yKfQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PKOOUFwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BPu9yKfQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F44B210ED;
	Thu, 27 Feb 2025 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740647308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKUlxxj443QwKFoG2c1qfTGieAAKYm/ZmPHhDHoJCEw=;
	b=PKOOUFwMjuxIH5GCnd7Wu7g5rsDj3nGNsW9ZKCarnCVzbR2kmIzQv1yhldgMz+I+Eij1S7
	oTz47iWWNXWCqh0/FM09ccnYpO6W65zMDbffeABDS2bVi3rxG00M/owJjmrkaYJINNdkGP
	xEf9PImfL+yRrSBxJNBbMH8Vxnb/mlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740647308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKUlxxj443QwKFoG2c1qfTGieAAKYm/ZmPHhDHoJCEw=;
	b=BPu9yKfQJDAJ9/m78cyWcvaGR/MjD5YvZZZ7dCeDpB5ZHryKU4XJ30XEABQMVIbG3XZqKN
	971YpTmHM0fykxCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740647308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKUlxxj443QwKFoG2c1qfTGieAAKYm/ZmPHhDHoJCEw=;
	b=PKOOUFwMjuxIH5GCnd7Wu7g5rsDj3nGNsW9ZKCarnCVzbR2kmIzQv1yhldgMz+I+Eij1S7
	oTz47iWWNXWCqh0/FM09ccnYpO6W65zMDbffeABDS2bVi3rxG00M/owJjmrkaYJINNdkGP
	xEf9PImfL+yRrSBxJNBbMH8Vxnb/mlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740647308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKUlxxj443QwKFoG2c1qfTGieAAKYm/ZmPHhDHoJCEw=;
	b=BPu9yKfQJDAJ9/m78cyWcvaGR/MjD5YvZZZ7dCeDpB5ZHryKU4XJ30XEABQMVIbG3XZqKN
	971YpTmHM0fykxCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A30C13888;
	Thu, 27 Feb 2025 09:08:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kRjrAIwrwGeNDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Feb 2025 09:08:28 +0000
Date: Thu, 27 Feb 2025 10:08:27 +0100
Message-ID: <87r03j7o1g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel =?ISO-8859-1?Q?B=E1rta?= <daniel.barta@trustlab.cz>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] In order to get speakers working on ASUS P5405CSA laptop (ID 0x1043, 0x1f63), which are dependent on Cirrus CS3551 smart speaker amplifiers located on SPI bus, I had to add line that applies fixup ALC245_FIXUP_CS35L41_SPI_2 for this system. Fixup enables correct detection of aplifiers and asks for firmware files (which are available in official sound card drivers for Windows from Cirrus).
In-Reply-To: <20250226143348.137808-2-daniel.barta@trustlab.cz>
References: <20250226143348.137808-2-daniel.barta@trustlab.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -0.31
X-Spamd-Result: default: False [-0.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	LONG_SUBJ(2.99)[399];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 26 Feb 2025 15:33:49 +0100,
Daniel Bárta wrote:
> 
> Signed-off-by: Daniel Bárta <daniel.barta@trustlab.cz>

Could you fix the patch in a proper format and resubmit?
Namely, instead of putting all texts in the Subject line, give a
proper subject (e.g. "[PATCH] ALSA: hda: Fix speakers on ASUS
P5405CSA"), then put more patch descriptions in the body, finally put
your Signed-off-by.

Also, let's put patches@opensource.cirrus.com to Cc, so that they can
verify whether the added quirk for Cirrus code is correct.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 224616fbec4f..360131dd2d06 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10699,6 +10699,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x1043, 0x1f1f, "ASUS H7604JI/JV/J3D", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
> +	SND_PCI_QUIRK(0x1043, 0x1f63, "ASUS P5405CSA", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
>  	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
>  	SND_PCI_QUIRK(0x1043, 0x31d0, "ASUS Zen AIO 27 Z272SD_A272SD", ALC274_FIXUP_ASUS_ZEN_AIO_27),
> -- 
> 2.47.2
> 
