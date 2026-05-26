Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26026B764
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806130; cv=none; b=gMVL4iOIuN4N7XMcAAETbeH3cSiqjfCj7a53gYQMoy2/k8mIaLwbQKlc51gVoGOGtcNITapU0kk61+8Dp5r4UfSG1G0+FXCdFpXy4XK2Fbgc1VIHeQVq2aDjmEv+S1mF6j2qUwpAe7nlyaBN6xaj4mcuvY9LO96QEhrjN8H7K+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806130; c=relaxed/simple;
	bh=O9OY316oFE+kkCIdQkUcWGy4+IySAnEP8k9Mp7DdC4Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZbJ+uXCnvb8FTRisn3JM0f3XKiysrvInjkDH20oO235AlLBOZrwpLmozuIiQb+fId7EeOiZ1KSI31LozQnIeU7qFDMF7VnzYwE76TR5A6Urks/9Z1Eoxe6EiBctwB26afDMFfi+pFZg1rM2AVU8G2B99Nar//9DWznZvOVw3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I2O0XB/9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f53bhUMa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I2O0XB/9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f53bhUMa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I2O0XB/9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f53bhUMa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I2O0XB/9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f53bhUMa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67ACF6ABAC;
	Tue, 26 May 2026 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779806127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFqiYYu2NIr8MGXsw9VZfycsKZh+RxL5nQ/ttInFGM4=;
	b=I2O0XB/9kTaaRQugg6VwAOvFneRoAP7g2MkAOXbR9JjfL7Jee6Ucb+3+z4NKrkey9GWv7n
	mFbwZcu7vkbr6jOVtxK62eJYhJazg61ZiGhC5pqNr0p3bb43FYcUAYE7OneisyKLXDw+97
	BpT5fDGD1aQUrqSpzjHbgLePYCscJcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779806127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFqiYYu2NIr8MGXsw9VZfycsKZh+RxL5nQ/ttInFGM4=;
	b=f53bhUMap8J4liS3/lK+9sZdtuSIkAv3df9PMV7RKWGbLwu0/DouPsxWgm1A2HeE4OdRjB
	zKObkqRJOM25VjAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779806127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFqiYYu2NIr8MGXsw9VZfycsKZh+RxL5nQ/ttInFGM4=;
	b=I2O0XB/9kTaaRQugg6VwAOvFneRoAP7g2MkAOXbR9JjfL7Jee6Ucb+3+z4NKrkey9GWv7n
	mFbwZcu7vkbr6jOVtxK62eJYhJazg61ZiGhC5pqNr0p3bb43FYcUAYE7OneisyKLXDw+97
	BpT5fDGD1aQUrqSpzjHbgLePYCscJcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779806127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFqiYYu2NIr8MGXsw9VZfycsKZh+RxL5nQ/ttInFGM4=;
	b=f53bhUMap8J4liS3/lK+9sZdtuSIkAv3df9PMV7RKWGbLwu0/DouPsxWgm1A2HeE4OdRjB
	zKObkqRJOM25VjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 516225A25D;
	Tue, 26 May 2026 14:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EBc5E6+vFWqINQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 14:35:27 +0000
Date: Tue, 26 May 2026 16:35:27 +0200
Message-ID: <87mrxmxmq8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe Kuechler <uwe@kuechler.org>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Novation Mininova
In-Reply-To: <20260526133517.17485-1-uwe@kuechler.org>
References: <20260526133517.17485-1-uwe@kuechler.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 26 May 2026 15:35:17 +0200,
Uwe Kuechler wrote:
> 
> Add a device-specific quirk for the Novation Mininova synthesizer
> (USB ID 1235:001e) to enable proper recognition and functionality
> as a MIDI device.
> 
> Signed-off-by: Uwe Küchler <uwe@kuechler.org>
> ---
>  sound/usb/quirks-table.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 4e9cfff4047f..7ee7c7fc60ac 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -2131,6 +2131,15 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  		}
>  	}
>  },
> +{
> +	USB_DEVICE(0x1235, 0x001e),
> +	QUIRK_DRIVER_INFO {
> +		.vendor_name = "Novation",
> +		.product_name = "Mininova",
> +		.ifnum = 0,
> +		.type = QUIRK_MIDI_RAW_BYTES

A very slight optimization is to use QUIRK_DATA_RAW_BYTES(0) like
Novation Speedio or Nocturn (see the entries above yours).  Also, you
don't have to pass vendor_name and product_name fields unless the
firmware gives something bogus, too.


thanks,

Takashi
