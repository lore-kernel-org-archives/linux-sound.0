Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7854C2242
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951514; cv=none; b=s8/jpUMZt3UikxVQZ8Zp5b0QKmyoR4FAOJ7pTtqYJeYKynd8ug8N519lU1Vd/Uh2k1PGsNRvDtGNaYfTMmYFntU0krZDP8oX8mcU11oXUiNYH4EVyzPY9ZCRmAp9DfM8p6qE21ReEv29+f91Pg8ETcT2cg2S2haiR/kTQDoD/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951514; c=relaxed/simple;
	bh=4yfL6ZuTNZa5NX/iTdaOyajQ2+YIltjNFmTy/Ygjfac=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ns6MzAs/Ux0xR5Icl45cfRkC3sjwcsAGwTQpC5cavbfy0eIPGg5GDzOK6YEBb0bmsvyrmmknUkVdDK+ApTBogJU6rL438z2DDNjCtkwdDAsPZ9dNHKiPS2uWCWX7rXnIBiQb8pq49SRi+do4KynEOeTBYUAGikE3QRWSwge2yiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cflr3DeK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eHMPH2BR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CtALC/I+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Q3Sus+2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cflr3DeK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eHMPH2BR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CtALC/I+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Q3Sus+2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 017A521EEF;
	Fri,  2 Oct 2026 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790951507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTCIVJ7/j69ZOgjlYrSfK9lJ1Jb4o1WUZlI9LTfcrG8=;
	b=Cflr3DeKzcbDhFfmWlSn0f98yErm1OwC4zOd9cXLdtXfZtSCtFu/Px1NqaeiNcd2JkKdUb
	6Xd7Vyn/NUM5nn6C0CwiW6HVGLdg//ATXjnzq0StkvPwezi4WHM/URErt13NSpN1D5iOjD
	hbKZGDFs9TAaex5mBa1hxfx/lQAJiuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790951507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTCIVJ7/j69ZOgjlYrSfK9lJ1Jb4o1WUZlI9LTfcrG8=;
	b=eHMPH2BRmD4w+gcpwJAR5T1DaUa4PyEIqG5hJ7PMnFwxH+z2rxc6+Y0SmoSv9YLhiMc/Z5
	C7T1fPU2nW42TOAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="CtALC/I+";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6Q3Sus+2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790951503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTCIVJ7/j69ZOgjlYrSfK9lJ1Jb4o1WUZlI9LTfcrG8=;
	b=CtALC/I+vrQlO3d87YRNnv4a2ZwMhY1I6UsZYXVQ+UQathTS9mosFLlT6NUZh4Q90TR3Vs
	C2bJALuLaWRBlM9gMNxDufeePsRh4fVEQrg9yhiQ1qZWLCwmONAFB7jbrrzLxxApmal8Yv
	oE9GtmskHJ8QwV7JRXEJQgzoyomLS5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790951503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTCIVJ7/j69ZOgjlYrSfK9lJ1Jb4o1WUZlI9LTfcrG8=;
	b=6Q3Sus+2a3leZrAG7d0Cy1aZS0wDyi6fM1yhn0y2XEEYSwAvVIshhK+Ete3WQmJr+5GE2R
	Bp5oyKFyXAcsXACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2F3D139C9;
	Fri,  2 Oct 2026 14:31:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 63yyJE7Av2oHQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 14:31:42 +0000
Date: Fri, 02 Oct 2026 16:31:42 +0200
Message-ID: <87ik3kyy0h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dchristensen8 <dchristensen8@proton.me>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
In-Reply-To: <I690osvh2wujN3P04R4abtKFqOqtIiC-qin2ZEFs9q8kKU7-qfIg2cya4BuHS7Vg83Wkon6BCJGtVIxeJVfRZ8nG07laTUlv-fJjELMgp1Y=@proton.me>
References: <I690osvh2wujN3P04R4abtKFqOqtIiC-qin2ZEFs9q8kKU7-qfIg2cya4BuHS7Vg83Wkon6BCJGtVIxeJVfRZ8nG07laTUlv-fJjELMgp1Y=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 017A521EEF
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 02 Oct 2026 03:41:50 +0200,
dchristensen8 wrote:
> 
> 
> Takashi,
> 
> Thank you for your assistance on this! I updated it to use CLASS
> (snd_hda_power_pm, pm)(codec) for the power management call, which cleaned up
> all the manual power-down error exits nicely.
> 
> Attached is the proper v2 patch for upstreaming.

Now reviewing further in details, and some issues found:

> --- a/sound/hda/codecs/ca0132.c
> +++ b/sound/hda/codecs/ca0132.c
> @@ -35,6 +35,8 @@
>  #include <sound/tlv.h>
>  #endif
>  
> +#include <linux/dma-mapping.h>

Let's move this into the block with other header file inclusions.
Not needed to be alone here.


> +static struct hdac_stream *ae5_strip_find_stream(struct hda_codec *codec)
> +{
> +	struct ca0132_spec *spec = codec->spec;
> +	struct hdac_bus *bus = &codec->bus->core;
> +	struct hdac_stream *s, *dsp = NULL, *first = NULL;
> +
> +	guard(spinlock_irqsave)(&bus->reg_lock);
> +	list_for_each_entry(s, &bus->stream_list, list) {
> +		if (s->direction != SNDRV_PCM_STREAM_PLAYBACK)
> +			continue;
> +		if (s->running || s->locked)
> +			continue;

It should also check s->opened, too.

> +	for (;;) {
> +		hstr = ae5_strip_find_stream(codec);
> +		if (!hstr) {
> +			if (--retries <= 0) {
> +				codec_warn(codec, "AE5 strip: no free azx stream after retries\n");
> +				return -EBUSY;
> +			}
> +			usleep_range(5000, 10000);
> +			continue;
> +		}
> +
> +		stream_tag = snd_hdac_dsp_prepare(hstr, format, AE5_STRIP_DMA_SIZE, &dmab);

The function needs CONFIG_SND_HDA_DSP_LOADER, and it's not always
selected.  Although the compile would works, it makes no sense to keep
the code without the support code.


> +static int ae5_strip_ctl_put(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
> +	struct ca0132_spec *spec = codec->spec;
> +	u32 colors[AE5_STRIP_MAX_LEDS];
> +	int i, num_leds;
> +
> +	guard(mutex)(&spec->ae5_strip_mutex);
> +	num_leds = spec->ae5_strip_cur_num_leds;
> +	for (i = 0; i < num_leds; i++) {
> +		u8 r = ucontrol->value.bytes.data[i * 3 + 0];
> +		u8 g = ucontrol->value.bytes.data[i * 3 + 1];
> +		u8 b = ucontrol->value.bytes.data[i * 3 + 2];
> +
> +		colors[i] = ((u32)g << 16) | ((u32)r << 8) | (u32)b;
> +	}
> +	memcpy(spec->ae5_strip_cur_colors, colors, sizeof(u32) * num_leds);
> +	ae5_strip_send_frame(codec, colors, num_leds);
> +	return 0;

In general, the put callback should return 1 if the values are
modified.


thanks,

Takashi
