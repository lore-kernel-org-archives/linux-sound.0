Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614C1F3D54
	for <linux-sound@vger.kernel.org>; Sat, 12 Jul 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752308951; cv=none; b=l4OOFLwkh69/WORSsH3T2EU3TAtundP+3b3FUUeLI6kFZEzBcClx8LnKa2pzi7gTlGftFXu+hXlSALJt4LeowT8jLNDme4qVz/gWRrNcvF70/xDkEs0PH/PwDAqj1+U3WlUnpZ4NyqpEVztJidzdEyhuFd0zXi30fmuddwxUN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752308951; c=relaxed/simple;
	bh=o5OSowyX0g2NZm20gpmAfN8NRzD6c4FUxrFvjquJBdw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQnBtBo8zcj1S8SILX0Yd2235stRXl71anCJ/N/0AH33Yngu5jr/XGKJaWm08q35gg9wZxThxhKJlCNweR0Xw6mppLECy3CTBlFa9HJUoSxzdHr5pZ8see7RpHo04AKGFExrX9I2CjL7Tkr9iP0Sk6anoAeGdjzmEn0488lBRY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2UQI6HGo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sY3Nf1/k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HhzT0oVm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g8dpR2tz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2UQI6HGo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sY3Nf1/k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HhzT0oVm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g8dpR2tz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1DC51F388;
	Sat, 12 Jul 2025 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752308948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=2UQI6HGoRfa+2uWYxrcF77ASgzK4yIF8V/tOK/BvLpu1pZ/pci7AzVDUnDTTqFKuEPiiNd
	KTfXJAneuCHdoWJtQE9ETeehwam5kguzAHg4P2AXg2iGGnAHl8cSxPeRXaJny68/Rm6h1N
	ddvYivLf3UbDnDF8iGwsMkzHXyXFH+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752308948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=sY3Nf1/kR84u03nBJvFIYQNAUdvBTtSWv/yzHbAGmk3g6zUO3dGeXSXc+2Hfmd54Fy8TL1
	GG3edwuurp3LBABw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752308946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=HhzT0oVmj+AxKCW0yVg2W+QMtIIwokFrRQrx/ZfCNT3q/idp7lB/LvEuRsPVq2dMV2Pnvl
	pDveQ8EwOIQk+DeZHrmGq7tSRaIpk7MDE5YZXwMpzsweNpKUbP67Lh+jlF6xYwfBzN8KfK
	SDAGJhqQM0nvG0apfhlH8+9WiKbHi28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752308946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=g8dpR2tzIkAyQGmyA9V8uTCyh7OnDxN+BncBzKLnDQVhuwtKfx8cp7hUaevvfqaG7+Obkk
	A4eSA3uHoT5J/HBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A20EA138A1;
	Sat, 12 Jul 2025 08:29:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T2KyJdIccmiWcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Jul 2025 08:29:06 +0000
Date: Sat, 12 Jul 2025 10:29:06 +0200
Message-ID: <87ple5olrh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add TAS2770 support
In-Reply-To: <20250712081733.12881-1-baojun.xu@ti.com>
References: <20250712081733.12881-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,ti.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Sat, 12 Jul 2025 10:17:33 +0200,
Baojun Xu wrote:
> 
> Add TAS2770 support in HDA.
> Create a header file include/sound/tas2770-tlv.h,
> Set chip_id in i2c probe, check it while sound control is created,
> and the DSP firmware binary file parser.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  include/sound/tas2770-tlv.h     | 20 ++++++++++++
>  include/sound/tas2781.h         |  4 +++
>  sound/pci/hda/tas2781_hda_i2c.c | 58 +++++++++++++++++++++++++--------

The whole HD-audio stuff has been moved under sound/hda recently.
Please create a patch based on for-next branch of sound git tree.


thanks,

Takashi
