Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE83A63EF
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911921; cv=none; b=QRkGMzzIS3Gn0y0j5ug2lC64hEJ2qynidrg9Wmqo86PfE4VxrQSY6CuXK+2DNz5/rqIr/JEZFLz1UA0RnD/6Q9CKCaIACFymKxN4F2J3O+NtBmoT/6DAJtSc1ZQfZoWELPAgLEQvFCDkd3aLLVLOefDahd1FhCvcW6HSnaktciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911921; c=relaxed/simple;
	bh=XdfrbcS/YFQ9Qh6mYGosu8FTD1+BUe9Qz6ieMNA1G+E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZKV4GUdawfvmtWrzagEG4Lv8RkA+wraYz4ZauiIg5YvEaqqDovZevgF9PwQokFwIi05L+709sc+E8hE8FbLYZF1TzeMxuC+soU/3bRofTIOjHlRRl2DfgzxdT25pLk/nbO9FKtuFofq+lfuNOAkAKz0gEpuGxoV9bBVBELxhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mQBtQWx1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ct+IqGqz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mQBtQWx1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ct+IqGqz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mQBtQWx1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ct+IqGqz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mQBtQWx1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ct+IqGqz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C11375C5E0;
	Mon,  4 May 2026 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777911917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mBWYWqnzMdwj7yCW3o8A2zqbDR5lIQ/VE879I7+iLYo=;
	b=mQBtQWx1kyUSq5Lz4ONyWKiHWfZqVx9b94UclUkZHJ+L77xLmURssAEJI9WglY98qCObFL
	4DDbceQQCzFhdP4zO667L5Y04a6qxpcXSfjxUvNpJrnuwt9THJ22h57hkygXsp5yEHW07F
	t9DMXPBOLeOiRE0d+A3FJj4ldJefB9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777911917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mBWYWqnzMdwj7yCW3o8A2zqbDR5lIQ/VE879I7+iLYo=;
	b=Ct+IqGqzjZFHbX+KJwgVuHpAWtUwF71B9EyYD3dZmOoYxAGkzaWU7q8ZjdYHxyktG440ES
	+UyXFZqvBWNF8rAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mQBtQWx1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ct+IqGqz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777911917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mBWYWqnzMdwj7yCW3o8A2zqbDR5lIQ/VE879I7+iLYo=;
	b=mQBtQWx1kyUSq5Lz4ONyWKiHWfZqVx9b94UclUkZHJ+L77xLmURssAEJI9WglY98qCObFL
	4DDbceQQCzFhdP4zO667L5Y04a6qxpcXSfjxUvNpJrnuwt9THJ22h57hkygXsp5yEHW07F
	t9DMXPBOLeOiRE0d+A3FJj4ldJefB9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777911917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mBWYWqnzMdwj7yCW3o8A2zqbDR5lIQ/VE879I7+iLYo=;
	b=Ct+IqGqzjZFHbX+KJwgVuHpAWtUwF71B9EyYD3dZmOoYxAGkzaWU7q8ZjdYHxyktG440ES
	+UyXFZqvBWNF8rAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97038593A3;
	Mon,  4 May 2026 16:25:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zd8qI23I+GmHTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 16:25:17 +0000
Date: Mon, 04 May 2026 18:25:17 +0200
Message-ID: <87jytjw39u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/generic: Add mic autoswitch support for dyn_adc_switch mode
In-Reply-To: <20260503114512.331805-1-zhangheng@kylinos.cn>
References: <20260503114512.331805-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: C11375C5E0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.51

On Sun, 03 May 2026 13:45:12 +0200,
Zhang Heng wrote:
> 
> When auto_mic is not available but dyn_adc_switch mode is enabled
> (e.g., on laptops with both front and rear mic jacks), this patch
> enables automatic microphone switching based on jack detection.
> 
> The patch includes three changes:
> 
> 1. In check_dyn_adc_switch(): Register jack detect callbacks for
>    all input pins when dyn_adc_switch is enabled and auto_mic is
>    not available.
> 
> 2. In call_mic_autoswitch(): Add handling for dyn_adc_switch mode
>    to check imux_pins[] for jack presence, searching from back to
>    front (last inserted wins).
> 
> 3. In mux_select(): Notify Capture Source controls after switching
>    to sync with user-space (PulseAudio/PipeWire).
> 
> Problem description:
> On Ubuntu 20.04 (with older PulseAudio/PipeWire):
> - Front mic is unplugged
> - Plug in rear mic
> - Jack event is reported correctly
> - Volume control (PulseAudio/PipeWire) recognizes the rear mic
> - But alsamixer does NOT switch to rear mic
> - Codec also does NOT perform the switch
> 
> The root cause is that in dyn_adc_switch mode without auto_mic,
> the jack detect callback was not properly set up to trigger the
> mic autoswitch. The call_mic_autoswitch() function only calls
> mic_autoswitch_hook or snd_hda_gen_mic_autoswitch(), which rely
> on auto_mic being enabled.
> 
> Additionally, after mux_select() performs the switch, user-space
> (PulseAudio/PipeWire) may not be aware of the path change,
> causing Capture Switch to show 'off'.
> 
> This patch fixes both issues by:
> 1. Registering jack detect callbacks for all input pins in
>    dyn_adc_switch mode
> 2. Notifying Capture Source controls after switching
> 
> Tested on SN6186 codec with Ubuntu 20.04 and 25.10.
> 
> Question to the community: Is this approach correct? Should additional
> changes be made to handle mute state preservation, or is this purely
> a user-space issue that requires updating PulseAudio/PipeWire?
> 
> Testing and feedback are welcome.

I think the basic idea is OK.  We can treat the auto-mic with dynamic
ADC switches, too.

But it's not clear what's the actual intent in your code changes:


> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/hda/codecs/generic.c | 82 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 79 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
> index 660a9f2c0ded..c536de10d8b8 100644
> --- a/sound/hda/codecs/generic.c
> +++ b/sound/hda/codecs/generic.c
> @@ -27,6 +27,10 @@
>  #include "hda_beep.h"
>  #include "generic.h"
>  
> +/* Forward declaration */
> +static void call_mic_autoswitch(struct hda_codec *codec,
> +				struct hda_jack_callback *jack);
> +
>  
>  /**
>   * snd_hda_gen_spec_init - initialize hda_gen_spec struct
> @@ -3238,6 +3242,19 @@ static int check_dyn_adc_switch(struct hda_codec *codec)
>  	if (!spec->dyn_adc_switch && spec->multi_cap_vol)
>  		spec->num_adc_nids = 1;
>  
> +	/* Enable mic autoswitch for dyn_adc_switch mode when auto_mic is not available */
> +	if (!spec->auto_mic && imux->num_items > 1) {
> +		int i;
> +		for (i = 0; i < imux->num_items; i++) {
> +			hda_nid_t pin = spec->imux_pins[i];
> +			if (!is_jack_detectable(codec, pin))
> +				continue;
> +			snd_hda_jack_detect_enable_callback(codec, pin,
> +							    call_mic_autoswitch);
> +		}
> +		codec_dbg(codec, "Enable mic autoswitch for input sources\n");
> +	}

IMO, this should be rather put at auto_mic_check_imux() instead,
something like:

@@ -4789,13 +4789,15 @@ static bool auto_mic_check_imux(struct hda_codec *codec)
 	const struct hda_input_mux *imux;
 	int i;
 
-	imux = &spec->input_mux;
-	for (i = 0; i < spec->am_num_entries; i++) {
-		spec->am_entry[i].idx =
-			find_idx_in_nid_list(spec->am_entry[i].pin,
-					     spec->imux_pins, imux->num_items);
-		if (spec->am_entry[i].idx < 0)
-			return false; /* no corresponding imux */
+	if (!spec->dyn_adc_switch) {
+		imux = &spec->input_mux;
+		for (i = 0; i < spec->am_num_entries; i++) {
+			spec->am_entry[i].idx =
+				find_idx_in_nid_list(spec->am_entry[i].pin,
+						     spec->imux_pins, imux->num_items);
+			if (spec->am_entry[i].idx < 0)
+				return false; /* no corresponding imux */
+		}
 	}
 
 	/* we don't need the jack detection for the first pin */


>  	return 0;
>  }
>  
> @@ -4107,9 +4124,38 @@ static int mux_select(struct hda_codec *codec, unsigned int adc_idx,
>  	path = get_input_path(codec, adc_idx, idx);
>  	if (!path)
>  		return 0;
> -	if (path->active)
> -		return 0;
> -	snd_hda_activate_path(codec, path, true, false);
> +	if (path->active) {
> +		codec_err(codec, "[MUX] mux_select: path already active, skip activate but still notify\n");
> +	} else {
> +		snd_hda_activate_path(codec, path, true, false);
> +	}
> +
> +	/* Notify Input Source / Capture Source controls that the path has changed */
> +	if (!spec->auto_mic && spec->input_mux.num_items > 1) {
> +		struct snd_card *card = codec->card;
> +		struct snd_kcontrol *kctl;
> +		struct snd_ctl_elem_id id;
> +		int notified = 0;
> +
> +		codec_err(codec, "[MUX] mux_select: notifying controls, num_items=%d\n", spec->input_mux.num_items);
> +
> +		if (card) {
> +			list_for_each_entry(kctl, &card->controls, list) {
> +				if (kctl->id.iface != SNDRV_CTL_ELEM_IFACE_MIXER)
> +					continue;
> +				codec_err(codec, "[MUX] mux_select: found control '%s'\n", kctl->id.name);
> +				if (strncmp(kctl->id.name, "Capture Source", 14) == 0) {
> +					id = kctl->id;
> +					snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
> +					codec_err(codec, "[MUX] mux_select: notified '%s'\n", kctl->id.name);
> +					notified = 1;
> +				}
> +			}
> +		}
> +		if (!notified)
> +			codec_err(codec, "[MUX] mux_select: no Input/Capture Source control found!\n");
> +	}
> +

Hmm, I can't follow the logic here.  What does this code change try to
achieve...?

>  	if (spec->cap_sync_hook)
>  		spec->cap_sync_hook(codec, NULL, NULL);
>  	path_power_down_sync(codec, old_path);
> @@ -4602,6 +4648,36 @@ static void call_mic_autoswitch(struct hda_codec *codec,
>  				struct hda_jack_callback *jack)
>  {
>  	struct hda_gen_spec *spec = codec->spec;
> +	const struct hda_input_mux *imux;
> +	int i;
> +
> +	/* Handle dyn_adc_switch mode - use imux_pins[] */
> +	if (!spec->auto_mic && spec->dyn_adc_switch) {
> +		imux = &spec->input_mux;
> +		if (imux->num_items <= 1)
> +			goto fallback;
> +
> +		codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: dyn_adc_switch mode, checking %d inputs\n", imux->num_items);
> +
> +		/* Search from back to front (last inserted wins) */
> +		for (i = imux->num_items - 1; i >= 0; i--) {
> +			hda_nid_t pin = spec->imux_pins[i];
> +			int det = is_jack_detectable(codec, pin);
> +			int state = snd_hda_jack_detect_state(codec, pin);
> +			codec_err(codec, "[AUTO_MIC] call_mic_autoswitch:   imux[%d] pin=0x%02x, det=%d, state=%s\n",
> +				  i, pin, det, state == HDA_JACK_PRESENT ? "PRESENT" : "ABSENT");
> +			if (det && state == HDA_JACK_PRESENT) {
> +				codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: switching to imux %d\n", i);
> +				mux_select(codec, 0, i);
> +				return;
> +			}
> +		}
> +		/* No jack present, keep current selection (don't switch to imux 0) */
> +		codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: no jack present, keeping current\n");
> +		return;
> +	}
> +
> +fallback:
>  	if (spec->mic_autoswitch_hook)
>  		spec->mic_autoswitch_hook(codec, jack);
>  	else

Ditto.  Something too complex here.
mux_select() should handle the dynamic ADC switching, per se.

And, with the auto-mic mode, the driver shouldn't expose the Capture
Source mixer control.  That said, enabling the auto-mic would have a
clear downside for the user of PA/PW, too.


thanks,

Takashi
