Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84F3B19CD
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562959; cv=none; b=q7n2JYXj7PpFA+Syl26JN9zAjpnCc3du+H6KMywOkJaXJYW1vjWiRt6f4X7aT/N5o/GPkpwH1qrSXFSdMSIcVrZC0ZEzk2uMixKXD+m2nEzie4BPurQfsl8NqufRoMPncWoov0s0iUO6Ys6CM826mNpQ5bkopE3LWfS/0aUYPKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562959; c=relaxed/simple;
	bh=f1yL4iCWL+Rx5vA2lAoP7srjr2gVT19OMNbcDyzsR5s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZWtjw6jeJmB0mkuOwL++SOgBxlTs8SEtpyzOB39IwTY4HQoVRveMMe5tdeUNwTbjZPJbnI5H7JPPPyisfbo2A8/cbqm/yPLZCF4ROqyQwzXvcG4/kupLgBPn92Bi6jJb81mgoIJgEcPqBrs4ZTPvm8FTmS4gKp+RgObfEUQq9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qs+LwB7b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VaNJWMgz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qs+LwB7b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VaNJWMgz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qs+LwB7b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VaNJWMgz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qs+LwB7b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VaNJWMgz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B4845BDD1;
	Tue,  7 Apr 2026 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775562955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMYkbt96t8w9WuI5dLUGS6doiL+PtLaI8OUZnzQXn3k=;
	b=Qs+LwB7bJ0W8u9Vp8uStSC5Pd2dMSFKc2sCCPjAGBEawS4tFhYue55R508q43DJ5VYQF3f
	/2ZOQTmVxrP8qy7ornPT8ztN2v/CpUKKxeeriB/FHEh+NbSxkhriMqyVSY/U0Favb0nOlu
	GRzBzhdQ1/e8aKwszntOuRll/NX0FOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775562955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMYkbt96t8w9WuI5dLUGS6doiL+PtLaI8OUZnzQXn3k=;
	b=VaNJWMgzCy4ac8ceqlEPmKi0FUQXiGBmK8rslcMZug7ISO1TBwZoEppQBDdsZ1uUFLBV7l
	lEZTsLsK4vor0EDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775562955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMYkbt96t8w9WuI5dLUGS6doiL+PtLaI8OUZnzQXn3k=;
	b=Qs+LwB7bJ0W8u9Vp8uStSC5Pd2dMSFKc2sCCPjAGBEawS4tFhYue55R508q43DJ5VYQF3f
	/2ZOQTmVxrP8qy7ornPT8ztN2v/CpUKKxeeriB/FHEh+NbSxkhriMqyVSY/U0Favb0nOlu
	GRzBzhdQ1/e8aKwszntOuRll/NX0FOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775562955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMYkbt96t8w9WuI5dLUGS6doiL+PtLaI8OUZnzQXn3k=;
	b=VaNJWMgzCy4ac8ceqlEPmKi0FUQXiGBmK8rslcMZug7ISO1TBwZoEppQBDdsZ1uUFLBV7l
	lEZTsLsK4vor0EDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2541C4A0B0;
	Tue,  7 Apr 2026 11:55:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMR4CMvw1GnucgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Apr 2026 11:55:55 +0000
Date: Tue, 07 Apr 2026 13:55:54 +0200
Message-ID: <87tstnm1bp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: tea6330t: add mixer state restore helper
In-Reply-To: <20260406-alsa-interwave-pm-v1-1-6ffa6f317c8f@gmail.com>
References: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
	<20260406-alsa-interwave-pm-v1-1-6ffa6f317c8f@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Tue, 07 Apr 2026 03:22:07 +0200,
Cássio Gabriel wrote:
> diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
> index e8c50a036bea..3e413929d3ea 100644
> --- a/sound/i2c/tea6330t.c
> +++ b/sound/i2c/tea6330t.c
> @@ -358,3 +358,36 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
>  
>  EXPORT_SYMBOL(snd_tea6330t_detect);
>  EXPORT_SYMBOL(snd_tea6330t_update_mixer);

Oh we need a cleanup to put EXPORT_SYMBOL() after each function.
(It should be a different patch, though.)

> +
> +int snd_tea6330t_restore_mixer(struct snd_i2c_bus *bus)
> +{
> +	struct snd_i2c_device *device;
> +	struct tea6330t *tea;
> +	unsigned char bytes[7];
> +	unsigned int idx;
> +	int err;
> +
> +	if (!bus)
> +		return -EINVAL;
> +
> +	list_for_each_entry(device, &bus->devices, list) {
> +		if (device->addr != TEA6330T_ADDR)
> +			continue;
> +
> +		tea = device->private_data;
> +		if (!tea)
> +			return -EINVAL;
> +
> +		snd_i2c_lock(bus);
> +		bytes[0] = TEA6330T_SADDR_VOLUME_LEFT;
> +		for (idx = 0; idx < 6; idx++)
> +			bytes[idx + 1] = tea->regs[idx];
> +		err = snd_i2c_sendbytes(device, bytes, 7);
> +		snd_i2c_unlock(bus);
> +
> +		return err < 0 ? err : 0;
> +	}

I think snd_i2c_lock() should cover the whole loop for the race at
linked list traversal.


thanks,

Takashi
