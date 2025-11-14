Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DE21CDFD5
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126377; cv=none; b=TujWTzyD8z9kDrjdgtFCeOBCFZg+xHb19FJtFaULqOtYJ3UBhIxlGIg2vl3UQPhFbkb9gAXiFcd/hKQiYR495tqg2cDKGk6nwdozECw1P/3pcfQ5+RrGti/+2JjRPwZnD2ZjSCkrOrMpnH7cj8+91f8M9YXmVoSRoyG83GXaapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126377; c=relaxed/simple;
	bh=/5H13s1+FmnguMrf8JqVvBn7q/WqvLaU4iqUkVkPlpg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXmp2U27bxYQ659OBxoje8vwUecPDPyZi0iHqs0qGnuyNO1I+qQxEZ/oTGIJAVA3DF0x2Ed3m94EMj7vJkNM9mmtqUJNFfYwNpxeF2QVzr7lzHiBajONU0oQajx2jJ9E91u2lx7g7wuQ1LLlAeEHmXB67sSUQSeSvLS8f13603U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v5PXvHNG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FHucVrPx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I4e9R8QF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OGxVJZap; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v5PXvHNG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FHucVrPx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I4e9R8QF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OGxVJZap"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B9221F7B6;
	Fri, 14 Nov 2025 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763126374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htvzYg7EXto2qNvtaE+nMrNg+dFUuQITBTbB5jKtqzU=;
	b=v5PXvHNGr+zDLxttiqerNY5qrocQnOxjxx+QWMI1LxLGX/jfBeFVLIr8dCsp7yR2BPzO9v
	Fi1Z2e6ZdFP2Zw5ONJo39gT26E2KdJHuvkXcZR8BITva077iP9JomAWRQ4JdR03bYYM715
	A9d2/zT02/UkqJDhoNPAPTxSYbotc4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763126374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htvzYg7EXto2qNvtaE+nMrNg+dFUuQITBTbB5jKtqzU=;
	b=FHucVrPxf8gFYsyZSoe65penQqXxMjj3kem4+ASncmaQx4FFaQVSUuYJIzss8JwkWX2xS4
	GNXIz30cPwCyeeCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763126373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htvzYg7EXto2qNvtaE+nMrNg+dFUuQITBTbB5jKtqzU=;
	b=I4e9R8QFMkedlR04wOvrGD3tuF5Zai5yocBc5ZLHLOnQ8j5O93rZv6NFPI4MMtsp0Xgry8
	n3Tv/aNJ7Wh/fLjt5vdgHGe21gWHGPSFxC9178BvJ+dcTuCwWYUVfyfdxrVRmO78D+Ovef
	nwSbbDGUTw03vaOcFwCk5z2TOmoZzhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763126373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htvzYg7EXto2qNvtaE+nMrNg+dFUuQITBTbB5jKtqzU=;
	b=OGxVJZapCXvu+mLcZvrn0Wue9oqeD7/x5fCJ/h6Ht//qkjoanWd4UjQgS3hgGtHLsf8xbB
	Z7LCBfuImcwFnzCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56CA63EA61;
	Fri, 14 Nov 2025 13:19:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U6/zE2UsF2k4NgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Nov 2025 13:19:33 +0000
Date: Fri, 14 Nov 2025 14:19:32 +0100
Message-ID: <87o6p4iwez.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lushih Hsieh <bruce@mail.kh.edu.tw>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add native DSD quirks for PureAudio DAC series
In-Reply-To: <20251114052053.54989-1-bruce@mail.kh.edu.tw>
References: <20251114052053.54989-1-bruce@mail.kh.edu.tw>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kh.edu.tw:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 14 Nov 2025 06:20:53 +0100,
Lushih Hsieh wrote:
> 
> The PureAudio APA DAC and Lotus DAC5 series are USB Audio
> 2.0 Class devices that support native Direct Stream Digital (DSD)
> playback via specific vendor protocols.
> 
> Without these quirks, the devices may only function in standard
> PCM mode, or fail to correctly report their DSD format capabilities
> to the ALSA framework, preventing native DSD playback under Linux.
> 
> This commit adds new quirk entries for the mentioned DAC models
> based on their respective Vendor/Product IDs (VID:PID), for example:
> 0x16d0:0x0ab1 (APA DAC), 0x16d0:0xeca1 (DAC5 series), etc.
> 
> The quirk ensures correct DSD format handling by setting the required
> SNDRV_PCM_FMTBIT_DSD_U32_BE format bit and defining the DSD-specific
> Audio Class 2.0 (AC2.0) endpoint configurations. This allows the ALSA
> DSD API to correctly address the device for high-bitrate DSD streams,
> bypassing the need for DoP (DSD over PCM).
> 
> Test on APA DAC and Lotus DAC5 SE under Arch Linux.
> 
> Tested-by: Lushih Hsieh <bruce@mail.kh.edu.tw>
> 
> Signed-off-by: Lushih Hsieh <bruce@mail.kh.edu.tw>

Thanks, applied now.


Takashi
