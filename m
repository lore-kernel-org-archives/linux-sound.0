Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC187BAF0
	for <linux-sound@vger.kernel.org>; Mon, 29 Apr 2024 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714404766; cv=none; b=Qh97AzWMiuZm5avResLFgOK61NR0QCifYi+tKp1Ibe1MkRJgYjsQX3eh6nK5X0o5BPKhAiuqVmgUnkZPCUjK02It4OwXu0oXiQG2kgcfplqApFiZPAyVGiocXX8eL5lFZZSZrNekzyFR6BHDSWHmTVFcL41eUPlNa7SCFOenXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714404766; c=relaxed/simple;
	bh=8IECo8OkMTR2jelHnyvI2VwFXrbvedpGsArS08GD99Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7Zw7efjII3IjsY9GmXsbFkMJueEEZY2YiAc7G5Fc9MliS5bECqiE7v2OCSP29V2LxykbS0NF0NoSojGgSEsnkOoksZNTFzX6vmPBHYlu4SNkdN3qZxDf+ggwPokVph7CYJtWExlVWU7adSDjHXPjsTE79E/rp51cp4DgRair5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWogoiFK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rWuqhu8+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWogoiFK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rWuqhu8+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWogoiFK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rWuqhu8+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWogoiFK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rWuqhu8+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B743338C1;
	Mon, 29 Apr 2024 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714404763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=IWogoiFKwVnJ/2PNvQ5vCNAiOqt0mNfnwZPKz+tABKEcQh1BmASgdw8xoQgDbxWGi6TCq7
	kJ2HtQ7uq69zJBs+Enawck/Qz+32LQNPxtbLu0coO2Bual+AUeC4ZrSsB+xbkADkrNgrW/
	++DhDForMxxUBNOIzC+qv1nNsW4BUx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714404763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=rWuqhu8+ThLq4TqXjXigevPI4T7vYkZh4Y1tugcfTXogxVRX1R4yU+R3cNkfj0zjlRw47m
	LInzEBeKXxMa4VAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714404763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=IWogoiFKwVnJ/2PNvQ5vCNAiOqt0mNfnwZPKz+tABKEcQh1BmASgdw8xoQgDbxWGi6TCq7
	kJ2HtQ7uq69zJBs+Enawck/Qz+32LQNPxtbLu0coO2Bual+AUeC4ZrSsB+xbkADkrNgrW/
	++DhDForMxxUBNOIzC+qv1nNsW4BUx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714404763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=rWuqhu8+ThLq4TqXjXigevPI4T7vYkZh4Y1tugcfTXogxVRX1R4yU+R3cNkfj0zjlRw47m
	LInzEBeKXxMa4VAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 290ED138A7;
	Mon, 29 Apr 2024 15:32:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MxfYCJu9L2ZdIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 15:32:43 +0000
Date: Mon, 29 Apr 2024 17:32:55 +0200
Message-ID: <87wmognpzs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of device_get_named_child_node()
In-Reply-To: <8c87a931-9e9b-4922-a126-867da5e0b3df@linux.intel.com>
References: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
	<874jbkp5zz.wl-tiwai@suse.de>
	<8c87a931-9e9b-4922-a126-867da5e0b3df@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Spam-Score: -3.29
X-Spam-Flag: NO

On Mon, 29 Apr 2024 17:15:19 +0200,
Pierre-Louis Bossart wrote:
> 
> Hi Takashi,
> 
> >> The documentation for device_get_named_child_node() mentions this
> >> important point:
> >>
> >> "
> >> The caller is responsible for calling fwnode_handle_put() on the
> >> returned fwnode pointer.
> >> "
> >>
> >> Add fwnode_handle_put() to avoid a leaked reference.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > 
> > Can we have a corresponding Fixes tag?
> 
> Good question.
> 
> The initial code was in
> 
> 6d2c66695bf3 ("soundwire: intel: transition to 3 steps initialization")
> 
> but then moved with
> 
> 08c2a4bc9f2a ("ALSA: hda: move Intel SoundWire ACPI scan to dedicated
> module")
> 
> I guess a Fixes tag for the latter is good enough, it's a 2021 commit
> and that would probably cover most SoundWire platforms.

OK, let's take it, then.  Applied now.


thanks,

Takashi
