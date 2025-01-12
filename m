Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E992A8C1;
	Sun, 12 Jan 2025 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736670403; cv=none; b=ZNMVG75Zd35Z1xN/hXx66c6kFqmwJmdeYq83ubnptsImey0YWae/yx/tg4Iocv5XK9TqXrULj9G04EEae7RvYEDP+eFnj7ul2sfnhHWBWSr4HUMc9t5TD5kqzytsFXu8UZVkkjVWLXi4/JNWbdh2nGzkxcRWLtRNwERNW77P6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736670403; c=relaxed/simple;
	bh=RDFfPJEEtOJh0E6M1PllzOCMDR/c+JkgyltMD3vnOLE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SXVlsPVnm7WHSzBY29zcQC3lim3z5JcUvC2WRu9AVQGd159pLD7EE7EEeLjt/4iBCleIUb/bRqSYWINj+anCgutRg8v+Vo98nQTwh9QpE5Il4NM1ICBi2/wp9d64rkaO9rr433E7AdFJ6HOHYDsg97l2J0zTndhUq1FBaL4PrjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wmwBhSI0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CtisPImE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XSN61PxQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r9MEya5e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wmwBhSI0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CtisPImE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XSN61PxQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r9MEya5e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC8B021125;
	Sun, 12 Jan 2025 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736670399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xazF+EHPG2owoeb3OGiKKtYfoDMyLRKWHEBpJkME45o=;
	b=wmwBhSI0SU7YeyLicXYy3x4syps9cvFOTz3sWvLFoLIQJ+284Guf+02g7vZxvuGDG2ki7D
	R4jVMsUxjqwUTos4llwEHmY2cURoG18K8NDEDf6O/gdA6H5T+aZANFlweac2QiNWAa3u2X
	7QX2gXSx1cD4yf7Uo5aAOiXlZs3v5PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736670399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xazF+EHPG2owoeb3OGiKKtYfoDMyLRKWHEBpJkME45o=;
	b=CtisPImETgUoJgszAaSjy2D5Q1xIhbtH19H2UnXpr5IWQTmQjr4ErTNZ+HC4ZJAtDc9KQP
	x+kezsz+fnl515Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736670398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xazF+EHPG2owoeb3OGiKKtYfoDMyLRKWHEBpJkME45o=;
	b=XSN61PxQXQOJ3EtRu9nS9PlU/eCrN6bNM6qFZM8bzXEm5YYQx8z3mjhk1Nl25Yj4/uYyr1
	B/7ivi6Lfqz+yd16sCEzBf6CUHXXPGZHkG2HNMlEKr26wGXhPCgpU2rGgXLhU2Euugm13t
	sHxpJwGURY7JmKRRr0G0StF2QinOSxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736670398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xazF+EHPG2owoeb3OGiKKtYfoDMyLRKWHEBpJkME45o=;
	b=r9MEya5eV6R00tqHGvto3i8OxSoh1TC7IrT2kqaqFbf13jmfD5Um8K6+lVBrNvVggUhgH+
	nANyc1ZafhXWFeBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6016613961;
	Sun, 12 Jan 2025 08:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NRKwFb58g2eaUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 Jan 2025 08:26:38 +0000
Date: Sun, 12 Jan 2025 09:26:37 +0100
Message-ID: <87ldvgtp36.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <tiwai@suse.de>,
	<robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<antheas.dk@gmail.com>,
	<stuart.a.hayhurst@gmail.com>,
	<dan.carpenter@linaro.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects
In-Reply-To: <20250111095728.1232-1-baojun.xu@ti.com>
References: <20250111095728.1232-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,vger.kernel.org,intel.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 11 Jan 2025 10:57:28 +0100,
Baojun Xu wrote:
> 
> Driver will return error if no SUBSYS_ID found in BIOS(acpi).
> It will cause error in tas2563 projects, which have no SUBSYS_ID.
> Change strncmp to strcmp to avoid warning for weird length.

I don't understand the logic.
The use of strncmp() there already matches only with the exact string
"INT8866", not the substring, because you use sizeof("INT8866") which
is 8 including the NUL-terminator.
The only merit of strncmp() in this case is that it can be used for an
unterminated char array.

In which situation do you see the problem and how does your patch
improve / fix it?  Please give a more concrete example.


thanks,

Takashi

> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  sound/pci/hda/tas2781_hda_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 0e42b87dadb8..61aec92f6536 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -143,7 +143,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
>  	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
>  	if (IS_ERR(sub)) {
>  		/* No subsys id in older tas2563 projects. */
> -		if (!strncmp(hid, "INT8866", sizeof("INT8866")))
> +		if (!strcmp(hid, "INT8866"))
>  			goto end_2563;
>  		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
>  		ret = PTR_ERR(sub);
> -- 
> 2.43.0
> 
> 
