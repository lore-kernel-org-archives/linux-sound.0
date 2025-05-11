Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094C273FD
	for <linux-sound@vger.kernel.org>; Sun, 11 May 2025 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746972956; cv=none; b=bBUMeIdmZeX5zGS0AhPGwBO5o0+hG/JWklxiI3yQR1vVa+VVqkefBVxnC204z2UKP63DZC6A5hasoax/LS8vaDN9pn6TufCkLQh4UKh3f9+3yFhLcJ5+/CdKglyX5X+5RkL0vx/XHCHJeBwo+VgCCwBf3vsmAp1rOVrnC9eg5pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746972956; c=relaxed/simple;
	bh=jaMYniB2xI/qVMfe1AJzTdMD5qVMqkUftJDOtYtEWR0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsA8/yJIazoRgADWF7tDQ9udQe39mqrTotdNiLKXD5e46LkGZ+v2NwThNo+MyEsBDkcyz1hTBaa7fXexIC9LicBAJnpvVTmklqbJ4PRWY18xancx+v+aBsG1uzNutrl8Ylp/dDR+6SlS1dxem/ZiOSj/EtVX0gZWCDPRDESPwjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BQ8/9gDw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7WjPuoDm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BQ8/9gDw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7WjPuoDm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BQ8/9gDw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7WjPuoDm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BQ8/9gDw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7WjPuoDm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 656B01F390;
	Sun, 11 May 2025 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpe5BEzekExCBfkf7OFRh7W1iK9uPA6pu/JplZzxUCI=;
	b=BQ8/9gDwDNPlNT76QHhCMm2CQpqrpxweYQ37LPfYP/+hSz7Co/J8qN8dDHLxOY5ts6WOPZ
	touPI1eDUw7aIKJjiiys46UQ0UevXrE4OG0iPtQuXXpFm9aGhdt4Pc8hMR4bmGM1LGCcpV
	FttX5WiFDiZKpdP7RAUOFEXE38L5kE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpe5BEzekExCBfkf7OFRh7W1iK9uPA6pu/JplZzxUCI=;
	b=7WjPuoDmDnpHZdSK2oRbNtd+SUOj99gfuIW54NuFBxGzvwgmwR+LHs4T/qb8GjzKAR5JEj
	x5yCWg3lAm2b61BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="BQ8/9gDw";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7WjPuoDm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpe5BEzekExCBfkf7OFRh7W1iK9uPA6pu/JplZzxUCI=;
	b=BQ8/9gDwDNPlNT76QHhCMm2CQpqrpxweYQ37LPfYP/+hSz7Co/J8qN8dDHLxOY5ts6WOPZ
	touPI1eDUw7aIKJjiiys46UQ0UevXrE4OG0iPtQuXXpFm9aGhdt4Pc8hMR4bmGM1LGCcpV
	FttX5WiFDiZKpdP7RAUOFEXE38L5kE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpe5BEzekExCBfkf7OFRh7W1iK9uPA6pu/JplZzxUCI=;
	b=7WjPuoDmDnpHZdSK2oRbNtd+SUOj99gfuIW54NuFBxGzvwgmwR+LHs4T/qb8GjzKAR5JEj
	x5yCWg3lAm2b61BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3730513690;
	Sun, 11 May 2025 14:15:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fytDDBixIGg3bwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:15:52 +0000
Date: Sun, 11 May 2025 16:15:51 +0200
Message-ID: <87o6vzxmg8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: intel-nhlt: Print errors in intel_nhlt_ssp_device_type()
In-Reply-To: <20250508181446.25323-1-peter.ujfalusi@linux.intel.com>
References: <20250508181446.25323-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 656B01F390
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Thu, 08 May 2025 20:14:46 +0200,
Peter Ujfalusi wrote:
> 
> Do not fail silently when the intel_nhlt_ssp_device_type() fails as it can
> be for two reasons:
> The NHLT table is missing or the SSP instance is missing from the table.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Thanks, applied now to for-next branch.


Takashi
