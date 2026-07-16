Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4D40315F
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197804; cv=none; b=n3tiGDrJ21uoFDIGBc7dUEAZviUxlD7uJpPVggxOu++VWbv3luWRdZnTisRq0/1b14rWWAGHUISUmsX+Ct+csrSWXXUgnZlsH/uuqwc+ZFRe+bNVt5MKyrrPTegPB/e9JXgk0vc4DE0Q3ZxC/u1NlUfKZwALf7XOVxQNfKJhhyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197804; c=relaxed/simple;
	bh=r0uL40poHrbOTwuMl5R0YkpdYmS8pPvuhnaDQo+y4Eo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFvRbZRr60LKWy7H9jLe386vJTu8NFzt9PprGUBd0Zq8RPVqOq0WPha6DeUxw0r5UFS+faXVXxGdu7A3i8HbgMPkf1eZs5vaSTzkEMnXfqYx+IN4s5ZQSjOGW416aYUuIeHBvATGnzn1+40MJSo+Dt5G7UVvwb7qWv9wI1829R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kMSWPG4O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dXebXPf3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kMSWPG4O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dXebXPf3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kMSWPG4O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dXebXPf3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kMSWPG4O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dXebXPf3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B257A788E2;
	Thu, 16 Jul 2026 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784197800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IowYhS0QHOnVk0pQxAnk4MM7yfk/rasVZRKPcDmOKOU=;
	b=kMSWPG4OG1buWX2wo1n4jVo25NN/QF3ptfRdQY4BioKDSfvZQ43uvzfz8r/+j+XzGhQLre
	7XJfCO5Lx5CgU9FxWZ3NRdL6BS4rACEoWS5TQJv4BiFdybBqtkZpX7nrx9i4Qybs2ExilO
	0Gaa8K2oARjhSRXFNr4snaUon0DCFAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784197800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IowYhS0QHOnVk0pQxAnk4MM7yfk/rasVZRKPcDmOKOU=;
	b=dXebXPf3hDS0zRc25292Ill/ff16YRU43ok15wlC8n4BQkDFcoB/rlOpist3bRptNFqxMX
	evxkdBWs6jWK6eDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784197800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IowYhS0QHOnVk0pQxAnk4MM7yfk/rasVZRKPcDmOKOU=;
	b=kMSWPG4OG1buWX2wo1n4jVo25NN/QF3ptfRdQY4BioKDSfvZQ43uvzfz8r/+j+XzGhQLre
	7XJfCO5Lx5CgU9FxWZ3NRdL6BS4rACEoWS5TQJv4BiFdybBqtkZpX7nrx9i4Qybs2ExilO
	0Gaa8K2oARjhSRXFNr4snaUon0DCFAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784197800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IowYhS0QHOnVk0pQxAnk4MM7yfk/rasVZRKPcDmOKOU=;
	b=dXebXPf3hDS0zRc25292Ill/ff16YRU43ok15wlC8n4BQkDFcoB/rlOpist3bRptNFqxMX
	evxkdBWs6jWK6eDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4858C779AD;
	Thu, 16 Jul 2026 10:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8tYtEKiyWGqTUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Jul 2026 10:30:00 +0000
Date: Thu, 16 Jul 2026 12:29:59 +0200
Message-ID: <87ik6fut08.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yufan <kuangfan955@gmail.com>
Cc: sbinding@opensource.cirrus.com,
    linux-sound@vger.kernel.org,
	tiwai@suse.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l41: Fix Speakers on HP OmniBook 7 16-bh0xxx
In-Reply-To: <20260716101708.86725-1-kuangfan955@gmail.com>
References: <20260716101708.86725-1-kuangfan955@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 16 Jul 2026 12:17:08 +0200,
Yufan wrote:
> 
> From: Yufan Kuang <kuangfan955@gmail.com>
> 
> The HP OmniBook 7 Laptop 16-bh0xxx (SSID 103C8E60) has two CS35L41
> amplifiers connected via I2C with internal boost, but its _DSD
> provides cirrus,dev-index as a Package while the driver expects
> per-device scalar values, causing the probe to fail with -EINVAL,
> leaving only the left speaker working.
> 
> Add the SSID to the configuration and prop-model override tables.
> 
> Tested on a HP OmniBook 7 Laptop 16-bh0xxx (BIOS F.12) with
> CachyOS 7.1.3-2; speaker-test confirms both channels work correctly.
> 
> Signed-off-by: Yufan Kuang <kuangfan955@gmail.com>
> Assisted-by: Copilot:DeepSeek-V4-Pro

The very same change has been already submitted (maybe multiple
times), e.g.
  https://lore.kernel.org/20260709214414.8461-1-skbotnl@disroot.org

The problem is known, and it's basically an issue of the firmware.
But obviously we need to address *something* in the driver side.

Cirrus people -- do you have ideas to fix those HP laptops?

If it's not feasible in a short term, maybe it'd be better to take
those quirk additions; although they aren't 100% correct, but they do
work somehow in a certain level.


thanks,

Takashi


> ---
>  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 416d7bf3e289..e14a87336478 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>  	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
>  	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
>  	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
> +	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
>  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
> @@ -511,6 +512,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
>  	{ "CSC3551", "103C8CDD", generic_dsd_config },
>  	{ "CSC3551", "103C8CDE", generic_dsd_config },
> +	{ "CSC3551", "103C8E60", generic_dsd_config },
>  	{ "CSC3551", "104312AF", generic_dsd_config },
>  	{ "CSC3551", "10431433", generic_dsd_config },
>  	{ "CSC3551", "10431463", generic_dsd_config },
> -- 
> 2.55.0
> 
