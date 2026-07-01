Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4062C0260
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894626; cv=none; b=ClZ3RYdRQhy0G5Jx5+JaO2Jt92eWEWjSxWAR4g1UodkR5iXceZ8+Ex4njbIDS0GUWjNZjg00FT8D0uElx9xNDLuMuq/goOSRuB6xCQPu0eD1Z0Gw5gYqOnpNss1fNrza8DovNpvYMKh8/Tap3ujzZnG6TEzyykMpUWqItXOowpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894626; c=relaxed/simple;
	bh=huT1fZuKN/2ckM5oBoZk7h64yCIFLi3n5OGKZqQkL6s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eACm+507/cOBniTi9NT2Q53TlLytVAzZIcc5kDOPIdzEEa0WknDmLUJUDI3j/KKAsTFFvmsN3W1FG+MIRzMtyOoIlPaBlWZdJS5e4Dl1ANpPFq14+ODyMck4pSySVwr+sG/SSlv9/2TuKk/njH/bL7tAaAAOyIqGXCCyBPaoeCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=btIIf50c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSFbvj+6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l4Cd2dBY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nh6SmtH5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="btIIf50c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSFbvj+6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l4Cd2dBY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nh6SmtH5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF3BC71BB8;
	Wed,  1 Jul 2026 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782894623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIafWuVc++KEh/oK1eXMjht4pdHqqhwr3pJzJaw54A=;
	b=btIIf50cEJN57D28PGTc6E3dO39kNCm/3xy++o0zWeNhGJ6LvstdPTVhtetnBFUN2pijSb
	QV5X4dj8SbJxQoA1X5krfldXMwMMaYXEWL3G0HQJ76SDAy7U28uarHNqabJPn2+P50RaRE
	k7+IvoMzYb/9V8R4OHun5eDIz2bW7G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782894623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIafWuVc++KEh/oK1eXMjht4pdHqqhwr3pJzJaw54A=;
	b=hSFbvj+6Oo4cuPY8/7dYBENsxxgGWnw8eQlDV16JBgmXNIK6cKwooIPDNq3v8HRTYX+idz
	ZHHHCbRwdK3sEtAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l4Cd2dBY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nh6SmtH5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782894622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIafWuVc++KEh/oK1eXMjht4pdHqqhwr3pJzJaw54A=;
	b=l4Cd2dBYmU+rx2eYQZD4uaC2UBflPwwZJx4q0MxM+Gssgnxs7zLBN0IE8DL94YA+NGUPZA
	FAU1Zh2+7oGmm1yAb2ZE7qcMrNEaC9xBWYZFoeu9p/5aU3Pmj01RqOZ8Fm2FIsI/DCCowR
	FwtS6Wq8XrxuEW1hU0+Mv5Sj5Ipp3TQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782894622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIafWuVc++KEh/oK1eXMjht4pdHqqhwr3pJzJaw54A=;
	b=nh6SmtH58Gc9nVo5EWaw6ee775iVLzliLAQpH8oxDoaQtfxThKY7Q58aExlwi9kdfC7wHc
	ij/ydpIQSAnP8xCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FDE2779AA;
	Wed,  1 Jul 2026 08:30:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nenPJR7QRGoJVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jul 2026 08:30:22 +0000
Date: Wed, 01 Jul 2026 10:30:22 +0200
Message-ID: <87o6grun6p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: os_dengxiang82  <os_dengxiang82@126.com>
Cc: tiwai@suse.com,
	bo.liu@senarytech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on reboot
In-Reply-To: <235d28fc.65dd.19f1cc1a68d.Coremail.os_dengxiang82@126.com>
References: <20260701065533.72517-1-os_dengxiang82@126.com>
	<87se63upn1.wl-tiwai@suse.de>
	<235d28fc.65dd.19f1cc1a68d.Coremail.os_dengxiang82@126.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CF3BC71BB8
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[126.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[126.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 01 Jul 2026 10:18:00 +0200,
os_dengxiang82 wrote:
> 
> 
> Hi Takashi,
> 
>   This failure occurs during bootup as well as after runtime resume. Does
> runtime resume here refer to the resume handler, like .resume = cx_resume? or
> something else? Looking forward to your reply.

It's hda_codec_runtime_resume().  We have no Conexant-specific resume
callback, hence the standard procedure is applied, i.e.
regcache_mark_dirty() and snd_hda_regmap_sync() make the codec verbs
resumed that have been touched.  So, you'd need to check whether the
needed amp has been already accessed via regmap, and check whether the
value gets restored properly in the procedure above.


Takashi

> 
> xiang
> 
> At 2026-07-01 15:37:22, "Takashi Iwai" <tiwai@suse.de> wrote:
> >On Wed, 01 Jul 2026 08:55:33 +0200,
> >dengxiang wrote:
> >> 
> >> Some devices have mute settings in their firmware set by the factory.
> >> This is to stop popping noise when the devices turn on. But this setting
> >> makes the microphones unable to record sound properly. This patch
> >> solves this problem and is compatible with conexant chips.
> >> 
> >> Signed-off-by: dengxiang <os_dengxiang82@126.com>
> >
> >Hmm, this doesn't look like a right solution.
> >
> >Is it only the problem after the boot?  Or is it an issue after the
> >runtime PM suspend?  The amp value must be restored by the runtime
> >resume, and if this doesn't work expected, it's a thing to be
> >addressed there, not in the PCM hook at all.
> >
> >
> >thanks,
> >
> >Takashi
> >
> >> ---
> >>  sound/hda/codecs/conexant.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >> 
> >> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> >> index 3d92262763f6..3229f9ef5969 100644
> >> --- a/sound/hda/codecs/conexant.c
> >> +++ b/sound/hda/codecs/conexant.c
> >> @@ -1184,6 +1184,24 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
> >>                    spec->gen.dac_min_mute = true;
> >>  }
> >>  
> >> +static void cxt_fixed_mic_boost(struct hda_codec *codec, hda_nid_t node_id)
> >> +{
> >> +                  struct conexant_spec *spec = codec->spec;
> >> +                  unsigned int value = 0;
> >> +
> >> +                  value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
> >> +                  snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, value);
> >> +}
> >> +
> >> +static void cxt_capture_hook(struct hda_pcm_stream *hinfo,  struct hda_codec *codec,
> >> +                                                                     struct snd_pcm_substream *substream, int action)
> >> +{
> >> +                  struct conexant_spec *spec = codec->spec;
> >> +                  hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> >> +
> >> +                  cxt_fixed_mic_boost(codec, mux_pin);
> >> +}
> >> +
> >>  static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
> >>  {
> >>                    struct conexant_spec *spec;
> >> @@ -1271,6 +1289,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
> >>                    if (err < 0)
> >>                                          goto error;
> >>  
> >> +                  if (spec->gen.pcm_capture_hook == NULL)
> >> +                                        spec->gen.pcm_capture_hook = cxt_capture_hook;
> >> +
> >>                    /* Some laptops with Conexant chips show stalls in S3 resume,
> >>                     * which falls into the single-cmd mode.
> >>                     * Better to make reset, then.
> >> -- 
> >> 2.39.5
> >>
> 
