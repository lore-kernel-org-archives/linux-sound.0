Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C925D3195EA
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557338; cv=none; b=nf49Ti3YOoDg8Fydj99gvs1a+IHyAenS7lbWMhEoHgWQfGLdX0dljPQbgv332UPhJQkbcfMEmeOuSj25g7EV32Qa2VtLBUX03RnPb0yR1Fgy9G2EjS/bPjYxroov8sUmg8JCZZJRUdaGVf6uOMjeNE7V3YVQLmraE0kWI3yQdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557338; c=relaxed/simple;
	bh=IeAbaUw6jMRJg0tfNJlC/gXHkrSErdjHl18v9R2hpMs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNJNbEK2PeALJimHjSVpnI2QJMUqqNLuWzj8YDbfonenFhHyajhY2Ur3nnf1UCnFckkCK9/OoyMvpb/KAWwsKWyGLjMNCPDbRfEMr5dVykJK4yAwbwgLFUVqowve1SfVqA83EKlpGQTFnvGoB42CDJSKo5QzK4x17MZa12tGnTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qWz1T+Kt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8o1/PHkF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UTFyGwo9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nHiKLNMQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qWz1T+Kt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8o1/PHkF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UTFyGwo9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nHiKLNMQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E1AE46A822;
	Thu, 30 Apr 2026 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777557334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ88mBgEQnBwE7BilEflY2Nf6nCDsjCFlpfUUOUln5E=;
	b=qWz1T+KtR7+O9By6TixjJgxWjYcO6caXaxGbOAc3tL39OGJhomxf2naecTzX4tZW02vHO0
	LJvVl67xrpRl43hm7aoj7R46EolAhl9UkdfsUw/GVr83PAT4SCpGkusMbZ/VlL1ASUi6Hq
	TjsJQ8YxHH3Vf6vjiihTsChB0uHPIXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777557334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ88mBgEQnBwE7BilEflY2Nf6nCDsjCFlpfUUOUln5E=;
	b=8o1/PHkF2elIkNW79J8i/9FWIcJKfefSlhJ0stEf+L29fRo0a/gYyyfQQRKYSyzqa7aIjp
	KJ9AxiPBUmpKR9BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777557333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ88mBgEQnBwE7BilEflY2Nf6nCDsjCFlpfUUOUln5E=;
	b=UTFyGwo9If7yGeKC1Qxsb0tLKPxi10c4zyOQJjScULWh4YClilkA6r6GCsi4aKJeTgZ1Mc
	4LFnt6DMcMk4Hwa5aRwgFYSGZ44XZZCYDUaUNp8YrXHYOL3uIFL8SzNiAycIxylMU3R8tS
	whUItSOz0LRUEQZMX8Bv4LBPyblLXEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777557333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ88mBgEQnBwE7BilEflY2Nf6nCDsjCFlpfUUOUln5E=;
	b=nHiKLNMQZnM0Gq2mlqpZ3UWNv9YIC6xAhvvqQyUQYvJlGfP+QwZAykCxQi0hgojY8cVplV
	Z193qHm6CB7nUiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0C24593B0;
	Thu, 30 Apr 2026 13:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TiAaJlVf82nIUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Apr 2026 13:55:33 +0000
Date: Thu, 30 Apr 2026 15:55:33 +0200
Message-ID: <87y0i4mu22.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: Wait for async firmware callback at unbind
In-Reply-To: <20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com>
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 30 Apr 2026 06:02:02 +0200,
Cássio Gabriel wrote:
> 
> The TAS2781 HDA I2C and SPI side-codec drivers queue the RCA
> firmware load with request_firmware_nowait() from component bind. The
> firmware loader keeps a device reference and pins the callback module,
> but it does not protect the driver's HDA private state from component
> unbind.
> 
> The callback dereferences tas_hda/tas_priv, takes codec_lock,
> creates ALSA controls, updates RCA/DSP state, runs runtime PM, and may
> load DSP and calibration data. Component unbind currently removes
> controls and DSP state immediately, and the later device remove destroys
> codec_lock through tasdevice_remove(). A delayed callback can therefore
> run after the HDA component state has been torn down.
> 
> Track the pending HDA RCA request with a completion. Mark it cancelled
> at unbind, let a callback that observes cancellation exit before parsing
> firmware or creating controls, and wait for any already-running callback
> before tearing down HDA controls and DSP state.
> 
> Clear cached kcontrol pointers as controls are removed, and when
> snd_ctl_add() rejects them, so a later cancelled or failed bind cannot
> remove stale controls from an earlier bind.
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Hmm, this looks too complex than needed.  Basically what we want is a
simple cancel or sync for async firmware loading work.  Once when such
a helper is provided, the rest in the HD-audio side will be just a
call of it at the remove or unbind.  And, I guess we can implement the
helper in the f/w loader with a help of devres or such.


thanks,

Takashi
