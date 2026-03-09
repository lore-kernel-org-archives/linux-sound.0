Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DB374E46
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046926; cv=none; b=mV8oZtLljZAMdYn8LLgqPu+4RDeA/tvgWPcc6JxrsGN3VdGfeDQS1mQToHdvb+Ji01BampLB80EkrnLcEl92pVFF9SODsRR4oHh3o08GHFYIykFSdW6Im80ZYGA7uvpjRGDJ/WLQ0U6gXB2mB9j+DsPqz1FqP3JchdYnATSP4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046926; c=relaxed/simple;
	bh=lxsngedNTuJ2gxdr+o7pki8ATm6ddiUn0I9/Iw9jR1E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptO3I5fH6xyckM1iUHj83TOTwCJIO1/G1FY24uNoa9lSf9tQjR1pTIX9Y4qS/kCfZxe/gx9DeKXzdL/Bl6njfxrcOGxEeyFqx/9HPyuggEjDdsp8hichiAtvgm7CiHI6lb5JozykRy/j7yGZF0pErQuk3s5hy3m6AOuGLmkMCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wjHXkgGc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HQcSB+v6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0XQQeG5w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pBkLwdU2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wjHXkgGc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HQcSB+v6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0XQQeG5w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pBkLwdU2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 75DF75BE6D;
	Mon,  9 Mar 2026 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=06VzGyHQUpRC/vwJO3GlSm4DtVrwQk8z5oewQG32Z9A=;
	b=wjHXkgGcmDUss/w3UFCs4sXCKw5fwD+tCU0YedQs2V0OXcyR1qDr0O2olCWfdzrxH3V9rn
	8Iqjk8S5pxct81UnaMT/nDsMufDelFPzFkD2Itvyr4X+cofZW09fmwPIJyj5+wmhwb/7gZ
	ihBp94Ac1Be6RIK4bBJ2fm5CfT6SyEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=06VzGyHQUpRC/vwJO3GlSm4DtVrwQk8z5oewQG32Z9A=;
	b=HQcSB+v6BduBCAQjxbhiM9AgztCNmyMF62hA3zWkoszs8iUaiIDY7bh/ZgQXoVu/kvkapP
	DxgYnRSSKFzlAJBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=06VzGyHQUpRC/vwJO3GlSm4DtVrwQk8z5oewQG32Z9A=;
	b=0XQQeG5woYfVkGeyNroyDAWbNMlL+tLVYeyiHDAqG0KjZe4y5ZSDRzH+grOJIYF5NeB1XO
	dVkOUw460IJY8JC+8lDHDXhjxoNDvTE6JgG/jJlYIiL0+AtLMRFZCyFEKm/tTlEG80zzrY
	DtW56BD9MFYzmeGe44Nuj54Q8Z8s56I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=06VzGyHQUpRC/vwJO3GlSm4DtVrwQk8z5oewQG32Z9A=;
	b=pBkLwdU2jv4rpQ4rkXWNLP/rFu1uHC8rrdw2ehag98baUXPppaYa2b3jMJU0ziaok9IWAz
	j9FDjvMpbhVjjIDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 498683EDFE;
	Mon,  9 Mar 2026 09:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id umawEIqMrmmGTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 09:02:02 +0000
Date: Mon, 09 Mar 2026 10:02:01 +0100
Message-ID: <87ms0htlyu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uzair Mughal <contact@uzair.is-a.dev>
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
In-Reply-To: <20260307012906.20093-1-contact@uzair.is-a.dev>
References: <20260307012906.20093-1-contact@uzair.is-a.dev>
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
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sat, 07 Mar 2026 02:29:06 +0100,
Uzair Mughal wrote:
> 
> The Lenovo ThinkPad X390 (ALC257 codec, subsystem ID 0x17aa2288)
> does not report headset button press events. Headphone insertion is
> detected (SW_HEADPHONE_INSERT), but pressing the inline microphone
> button on a headset produces no input events.
> 
> Add a SND_PCI_QUIRK entry that maps this subsystem ID to
> ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK, which enables
> headset jack button detection through alc_fixup_headset_jack()
> and ThinkPad ACPI integration. This is the same fixup used by
> similar ThinkPad models (P1 Gen 3, X1 Extreme Gen 3).
> 
> Signed-off-by: Uzair Mughal <contact@uzair.is-a.dev>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index XXXXXXX..XXXXXXX 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6998,6 +6998,7 @@
>  	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>  	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> +	SND_PCI_QUIRK(0x17aa, 0x2288, "Thinkpad X390", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
>  	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
>  	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
> -- 
> 2.43.0

It looks like that the patch is malformed, failing one context line,
and neither git-am nor patch can't apply it cleanly.
Since the code change is trivial, I fixed it locally now.  But at the
next time, please make sure that the patch is really applicable.


thanks,

Takashi
