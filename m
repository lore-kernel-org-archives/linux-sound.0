Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFB7C8E6
	for <linux-sound@vger.kernel.org>; Sat,  4 Apr 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316092; cv=none; b=QC7GVcNlWwNkbOF5sFgnsCSrhihJ0/y2Vfj8FENhZfj7cf5qmS0lIThsAZyPoi1dzCL8TzO392PxRLMkGmmAha0A0bg4KS+hItG3ToSS3R7mm0bCC+V0ukpfU0+6hEX0H+mxzgD4Bc9aaxkN3VJDGUnlBG5pFiPjmDNTpBhyNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316092; c=relaxed/simple;
	bh=V7pgkdyFBKeaxTeCA0HTP0CkghDJ3q839cYEQFSAB2w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxkeYHqUdrfkKa88xs+Z/awk1Sd9YHM/kjPKaawzCR3T5Z09V7fsckIfuU/FfZrSeFRKdIO/Xhnkqatet94eM5VUL6wZo9NTtv4CnUoX+Z6pwotP+PtFaW0nv7g6yHXJFteL5pNAdyA/9XrrtHRyrAjeXmPTAvzY1cuWcy36FuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GbKZzKxi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ocsb54jJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XkUCTx20; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=th1Al/6W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GbKZzKxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ocsb54jJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XkUCTx20";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="th1Al/6W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6B2A4D213;
	Sat,  4 Apr 2026 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775316089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+rsFD4au9jhbB/pkFDsjWRPyAAQvH2glA+otrqoj3Q=;
	b=GbKZzKxiNUWpHVsn5EDx2eHWYJoCRRB55UIJ6xlBczK0riD260rynAGT6rApeosgaTHGv2
	tohIa3I53s6SZYVdtWmZIOkSia90RYeZlkYhWMQS/Eel7x8qhRXIM9wT9XuhywYkaHElCi
	Hj1zk9thYRJGcBBl6Tm13Q58qejwWH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775316089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+rsFD4au9jhbB/pkFDsjWRPyAAQvH2glA+otrqoj3Q=;
	b=ocsb54jJfltdpx6pOyV1dm5yBrnryh3KiUc5VNe4Vwd0lgjkjQXOfOGu7KtWkJb2RIU3IY
	BcifHbARIRWXz9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775316087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+rsFD4au9jhbB/pkFDsjWRPyAAQvH2glA+otrqoj3Q=;
	b=XkUCTx20ZYpYJ4OFXHdoXW6eIMo+y9k/9+Zbdyc8ra0wRhn6+KRjcSe/4S8Afzzl8wC84i
	UB1c75uzZbeZuypuQkJkudsF+JDBmMZrbQdm6i7GcZaA9VGIbTlM7zniKnds8/Zwz90dP9
	bYAMvdNDw8SBRUFUt0z3DBy4NAi9SHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775316087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+rsFD4au9jhbB/pkFDsjWRPyAAQvH2glA+otrqoj3Q=;
	b=th1Al/6WOT+jZn9MxtKNHz+iz/1yeIDLPDwjIbaL26IJfHBoaJ5DcRlsuKfGY+pi8ZRMS6
	9NgPyrHOF0XuasAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B876A4A0B0;
	Sat,  4 Apr 2026 15:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J6mLK3cs0Wl0fwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 04 Apr 2026 15:21:27 +0000
Date: Sat, 04 Apr 2026 17:21:27 +0200
Message-ID: <87zf3ihhu0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antti =?ISO-8859-1?Q?Jalom=E4ki?= <antti@nevaberry.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Force legacy HDA on Lenovo ThinkPad X1 Yoga Gen 5
In-Reply-To: <20260404144743.46466-1-antti@nevaberry.com>
References: <20260404144743.46466-1-antti@nevaberry.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.982];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,nevaberry.com:email,suse.de:mid]
X-Spam-Flag: NO

On Sat, 04 Apr 2026 16:47:43 +0200,
Antti Jalomäki wrote:
> 
> The SOF driver fails to initialize on the Lenovo ThinkPad X1 Yoga Gen 5
> with Intel Comet Lake PCH-LP cAVS [8086:02c8]. Add a DMI quirk to force
> legacy HDA driver selection for this device.
> 
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1120554
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2455066
> Signed-off-by: Antti Jalomäki <antti@nevaberry.com>

Have you tested with the latest kernel together with the latest
SOF-firmware?  Just to be sure, as your reports above didn't indicate
it, and ....

> ---
>  sound/hda/core/intel-dsp-config.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
> index f0a44fd11..179fe4d59 100644
> --- a/sound/hda/core/intel-dsp-config.c
> +++ b/sound/hda/core/intel-dsp-config.c
> @@ -269,6 +269,21 @@ static const struct config_entry config_table[] = {
>  		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
>  		.codec_hid =  &essx_83x6,
>  	},
> +	{
> +		.flags = 0,

... there is no other quirk entries setting like this.  It already
looks very special, and such a case is often due to other problems.


thanks,

Takashi

> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Lenovo ThinkPad X1 Yoga Gen 5",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +					DMI_MATCH(DMI_PRODUCT_FAMILY,
> +						  "ThinkPad X1 Yoga Gen 5"),
> +				},
> +			},
> +			{}
> +		}
> +	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> 
> base-commit: 9f2a23bd5d30dc0968e56a2b6e5edb58aff1bc6d
> -- 
> 2.53.0
> 
