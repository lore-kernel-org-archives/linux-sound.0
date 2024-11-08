Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9C1401C
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075427; cv=none; b=ABj3JD9Xn4TpOJPxjEasP7SfY9tYBhuY0+ym2R1AUyTgTXcXB77TGXCuRQCqRZ7AgZzRhMK0pLNqIR6mvp8I7xVW/KFHlb98mblb7rT8g4dD/hWfzzYXaPLIN90NppJslYBRhsgaLadz5wkp1AM8hB8Z8zEENZfFRojrrmAovcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075427; c=relaxed/simple;
	bh=SXtJlYh/CmaiRKf/vOQSprtRLOD2a6HQCSkCLyum5kQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qU2IisV9TWbwe/n7U/QZUXG7oq8KYQITMSvFN8FFVqM5wwe371EdU1mpACWxTw9bFfyQ4SvToyNx81QUUD1KDM8e7n8dFWWLZ+hIxvmWF1M7XlyGdYQREmvBSJcbUQkQ+hs8hBK2Jrk1+OfD/RXTCDJOgRs60bZazr7u4vytu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UcfQlmLB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UMfMEkyH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UcfQlmLB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UMfMEkyH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UcfQlmLB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMfMEkyH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UcfQlmLB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMfMEkyH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D50021EB5;
	Fri,  8 Nov 2024 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731075424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrNX/E+QX++uSpfMlSC/hks/HhMRcBIBL6sXNDgxW28=;
	b=UcfQlmLBIzUFzWfxWmNRZH93T9vbqBxYuLS8Q4vr9zBhMtS4qRFwc92BQQOEyfw/obt+3u
	FxNqNXw3ABY6oaLGPGQ+x3ZjWgsBVJ1Ohz4TntvuqVOT3CV36Dn5jjW4b6DSIhPDSPg+VI
	dxsdq5mDFPxQxW69Rf0W8pJqx9n5JC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731075424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrNX/E+QX++uSpfMlSC/hks/HhMRcBIBL6sXNDgxW28=;
	b=UMfMEkyHlXn9zt4mjDCeRTY4qPUVpY0kQ7UjBk3OEiMyuTYQxN1cP0kKOffMxgBmuSfmhZ
	v9zOIC+QGcMckHBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731075424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrNX/E+QX++uSpfMlSC/hks/HhMRcBIBL6sXNDgxW28=;
	b=UcfQlmLBIzUFzWfxWmNRZH93T9vbqBxYuLS8Q4vr9zBhMtS4qRFwc92BQQOEyfw/obt+3u
	FxNqNXw3ABY6oaLGPGQ+x3ZjWgsBVJ1Ohz4TntvuqVOT3CV36Dn5jjW4b6DSIhPDSPg+VI
	dxsdq5mDFPxQxW69Rf0W8pJqx9n5JC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731075424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrNX/E+QX++uSpfMlSC/hks/HhMRcBIBL6sXNDgxW28=;
	b=UMfMEkyHlXn9zt4mjDCeRTY4qPUVpY0kQ7UjBk3OEiMyuTYQxN1cP0kKOffMxgBmuSfmhZ
	v9zOIC+QGcMckHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B52D13967;
	Fri,  8 Nov 2024 14:17:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fj04DWAdLmcyAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 08 Nov 2024 14:17:04 +0000
Date: Fri, 08 Nov 2024 15:17:03 +0100
Message-ID: <87a5e9g68w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
	<87o730uttl.wl-tiwai@suse.de>
	<5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
	<87ikt7v028.wl-tiwai@suse.de>
	<74e49336-4552-4224-9b14-204d4264d647@gmail.com>
	<871pzuujkc.wl-tiwai@suse.de>
	<18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 02 Nov 2024 23:45:33 +0100,
Jaros³aw Janik wrote:
> 
> On 11/2/24 09:27, Takashi Iwai wrote:
> 
> > For checking the runtime-suspend, at best check the sysfs file entry.
> > e.g. cat /sys/bus/hdaudio/devices/hdaudioC0D0/power/runtime_status
> 
> OK, so - just to be sure - I verified my assumptions about PM state of
> HDA controller when "nothing interesting is happening" (suspended) and
> for a short while after I generate a beep on a console (active) - so not
> a huge surprise here :)

A beep sound triggered via the input beep device -- the one from
HD-audio driver, not from pcspkr -- does resume the runtime suspend.
So it's no surprise that it works.

OTOH, a question is rather the other route -- the beep via pcspkr
driver -- if this beep still works while the HD-audio is runtime
suspended: that's the interesting point.  Could you check that?
You can figure out which input device corresponds what, and try to
trigger directly there.

Also, one more question is whether the beep tone persists if you mute
the volume on the HD-audio (e.g. set "Speaker Playback Switch" to
off).  The beep tone at shutdown should be gone in this state, too.

> > As you see, the simple beeping stuff is really complex due to its
> > history.  Although it's a legacy feature, a few people still love it,
> > hence it can't go away soon :)
> 
> OK, so (again - just to be sure) - I understand that you are going to
> revert that patch this is all about (no more tests or whatever needed
> from my side)?

Yes, the revert is on the way to 6.12-rc7.


thanks,

Takashi
