Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A73CFF50
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211350; cv=none; b=m+rjRYCKVFa8jFle5eTXN5nX4SQYWm8Vo6EAD65y4b46/5HqYMW2I8H44nAcIvh7GSz6YVG0J4fYP89kqfFQ4cuI1pvAUyoABXCv1rGugyCpiqMxkawDMvO/M4AM3nuKiG+4K3T2iseR9K5VLayc9A5p/w4S/wxELWTjZ/WfAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211350; c=relaxed/simple;
	bh=fj4TM5GiqKMPxzp8vFBJmMjQV8IHAoHFczXKwVkuk1I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bf+XGnakN1bFghiHWis7YH3B+7n8Ze7r9mcV8Bo+aIVgvETKo1qZ5tZUn6S/VaLapranpXvvwZNZ/labfJlwanH7ncMX+K9SI0o0HRaRdY+kKl88pLCrWEAuHaru0XaoFMqYbFnMAtVoKjE3ZG7PQcbIkflZ41goQ07HBSIDgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BmXLD5p6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oxuSTUe2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TWrdVZJF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hLHVYt1n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BmXLD5p6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oxuSTUe2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TWrdVZJF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hLHVYt1n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BE2275EBF;
	Tue, 23 Jun 2026 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782211346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6046PHjFNJcqAqNcMr6FxqQ0UmVmimIhMer13BW88=;
	b=BmXLD5p63EHYRNX5weWx1e0UUWQ+0xHP2omMjMeUg8yfuY4yAtwBLIe3/Sq5BAcFMyGsOJ
	mm/pGr4o73NIGZgtnFW2xOahSMIYond8N9jE1qRbTwITGAH/R4VLXaBw8HBKU3y5nsyXAB
	+BZxeL6AX/8l84q5AdG8JKHbsJGhCu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782211346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6046PHjFNJcqAqNcMr6FxqQ0UmVmimIhMer13BW88=;
	b=oxuSTUe2seF2CVFmebQul9bhXz35fD3b+qWeK4SoMOlS3L0nu0mRCG7jFIzs8WHfFqrX3A
	mzC58WI9qZe30HCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TWrdVZJF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hLHVYt1n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782211345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6046PHjFNJcqAqNcMr6FxqQ0UmVmimIhMer13BW88=;
	b=TWrdVZJFQ0Nm2+9hc6ocSoYAk/u1Nuy1luYXVlAgXQDznUi5jUX+bTT8ehO2I6cpEks4KJ
	20ihLcvdzsVuBIvjo7WDpLwj9vAfNVI6bG6ps/Uz0P3fbO/0x2mjoelkncumvjP6T6A7ve
	JvXt//69teQw1JfWjz4SaiMAYoxDNEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782211345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6046PHjFNJcqAqNcMr6FxqQ0UmVmimIhMer13BW88=;
	b=hLHVYt1n5BBnQwiKkXXOpBk8v1axLTiUVE0pdDPiudm4jw+3FB2b46+zBmJQRKklTPn/2y
	8/CuJZDUOeA8KaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BDCD779A8;
	Tue, 23 Jun 2026 10:42:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UzWsGBFjOmpfTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Jun 2026 10:42:25 +0000
Date: Tue, 23 Jun 2026 12:42:25 +0200
Message-ID: <87cxxhczce.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christopher =?ISO-8859-1?Q?H=F6ner?= <christopher-hoener@web.de>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable internal speakers on Razer Blade 16 (2025)
In-Reply-To: <20260622174309.5873-1-christopher-hoener@web.de>
References: <87ldc7dkdx.wl-tiwai@suse.de>
	<20260622174309.5873-1-christopher-hoener@web.de>
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
X-Rspamd-Queue-Id: 8BE2275EBF
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[web.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 22 Jun 2026 19:43:09 +0200,
Christopher Höner wrote:
> 
> Hi Takashi,
> 
> Thanks for the review.
> 
> On the size: agreed, that was too much to sit inline. v3 moves the
> captured DSP tables into a separate header (alc298_rb16_2025.h) that the
> codec includes, so alc269.c keeps only the apply helper, the PCM hook
> and the fixup.

Thanks!  We have this kind of large code in sound/hda/codecs/helpers,
and you can follow the pattern, too.

> On power_save_node: I tried it and it does work. The catch is that the
> amp wake and park have to come out of the init sequence first, the park
> in particular. If the amp is parked at the end of init, nothing wakes it
> again, since power_save_node only toggles the codec's own widgets and the
> amp isn't one of them; it sits behind the coef mailbox on NID 0x20 and
> isn't a power-managed node. Dropping the init wake as well seemed fine
> here, though I'm less sure about that one, since the Windows driver does
> send a wake at init.
> 
> With the amp left on and power_save_node handling the widget PM, playback
> is fine. The one thing I noticed is that every stream then starts with a
> small but audible click, the speaker DAC and pin going D3->D0 in a single
> step. The mailbox wake/park ramps the amp up and down instead, so the
> hook path doesn't click, and for me that transition is the nicer result.
> 
> The trade-offs run the other way too. power_save_node would let the codec
> power its widgets down when idle, which on a laptop is probably worth
> having, and I can't really put a number on what the hook costs by leaving
> them up, so I'm not weighing that part heavily. The fact that it's
> codec-wide is presumably a good thing for the headphone and the mics too;
> I don't know that side well enough to have a strong opinion there.
> 
> Where I landed for v3 was the pcm_playback_hook with power_save_node left
> at its default, mostly for the cleaner transition, and because it matches
> the other ALC298 external-amp fixups: Samsung and LG Gram both drive the
> amp from a pcm_playback_hook and leave power_save_node alone,
> alc274_fixup_bind_dacs sets it to 0, and alc_fixup_tpt440_dock sets it to
> 0 specifically to avoid click noises.
> 
> That said, you've seen far more of these than I have, and I don't have a
> strong stake in the PM side beyond that transition. If you'd rather this
> used power_save_node, say so and I'll switch v3 over: drop the wake/park
> and let the widgets manage themselves.

Hm, indeed there is no direct hook associated to each widget node for
the power amp.  A tricky way would be, though, to use the existing
codec->power_filter callback; you can define something like:

static int razer_amp_power_filter(struct hda_codec *codec, hda_nid_t nid,
				  unsigned int power_state)
{
	int state = snd_hda_gen_path_power_filter(codec, nid, power_state);

	if (nid == SOME_OUTPUT_PIN) {
		if (state == AC_PWRST_D0)
			power_up_amp(codec, nid);
		else
			power_down_amp(codec, nid);
	}

	return state;
}

and set codec->power_filter = razer_amp_power_filter in the fixup,
together with codec->power_save_node = 1.

It's just an idea, and if this doesn't look working well, we can go
with your approach with the PCM hook, too.


thanks,

Takashi
