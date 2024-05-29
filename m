Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53F1591F8
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993158; cv=none; b=eCv7qogIiM5R6UJYIxuhTjGl42PNccXt3gnj7JNfFcWP4+EYkCX55oVQ16U+Em68I7lQD0WxGdhWBCvrntWgQZnlqCl2YG2l7Wb96kfTmZPel4na4WkhJZWlgIU1PiVp4BgdahWRNPvwQKTjz+BTp6KGPHaKC6ZkuCPAipmI5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993158; c=relaxed/simple;
	bh=D/JzpsPyWrwIPHjmMRoXwD1E32CNeYH+Dw6gnvEHSCI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxAj6JlLZ5zrqz1rxfNdZmYI1RcTMHB6S9T4vBFjxsBcH22oiwumB/0H+kGUdolIivevm7j9g7C6lf3yFl4TJ3ImB7sn7EgXxs2OpYsVFjZ90i/tA+cr87/1eDvbrDx/u3oGvqM6Mu7kv4tJ2MG2Q1goQ7l8QOH7tXg5fFXm6aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jjKj2PbO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4/nOokGV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RaGT+9OT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Oq54kbCB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jjKj2PbO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/nOokGV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RaGT+9OT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oq54kbCB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFDCF20577;
	Wed, 29 May 2024 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716993154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=jjKj2PbOnwHHa34pWqJFAvHVfGkBGuH9Wc2WADyUUA4rQ7m3qu1nQSBi4pNWR2lw7xOS07
	1LjMfNk7Xt4RMCrfnmJoh/glL1IyVGmZa2gIFvv+PzeDRHHuT636K+y9vzj5ldSBIVps+0
	L6FTkAjwGXQD4rfzf7jyBbgbLCbJhps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716993154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=4/nOokGVt/T/B+YciXOJNJbSDbS+lXSuvUJc9Yj2Nxbzhj7/NP1L99LwcnutzToW9TRiJB
	i4vAUvGkTXJ2ZaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716993153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=RaGT+9OTE5a3eXYMwxiMsbDqBQ3m6vdx70wnjAulhY4P6LpTCsleZK9IQGqCylNL3MlZ7H
	iZacUenRMWnMVemLjSah+MU3s7g/ci9ueisBsj8p7TgbzWryzrz0Sgb5Macl6ekvZ6Nno8
	XLdBUdhEbnbFV1AQDpqudjmtA0lNfTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716993153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=Oq54kbCBi9N90D1BHPVfluamU2BuO6UmVDu+xTvTKgZd9sCijzKzru1A2jP5KTPaCdkfi+
	a4Tymi8BtfSSYuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99F4A1372E;
	Wed, 29 May 2024 14:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oO5LJIE8V2Y3YQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 14:32:33 +0000
Date: Wed, 29 May 2024 16:32:54 +0200
Message-ID: <87fru04rjd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH 0/3] ACPI/ALSA/soundwire: add acpi_get_local_u64_address() helper
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
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
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 28 May 2024 21:29:32 +0200,
Pierre-Louis Bossart wrote:
> 
> The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
> we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
> extension where the native 64-bits are used. This patchset suggests a
> new helper, acpi_get_local_address() may be renamed if desired in a
> folow-up patch.
> 
> The path of least resistance would be to merge this patchset in the
> ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
> Device Class) that depend on the new helper.
> 
> Pierre-Louis Bossart (3):
>   ACPI: utils: introduce acpi_get_local_u64_address()
>   soundwire: slave: simplify code with acpi_get_local_u64_address()
>   ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
