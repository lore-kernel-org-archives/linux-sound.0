Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B963486412
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206307; cv=none; b=K9T0HtqUP6Bk9QZpusBbP/BLqGLuXLop7WchFM95IUZce7/9L4KfgoBEP+G7LpRwPZ9qvmXmR5hjBGc1b1QI4IjWjjrP/n33qX3EN1/YJibGTYH9CSDLIbaP8UMzMjT8TFTzyOILpXvvYAGmloDqqgJb7rR4UUEmtXl2H/LlxfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206307; c=relaxed/simple;
	bh=gAZfvTUZPfA7+YQswbx6NcQ48nAEnTaT0R0kNP2ggPg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPo5gm++oVFDAYa/DhtyBpseJ05cuUrHGLeAtnzrgF3Uhpa3jrU/avC0cm87CWOpZElBlQN22aa7d3KJSq2KAKyaGcv0TmkfZku0GSM0FMfWjlUAhiXeIMapOqYeXB85Em+QcZmNUjfjWMMQOljCnwmR29EaU+ei4VLs3wSaa6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1MFBi1B9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EOJLaCXl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j5RK3I+d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AugFCksq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1MFBi1B9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EOJLaCXl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j5RK3I+d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AugFCksq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3813421D71;
	Mon,  5 Oct 2026 13:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791206292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iek6am4n6t3QAon3fsQ/2Z5r7Gg9LpL4ytdzR9iNgU4=;
	b=1MFBi1B9+IWExro9DtSkB1gtqQUGpMgjGvXWiIgoHjQuJOPousRktu0gUHljMJLOhNjYy2
	xJDwbP2EUMbfSCIMqxaynDzhQpF/5w4byycy4Arnp3pK0iCUeA4q+ClhQDW/3HFh+P54j5
	sQBpgBTA6AbFbFsXnCLs9e1CHUVxSqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791206292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iek6am4n6t3QAon3fsQ/2Z5r7Gg9LpL4ytdzR9iNgU4=;
	b=EOJLaCXlJtpaOQIrDyhU7aNZlmy7pDuJF5XAMbiGGGuZfghMdltTwdA2IPYEcJpBx4+T/V
	FNjr7jkNolkhMqCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j5RK3I+d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AugFCksq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791206288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iek6am4n6t3QAon3fsQ/2Z5r7Gg9LpL4ytdzR9iNgU4=;
	b=j5RK3I+d6QCMJLPsZUEEy1Loh7wBg6lBzgw63lD4ke9jaFh1tAsX5mmlh3ot3mWJ6uTVXz
	QNfacTJaNuHwlygJ9gnQQIZ8eotu4E71NcEo3z+c3qHbpgawazrlwRaQg9r011RV081dz7
	9E17N2mZtDfJhsGX9IW5T+oVVqAkk00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791206288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iek6am4n6t3QAon3fsQ/2Z5r7Gg9LpL4ytdzR9iNgU4=;
	b=AugFCksqSnJcSXjHphE0SDxe4UfwnvspVRI89CJLGahb2VukNiF050d+oWKqcoCJe9obqN
	Ogt9fVZFtaqqIbDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E80E613ADA;
	Mon,  5 Oct 2026 13:18:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ISJ4LY+jw2qDYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Oct 2026 13:18:07 +0000
Date: Mon, 05 Oct 2026 15:18:03 +0200
Message-ID: <87ece4s2us.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vadym Shevchuk <0xsheff@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Add quirk for Shanling UP4
In-Reply-To: <20261005125953.190316-1-0xsheff@gmail.com>
References: <20261005094433.32960-1-0xsheff@gmail.com>
	<20261005125953.190316-1-0xsheff@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3813421D71
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 05 Oct 2026 14:59:53 +0200,
Vadym Shevchuk wrote:
> 
> The Shanling UP4 (0a12:1244, CSR-based, UAC1, full speed) sets the
> MaxPacketsOnly bit in its AS isochronous endpoint descriptor. With
> UAC_EP_CS_ATTR_FILL_MAX set, the driver fills every 1 ms packet up to
> wMaxPacketSize, i.e. 48 frames, regardless of the sample rate. At
> 44.1 kHz the device expects 44/45 frames per packet and outputs only
> silence. 48 kHz works because both packet sizes are the same there.
> 
> Measured with aplay on hw:UP4,0, 4 s of S16_LE stereo:
> 
>   before: 44.1 kHz consumed at ~48030 frames/s, done in 3.68 s, silent
>   after:  44.1 kHz consumed at ~44220 frames/s, done in 4.00 s, audible
> 
> 48 kHz plays fine both before and after the change. Regular music
> playback at 44.1 kHz through PipeWire sounds fine as well.
> 
> Clear the attribute for this device, as is already done for the MOTU
> MicroBook IIc. Since the packet sizes are equal at 48 kHz, this does
> not change anything for other devices that may share this CSR USB ID
> and only use 48 kHz.
> 
> Link: https://lore.kernel.org/all/CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com/
> Signed-off-by: Vadym Shevchuk <0xsheff@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
