Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790E394496;
	Tue, 11 Aug 2026 06:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428756; cv=none; b=Vo8dWnoSGifCYxGaBGrieHBgXn8eUFQVMlBYYRSYvpMLFTvYZM+O4HNlpPvfiaNKc4hkeGReNLJ4YWA/xSpwxwiaYwmogphH+cwBVglRu4HVeKuwZIRdf4VoHpvWnnJgl74E1xt/BGKshlTDgZbMYrpvBYtASQN4TB/W+u5gtmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428756; c=relaxed/simple;
	bh=0fa2RpEDe7m5PzwbULvWwK7r1hekDDhfJ3jk5ZlBG+o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTu7q0pYRLFfyPHF/HK0SyRPXpMkaojYTMZODpQSRdNkWrHOk9StteJNo0lNnEl1cnOebVgUTvuz76S5URqJ+A1gUP1h4N0ZPLR59XbEO5ln46uQ+kc4Sj6qe4s3Sh7xdAqfYWCpLc8UlaTff/PX3pmKR4t96jlAfb/eskmr9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FCZaLARV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+nMENYoi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZSDP3Esb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tx2N76VG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FCZaLARV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+nMENYoi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZSDP3Esb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tx2N76VG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB710818AF;
	Tue, 11 Aug 2026 06:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r909K1vr4bt+yjSpS39hgHqirCgo+4AGbhqWtmyRg8o=;
	b=FCZaLARVXwUJPfc/nd86rV56Bsts6x+Us3XeL0oNXm1Y+VQ+AYdIRmGi3IaWVjvi5MpoYQ
	9grdT4/iBjTvw0gS9w9wyJLRwCbrth8H1g/rUxOiyOu57RaG1oHpzFwCbKtO6e9CRHCWcU
	57aWTzJ5BvDB9SBy6wSqVsmHlg7CwrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r909K1vr4bt+yjSpS39hgHqirCgo+4AGbhqWtmyRg8o=;
	b=+nMENYoiJEZORwbeyRU5kNHhN+Pcgzda6q3L2LaH8IPpzg5HjykibzOHRVHjtywGHSp2sD
	Nn5ZkJq6wxKfziBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r909K1vr4bt+yjSpS39hgHqirCgo+4AGbhqWtmyRg8o=;
	b=ZSDP3Esbw0qEOpSVKf+HC5xO2MQbUEH7l01YsjdzhoacV4V9bb+R911zqvfJwPQ267fW/4
	2g145tXh/VO2DqNFjexZVMLwz5OSS/XGk4ai5PHDoUOKLVFxmsykTTszRTaMmcFu8Q2rJs
	r1OCexS3WTcl+qp7RLIq11hlfJ7Qh9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r909K1vr4bt+yjSpS39hgHqirCgo+4AGbhqWtmyRg8o=;
	b=Tx2N76VGVS8aX6pb2m2AgbaJt0d9zpF7h3byAq8vVjZFG7pVkztNCXL5+/0dNER5fuHKaL
	5gokywzbgGzLWBCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87FE9779B6;
	Tue, 11 Aug 2026 06:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A9jkH0e9empNPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:12:23 +0000
Date: Tue, 11 Aug 2026 08:12:23 +0200
Message-ID: <87fr0lb2yg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Branislav Klocok <branislav.klocok@orava.sk>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: Rename Line Out control to Headphone on ThinkPad X1 Carbon 6th
In-Reply-To: <20260811024902.134457-1-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,orava.sk:email,kylinos.cn:email]

On Tue, 11 Aug 2026 04:48:59 +0200,
Zhang Heng wrote:
> 
> The ThinkPad X1 Carbon 6th Gen (ALC285, SSID 17aa:225c) has no physical
> Line Out jack. The 3.5mm headphone jack is wired to the headphone DAC,
> but the ALSA HDA driver names the corresponding control as
> "Line Out Playback Volume" (node 0x02).
> 
> PipeWire's ALSA Card Profile (ACP) silences "Line Out" when headphones
> are activated, which incorrectly mutes the headphone output.
> 
> Add a quirk to rename the control to "Headphone Playback Volume" via
> alc285_lenovo_dac_rename().
> 
> Tested on openSUSE Tumbleweed (kernel 7.1.5):
> - Control renamed successfully, no name collision with "Headphone Playback Switch"
> - Headphone output works across multiple PipeWire/WirePlumber restarts
>   and port switches
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221522
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> Tested-by: Branislav Klocok <branislav.klocok@orava.sk>
> ---
>  sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 6b36c730ce78..da9c816b8c4f 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -2572,6 +2572,13 @@ static void alc282_fixup_asus_tx300(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc285_lenovo_dac_rename(struct hda_codec *codec,
> +				     const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_BUILD)
> +		rename_ctl(codec, "Line Out Playback Volume",
> +			   "Headphone Playback Volume");
> +}
>  static void alc290_fixup_mono_speakers(struct hda_codec *codec,
>  				       const struct hda_fixup *fix, int action)
>  {
> @@ -6998,6 +7005,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
>  	},
> +	[ALC285_LENOVO_DAC_RENAME] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc285_lenovo_dac_rename,
> +	},
>  };
>  
>  static const struct hda_quirk alc269_fixup_tbl[] = {
> @@ -7956,6 +7967,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x224b, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>  	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>  	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
> +	SND_PCI_QUIRK(0x17aa, 0x225c, "Lenovo ThinkPad X1 Carbon 6th Gen", ALC285_LENOVO_DAC_RENAME),
>  	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST),
>  	SND_PCI_QUIRK(0x17aa, 0x2288, "Thinkpad X390", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
>  	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),

Hmm,  this patch is broken -- missing the definition of enum
ALC285_LENOVO_DAC_RENAME?


thanks,

Takashi
