Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E158258EC3
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399740; cv=none; b=YXqIMjSh/gRB0tgEASCHiPm3xTEx5U9O+3ZTLi5hUToSAPlWS21UvAsfNva0FIVqcHbfYLBDzUq+VuZyvpsNlTa4npgMaNrJ6JsvB4yJ4iiPrZaiaAa7k6c4H3h5IiIf6htB7DajpExwNGU0i9/AVEmhdFQN5e1EpL11ellR+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399740; c=relaxed/simple;
	bh=XPj2Zt3jc4EJNDqQLAOVYeA0c5XYyidFXjDHcIsY+YQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dM2qOuzDsdLb11mTeBD0QCxUrwhb+jA/L1rlDpSVMDLV66rHRDoo1QtmXJSMmzHvbWrG1gaiLDOElCVtHIEPzgtF2jD/j6QiWXl1igB8U7MNbv81D7fc0QVFy3iFhARY5qtscNynykuVZfkSTotrvEm39lvqj3VqmSTIIJiA6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pxTGo9hu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hXzj1JtU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pxTGo9hu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hXzj1JtU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pxTGo9hu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hXzj1JtU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pxTGo9hu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hXzj1JtU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1B363E6E7;
	Wed, 18 Feb 2026 07:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771399736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kzo8oUNRnAeHgz2qhbnLkpp/syOZgoKQk4EAlp9tTWA=;
	b=pxTGo9hu15M0DS7MwcdOPrRlyV1MsNwmYGWyy3LBy9Hpp1GEyiihjZZRqGwe7QyXwUTVns
	YiStwOCHexx0xq5WQz2EVe4czVFhOqpYoGNDm7OyhM3GClDhIWfjV4vfwVDQUSMXqihb8B
	PouOv2dyo3sZE/h8bBOtp0wldbdkM7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771399736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kzo8oUNRnAeHgz2qhbnLkpp/syOZgoKQk4EAlp9tTWA=;
	b=hXzj1JtUgLFQ400Fp8yUdUk6f8c4kg3qgAQKwkeP7gcAq4aNMJFl5onWIOu4M2X94X4onT
	JTCxeLQiCOAe09Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771399736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kzo8oUNRnAeHgz2qhbnLkpp/syOZgoKQk4EAlp9tTWA=;
	b=pxTGo9hu15M0DS7MwcdOPrRlyV1MsNwmYGWyy3LBy9Hpp1GEyiihjZZRqGwe7QyXwUTVns
	YiStwOCHexx0xq5WQz2EVe4czVFhOqpYoGNDm7OyhM3GClDhIWfjV4vfwVDQUSMXqihb8B
	PouOv2dyo3sZE/h8bBOtp0wldbdkM7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771399736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kzo8oUNRnAeHgz2qhbnLkpp/syOZgoKQk4EAlp9tTWA=;
	b=hXzj1JtUgLFQ400Fp8yUdUk6f8c4kg3qgAQKwkeP7gcAq4aNMJFl5onWIOu4M2X94X4onT
	JTCxeLQiCOAe09Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F89A3EA65;
	Wed, 18 Feb 2026 07:28:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HXjOGThqlWnKZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 07:28:56 +0000
Date: Wed, 18 Feb 2026 08:28:55 +0100
Message-ID: <87342ybjd4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	tiwai@suse.com,
	chris.chiu@canonical.com,
	edip@medip.dev,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	david.henningsson@canonical.com,
	sbinding@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
In-Reply-To: <CABtds-0aHEfz3=i=q_4bNHwfEg1aCFD4=1Js6hZ=FWpB9c8onw@mail.gmail.com>
References: <CABtds-0aHEfz3=i=q_4bNHwfEg1aCFD4=1Js6hZ=FWpB9c8onw@mail.gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 17 Feb 2026 23:14:24 +0100,
Sean Rhodes wrote:
> On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
> emit an audible pop when resuming from runtime suspend.
> 
> The speaker amplifier is controlled via EAPD. The generic Realtek shutup
> path can toggle EAPD/pin widget control while the amp is still unmuted,
> causing the pop.

Doesn't just turn off shutup (e.g. applying ALC269_FIXUP_NO_SHUTUP
quirk) work enough in your case?  Or just muting without touching
EAPD?

If only mute is needed, you can apply a simpler fix like below.


thanks,

Takashi

-- 8< --

--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3609,6 +3609,22 @@ static void alc245_fixup_hp_zbook_firefly_g12a(struct hda_codec *codec,
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }
 
+static void starlabs_starfighter_shutup(struct hda_codec *codec)
+{
+	if (snd_hda_gen_shutup_speakers(codec))
+		msleep(30);
+}
+
+static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
+					      const struct hda_fixup *fix,
+					      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->shutup = starlabs_starfighter_shutup;
+}
+
 /*
  * ALC287 PCM hooks
  */
@@ -4056,6 +4072,7 @@ enum {
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
 	ALC245_FIXUP_BASS_HP_DAC,
+	ALC233_FIXUP_STARLABS_STARFIGHTER,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6576,6 +6593,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		/* Borrow the DAC routing selected for those Thinkpads */
 		.v.func = alc285_fixup_thinkpad_x1_gen7,
 	},
+	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_starlabs_starfighter,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -7651,6 +7672,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
