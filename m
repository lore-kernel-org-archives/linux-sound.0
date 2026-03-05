Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72CF3947BF
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710925; cv=none; b=eu5+wxqJmXnFrMSzi4c1iyymzhuHkFoZ1+C/L3AQx7HTzNPF2X0y60Mf4bkJ2ZvEsi77b6hu6td44SURQeGkV2v/XiILjG3pyMsJGgyEl3mFw0I1iofeNikwnTNMo1PKbOcncDL6OGpesBAP614MJcB0wqHOk67mtM27kOc6oog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710925; c=relaxed/simple;
	bh=YlSn5mhehtXexk0UgzHeWWi/zuHQUIO0OKDNwuVeRCE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdJsXPWY74fqw8UKdCleV2T4rOo6U9Gjg0hlMaMOC/ht/9AMJq4fEwzAb1RD2X9MZcNlLrstJgrS/AmgcqjSFM/Fg84KjIp0DOo+jxxYhhKrlLDssR9KLlJKqoHIe2uG/njEHq/5YkKY4fWMsyvlA4rT/z1p+QbMVVVr7tHbUoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fPERXZbC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PjUF/u6e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JVxue8mf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t93iDBFJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fPERXZbC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PjUF/u6e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JVxue8mf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t93iDBFJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC2A63F308;
	Thu,  5 Mar 2026 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jP9CLbf19R5CcuLKu2ibX3EboVfph6KN9N/LRN7agDk=;
	b=fPERXZbC9OHuYuN1UCufKnl/b2FfErlxR7DtApwz52eGizb0iipnR22lVWwyXqRLE+Au5k
	0MAXFPjvy4GKzm65TA5hcbfsCbvqYmhW8OMnQpqzVxKd5uEBWXCbCkHUpzZP6WhsZAfpR+
	pQe9s683BxIPUlcf8l4+AAlqtdNnsZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jP9CLbf19R5CcuLKu2ibX3EboVfph6KN9N/LRN7agDk=;
	b=PjUF/u6eLQr8ShyM4/JRVjFmIM7W2k8agTDTllxrVx8kAl117bRA6edqXCanG5wPlUEFBo
	6fIY/sdFwbxL79BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jP9CLbf19R5CcuLKu2ibX3EboVfph6KN9N/LRN7agDk=;
	b=JVxue8mf4zIrClxFUsOtYBOWTnzxdQEjKk9zQNW4lW2cATMMMbPKXfgEuR/Blh/5kRcrmX
	FwqFqkVKaZ9q9LV4p6dk+971N3g2zdsFxq7ItpvirIlFF4SNLfK8++pYMSkOuY/MDQvH4g
	ReFiGL+9WaKW2MIOFEoOVnZIvTwlxrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jP9CLbf19R5CcuLKu2ibX3EboVfph6KN9N/LRN7agDk=;
	b=t93iDBFJr2KHJce3XA4mYd3w4HNHTtMQEAbl7/+8FNrV4y8gKJG/L3BZk77eKlN92s6kb2
	xDSq/iSMoBGHcYBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A35AD3EA68;
	Thu,  5 Mar 2026 11:41:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V5SbJgdsqWlIPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 11:41:59 +0000
Date: Thu, 05 Mar 2026 12:41:59 +0100
Message-ID: <87bjh2y03c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 3/4] ALSA: hda/senary: Add dynamic EAPD control via playback hook
In-Reply-To: <20260305032741.236048-1-wangdich9700@163.com>
References: <20260305032741.236048-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 05 Mar 2026 04:27:41 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> To reduce power consumption and eliminate static noise during idle,
> this patch introduces dynamic EAPD switching. It hooks into the PCM
> playback stream to turn EAPD on only when audio is playing and off
> when the stream stops.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Hmm, this is usually controlled via runtime PM.


Takashi

> ---
>  sound/hda/codecs/senarytech.c | 37 +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
> index 8ebd974817ac..c589b3b01171 100644
> --- a/sound/hda/codecs/senarytech.c
> +++ b/sound/hda/codecs/senarytech.c
> @@ -132,6 +132,36 @@ static void senary_init_verb(struct hda_codec *codec)
>  	snd_hda_override_pin_caps(codec, 0x19, 0x2124);
>  }
>  
> +static void senary_set_port_eapd(struct hda_codec *codec, hda_nid_t nid, bool enable)
> +{
> +	unsigned char port_eapd = 0, eapd_value = enable << 1;
> +
> +	port_eapd = snd_hda_codec_read(codec, nid, 0, 0xf0c, 0x0);
> +	if (port_eapd != eapd_value)
> +		snd_hda_codec_write(codec, nid, 0, 0x70c, eapd_value);
> +}
> +
> +static void senary_playback_hook(struct hda_pcm_stream *hinfo,
> +		struct hda_codec *codec,
> +		struct snd_pcm_substream *substream,
> +		int action)
> +{
> +	struct senary_spec *spec = codec->spec;
> +	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> +	int i;
> +
> +	switch (action) {
> +	case HDA_GEN_PCM_ACT_PREPARE:
> +		for (i = 0; i < cfg->speaker_outs; i++)
> +			senary_set_port_eapd(codec, cfg->speaker_pins[i], true);
> +		break;
> +	case HDA_GEN_PCM_ACT_CLEANUP:
> +		for (i = 0; i < cfg->speaker_outs; i++)
> +			senary_set_port_eapd(codec, cfg->speaker_pins[i], false);
> +		break;
> +	}
> +}
> +
>  static void senary_auto_turn_eapd(struct hda_codec *codec, int num_pins,
>  			      const hda_nid_t *pins, bool on)
>  {
> @@ -270,6 +300,13 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	if (err < 0)
>  		goto error;
>  
> +	/* Register playback hook for dynamic EAPD control.
> +	 * Vendor driver applies this specifically for subsystem 0x14f10101,
> +	 * but we apply it broadly for SN6186 to fix noise issues.
> +	 */
> +	if (codec->core.vendor_id == 0x1fa86186)
> +		spec->gen.pcm_playback_hook = senary_playback_hook;
> +
>  	/* Some laptops with Senary chips show stalls in S3 resume,
>  	 * which falls into the single-cmd mode.
>  	 * Better to make reset, then.
> -- 
> 2.25.1
> 
