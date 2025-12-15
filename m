Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEF029BDBD
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765787770; cv=none; b=SP8FTyQREflRWVVmD6D8TtIS9IE+9KxbWLRr4QFoSsLasNGtMnJ4ZT0n+E1oo4b9wd1WXv+SAnM5LK5t3OAQ5C8Azd86H9Vr6F1Ihiv42TOAnti3L2fdcauhv95F3+2JqH+C+spickBsfqy1AyxO392VxZNtJ6yBy4qFQo/yqYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765787770; c=relaxed/simple;
	bh=16Li0G7aiuHG/z5H0NkOi8LM2/buygGg+GsQXOuKJlA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVlRSWSHY2tBs5LSPkiars4Lcd3vR9u6E0MA3LySrUbvGVv7qKhlmVu8gwdP3gDEYvRoP+Ch08h3v71Ls/C3+IxLztUIOaGhGgWdzMaidDvhC4Qo5PcpodEXlHRUW6DiKTbrYY2GfPAulKP4Q3zRqiqJ5tlY+495PAmRjZa0R/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aMf6f0MT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sJpqExad; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aMf6f0MT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sJpqExad; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aMf6f0MT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sJpqExad";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aMf6f0MT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sJpqExad"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7A84336AF;
	Mon, 15 Dec 2025 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765787766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL1j3fsiwMHxJ7DA8bfanP4tOY/yW5X0itM8XiSsxBo=;
	b=aMf6f0MT1jlOCNk+Q3OOKJqua4UEOWadtyfoRM9czBA6ILA126c6qNZcI4VhYLpeRon857
	063YYd4B8/yTk9XVEg8n8qWL3jKZ/TYYIhyMwJ8U4TAJVdB1sDHpf8XN8xumqvD4srzNFt
	tDY+Csy1Y4i25RF4HZqtxJd+0lNGrSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765787766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL1j3fsiwMHxJ7DA8bfanP4tOY/yW5X0itM8XiSsxBo=;
	b=sJpqExad7eUemeviPVBJeUsRIAlrrrzNbA1fQP3wVEhWXSacH8fCfPq2VCH+4JMTBKUiJ+
	/rPGZkUi5b62MwDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765787766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL1j3fsiwMHxJ7DA8bfanP4tOY/yW5X0itM8XiSsxBo=;
	b=aMf6f0MT1jlOCNk+Q3OOKJqua4UEOWadtyfoRM9czBA6ILA126c6qNZcI4VhYLpeRon857
	063YYd4B8/yTk9XVEg8n8qWL3jKZ/TYYIhyMwJ8U4TAJVdB1sDHpf8XN8xumqvD4srzNFt
	tDY+Csy1Y4i25RF4HZqtxJd+0lNGrSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765787766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL1j3fsiwMHxJ7DA8bfanP4tOY/yW5X0itM8XiSsxBo=;
	b=sJpqExad7eUemeviPVBJeUsRIAlrrrzNbA1fQP3wVEhWXSacH8fCfPq2VCH+4JMTBKUiJ+
	/rPGZkUi5b62MwDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7794A3EA63;
	Mon, 15 Dec 2025 08:36:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wyOyG3bIP2m0XQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Dec 2025 08:36:06 +0000
Date: Mon, 15 Dec 2025 09:36:05 +0100
Message-ID: <87sedc6t1m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Leo Tsai <antivirus621@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cm9825: Add new project GENE_TWL7 for AAEON
In-Reply-To: <20251215081422.3771-1-antivirus621@gmail.com>
References: <20251215081422.3771-1-antivirus621@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.955];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 15 Dec 2025 09:14:21 +0100,
Leo Tsai wrote:
> 
> The GENE_TWL7 project is an AAEON platform with a fixed audio
> configuration consisting of line-out, line-in, and mic-in.
> The audio routing and pin assignments are defined according to
> the board-level hardware design and are not intended to be
> dynamically changed.
> 
> Signed-off-by: Leo Tsai <antivirus621@gmail.com>

Please put v2 (or later number) prefix when you resubmit a newer
patch (e.g. [PATCH v2] ALSA: hda/cm9825: ....)

One thin I haven't noticed in the previous review:

> @@ -258,6 +506,51 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
>  	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
>  
> +	switch (codec->core.subsystem_id) {
> +	case QUIRK_CM_STD:
> +		snd_hda_codec_set_name(codec, "CM9825 STD");
> +		INIT_DELAYED_WORK(&spec->unsol_hp_work,
> +				  cm9825_unsol_hp_delayed);
> +		spec->chip_d0_verbs = cm9825_std_d0_verbs;
> +		spec->chip_d3_verbs = cm9825_std_d3_verbs;
> +		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
> +		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
> +		cm9825_setup_unsol(codec);
> +		break;
> +	case QUIRK_GENE_TWL7_SSID:
> +		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
> +		INIT_DELAYED_WORK(&spec->unsol_linein_work,
> +				  cm9825_unsol_linein_delayed);
> +		INIT_DELAYED_WORK(&spec->unsol_lineout_work,
> +				  cm9825_unsol_lineout_delayed);
> +		spec->gen.hp_mic = 0;
> +		cfg->line_outs = 1;
> +		cfg->line_out_pins[0] = 0x36;
> +		cfg->line_out_type = AUTO_PIN_LINE_OUT;
> +		cfg->num_inputs = 2;
> +		cfg->inputs[0].pin = 0x3b;
> +		cfg->inputs[0].type = AUTO_PIN_LINE_IN;
> +		cfg->inputs[1].pin = 0x37;
> +		cfg->inputs[1].type = AUTO_PIN_MIC;
> +		cfg->inputs[1].is_headphone_mic = 1;

You're setting up the autocfg stuff here, but
snd_hda_parse_pin_defcfg() is called after this point.
Wouldn't it override the values set here?

That is, if you'd like to set up a static pin table, it's better to
provide your own default pin table via snd_hda_apply_pincfgs().
It's something like other codecs applying the pin quirks.


Takashi
