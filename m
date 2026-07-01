Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728213BAD8B
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895860; cv=none; b=pmjh7aS7fYWzTOLu/kJb6gcNjDDv6kc8wydvayW4P8Qeqjyxv9NTS6MuFUT8DEEn7Z/snME5peklOoIORuAfaWuDCQhfpa+ZmLvg0oTAE9nQ7ve6G+CPULTeXfdCJz6a7zmPAyFfvN1ia8rE4V5m1obrJDXyfIe7ClSVdWkvT9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895860; c=relaxed/simple;
	bh=Y/cozOHSPQMMSo3WRLwd4rCT9ufJEqgOFGg/hQ9MpIY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzxCd4Dr8Ly7rSJpA3NprD5sdmShXCdc+LEFF81hPExi215loB0ls5M9C4QqJWQaWYhDUFOs7Bgs10JnJquJbG/ELCXEyE5coi/cCRWH2UhTEvw6o2L6rHKPJbASR9WHBrKFY1iDAdzByiunQEGHY8CIcojpl0GLnbmjDc5GOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gNfBPlta; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oGA3xDA7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gNfBPlta; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oGA3xDA7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gNfBPlta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGA3xDA7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gNfBPlta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGA3xDA7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E15071FB2;
	Wed,  1 Jul 2026 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782895856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YPd0gL7HTgwaLFo3KJqUZzD8DEDLOZM7IKoXS4xxKs=;
	b=gNfBPltaNe8Dg1MEeQ/r/Z9fjbGh86+jxUhQdRpjqQ2gwvgVe9aGhYJe3rxnU81Vcagm+3
	mhepgq3O7lgF6d/SPHFt6Uudb6SfOooTkf61pSOOoah3nPEBAjr1m0gdLNzvuhWgXl7XC6
	zXd6xSMPgjewS+ivQIfsdFRaPnZSRSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782895856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YPd0gL7HTgwaLFo3KJqUZzD8DEDLOZM7IKoXS4xxKs=;
	b=oGA3xDA7HAzDU5UTLlSrLq9wGtpts1V8f3Q4DkidQUc2mn57g3BGLzVC7dW5Gxx80octmE
	nxrDflCBLSeKfMDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782895856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YPd0gL7HTgwaLFo3KJqUZzD8DEDLOZM7IKoXS4xxKs=;
	b=gNfBPltaNe8Dg1MEeQ/r/Z9fjbGh86+jxUhQdRpjqQ2gwvgVe9aGhYJe3rxnU81Vcagm+3
	mhepgq3O7lgF6d/SPHFt6Uudb6SfOooTkf61pSOOoah3nPEBAjr1m0gdLNzvuhWgXl7XC6
	zXd6xSMPgjewS+ivQIfsdFRaPnZSRSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782895856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YPd0gL7HTgwaLFo3KJqUZzD8DEDLOZM7IKoXS4xxKs=;
	b=oGA3xDA7HAzDU5UTLlSrLq9wGtpts1V8f3Q4DkidQUc2mn57g3BGLzVC7dW5Gxx80octmE
	nxrDflCBLSeKfMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C59F779AA;
	Wed,  1 Jul 2026 08:50:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4nPrGPDURGqlagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jul 2026 08:50:56 +0000
Date: Wed, 01 Jul 2026 10:50:55 +0200
Message-ID: <87ldbvum8g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: os_dengxiang82  <os_dengxiang82@126.com>
Cc: tiwai@suse.com,
	bo.liu@senarytech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on reboot
In-Reply-To: <4932c551.6ece.19f1cdd10ba.Coremail.os_dengxiang82@126.com>
References: <20260701065533.72517-1-os_dengxiang82@126.com>
	<87se63upn1.wl-tiwai@suse.de>
	<235d28fc.65dd.19f1cc1a68d.Coremail.os_dengxiang82@126.com>
	<87o6grun6p.wl-tiwai@suse.de>
	<4932c551.6ece.19f1cdd10ba.Coremail.os_dengxiang82@126.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[126.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[126.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 01 Jul 2026 10:47:57 +0200,
os_dengxiang82 wrote:
> 
> 
> I have already tried calling regcache_mark_dirty() and snd_hda_regmap_sync()
> inside the resume callback, and I¢ve also attempted this during the bootup
> phase. But the issue is still present.

Then you need to investigate why this doesn't suffice, instead of an
ad hoc workaround :)  We can take a workaround fix, too, but only when
it's the only appropriate solution.


thanks,

Takashi

> At 2026-07-01 16:30:22, "Takashi Iwai" <tiwai@suse.de> wrote:
> >On Wed, 01 Jul 2026 10:18:00 +0200,
> >os_dengxiang82 wrote:
> >> 
> >> 
> >> Hi Takashi,
> >> 
> >>   This failure occurs during bootup as well as after runtime resume. Does
> >> runtime resume here refer to the resume handler, like .resume = cx_resume? or
> >> something else? Looking forward to your reply.
> >
> >It's hda_codec_runtime_resume().  We have no Conexant-specific resume
> >callback, hence the standard procedure is applied, i.e.
> >regcache_mark_dirty() and snd_hda_regmap_sync() make the codec verbs
> >resumed that have been touched.  So, you'd need to check whether the
> >needed amp has been already accessed via regmap, and check whether the
> >value gets restored properly in the procedure above.
> >
> >
> >Takashi
> >
> >> 
> >> xiang
> >> 
> >> At 2026-07-01 15:37:22, "Takashi Iwai" <tiwai@suse.de> wrote:
> >> >On Wed, 01 Jul 2026 08:55:33 +0200,
> >> >dengxiang wrote:
> >> >> 
> >> >> Some devices have mute settings in their firmware set by the factory.
> >> >> This is to stop popping noise when the devices turn on. But this setting
> >> >> makes the microphones unable to record sound properly. This patch
> >> >> solves this problem and is compatible with conexant chips.
> >> >> 
> >> >> Signed-off-by: dengxiang <os_dengxiang82@126.com>
> >> >
> >> >Hmm, this doesn't look like a right solution.
> >> >
> >> >Is it only the problem after the boot?  Or is it an issue after the
> >> >runtime PM suspend?  The amp value must be restored by the runtime
> >> >resume, and if this doesn't work expected, it's a thing to be
> >> >addressed there, not in the PCM hook at all.
> >> >
> >> >
> >> >thanks,
> >> >
> >> >Takashi
> >> >
> >> >> ---
> >> >>  sound/hda/codecs/conexant.c | 21 +++++++++++++++++++++
> >> >>  1 file changed, 21 insertions(+)
> >> >> 
> >> >> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> >> >> index 3d92262763f6..3229f9ef5969 100644
> >> >> --- a/sound/hda/codecs/conexant.c
> >> >> +++ b/sound/hda/codecs/conexant.c
> >> >> @@ -1184,6 +1184,24 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
> >> >>                    spec->gen.dac_min_mute = true;
> >> >>  }
> >> >>  
> >> >> +static void cxt_fixed_mic_boost(struct hda_codec *codec, hda_nid_t node_id)
> >> >> +{
> >> >> +                  struct conexant_spec *spec = codec->spec;
> >> >> +                  unsigned int value = 0;
> >> >> +
> >> >> +                  value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
> >> >> +                  snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, value);
> >> >> +}
> >> >> +
> >> >> +static void cxt_capture_hook(struct hda_pcm_stream *hinfo,  struct hda_codec *codec,
> >> >> +                                                                     struct snd_pcm_substream *substream, int action)
> >> >> +{
> >> >> +                  struct conexant_spec *spec = codec->spec;
> >> >> +                  hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> >> >> +
> >> >> +                  cxt_fixed_mic_boost(codec, mux_pin);
> >> >> +}
> >> >> +
> >> >>  static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
> >> >>  {
> >> >>                    struct conexant_spec *spec;
> >> >> @@ -1271,6 +1289,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
> >> >>                    if (err < 0)
> >> >>                                          goto error;
> >> >>  
> >> >> +                  if (spec->gen.pcm_capture_hook == NULL)
> >> >> +                                        spec->gen.pcm_capture_hook = cxt_capture_hook;
> >> >> +
> >> >>                    /* Some laptops with Conexant chips show stalls in S3 resume,
> >> >>                     * which falls into the single-cmd mode.
> >> >>                     * Better to make reset, then.
> >> >> -- 
> >> >> 2.39.5
> >> >>
> >>
> 
