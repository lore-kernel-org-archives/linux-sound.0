Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9F38DF9
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 07:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501540; cv=none; b=lmr0m8wz6z647m+VUwyrKFlaJQNpeY1+6Kqm8eKmFmPGEKsGDeE5OZbU3KVed40y8vx4+c7GEX4hIrzjFalMi12S9x+9cs5Uipvs0Kib+e9Mh7VMWwCo5HJ8ZUomE8+F07QfvQH9LucBWmhz1xuojoXoH4MmeBV8PbH6GWJOufc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501540; c=relaxed/simple;
	bh=Sn2yN4TfoaogRNoVFlNyfrtzw3hFIgoCTP/hcSXhKbo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3BtNzCyDfk4FAfzoS544O4yX2FaTREeMt+DRVlMQpPtdNsfwx4aXAYbxFbwFzf5FsGSGSeJxhH1wG+OrNh/lDvINSfochrKrp2QIpJ+x5DPiXDaFj8PsKnlGrmz1yEo8x3SO9PfEX0X32MOloSPbgsJHkOO7UnZ67O0203TC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0PeGqaOn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9oNKmt3u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0PeGqaOn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9oNKmt3u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0PeGqaOn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9oNKmt3u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0PeGqaOn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9oNKmt3u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B57D421253;
	Mon, 18 Aug 2025 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755501536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZWbQJexQHuJPePPh9k0HX/hq6W/VqtOGaq1VnyY0XQ=;
	b=0PeGqaOnQTAXjtxdLDKR1WAAgvraeJIvHntCvdzS7pzVFIyOqlR+HbkBgvf/wOWymPaFXG
	dL/+s6eCMtrzxQuNe1TiyYo6oIP9tNAKZBzeWadPHlkIH7a+E6AMI/0bOVf7CfixCmFhG3
	2c0qA1PF3sxZuJY6hdUFTwvYpotpx9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755501536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZWbQJexQHuJPePPh9k0HX/hq6W/VqtOGaq1VnyY0XQ=;
	b=9oNKmt3uXLsUtdsD1xFiLm5e7ZRbcx2w7rcqxr6bk8tmlCh53BscYdLsOh6dKHuKycVYwB
	DAv8gMuC3mxpneDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755501536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZWbQJexQHuJPePPh9k0HX/hq6W/VqtOGaq1VnyY0XQ=;
	b=0PeGqaOnQTAXjtxdLDKR1WAAgvraeJIvHntCvdzS7pzVFIyOqlR+HbkBgvf/wOWymPaFXG
	dL/+s6eCMtrzxQuNe1TiyYo6oIP9tNAKZBzeWadPHlkIH7a+E6AMI/0bOVf7CfixCmFhG3
	2c0qA1PF3sxZuJY6hdUFTwvYpotpx9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755501536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZWbQJexQHuJPePPh9k0HX/hq6W/VqtOGaq1VnyY0XQ=;
	b=9oNKmt3uXLsUtdsD1xFiLm5e7ZRbcx2w7rcqxr6bk8tmlCh53BscYdLsOh6dKHuKycVYwB
	DAv8gMuC3mxpneDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6666613A55;
	Mon, 18 Aug 2025 07:18:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v8uxF+DTomgJEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 Aug 2025 07:18:56 +0000
Date: Mon, 18 Aug 2025 09:18:55 +0200
Message-ID: <87bjodrtb4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Takashi Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Kailang <kailang@realtek.com>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH 23/27] ALSA: hda/hdmi: Rewrite to new probe method
In-Reply-To: <14a14afe-eea9-4888-95e1-9b82c1e855e8@mixaill.net>
References: <20250709160434.1859-1-tiwai@suse.de>
	<20250709160434.1859-24-tiwai@suse.de>
	<14a14afe-eea9-4888-95e1-9b82c1e855e8@mixaill.net>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Sun, 17 Aug 2025 12:55:48 +0200,
Mikhail Paulyshka wrote:
> 
> On 7/9/25 7:04 PM, Takashi Iwai wrote:
> > diff --git a/sound/hda/codecs/hdmi/intelhdmi.c b/sound/hda/codecs/hdmi/intelhdmi.c
> > index a88ac1f80db6..23237d527430 100644
> > --- a/sound/hda/codecs/hdmi/intelhdmi.c
> > +++ b/sound/hda/codecs/hdmi/intelhdmi.c
> > @@ -701,51 +698,104 @@ static int patch_i915_byt_hdmi(struct hda_codec *codec)
> >   }
> >     /* Intel IronLake, SandyBIridge and IvyBridge; with eld notifier
> > */
> > -static int patch_i915_cpt_hdmi(struct hda_codec *codec)
> > +static int probe_i915_cpt_hdmi(struct hda_codec *codec)
> > +{
> > +	return parse_intel_hdmi(codec);
> > +}
> > +
> > +/*
> > + * common driver probe
> > + */
> > +static int intelhdmi_probe(struct hda_codec *codec, const struct hda_device_id *id)
> >   {
> >   	int err;
> >     	err = alloc_intel_hdmi(codec);
> >   	if (err < 0)
> >   		return err;
> > -	return parse_intel_hdmi(codec);
> > +
> > +	switch (id->driver_data) {
> > +	case MODEL_HSW:
> > +		err = probe_i915_hsw_hdmi(codec);
> > +		break;
> > +	case MODEL_GLK:
> > +		err = probe_i915_glk_hdmi(codec);
> > +		break;
> > +	case MODEL_ICL:
> > +		err = probe_i915_icl_hdmi(codec);
> > +		break;
> > +	case MODEL_TGL:
> > +		err = probe_i915_tgl_hdmi(codec);
> > +		break;
> > +	case MODEL_ADLP:
> > +		err = probe_i915_adlp_hdmi(codec);
> > +		break;
> > +	case MODEL_BYT:
> > +		err = probe_i915_byt_hdmi(codec);
> > +		break;
> > +	case MODEL_CPT:
> > +		err = probe_i915_cpt_hdmi(codec);
> > +		break;
> > +	default:
> > +		err = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	if (err < 0) {
> > +		snd_hda_hdmi_generic_spec_free(codec);
> 
> Is this the intended behavior? It modifies the codec state even when
> it does not match any Intel model. We have reports from users on
> 6.17-rc1 with AMD BC-250 hardware experiencing HDMI audio detection
> issues. Adding a check for |EINVAL| resolves the problem.

Have you enabled CONFIG_SND_HDA_CODEC_HDMI_ATI?

The probe of intelhdmi.c is only for Intel chips, and no other devices
will be probed, as you can find in snd_hda_id_intelhdmi[] array.


thanks,

Takashi
