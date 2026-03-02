Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43D0212FAD
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440702; cv=none; b=M9HUfYNdkXQsxIasdX8pHrLgzfdYBUy0+YbLlbefWmLDPgrdT2XutAC7reh9t9QvAMElf3QH/0uQ8clxFxjbbqXoI6JvyASB5zkhCTMPyKAQFU27AXxd8MaYXnVCnyQZ+BbFeDuN2Ysp2l/38dmzQpjS0jpCMGvBLGCRf2FyTf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440702; c=relaxed/simple;
	bh=5ugLVuT+3MNTAn9OWVkS7WiEkkwMUQc1c+jV9UvGpeM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iE2gQaL5HaaPv5gXsqE/v6YSwF8QuhQ34R42D0vQeRoD93eC2ZXr59jTRkdwzmdn8DJa5iYMUCWgEKyBm9Hyxih3ZA90JoUkC0Vo5TOOo0RgHHse2em6lcV7Dn5PQkHFt2p9N49ZqSJjxlr8ixby31WllUN7Vm9d5ysmikouvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P5MMv63M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yk8Vmto9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h3ASvfBv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2RCHCmq8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P5MMv63M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yk8Vmto9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h3ASvfBv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2RCHCmq8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1BFD3FF27;
	Mon,  2 Mar 2026 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772440698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRi0gEJVLuDmlKElTSJnEiYYYvASIEVjScssBHi5c6M=;
	b=P5MMv63M/vEufbeHQqfVxjef1XE6iNgXttA3+CpObCj5yMkqHoCwh6qptjAsFpST7o8X8L
	SFD/5Yemip4P7wAMwaWIDDCgg4SrxE9ujeet3DI8ocAdQsmpmGTg+qbuk66YKRTtc5GGwL
	1/XP1XDAuvWCw2aJbZhZOJADi6bBp5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772440698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRi0gEJVLuDmlKElTSJnEiYYYvASIEVjScssBHi5c6M=;
	b=Yk8Vmto9KsZsGLKMhgJJKiDBXo1xX0NB4+5N+7Nb1eEV32VI5w/AoooUNCrLIBuknK5C8I
	KMbfqMoGD3XZLzDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h3ASvfBv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2RCHCmq8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772440697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRi0gEJVLuDmlKElTSJnEiYYYvASIEVjScssBHi5c6M=;
	b=h3ASvfBvazwgm7uyY8hKJOyI6+iHoMS3fQekuv7wtvjtiyY3RN2mB5RbOo5/v1yXZqHKv7
	7oo7DFv8LurtuIFdmduS4Y++nTo/52Fv+FRa8deedVlM+XsXqiRGL5pHE+ioMW3IfqBQ67
	FKs5NCdCZz65S6k122qkbogTpTAmjOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772440697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRi0gEJVLuDmlKElTSJnEiYYYvASIEVjScssBHi5c6M=;
	b=2RCHCmq83rc/s1lNOhotxnv7204d9mnL+ipX0KrTzvNCz0y+LR2sxYRBgIOqAUXdRzy6w0
	cFX+XEvgvYkyT7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD4A23EA69;
	Mon,  2 Mar 2026 08:38:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id noP5MHlMpWnTPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Mar 2026 08:38:17 +0000
Date: Mon, 02 Mar 2026 09:38:17 +0100
Message-ID: <87v7femxs6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/intel: Synchronize the module parameter values of the power_save
In-Reply-To: <20260302081218.771520-1-songxiebing@kylinos.cn>
References: <20260302081218.771520-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: F1BFD3FF27

On Mon, 02 Mar 2026 09:12:18 +0100,
songxiebing wrote:
> 
> In set_default_power_save, if val is 0 and is not assigned to
> power_save, it leads to incorrect reading of the sys node, resulting in
> misjudgment, so modify it here.
> 
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>

I'm afraid that this can break things in a subtle way, e.g. when there
are multiple HD-audio controllers, and only one of them is
blacklisted.

The power_save option is provided as a single knob for simplicity, in
the case if user wants to change intentionally.  And this doesn't
guaranteed to be the actual power-saving timeout value that could be
adjusted also via sysfs.


thanks,

Takashi

> ---
>  sound/hda/controllers/intel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 3f434994c18d..6c6564396637 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -2306,6 +2306,7 @@ static void set_default_power_save(struct azx *chip)
>  		dev_info(chip->card->dev, "Forcing power_save to 0 via option\n");
>  		val = 0;
>  	}
> +	power_save = val;
>  	snd_hda_set_power_save(&chip->bus, val * 1000);
>  }
>  
> -- 
> 2.25.1
> 
