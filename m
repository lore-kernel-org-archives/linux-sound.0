Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71336C9C5
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166354; cv=none; b=ok5l4fEzqWazOcs3DjknUWuJ8PUVjE+gQ4GHR3URtd/YBieubXxaAaOX3TyUm2Q0QJoSCb7HEFD2bRD/BUW75oAj7pbG51VxMiQIJktFRXqtgwdmL71IKO+7l99Nn1N9LAA+2K+mW0AwjplJ9/xKPEgmABprHh1fTpS7/XWXwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166354; c=relaxed/simple;
	bh=Ae5+ihgoN/doKIx6Qs7/10ZxHAMZWQ2xj+VLEY4EkEA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6JPNU7/vgIHwcGj8HpPwaciFWZs3VLys9wPmbugnY2Hq4eKgDegQTzeEuHOtudz9nlpK+y52xXD5ZwL3XfBQHWLe/yHwXFFZ7EsYbdx4IiYAII6sCKKd9ZsPqOueb+ukFWrFxGigy+BpiBB8FPKFzI3Y5bBpnXf61/MzK5Lpxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vWTP1uWa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Bw0St0A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vWTP1uWa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Bw0St0A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vWTP1uWa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Bw0St0A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vWTP1uWa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Bw0St0A"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B9265D841;
	Thu,  7 May 2026 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778166347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMJBhSoqZS8Md3KcxH/iLgI3ugC8uwQu/As0PgqmTIk=;
	b=vWTP1uWa0jDmZQRCvHsV44wgFR3lqyr0EG05LqUDaFNPp33vYQvgmyCjHkidX1gvZetv/k
	B89FhoV+DoqlX2iKq88MGuMZKqO9BUQXuaI6YoSKhUpfBpfok7M46m7hbRQ24rh/Swv2/o
	aur/Nk7tSzY2Tgns/dBo4BongYiNc5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778166347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMJBhSoqZS8Md3KcxH/iLgI3ugC8uwQu/As0PgqmTIk=;
	b=/Bw0St0A1zgHsZdRfAwjMFcmoA4YWAF2IZw/F/SOyEoufEM3naF8NpQz2tO21pz535ZIby
	+0zakPH3TvjdviBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778166347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMJBhSoqZS8Md3KcxH/iLgI3ugC8uwQu/As0PgqmTIk=;
	b=vWTP1uWa0jDmZQRCvHsV44wgFR3lqyr0EG05LqUDaFNPp33vYQvgmyCjHkidX1gvZetv/k
	B89FhoV+DoqlX2iKq88MGuMZKqO9BUQXuaI6YoSKhUpfBpfok7M46m7hbRQ24rh/Swv2/o
	aur/Nk7tSzY2Tgns/dBo4BongYiNc5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778166347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMJBhSoqZS8Md3KcxH/iLgI3ugC8uwQu/As0PgqmTIk=;
	b=/Bw0St0A1zgHsZdRfAwjMFcmoA4YWAF2IZw/F/SOyEoufEM3naF8NpQz2tO21pz535ZIby
	+0zakPH3TvjdviBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47447593A7;
	Thu,  7 May 2026 15:05:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XWvGD0uq/Gn0WgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 15:05:47 +0000
Date: Thu, 07 May 2026 17:05:46 +0200
Message-ID: <87ecjnp8dx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Fwd: [PATCH] ALSA: hda/generic: Add mic autoswitch support for dyn_adc_switch mode
In-Reply-To: <a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
References: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
	<a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 06 May 2026 09:03:52 +0200,
Zhang Heng wrote:
> 
> 
> 
> 
> -------- 转发的消息 --------
> 主题: 	Re: [PATCH] ALSA: hda/generic: Add mic autoswitch support for
> dyn_adc_switch mode
> 日期: 	Wed, 6 May 2026 14:19:14 +0800
> 发件人: 	Zhang Heng <zhangheng@kylinos.cn>
> 收件人: 	Takashi Iwai <tiwai@suse.de>
> 
> 
> 
> 
> 在 2026/5/5 0:25, Takashi Iwai 写道:
> > On Sun, 03 May 2026 13:45:12 +0200,
> > Zhang Heng wrote:
> >> When auto_mic is not available but dyn_adc_switch mode is enabled
> >> (e.g., on laptops with both front and rear mic jacks), this patch
> >> enables automatic microphone switching based on jack detection.
> >> 
> >> The patch includes three changes:
> >> 
> >> 1. In check_dyn_adc_switch(): Register jack detect callbacks for
> >> all input pins when dyn_adc_switch is enabled and auto_mic is
> >> not available.
> >> 
> >> 2. In call_mic_autoswitch(): Add handling for dyn_adc_switch mode
> >> to check imux_pins[] for jack presence, searching from back to
> >> front (last inserted wins).
> >> 
> >> 3. In mux_select(): Notify Capture Source controls after switching
> >> to sync with user-space (PulseAudio/PipeWire).
> >> 
> >> Problem description:
> >> On Ubuntu 20.04 (with older PulseAudio/PipeWire):
> >> - Front mic is unplugged
> >> - Plug in rear mic
> >> - Jack event is reported correctly
> >> - Volume control (PulseAudio/PipeWire) recognizes the rear mic
> >> - But alsamixer does NOT switch to rear mic
> >> - Codec also does NOT perform the switch
> >> 
> >> The root cause is that in dyn_adc_switch mode without auto_mic,
> >> the jack detect callback was not properly set up to trigger the
> >> mic autoswitch. The call_mic_autoswitch() function only calls
> >> mic_autoswitch_hook or snd_hda_gen_mic_autoswitch(), which rely
> >> on auto_mic being enabled.
> >> 
> >> Additionally, after mux_select() performs the switch, user-space
> >> (PulseAudio/PipeWire) may not be aware of the path change,
> >> causing Capture Switch to show 'off'.
> >> 
> >> This patch fixes both issues by:
> >> 1. Registering jack detect callbacks for all input pins in
> >> dyn_adc_switch mode
> >> 2. Notifying Capture Source controls after switching
> >> 
> >> Tested on SN6186 codec with Ubuntu 20.04 and 25.10.
> >> 
> >> Question to the community: Is this approach correct? Should additional
> >> changes be made to handle mute state preservation, or is this purely
> >> a user-space issue that requires updating PulseAudio/PipeWire?
> >> 
> >> Testing and feedback are welcome.
> > I think the basic idea is OK. We can treat the auto-mic with dynamic
> > ADC switches, too.
> > 
> > But it's not clear what's the actual intent in your code changes:
> > 
> > 
> >> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> >> ---
> >> sound/hda/codecs/generic.c | 82 ++++++++++++++++++++++++++++++++++++--
> >> 1 file changed, 79 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
> >> index 660a9f2c0ded..c536de10d8b8 100644
> >> --- a/sound/hda/codecs/generic.c
> >> +++ b/sound/hda/codecs/generic.c
> >> @@ -27,6 +27,10 @@
> >> #include "hda_beep.h"
> >> #include "generic.h"
> >> +/* Forward declaration */
> >> +static void call_mic_autoswitch(struct hda_codec *codec,
> >> + struct hda_jack_callback *jack);
> >> +
> >> /**
> >> * snd_hda_gen_spec_init - initialize hda_gen_spec struct
> >> @@ -3238,6 +3242,19 @@ static int check_dyn_adc_switch(struct
> >> hda_codec *codec)
> >> if (!spec->dyn_adc_switch && spec->multi_cap_vol)
> >> spec->num_adc_nids = 1;
> >> + /* Enable mic autoswitch for dyn_adc_switch mode when auto_mic is
> >> not available */
> >> + if (!spec->auto_mic && imux->num_items > 1) {
> >> + int i;
> >> + for (i = 0; i < imux->num_items; i++) {
> >> + hda_nid_t pin = spec->imux_pins[i];
> >> + if (!is_jack_detectable(codec, pin))
> >> + continue;
> >> + snd_hda_jack_detect_enable_callback(codec, pin,
> >> + call_mic_autoswitch);
> >> + }
> >> + codec_dbg(codec, "Enable mic autoswitch for input sources\n");
> >> + }
> > IMO, this should be rather put at auto_mic_check_imux() instead,
> > something like:
> > 
> > @@ -4789,13 +4789,15 @@ static bool auto_mic_check_imux(struct
> > hda_codec *codec)
> > const struct hda_input_mux *imux;
> > int i;
> > - imux = &spec->input_mux;
> > - for (i = 0; i < spec->am_num_entries; i++) {
> > - spec->am_entry[i].idx =
> > - find_idx_in_nid_list(spec->am_entry[i].pin,
> > - spec->imux_pins, imux->num_items);
> > - if (spec->am_entry[i].idx < 0)
> > - return false; /* no corresponding imux */
> > + if (!spec->dyn_adc_switch) {
> > + imux = &spec->input_mux;
> > + for (i = 0; i < spec->am_num_entries; i++) {
> > + spec->am_entry[i].idx =
> > + find_idx_in_nid_list(spec->am_entry[i].pin,
> > + spec->imux_pins, imux->num_items);
> > + if (spec->am_entry[i].idx < 0)
> > + return false; /* no corresponding imux */
> > + }
> > }
> > /* we don't need the jack detection for the first pin */
> > 
> In fact, auto_ic_check_imux cannot be executed on desktop computers at
> all. You can take a look at the check_outo_ic_availability section
> for (int i = 0; i < cfg->num_inputs; i++) {
>     hda_nid_t nid = cfg->inputs[i].pin;
>     unsigned int attr;
>     attr = snd_hda_codec_get_pincfg(codec, nid);
>     attr = snd_hda_get_input_pin_attr(attr);
>     if (types & (1 << attr))        For desktop computers, the rear
> mic and line are an attr, which will be directly returned here.

Do you mean that the mic is no built-in mic?  If so, the auto-mic
isn't the way to go.

The driver can't judge which one has a higher priority between an mic
jack and a line jack.  OTOH, in the case of built-in mic vs mic jack,
it's clear who should win, and the driver provides the auto-mic
feature.  So, unless this condition is met, leaving the choice to
user-space is the designed behavior.


thanks,

Takashi
