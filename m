Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BA220F49
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711356; cv=none; b=KgCOfSFDeSWwyU1L+CJk+VmmR8XVgt5VTRXbqv1NoKCOTaHNEe9n7CiQ7sWssAMvHY06JFQPIl5yOAFcu2svem78RqVM9K4Jv/69rrWvQTzrgBeFkaMKcmrCm6ef6Xdsx8WNf9QgQYgwWUHi2YI0/W5WrGHhz/nYXQdnMCaeNkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711356; c=relaxed/simple;
	bh=ZOojv0HFXE3145fKoB4RwRkZge09ZQORv6HIMVh0Hoo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HI2vogMrDDEHJKzn5VN43yoD8Z60KUpiVjYt4VpvUTygYF5ouDrTUVtOzD+Tbtlm5iyC6mOQCEe/N3p27D8uwpT8RgBo/a7Q6sKTdPZk494JmEm6ooWj9wHusmr+Uv69OOAzQIK0YHxfLdfXoVwq8vc0DySzhIlfJr/q0tvRiGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e+Nn8UHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Xx6BbEA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qSpft/86; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s+fH3zqZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e+Nn8UHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Xx6BbEA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qSpft/86";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s+fH3zqZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E72FF5BCE6;
	Thu,  9 Apr 2026 05:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775711353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6ZlIKS2JScbL455dt0yLmTQ+PXj5BbfkElB+f7isaM=;
	b=e+Nn8UHg01tT2DuvIRupp2uq/BoHiUqTViKKKp4zXvK6/8t7CF/CxoXrzazYZHsJk4VHOj
	xPyps8DF77Y/nhYEaIHl+VWGHYhrFv7cBFTch2Vkt10MvpQXg/gwx1dMvH9+3s+zlWrzid
	P8+gdrhNvZyKakk75cNjPcRoWmb7bx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775711353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6ZlIKS2JScbL455dt0yLmTQ+PXj5BbfkElB+f7isaM=;
	b=7Xx6BbEAXGIb7lmR2pAVZWjnFG5qaWf2UpwFVKgPlVixDOIr9xQ4KN4i9n/AzkWHKtMY0D
	U7y+Lhnrl8o3PUBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="qSpft/86";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s+fH3zqZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775711352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6ZlIKS2JScbL455dt0yLmTQ+PXj5BbfkElB+f7isaM=;
	b=qSpft/86a97Buqx3/UtE9Wb/5YeX864PZUfIRSQmJvmqi6l5G7lMXsDtJE1722D9VIvZp1
	xvyyoH5muiJRmTl9Zige3dTVkpyaknhxwjaeWDpGqOqckN5Wvt7IgaeH3fGrlbFeJ20AXS
	NFnfhRsMUv1oLVd2RadWrpRxG3k4Og8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775711352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6ZlIKS2JScbL455dt0yLmTQ+PXj5BbfkElB+f7isaM=;
	b=s+fH3zqZGpZIUnezuTDq7nJbrk/XN1AqznNmrXxXakJYa4gDEEkaAgZ122s6oL6IHuCRzA
	Rd6h/+remUDEQSAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A38C64A0B3;
	Thu,  9 Apr 2026 05:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fvRwJHg012nrRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 05:09:12 +0000
Date: Thu, 09 Apr 2026 07:09:12 +0200
Message-ID: <873414lnyf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
In-Reply-To: <20260409024028.1297587-1-zhangheng@kylinos.cn>
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E72FF5BCE6

On Thu, 09 Apr 2026 04:40:28 +0200,
Zhang Heng wrote:
> 
> The CSL Unity BF24B all-in-one PC uses a Realtek ALC662 rev3 audio
> codec and requires the correct GPIO configuration to enable sound
> output from both the speakers and the headphone.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221258
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/hda/codecs/realtek/alc662.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
> index 5073165d1f3c..3abe41c7315c 100644
> --- a/sound/hda/codecs/realtek/alc662.c
> +++ b/sound/hda/codecs/realtek/alc662.c
> @@ -255,6 +255,25 @@ static void alc_fixup_headset_mode_alc668(struct hda_codec *codec,
>  	alc_fixup_headset_mode(codec, fix, action);
>  }
>  
> +static void alc662_fixup_csl_amp(struct hda_codec *codec,
> +				 const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->gpio_mask |= 0x03;
> +		spec->gpio_dir |= 0x03;
> +		break;

Do we need to set gpio_mask and gpio_dir explicitly for this bit?
Looking at the rest of the patch...

> +	case HDA_FIXUP_ACT_INIT:
> +		/* need to toggle GPIO to enable the amp */
> +		alc_update_gpio_data(codec, 0x03, true);
> +		msleep(100);
> +		alc_update_gpio_data(codec, 0x03, false);
> +		break;

... here is the only place to fiddle with this GPIO bit, and it's used
for gating.  OTOH, spec->gpio_mask, gpio_dir and gpio_data are used at
alc_write_gpio() that is called from alc_init(), and IIUC, this bit
doesn't have to be initialized there.


thanks,

Takashi
