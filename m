Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9B0329C79
	for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483482; cv=none; b=hLoQ3pbmo1UJUTcr/JfIWEigOpvZQ6EDoM4Ud/ofSejvhACaxyMHBZZPHrNIe4D31C8iB0cG3/OgIzcGSdHo7yKkWS1WVoFAvQJLgnPoqJlcPihsuCIahvH7bf4JYy4xA2qRiqsHJDElpje4K4EtrxTnbswuh/g4sV1lNI6inRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483482; c=relaxed/simple;
	bh=rj2KDvqajeZKh6bD8N++ziU+5IQmCtehzZjFlnBB1Hs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQNvK2VR+zCg7PeHsMVqYjWvj3/fBWZ50wle3tppPmOy8EPInmCQDn3ZRSKqTX6wSquHL0KLkvBddwtaeXdgqecKx1r/L7WCUzn4AyYCyWpGd0js8Nj2sp/pAPZYzT3dIfPWVhn0dVzKZjE8fPFMDyt15TIa50QkDIFNTW+fC9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x7r1AeQj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yMlHr4wZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P5YW6+7l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P8hnqYCL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x7r1AeQj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yMlHr4wZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P5YW6+7l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P8hnqYCL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25BDC5BCEA;
	Tue, 23 Dec 2025 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766483479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph8n9BGATIXhuzUbX0JP4qd4cBReSRDvGm6LpXpYS/I=;
	b=x7r1AeQjG4/E41SxLp5KaoDppG/imeiHenxDR9aJqOg5orw93NBSJNUR13ckGVOqfgfwrI
	So7Lvwzn12YiZtjAQGOIw6yRTzmI0bbcoOKaqxtoM/YOwtRd9xLRnA0rsWQrDBoLbIvIBv
	4pugosEp8uhW53T/foz1zvDZYnL/XkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766483479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph8n9BGATIXhuzUbX0JP4qd4cBReSRDvGm6LpXpYS/I=;
	b=yMlHr4wZssZedCdjaEEFHPNBP1CjWZ5B+dQD4j2B2a9BroucPl0LV7OD3aBHTdE/f9wVoW
	Bah+qgrUCIJvmhBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766483478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph8n9BGATIXhuzUbX0JP4qd4cBReSRDvGm6LpXpYS/I=;
	b=P5YW6+7lWJ6H5q/jFnnWtgHen/JWn8iTlI/eDRqf8WbU8kfhoOolmA3Hwy2Avreq6va0em
	3g6murNr2yRzZvXGDp39wkzseaG2Yui1QmqkfRHfJdQZLkMsaL6HJTmG4kl2lwLzs841r/
	3kMq1T0m+sF0/MLvxSnZDwws03ndI9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766483478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph8n9BGATIXhuzUbX0JP4qd4cBReSRDvGm6LpXpYS/I=;
	b=P8hnqYCLlrZKVgatzboXyPqFGnLYLdjJw12RrsL5kNkqyp/SQNjUURsVfB7bgV78WfvK/C
	v3d3UNhidd7UBsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6201A3EA63;
	Tue, 23 Dec 2025 09:51:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TZP6ExVmSmnaPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Dec 2025 09:51:17 +0000
Date: Tue, 23 Dec 2025 10:51:00 +0100
Message-ID: <87o6npil17.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: August Wikerfors <git@augustwikerfors.se>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi
 Iwai <tiwai@suse.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: properly initialize speaker_id for TAS2563
In-Reply-To: <20251222194704.87232-1-git@augustwikerfors.se>
References: <20251222194704.87232-1-git@augustwikerfors.se>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.16)[-0.799];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,augustwikerfors.se:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.26

On Mon, 22 Dec 2025 20:47:04 +0100,
August Wikerfors wrote:
> 
> After speaker id retrieval was refactored to happen in tas2781_read_acpi,
> devices that do not use a speaker id need a negative speaker_id value
> instead of NULL, but no initialization was added to the TAS2563 code path.
> This causes the driver to attempt to load a non-existent firmware file name
> with a speaker id of 0 ("TAS2XXX38700.bin") instead of the correct file
> name without a speaker id ("TAS2XXX3870.bin"), resulting in low volume and
> these dmesg errors:
> 
>     tas2781-hda i2c-INT8866:00: Direct firmware load for TAS2XXX38700.bin failed with error -2
>     tas2781-hda i2c-INT8866:00: tasdevice_dsp_parser: load TAS2XXX38700.bin error
>     tas2781-hda i2c-INT8866:00: dspfw load TAS2XXX38700.bin error
>     [...]
>     tas2781-hda i2c-INT8866:00: tasdevice_prmg_load: Firmware is NULL
> 
> Fix this by setting speaker_id to -1 as is done for other models.
> 
> Fixes: 945865a0ddf3 ("ALSA: hda/tas2781: fix speaker id retrieval for multiple probes")
> Cc: stable@vger.kernel.org
> Signed-off-by: August Wikerfors <git@augustwikerfors.se>

Applied now.  Thanks.


Takashi
