Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD3A6A003
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 19:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710270046; cv=none; b=nKqFPouibPmiNyCBovrCrug4g49QgiCJsplDXedmpXFtVMOQUpbJwz9BATbLy0yQQzZn/5DcNHvlvsC/0E3mONrh5iBhkf4ObgZPHFoMgpw3uL1jM4CPDIbosUMSJmIEmTTFJ0bm6uVrFNw3nQuanedkepc2QRFoMK+Qkh09M9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710270046; c=relaxed/simple;
	bh=lDZjnhy60e0RSij4Y8L58VOEZKFRc9KgND2oGr3XqZc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sf3I+sgUlH0S1wXWbQt/ES3p2eECBD6Lw2Wq3AuuVr6NEe//J7Z2S0OjPRXcMoWaopP0sjIsTlFcOehyxb+ri5hN+ZX40Qevt4Z3WkQ7DKyI2y2ai0uD6EGFXgv0V85Pg0iqIzUczWJPV0B8cpdiLhotESe2stSx5QDmrGCL6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2NLU0NXK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lVOv5ZSR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2NLU0NXK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lVOv5ZSR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2NLU0NXK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lVOv5ZSR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2NLU0NXK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lVOv5ZSR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 42DF51F441;
	Tue, 12 Mar 2024 19:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710270043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K2l9pvmy9K/XS9ClndGj54uLv0o/ism2b17ysFL5ca0=;
	b=2NLU0NXK6FXxM6TaxD4SxwDzaUfJYzOzXj1PsECEtpln5EfJVrR2kkV0jwx+hBRjkzyVy4
	+dNAel1fEhEN3DRGz8bNBPhTN/q4gFztrT4FRmPp3gLVuSu3Mx4qha9PElakIRcr2aXbD6
	QE1zmc59zBM4+FxbNhs+FVEmgMAbjJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710270043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K2l9pvmy9K/XS9ClndGj54uLv0o/ism2b17ysFL5ca0=;
	b=lVOv5ZSRV18/p/MwsGwnF6Yeq3vbh5KfLnRAaYOcY46/56mp1k2RbRs0QibxiZ+/sqzUZr
	LXiJDIGdUQrnp8BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710270043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K2l9pvmy9K/XS9ClndGj54uLv0o/ism2b17ysFL5ca0=;
	b=2NLU0NXK6FXxM6TaxD4SxwDzaUfJYzOzXj1PsECEtpln5EfJVrR2kkV0jwx+hBRjkzyVy4
	+dNAel1fEhEN3DRGz8bNBPhTN/q4gFztrT4FRmPp3gLVuSu3Mx4qha9PElakIRcr2aXbD6
	QE1zmc59zBM4+FxbNhs+FVEmgMAbjJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710270043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K2l9pvmy9K/XS9ClndGj54uLv0o/ism2b17ysFL5ca0=;
	b=lVOv5ZSRV18/p/MwsGwnF6Yeq3vbh5KfLnRAaYOcY46/56mp1k2RbRs0QibxiZ+/sqzUZr
	LXiJDIGdUQrnp8BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C63513795;
	Tue, 12 Mar 2024 19:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJqfBVum8GUOfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Mar 2024 19:00:43 +0000
Date: Tue, 12 Mar 2024 20:00:42 +0100
Message-ID: <87jzm7p95x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/14] ALSA: scarlett2: Add support for Vocaster
In-Reply-To: <cover.1710264833.git.g@b4.vu>
References: <cover.1710264833.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.79 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.11)[66.33%]
X-Spam-Score: 0.79
X-Spam-Flag: NO

On Tue, 12 Mar 2024 19:28:52 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> This patch series contains:
> 
> 1-2: Fix to wait for an ACK from the device after sending a command,
> before attempting to read the response. This didn't seem to be
> necessary previously, but with 4th Gen devices it seems to help with a
> rare issue where the device stops responding.
> 
> 3: Support for reading flash segments from the device.
> 
> 4-11: Preparation for Vocaster support.
> 
> 12: Vocaster One and Two support.
> 
> 13: Add autogain target controls for 4th Gen and Vocaster.
> 
> 14: Add Bluetooth volume control for Vocaster Two.

As the merge window was already opened, I postpone this series to
6.10.  If there is any fix that should be taken to 6.9, please submit
separately.


thanks,

Takashi

> 
> Thanks,
> Geoffrey.
> 
> Geoffrey D. Bennett (14):
>   ALSA: scarlett2: Move initialisation code lower in the source
>   ALSA: scarlett2: Implement handling of the ACK notification
>   ALSA: scarlett2: Add support for reading from flash
>   ALSA: scarlett2: Rename gen4_write_addr to param_buf_addr
>   ALSA: scarlett2: Add pbuf field to struct scarlett2_config
>   ALSA: scarlett2: Add support for config items with size = 32
>   ALSA: scarlett2: Add additional input configuration parameters
>   ALSA: scarlett2: Define the maximum preamp input gain per-config-set
>   ALSA: scarlett2: Define autogain status texts per-config-set
>   ALSA: scarlett2: Add input mute controls
>   ALSA: scarlett2: Add DSP controls
>   ALSA: scarlett2: Add support for Focusrite Vocaster One and Two
>   ALSA: scarlett2: Add autogain target controls
>   ALSA: scarlett2: Add Bluetooth volume control for Vocaster Two
> 
>  sound/usb/mixer_quirks.c    |    2 +
>  sound/usb/mixer_scarlett2.c | 2757 ++++++++++++++++++++++++++++-------
>  2 files changed, 2235 insertions(+), 524 deletions(-)
> 
> -- 
> 2.43.0
> 
