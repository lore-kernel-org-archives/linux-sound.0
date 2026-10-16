Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA74CDDC3
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159970; cv=none; b=KO3G73NULkqB08I2B8sLBr2CIzknxt8olBoEHEDzp3dnZjebYvJmSvZanD5zJjYnCjVGBbJRaFIRnYwe9am4kgIgg7LZxf5Q4R9EOYd4HH/qJQT6M5n83PjMSh1bBLUPDszX1m+fygBIC6vvlMhiOSUR/+QnbaoocjcXcvwxZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159970; c=relaxed/simple;
	bh=XkeCI4CQwmAdEBVqiyi23qjHYNXtPLdWdi24kW6C3bg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmNXyRayyf3JpK6iXmbl9LqJSPQo1LCfHH6HtEaey0uAqVC2WAJBiyUAvy+C2u9ZjKB2pSJKo5PojvdPHgAKYat7L49FVKlNKEWJuO1HKPhE993nHQEL/XRfeqq8lImTjHVzqi17XhbuZ6X94qNCyzOEYGdNPUvKtRz2AIccluQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t8J3ZxTR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+4FprJjE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t8J3ZxTR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+4FprJjE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t8J3ZxTR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4FprJjE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t8J3ZxTR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4FprJjE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A85B021B9F;
	Fri, 16 Oct 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792159957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FWNiEd+tCU5KWUjQZymH3LyO36LtgZUbDJ2d20bcroo=;
	b=t8J3ZxTRSYB1BXvWClcWbZSTUTJV9lljVPgMh+S5cSQ5pPbx8crd2+8nQQhpUokMyX2tGj
	ir5Xgz+W6qQnCQ2SEtl/ojjVYRuxSFxq1DNnTxMQGQZJB5jHrCPI5j62VwMCxxrkuQxuHS
	HRIYiX/oMqfpzPwRRy7Qd6sr9fdwX3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792159957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FWNiEd+tCU5KWUjQZymH3LyO36LtgZUbDJ2d20bcroo=;
	b=+4FprJjES9TZh4NPWRIiOFb+3sKLUZSP5D45y6Ve7EWD/bXnALm1yHD0SZ4qO7UDnVEI6O
	NGgxqe6UTauqd8Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792159957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FWNiEd+tCU5KWUjQZymH3LyO36LtgZUbDJ2d20bcroo=;
	b=t8J3ZxTRSYB1BXvWClcWbZSTUTJV9lljVPgMh+S5cSQ5pPbx8crd2+8nQQhpUokMyX2tGj
	ir5Xgz+W6qQnCQ2SEtl/ojjVYRuxSFxq1DNnTxMQGQZJB5jHrCPI5j62VwMCxxrkuQxuHS
	HRIYiX/oMqfpzPwRRy7Qd6sr9fdwX3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792159957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FWNiEd+tCU5KWUjQZymH3LyO36LtgZUbDJ2d20bcroo=;
	b=+4FprJjES9TZh4NPWRIiOFb+3sKLUZSP5D45y6Ve7EWD/bXnALm1yHD0SZ4qO7UDnVEI6O
	NGgxqe6UTauqd8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C9451339F;
	Fri, 16 Oct 2026 14:12:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L5QoEdUw0mrIDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 14:12:37 +0000
Date: Fri, 16 Oct 2026 16:12:36 +0200
Message-ID: <87bj8t3faj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Viktor Menshin <ripeeerr@gmail.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix hiss/crackle on Lenovo Xiaoxin 14 GT (17aa:3912)
In-Reply-To: <20261015132157.57198-1-ripeeerr@gmail.com>
References: <20261015132157.57198-1-ripeeerr@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 15 Oct 2026 15:21:57 +0200,
Viktor Menshin wrote:
> 
> Commit 3a3e810e9108 ("ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin
> 14 GT") added a quirk mapping SSID 17aa:3912 to
> ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, chosen by analogy with
> neighboring SSIDs (0x390d, 0x3911, 0x391a) without being verified on
> hardware, as noted in that commit's own message.
> 
> I have since tested it on the actual hardware (Lenovo Xiaoxin Pro 14
> ASP10, same 17aa:3912 SSID) and confirmed it does not fix the reported
> issue. ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN only repoints pin 0x17
> and the preferred DAC pairs for the bass speaker; it does not touch
> the codec's vendor processing coefficients. The actual symptom -
> constant electrical hiss/crackle on both the headphone jack and the
> internal speakers, independent of volume - is unrelated to pin/DAC
> routing and is also present on stock Windows before the Realtek
> driver is installed, which points at those coefficients being left
> at their power-on default.
> 
> To find the correct values, I passed the physical HD Audio controller
> through to a Windows 10 VM (VFIO, with QEMU patched to log CORB verb
> traffic) and captured the coefficient writes the vendor Realtek driver
> performs at init. Replaying a single one of them on Linux via hda-verb
> reproducibly eliminates the headphone jack noise:
> 
>     hda-verb /dev/snd/hwC#D0 0x20 SET_COEF_INDEX 0x36
>     hda-verb /dev/snd/hwC#D0 0x20 SET_PROC_COEF  0x77d7
> 
> This has held up across reboots and kernel updates for several weeks
> (applied via a small systemd oneshot unit while testing).
> 
> Add a dedicated fixup that performs this coefficient write and chains
> it with the existing ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN (which may
> still be relevant for the bass speaker pin wiring on this board), and
> point the 17aa:3912 quirk entry at it instead.
> 
> Honesty note: this fixes the headphone jack. The internal speakers
> still have noise under certain conditions (notably worse on AC power)
> that I have not been able to isolate via coefficient-table replay;
> that part remains open. Sending what is verified to work rather than
> holding this back.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221203
> Fixes: 3a3e810e9108 ("ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT")
> Signed-off-by: Viktor Menshin <ripeeerr@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
