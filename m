Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DE3AD538
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127690; cv=none; b=fp2DP0nHTQrU5/BSJJ4b8DLxPSEvJ9anAaszMyGfx8KpNxlRKPE1BPBxtTlqNWX8DCQbdRU6ZkQaVbxDttw5lWAEuxrhzH6CkFIMiXXJV0BXayVDD/TNbCa81Ju0HE0ExnVDJxwlGmZWHDZwsrG9l2ql2ryG8/+pDAe+/y+J6+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127690; c=relaxed/simple;
	bh=TUrpbegJM28xVMNIZBjsqo/usWRoPT4/45U4T4n0W5o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMQTbUV+jrBphwBctQHJh/uLTaXwIv35Iay4IFhr/Bl/D4JE5+piK+In3TjvpVl8hXRBdhWzXZzqgflynOT950wpjtXj02wRAhg+7qfM+/bmo1ALISbAGqu947JjzG5bRoNVVEMUpOP3s10I8kTdlJtRxS00pBFFX8tWInPI5Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pm+wr7xf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QA2etdJq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yIAlOPpD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Vc6Z5wU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pm+wr7xf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QA2etdJq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yIAlOPpD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Vc6Z5wU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 248A85BDAD;
	Thu,  2 Apr 2026 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775127685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRIieAaWk0A28DNqRH1fDK0tQhWZ89jpeJuzhLiecQs=;
	b=pm+wr7xfJ+BB3cpo6ou+g/HMaq1t/wYoBh9hqPEH/gotx0uaPEOjcuJksbmGoXzxYSCxOI
	3JwPfxLgEzjmC/lhq5fwIwVEFk2QQC1//qq7plREwp6EpPIJa8UnhbeT0H83qrxRYUwXPA
	cAIW6ctGRcOvz+nOBjHXoUmga3+ywT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775127685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRIieAaWk0A28DNqRH1fDK0tQhWZ89jpeJuzhLiecQs=;
	b=QA2etdJqXst6l2MsL62643OLnJ+/ut7G8uBTTZHmnGarvvS9/huVN7b63CE8pZFiklrETv
	OCWAJ1YOtZW2UbCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yIAlOPpD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3Vc6Z5wU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775127680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRIieAaWk0A28DNqRH1fDK0tQhWZ89jpeJuzhLiecQs=;
	b=yIAlOPpD5nD7tvhqQRPhMVgszEsFZ1n+KZ3fO6+NX2c6ABhNoSZY+yn+Kgn+jU0JU2duAO
	fZgqksE3DVHixcVSzUKz6yO61GgCJRhHQjp4tmEAptbmm9jpdd75SQoI9UaPEEmrmjssIQ
	UHvLefmoAsevLb/NnWX12ED7hgvlSQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775127680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRIieAaWk0A28DNqRH1fDK0tQhWZ89jpeJuzhLiecQs=;
	b=3Vc6Z5wUukU+v95AmlOSBGg9hhowm4xDWspjb4gRPdU+PQQGNUHRl4GIQWi4n9U+LnGBIq
	Oz3rIlQXIDTZPICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFF9D4A0B0;
	Thu,  2 Apr 2026 11:01:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DbZSOX9Mzmm2RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 11:01:19 +0000
Date: Thu, 02 Apr 2026 13:01:19 +0200
Message-ID: <87pl4hiq2o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Notify IEC958 Default PCM switch state changes
In-Reply-To: <20260401-hda-spdif-share-notify-v1-1-707e422ed9d1@gmail.com>
References: <20260401-hda-spdif-share-notify-v1-1-707e422ed9d1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,spdif_share_sw.name:url];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 248A85BDAD
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 02 Apr 2026 02:20:21 +0200,
Cássio Gabriel wrote:
> 
> The "IEC958 Default PCM Playback Switch" control is backed directly by
> mout->share_spdif. The share-switch callbacks currently access that state
> without serialization, and spdif_share_sw_put() always returns 0, so
> normal userspace writes never emit the standard ALSA control value
> notification.
> 
> snd_hda_multi_out_analog_open() may also clear mout->share_spdif when the
> analog PCM capabilities and the SPDIF capabilities no longer intersect.
> That fallback is still needed to avoid creating an impossible hw
> constraint set, but it changes the mixer backing value without notifying
> subscribers.
> 
> Protect the share-switch callbacks with spdif_mutex like the other SPDIF
> control handlers, return the actual change value from spdif_share_sw_put(),
> and notify the matching control when the open path forcibly disables
> shared SPDIF mode after dropping spdif_mutex.
> 
> This keeps the existing auto-disable behavior while making switch state
> changes visible to userspace.
> 
> Fixes: 9a08160bdbe3 ("[ALSA] hda-codec - Add "IEC958 Default PCM" switch")
> Fixes: 022b466fc353 ("ALSA: hda - Avoid invalid formats and rates with shared SPDIF")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/hda/common/codec.c | 51 ++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
> index 09b1329bb8f3..5e74b02c45f6 100644
> --- a/sound/hda/common/codec.c
> +++ b/sound/hda/common/codec.c
> @@ -2529,7 +2529,10 @@ EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_assign);
>  static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
>  			      struct snd_ctl_elem_value *ucontrol)
>  {
> +	struct hda_codec *codec = (void *)kcontrol->private_value;
>  	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
> +
> +	guard(mutex)(&codec->spdif_mutex);
>  	ucontrol->value.integer.value[0] = mout->share_spdif;
>  	return 0;
>  }

I think it's better to assign codec to private_data like others, and
put mout to private_value instead.

> @@ -2550,6 +2559,33 @@ static const struct snd_kcontrol_new spdif_share_sw = {
>  	.put = spdif_share_sw_put,
>  };
>  
> +static struct snd_kcontrol *find_spdif_share_sw(struct hda_codec *codec,
> +						struct hda_multi_out *mout)
> +{
> +	struct hda_nid_item *items = codec->mixers.list;
> +	int i;
> +
> +	for (i = 0; i < codec->mixers.used; i++) {
> +		struct snd_kcontrol *kctl = items[i].kctl;
> +
> +		if (snd_kcontrol_chip(kctl) == mout &&
> +		    !strcmp(kctl->id.name, spdif_share_sw.name))
> +			return kctl;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void notify_spdif_share_sw(struct hda_codec *codec,
> +				  struct hda_multi_out *mout)
> +{
> +	struct snd_kcontrol *kctl = find_spdif_share_sw(codec, mout);
> +
> +	if (kctl)
> +		snd_ctl_notify_one(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
> +				   kctl, 0);

We may extend struct hda_multi_out to store the assigned shared SPDIF
kcontrol pointer.  Then it's called directly without parsing at each
time.


thanks,

Takashi
