Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC4385530
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126088; cv=none; b=LY7ZSh9bz7dYVf2zuQZajbML0Ub0k+RihJ2fs9ygWDkgR5so6RKJl1zMZGDdBZ8XdnIZ9p4ogoxmyq3opqqc5tYVdr23aeCcOKjgUlSLJStiOqpH7cZ3yN7Q6FdfJkIJzPsAZ+89IyuaA6egh73GYyxvtkyKM+8kJHcj6CYwTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126088; c=relaxed/simple;
	bh=JRvVuKjLPRiHQR8TV3RfotFUbSZfODlyo5ryDiv2JtM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RRYTw3T8V+79r0mmiJZTfio/joat0wNwDTeLtm44Ku4DQx/zJKiz39wOnwGco19ZostwgOr9/4zCahBZnA1nnMlc9AbtA3SHJOkOjqXLA0HN+y3frvPMyghqpBQyISftURYoSIDsMvVV9OTQuExPTdq871Nppf6JGkHo0gKdeGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wod6cJ7O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3oeq8On4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wod6cJ7O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3oeq8On4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wod6cJ7O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3oeq8On4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wod6cJ7O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3oeq8On4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D58A3E2E;
	Wed, 15 Jul 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784126084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5M9otqlEv1R6iv9nSMGokHwkHwsUR2+PtgccIBBm10Y=;
	b=wod6cJ7OkHlNtNO1idAuaFExme/Gq4nfYWEj7o8QWM/9YGX965YGOnfdABdh4aiRWgU5nJ
	byPVl4usLUMWUPKgHQO1XYI/NDdUzaSfYXqak+rXRUN6zrYH20+LH3lq9a6XB3WfTK77pp
	aVriJ3NMZqoWagu2U03bVX5LK0eHqRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784126084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5M9otqlEv1R6iv9nSMGokHwkHwsUR2+PtgccIBBm10Y=;
	b=3oeq8On4CDDUphfNgNngkFAq0rP7hzKyCd7KGLlX4wTjsjASxgmVdAQqSkmx6wKT7F2LU6
	I7wU3Qi95X6u32DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784126084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5M9otqlEv1R6iv9nSMGokHwkHwsUR2+PtgccIBBm10Y=;
	b=wod6cJ7OkHlNtNO1idAuaFExme/Gq4nfYWEj7o8QWM/9YGX965YGOnfdABdh4aiRWgU5nJ
	byPVl4usLUMWUPKgHQO1XYI/NDdUzaSfYXqak+rXRUN6zrYH20+LH3lq9a6XB3WfTK77pp
	aVriJ3NMZqoWagu2U03bVX5LK0eHqRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784126084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5M9otqlEv1R6iv9nSMGokHwkHwsUR2+PtgccIBBm10Y=;
	b=3oeq8On4CDDUphfNgNngkFAq0rP7hzKyCd7KGLlX4wTjsjASxgmVdAQqSkmx6wKT7F2LU6
	I7wU3Qi95X6u32DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50CD1779AD;
	Wed, 15 Jul 2026 14:34:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FluUEoSaV2oeVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 14:34:44 +0000
Date: Wed, 15 Jul 2026 16:34:43 +0200
Message-ID: <87pl0owccc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Sven Jans <skbotnl@disroot.org>,
    David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
In-Reply-To: <20260709214414.8461-1-skbotnl@disroot.org>
References: <20260709214414.8461-1-skbotnl@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Thu, 09 Jul 2026 23:43:53 +0200,
Sven Jans wrote:
> 
> The laptop has a malformed _DSD which causes the cirrus,dev-index
> property to fail to parse, so it needs to be supported using the
> configuration table.
> 
> Signed-off-by: Sven Jans <skbotnl@disroot.org>
> ---
> Resubmission, discussion of the previous submission stalled.
> The values are equal to the values reported in the _DSD.
> You can find my ACPI dump to verify here:
> https://bugzilla.kernel.org/attachment.cgi?id=310050
> Link to v1:
> https://lore.kernel.org/linux-sound/20260506181807.22547-1-skbotnl@disroot.org/

Stefan, is this also one of models with odd firmware?


thanks,

Takashi

> 
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
