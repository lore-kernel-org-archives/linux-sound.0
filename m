Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975648;
	b=J9C10XEoRXovFlX49DIetDarPXH5oxGmx6PgthXam+TZlSvLnOKGJtWNsm+MhrL58At/
	 D5Gp2TuaaE/wTudq6XZ//wmD3LTSgO9mKbgUI3D7uXhkU1Y9ckgCs8Bn0CoWEncDbpidL
	 dTfWUauJEB2mhEfPSbMBtNwnJiqy+MSeLwQqFSkoDnw52sqny+r1QYw5TZ2H8KURDw0Jp
	 QQg7WTCnHRdwuGx5I170iFf+AkD3mPhBNLjXMNPhPBP0yM7OFLRf2UQmhTH2mDe2HyCUK
	 fo2sihLzIoEmdsXCXhUtKloCP6KEbFqlrpsb/YskUs5b7IxuiIBxlSGNBIJ8bcvetIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975648;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=eT5kW3GqbMNCiTQt7Xx/TzYOBlaxqGWuEdZHuRmY6zU=;
	b=5gy3Ddh99cry44arI9iIOzkFinnFOplG9FhZQkLL0vl8nsaLnh1zZaNC1sE3aJlUjXX3
	 UKc513QhvKIsLlDNx7+VpD1LyKncqMkMdFiu49qCAisxRaZdDVVUsQeT92bSuvILfz0mq
	 kGuulj+Sv4rjCRPKPElupLqGB2PbL9CUm1wnf0lHkOecPjfN5N6/NYzRRQC7peUThTSrX
	 oNyHtL3koPyFDzuRlfek02nc0ewLmYhACP+u9BLCM/2MIiFEhUEvl5dY0dBL5rjd9GGLd
	 xIvMzXI5AmJPEGfm5WiwL+WehaKWustD3J7yBMI+tm8y0b051JnzMns48efnLmUjcZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=z7jYrBK6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/h5FGc1w";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=z7jYrBK6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/h5FGc1w";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C3606A33E
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 14:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775C3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=z7jYrBK6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/h5FGc1w;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=z7jYrBK6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/h5FGc1w
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF3F41F452;
	Fri,  6 Nov 2026 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793975645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eT5kW3GqbMNCiTQt7Xx/TzYOBlaxqGWuEdZHuRmY6zU=;
	b=z7jYrBK6mPEwiMVqKHe83g6ffzYnNJNdjKc98JnHrplJ5uxUbq9ZuK7+SgO0L4hJ3Ysao5
	KULu5zFDLbDAWT6Rcs2P2hgDRT6s9kBIhFPhNrxlM/khTzCSIvqbgblWA1pYgq5BmNaUIH
	WIFG1dztjuGqrkT72hqFrboCXp1Ovww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793975645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eT5kW3GqbMNCiTQt7Xx/TzYOBlaxqGWuEdZHuRmY6zU=;
	b=/h5FGc1wvVooO2wMG3sTx3lkNj9gIdrm+OMLyrNtWqgXCEGV0SMpCuHiAxNqKzwe3txEwZ
	+OoZlWEzLiR1mMCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793975645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eT5kW3GqbMNCiTQt7Xx/TzYOBlaxqGWuEdZHuRmY6zU=;
	b=z7jYrBK6mPEwiMVqKHe83g6ffzYnNJNdjKc98JnHrplJ5uxUbq9ZuK7+SgO0L4hJ3Ysao5
	KULu5zFDLbDAWT6Rcs2P2hgDRT6s9kBIhFPhNrxlM/khTzCSIvqbgblWA1pYgq5BmNaUIH
	WIFG1dztjuGqrkT72hqFrboCXp1Ovww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793975645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eT5kW3GqbMNCiTQt7Xx/TzYOBlaxqGWuEdZHuRmY6zU=;
	b=/h5FGc1wvVooO2wMG3sTx3lkNj9gIdrm+OMLyrNtWqgXCEGV0SMpCuHiAxNqKzwe3txEwZ
	+OoZlWEzLiR1mMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A795132C9;
	Fri,  6 Nov 2026 14:34:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xMhkEF3l7WoMeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 14:34:05 +0000
Date: Fri, 06 Nov 2026 15:34:04 +0100
Message-ID: <87h5huowpv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Devajith Jijush <devajuice@zohomail.in>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: hda/conexant: Add quirk for Acer TravelLite TL05-41M
In-Reply-To: <179396062556.127350.15308705935335598574@zohomail.in>
References: <179396062556.127350.15308705935335598574@zohomail.in>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 06 Nov 2026 11:23:45 +0100,
Devajith Jijush wrote:
> 
> The Acer TravelLite TL05-41M (subsystem 0x1558a600) uses a Conexant
> CX11880 codec whose analog output amplifier is enabled by codec GPIO
> bit 1.  The driver has no quirk for this machine, so the line is never
> raised and both the internal speakers and the 3.5 mm combo jack stay
> silent, while the microphone on the same jack, USB and Bluetooth audio
> work normally.
> 
> Add a fixup that sets GPIO bit 1 on this subsystem ID.  It is applied
> from the HDA_FIXUP_ACT_INIT hook, since the codec loses the GPIO state
> on a power transition and the line would otherwise stay off after the
> first runtime power save.
> 
> Note that the existing CXT_FIXUP_GPIO1 fixup raises GPIO bit 0, which
> has no effect on this board.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222238
> Signed-off-by: Devajith Jijush <devajuice@zohomail.in>
> ---
> Note for reviewers: the GPIO behaviour was verified on the affected
> machine with hda-verb; I have not built a kernel with this patch, so the
> code path itself is untested.  Setting the same three GPIO bits from
> userspace makes both the internal speakers and the headphone jack work.
> 
>  sound/hda/codecs/conexant.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index a141c94..623e466 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -289,6 +289,7 @@ enum {
>  	CXT_FIXUP_HEADPHONE_MIC_PIN,
>  	CXT_FIXUP_HEADPHONE_MIC,
>  	CXT_FIXUP_GPIO1,
> +	CXT_FIXUP_AMP_GPIO1,
>  	CXT_FIXUP_ASPIRE_DMIC,
>  	CXT_FIXUP_THINKPAD_ACPI,
>  	CXT_FIXUP_LENOVO_XPAD_ACPI,
> @@ -826,6 +827,17 @@ static void cxt_fixup_hp_a_u(struct hda_codec *codec,
>  		cxt_setup_gpio_unmute(codec, 0x2);
>  }
>  
> +/* Acer TravelLite TL05-41M: the analog output amplifier is enabled by
> + * codec GPIO bit 1.  The codec loses the GPIO state on a power
> + * transition, so this must be applied on every init, not only at probe.
> + */
> +static void cxt_fixup_amp_gpio1(struct hda_codec *codec,
> +				const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_INIT)
> +		snd_hda_codec_set_gpio(codec, 0x02, 0x02, 0x02, 0);
> +}
> +
>  /* Huawei MateBook 14 (SN6140): the speaker output follows the headphone
>   * pin's connection select in hardware.  Both pins must be routed to the
>   * shared DAC 0x10, which carries the playback stream; the generic
> @@ -1001,6 +1013,10 @@ static const struct hda_fixup cxt_fixups[] = {
>  			{ }
>  		},
>  	},
> +	[CXT_FIXUP_AMP_GPIO1] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = cxt_fixup_amp_gpio1,
> +	},

There is already a GPIO bit 0 setup (called gpio1)

	[CXT_FIXUP_GPIO1] = {
		.type = HDA_FIXUP_VERBS,
		.v.verbs = (const struct hda_verb[]) {
			{ 0x01, AC_VERB_SET_GPIO_MASK, 0x01 },
			{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x01 },
			{ 0x01, AC_VERB_SET_GPIO_DATA, 0x01 },
			{ }
		},
	},

so you can implement similarly,

	[CXT_FIXUP_GPIO2] = {
		.type = HDA_FIXUP_VERBS,
		.v.verbs = (const struct hda_verb[]) {
			{ 0x01, AC_VERB_SET_GPIO_MASK, 0x02 },
			{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02 },
			{ 0x01, AC_VERB_SET_GPIO_DATA, 0x02 },
			{ }
		},
	},

and use this in the quirk, instead.  Then you don't need to create a
function.

> @@ -1255,6 +1273,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
>  static const struct hda_model_fixup cxt5066_fixup_models[] = {
>  	{ .id = CXT_FIXUP_STEREO_DMIC, .name = "stereo-dmic" },
>  	{ .id = CXT_FIXUP_GPIO1, .name = "gpio1" },
> +	{ .id = CXT_FIXUP_AMP_GPIO1, .name = "amp-gpio1" },
>  	{ .id = CXT_FIXUP_HEADPHONE_MIC_PIN, .name = "headphone-mic-pin" },
>  	{ .id = CXT_PINCFG_LENOVO_TP410, .name = "tp410" },
>  	{ .id = CXT_FIXUP_THINKPAD_ACPI, .name = "thinkpad" },

Please avoid adding a new model string unless needed inevitably.
We can apply the existing quirk with the alias (xxxx:yyyy), too.


thanks,

Takashi
