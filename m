Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFAD339361;
	Sun, 23 Aug 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475629; cv=none; b=DKcmbt0RE/2vrl6Ziw2RCZ7/rdlXIvhoC5lwamElgOWljgEnplmExp5M1nv/miAWaN/fDCrtEBAb4ry7Ef4HWng3+kUNvTpQNfeeAvU1n3L8JV/9+WcNOZdDA7yqox1O5trHzjpiwsJe2bPiPs0Ix+g7xXL9TMDLzSa8sT13crE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475629; c=relaxed/simple;
	bh=OtQYl7A7doj1nRxT0QCPma4goulBBejMQmyeYzZ2E04=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OY3iiCb9T9C0dmQlXa8znH6+gdcUnbQjHiRSkw8WfHZER9mr66xgZw+bTNIwfpbfBgqmSndoklqLcG7fwXB2Vdy/7gw5ZZ2yvXiQTXVhY8steDTO0OXbDwcIU00Q5xZ1cVci4I/gOlDlYv4fmwDeX2cwJIkgCgXWatLGEbSb/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GWQ6wX7/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9sicZ8ju; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OgeEVREB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8moz7JWH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GWQ6wX7/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9sicZ8ju";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OgeEVREB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8moz7JWH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EAF98615A;
	Sun, 23 Aug 2026 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8TBrOtMHkY8C2ezmBC0IR7HRFaxx0ZgptuPG6yE9H8=;
	b=GWQ6wX7/3EFaM67rw16Fscs7DQQ7+EaXzrzOP/XrAz7njDZZu24fltR3a2ObvAMv4RUjQt
	j8tXBMTH+fRnETHr/A8Fq3A9WfioJQzUsJ1fU2eWtU66yu2s8jvsSQhBHNVAXrkmNV40ID
	9VIo2/g3j+TxjDQWUOYm+642XLRDgaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8TBrOtMHkY8C2ezmBC0IR7HRFaxx0ZgptuPG6yE9H8=;
	b=9sicZ8juhtwWRusKX7ZLO/LOFQiJKuegC6F19CCUaMlp49j9qJU+tfFoEuxYR/KWIyOwiQ
	gOXr6EjLMpzlepBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OgeEVREB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8moz7JWH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8TBrOtMHkY8C2ezmBC0IR7HRFaxx0ZgptuPG6yE9H8=;
	b=OgeEVREBX41qSr5swVESUNwmeakUoGyaarOjwpLjPXHfs486pxCifz16VMcGHIMB0+eNxw
	kDz++12K56effUwtzo/lF5iG5lpS2fgkN0MlUjjeTUCuh9DN9Pll/VIJGySiR2d5eL3Mj1
	K6I7+UxLZNMVyfySyuz3dIpwOFKDn1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8TBrOtMHkY8C2ezmBC0IR7HRFaxx0ZgptuPG6yE9H8=;
	b=8moz7JWHIU/6+g8zRDTZ2VFgFQy4DYI8Vl/L1iuQHo8KaH7PZuWeHr1jQWzyNNw0KEE8m0
	0Ub29EXUxSj39wAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D94113332;
	Sun, 23 Aug 2026 09:00:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Fl+SFaG2imrfCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 23 Aug 2026 09:00:17 +0000
Date: Sun, 23 Aug 2026 11:00:17 +0200
Message-ID: <87ik51w6se.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Blair <edward.blair@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flags for SMSL USB DAC
In-Reply-To: <20260822114110.1069541-1-edward.blair@gmail.com>
References: <20260822114110.1069541-1-edward.blair@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9EAF98615A
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sat, 22 Aug 2026 13:41:10 +0200,
Edward Blair wrote:
> 
> The SMSL USB DAC with USB ID 152a:85dd produces an audible pop
> when snd-usb-audio performs its redundant probe-time interface setup.
> It also pops when returning from runtime suspend.
> 
> Skip the probe-time interface setup and disable runtime autosuspend for
> this device. Both flags have been verified through the quirk_flags module
> parameter.
> 
> Keep QUIRK_FLAG_DSD_RAW in the device entry because the exact match takes
> precedence over the generic 0x152a vendor entry from which the device
> currently inherits that flag.
> 
> Signed-off-by: Edward Blair <edward.blair@gmail.com>

Applied now.  Thanks.


Takashi
