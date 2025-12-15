Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618D2E7F17
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786488; cv=none; b=eL1FnLCagwiAORzUgUSf08G4+WjZMoO6ec+hX5AaPxSO/9JytHrIt8ZZlDyOp24sTWRbdfsigpccPLBSCJcB7gwyUAw12Z61OuJalnXtbWKOem35+WCZX3ykiCdg6USrNK9lfocGg0tkJsHTHfuCJnLG2Q/imdeo1/KPXzAty58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786488; c=relaxed/simple;
	bh=u8p0ps15aOQ4rHREJqcKsU5iblmbJfPkTlX8FKkeSlc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GEM1rgfz+Y9RbI270w5n3DixFA0/3SKVQAsUCdZJlhVh0X53QEvqn6/RuRYTz3Kyo6/6oW5Nj2EF22M8FaT5WG/3TbE0FHwILTtpA5hurJGJtsnB8Rg43ss2tnxg5xxsEyvo7/PtRPISM6r+PockbZ7j4yKNl5YHuN+B1Lo21Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BwJqB/Ui; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a6Xdc7XK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BwJqB/Ui; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a6Xdc7XK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BwJqB/Ui";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a6Xdc7XK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BwJqB/Ui";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a6Xdc7XK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8DAFF336AF;
	Mon, 15 Dec 2025 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765786476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7LEGa3OH7cUJ3UUKMIJWhyDTjNlBfrFL2h5XtwqZqQ=;
	b=BwJqB/Uid3MFnergaUnmrrXb1EJXzUtKiW6aSvnCOhBe6hdd5LGLSawUGixe0e+jgAN4T0
	LIceV6aFkyPdIjurAknO0+aeeEM5jSp2HTXLYMi9kfOk8ZdBnX+c2zg1PxF3LRcNc0h4kc
	OR2bPJMAobUCo1AfauKng6fOjF0wo5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765786476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7LEGa3OH7cUJ3UUKMIJWhyDTjNlBfrFL2h5XtwqZqQ=;
	b=a6Xdc7XKmojQ7d7y56T6KWq1L3FzWNFTJWhGFi6+ikAgspv6b8cK/A3JTaj1bmwkSfB+Uv
	+//DVn43g7HiNOBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765786476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7LEGa3OH7cUJ3UUKMIJWhyDTjNlBfrFL2h5XtwqZqQ=;
	b=BwJqB/Uid3MFnergaUnmrrXb1EJXzUtKiW6aSvnCOhBe6hdd5LGLSawUGixe0e+jgAN4T0
	LIceV6aFkyPdIjurAknO0+aeeEM5jSp2HTXLYMi9kfOk8ZdBnX+c2zg1PxF3LRcNc0h4kc
	OR2bPJMAobUCo1AfauKng6fOjF0wo5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765786476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7LEGa3OH7cUJ3UUKMIJWhyDTjNlBfrFL2h5XtwqZqQ=;
	b=a6Xdc7XKmojQ7d7y56T6KWq1L3FzWNFTJWhGFi6+ikAgspv6b8cK/A3JTaj1bmwkSfB+Uv
	+//DVn43g7HiNOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 511383EA63;
	Mon, 15 Dec 2025 08:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /GyCEmzDP2mDSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Dec 2025 08:14:36 +0000
Date: Mon, 15 Dec 2025 09:14:35 +0100
Message-ID: <87wm2o6u1g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: CM-Tsai  Leo - =?ISO-2022-JP?B?GyRCaHE5ST9CGyhC?=
 <leo.tsai@cmedia.com.tw>
Cc: Takashi Iwai <tiwai@suse.de>,
	Leo Tsai <antivirus621@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?ISO-2022-JP?B?GyRCMnNKJBsoQjo=?= [PATCH] ALSA: hda/cm9825:
 Add new project GENE_TWL7 for AAEON
In-Reply-To: <TYZPR02MB7725DC0F673983A6D3CFDD1CD8ADA@TYZPR02MB7725.apcprd02.prod.outlook.com>
References: <20251212093157.5618-1-antivirus621@gmail.com>
	<87345d8ifl.wl-tiwai@suse.de>
	<TYZPR02MB7725DC0F673983A6D3CFDD1CD8ADA@TYZPR02MB7725.apcprd02.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.978];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,suse.com,opensource.cirrus.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 15 Dec 2025 04:26:25 +0100,
CM-Tsai  Leo - 蔡紘紳 wrote:
> 
> Dear Takashi,
> 
> Sorry for the patch we sent you was unclear.
> 
> AAEON is one of our customers, and GENE_TWL7 is a project of their team.
> We confirmed with other customers a few days ago that only AAEON will not require further changes, so we decided to proceed with AAEON’s patch first.
> 
> 
> 
> > @@ -80,10 +87,8 @@ static const struct hda_verb cm9825_std_d0_verbs[] = {
> >        {0x43, CM9825_VERB_SET_OCP, 0x33},      /* OTP set */
> >        {0x43, CM9825_VERB_SET_GAD, 0x07},      /* ADC -3db */
> >        {0x43, CM9825_VERB_SET_TMOD, 0x26},     /* Class D clk */
> > -     {0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
> > -             AC_AMP_SET_OUTPUT | AC_AMP_SET_RIGHT, 0x2d},    /* Gain set */
> > -     {0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
> > -             AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT, 0x2d},     /* Gain set */
> > +     {0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0xa0, 0x2d}, /* Gain set */
> > +     {0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0x90, 0x2d}, /* Gain set */
> 
> We found AC_AMP_SET_OUTPUT | AC_AMP_SET_RIGHT is not 0xa0 and AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT is not 0x90, so replaced the symbols with numbers.
> Please let me know if there is a better way to express this.

If there is a correction of verbs for the existing models, better to
split to another patch just for the correction.  Then it can be
applied to the existing releases as a stable fix, too.

But yet, passing numbers like 0xa0 or 0x90 looks weird, and it needs
more commends why those values are set.
> 
> > +static const struct hda_verb cm9825_gene_twl7_d3_verbs[] = {
> > +     {0x43, CM9825_VERB_SET_D2S, 0x62},
> > +     {0x43, CM9825_VERB_SET_PLL, 0x01},
> > +     {0x43, CM9825_VERB_SET_NEG, 0xc2},
> > +     {0x43, CM9825_VERB_SET_ADCL, 0x00},
> > +     {0x43, CM9825_VERB_SET_DACL, 0x02},
> > +     {0x43, CM9825_VERB_SET_MBIAS, 0x00},
> > +     {0x43, CM9825_VERB_SET_VNEG, 0x50},
> > +     {0x43, CM9825_VERB_SET_PDNEG, 0x04},
> > +     {0x43, CM9825_VERB_SET_CDALR, 0xf6},
> > +     {0x43, CM9825_VERB_SET_OTP, 0xcd},
> > +     {}
> > +};
> 
> > +static const struct hda_verb cm9825_gene_twl7_d0_verbs[] = {
> > +     {0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},
> > +     {0x43, CM9825_VERB_SET_SNR, 0x38},
> > +     {0x43, CM9825_VERB_SET_PLL, 0x00},
> > +     {0x43, CM9825_VERB_SET_ADCL, 0xcf},
> > +     {0x43, CM9825_VERB_SET_DACL, 0xaa},
> > +     {0x43, CM9825_VERB_SET_MBIAS, 0x1c},
> > +     {0x43, CM9825_VERB_SET_VNEG, 0x56},
> > +     {0x43, CM9825_VERB_SET_D2S, 0x62},
> > +     {0x43, CM9825_VERB_SET_DACTRL, 0x00},
> > +     {0x43, CM9825_VERB_SET_PDNEG, 0x0c},
> > +     {0x43, CM9825_VERB_SET_CDALR, 0xf4},
> > +     {0x43, CM9825_VERB_SET_OTP, 0xcd},
> > +     {0x43, CM9825_VERB_SET_MTCBA, 0x61},
> > +     {0x43, CM9825_VERB_SET_OCP, 0x33},
> > +     {0x43, CM9825_VERB_SET_GAD, 0x07},
> > +     {0x43, CM9825_VERB_SET_TMOD, 0x26},
> > +     {0x43, CM9825_VERB_SET_HPF_1, 0x40},
> > +     {0x43, CM9825_VERB_SET_HPF_2, 0x40},
> > +     {0x40, AC_VERB_SET_CONNECT_SEL, 0x00},
> > +     {0x3d, AC_VERB_SET_CONNECT_SEL, 0x01},
> > +     {0x46, CM9825_VERB_SET_P3BCP, 0x20},
> > +     {}
> > +};
> 
> > +static const struct hda_verb cm9825_gene_twl7_playback_start_verbs[] = {
> > +     {0x43, CM9825_VERB_SET_D2S, 0xf2},
> > +     {0x43, CM9825_VERB_SET_VDO, 0xd4},
> > +     {0x43, CM9825_VERB_SET_SNR, 0x30},
> > +     {}
> > +};
> > +
> > +static const struct hda_verb cm9825_gene_twl7_playback_stop_verbs[] = {
> > +     {0x43, CM9825_VERB_SET_VDO, 0xc0},
> > +     {0x43, CM9825_VERB_SET_D2S, 0x62},
> > +     {0x43, CM9825_VERB_SET_VDO, 0xd0},
> > +     {0x43, CM9825_VERB_SET_SNR, 0x38},
> > +     {}
> > +};
> 
> The IC design team told us that these settings are related to the internal operation of the IC and are somewhat complex, so they only provided us with the intended purpose.
> 
> /*
>  * To save power, AD/CLK is turned off.
>  */
> static const struct hda_verb cm9825_gene_twl7_d3_verbs[] = {
>      {0x43, CM9825_VERB_SET_D2S, 0x62},
>      {0x43, CM9825_VERB_SET_PLL, 0x01},
>      {0x43, CM9825_VERB_SET_NEG, 0xc2},
>      {0x43, CM9825_VERB_SET_ADCL, 0x00},
>      {0x43, CM9825_VERB_SET_DACL, 0x02},
>      {0x43, CM9825_VERB_SET_MBIAS, 0x00},
>      {0x43, CM9825_VERB_SET_VNEG, 0x50},
>      {0x43, CM9825_VERB_SET_PDNEG, 0x04},
>      {0x43, CM9825_VERB_SET_CDALR, 0xf6},
>      {0x43, CM9825_VERB_SET_OTP, 0xcd},
>      {}
> };
> 
> /*
>  * Enable CLK/ADC to start recording.
>  */
> static const struct hda_verb cm9825_gene_twl7_d0_verbs[] = {
>      {0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},
>      {0x43, CM9825_VERB_SET_SNR, 0x38},
>      {0x43, CM9825_VERB_SET_PLL, 0x00},
>      {0x43, CM9825_VERB_SET_ADCL, 0xcf},
>      {0x43, CM9825_VERB_SET_DACL, 0xaa},
>      {0x43, CM9825_VERB_SET_MBIAS, 0x1c},
>      {0x43, CM9825_VERB_SET_VNEG, 0x56},
>      {0x43, CM9825_VERB_SET_D2S, 0x62},
>      {0x43, CM9825_VERB_SET_DACTRL, 0x00},
>      {0x43, CM9825_VERB_SET_PDNEG, 0x0c},
>      {0x43, CM9825_VERB_SET_CDALR, 0xf4},
>      {0x43, CM9825_VERB_SET_OTP, 0xcd},
>      {0x43, CM9825_VERB_SET_MTCBA, 0x61},
>      {0x43, CM9825_VERB_SET_OCP, 0x33},
>      {0x43, CM9825_VERB_SET_GAD, 0x07},
>      {0x43, CM9825_VERB_SET_TMOD, 0x26},
>      {0x43, CM9825_VERB_SET_HPF_1, 0x40},
>      {0x43, CM9825_VERB_SET_HPF_2, 0x40},
>      {0x40, AC_VERB_SET_CONNECT_SEL, 0x00},
>      {0x3d, AC_VERB_SET_CONNECT_SEL, 0x01},
>      {0x46, CM9825_VERB_SET_P3BCP, 0x20},
>      {}
> };
> 
> /*
>  * Enable DAC to start playback.
>  */
> static const struct hda_verb cm9825_gene_twl7_playback_start_verbs[] = {
>      {0x43, CM9825_VERB_SET_D2S, 0xf2},
>      {0x43, CM9825_VERB_SET_VDO, 0xd4},
>      {0x43, CM9825_VERB_SET_SNR, 0x30},
>      {}
> };
> 
> /*
>  * Disable DAC and enable de-pop noise mechanism.
>  */
> static const struct hda_verb cm9825_gene_twl7_playback_stop_verbs[] = {
>      {0x43, CM9825_VERB_SET_VDO, 0xc0},
>      {0x43, CM9825_VERB_SET_D2S, 0x62},
>      {0x43, CM9825_VERB_SET_VDO, 0xd0},
>      {0x43, CM9825_VERB_SET_SNR, 0x38},
>      {}
> };
> 
> Above are the added comments. Please let me know if this is acceptable or not.

They look better now.

> >  static void cm9825_unsol_hp_delayed(struct work_struct *work)
> >  {
> >        struct cmi_spec *spec =
> > @@ -120,6 +179,9 @@ static void cm9825_unsol_hp_delayed(struct work_struct *work)
> >        bool hp_jack_plugin = false;
> >        int err = 0;
> >
> > +     if (spec->codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
> > +             hp_pin = 0x36;
> 
> 
> In the GENE_TWL7 project, 0x36 pin widget is used as the line-out
> pin widget.

And yet it's handled as a headphone?

> We will add another pin widget specifically for line-out with a
> distinct name to avoid confusion with the headphone (HP) pin.

Well, it's very confusing.  You have two line-outs, and one of them is
treated as a headphone, or what?  You need to show a "big picture".

> > +static void cm9825_init_hook(struct hda_codec *codec)
> > +{
> > +     unsigned int val;
> > +
> > +     codec_dbg(codec, "init hook\n");
> > +
> > +     /* OMTP */
> > +     val = snd_hda_codec_read(codec, 0x46, 0, 0xfec, 0x0);
> > +     snd_hda_codec_write(codec, 0x46, 0, 0x7ef, (val >> 24) & 0x7f);
> 
> This setting is used to enable support for the CTIA/OMTP interface,
> which was missing in the previous patch.

If so, it should be corrected by another patch instead of folding into
a patch for a new model.


thanks,

Takashi
