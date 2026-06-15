Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983739D3F1
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 07:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508572; cv=none; b=b8N1QlR6HAuEFb1xRifHYbQNTxSzo/6RIc9Nlxd+vWiO8jZQXQmMMWGmLaK7yw1Okrir+pxxeEnliwHW9vKHRJTW0L3WCjqJKAiz49kKnHcug0D4r/S3AXgbDm/fLZqrAQEebHkkgGGTmnEPsk7XpHWZixcVC8tK/EMM52p74Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508572; c=relaxed/simple;
	bh=/+w6R6/rGf27CPxK3hK3X1zoy0R9FlE1zxyyPEa2naA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t6jIxNsDlgY4sOMHmCeYU3vFRJPw6GCeBA8It2GcLjAsPHZMIpCMuu0Qa78rdtnWXry8LxsrSjefvqmYPCBT67oQ/BxVtJHAZLpr618johtM/RSjon54Eb1D49Mg5ir7vsVi43XlKWx4RBfpnSzYWpfeHBLMPh5CzMrb3l25GUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J/mA6BZ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nz9RPBv6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J/mA6BZ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nz9RPBv6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J/mA6BZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nz9RPBv6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J/mA6BZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nz9RPBv6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D7626BDED;
	Mon, 15 Jun 2026 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781508569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QostlpVhqzE+GJ2glI1dUKNfIUTnYQDNpMcfdAQnp58=;
	b=J/mA6BZ7gTT7EfIlxNpicje9EmicHgWXShWLN4Lu1C+tTmXj3z8z+m+prbw462pOW6aagA
	PzXl8Erb+YZcAwfARUAnhCu65VfcuzPJ47IDxqPwp9g0BQKwS5Q20WAHsWhA6MQrKxVZVE
	aG9W0ApAdG0jvuxUaHYtuiws0SkoCfw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781508569;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QostlpVhqzE+GJ2glI1dUKNfIUTnYQDNpMcfdAQnp58=;
	b=nz9RPBv6f4ePqf8Nh7nGezgSYdHGK23EtS2lVyiM5iku4msFkM+1TxEx4MoOToNet2VwB5
	V6JMOHJCauZ04tDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="J/mA6BZ7";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nz9RPBv6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781508569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QostlpVhqzE+GJ2glI1dUKNfIUTnYQDNpMcfdAQnp58=;
	b=J/mA6BZ7gTT7EfIlxNpicje9EmicHgWXShWLN4Lu1C+tTmXj3z8z+m+prbw462pOW6aagA
	PzXl8Erb+YZcAwfARUAnhCu65VfcuzPJ47IDxqPwp9g0BQKwS5Q20WAHsWhA6MQrKxVZVE
	aG9W0ApAdG0jvuxUaHYtuiws0SkoCfw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781508569;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QostlpVhqzE+GJ2glI1dUKNfIUTnYQDNpMcfdAQnp58=;
	b=nz9RPBv6f4ePqf8Nh7nGezgSYdHGK23EtS2lVyiM5iku4msFkM+1TxEx4MoOToNet2VwB5
	V6JMOHJCauZ04tDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2390D779A9;
	Mon, 15 Jun 2026 07:29:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D0R5B9mpL2rIRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jun 2026 07:29:29 +0000
Date: Mon, 15 Jun 2026 09:29:28 +0200
Message-ID: <87o6hcmfc7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colton Jones <cjones1308@pm.me>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add CS35L41 I2C quirk for ASUS UM3405GA
In-Reply-To: <20260615033619.7-1-cjones1308@pm.me>
References: <20260615033619.7-1-cjones1308@pm.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4D7626BDED
X-Spam-Score: -3.51

On Mon, 15 Jun 2026 05:36:20 +0200,
Colton Jones wrote:
> 
> The ASUS Zenbook 14 UM3405GA uses a Realtek ALC294 codec with two
> Cirrus Logic CS35L41 speaker amplifiers exposed through the CSC3551 ACPI
> device. The machine reports the Realtek subsystem ID 1043:19f4.
> 
> Without a PCI quirk, the codec falls back to generic pin matching and the
> internal speakers remain silent even though PCM playback completes.
> 
> Add the UM3405GA subsystem ID and reuse the same ASUS I2C headset-mic
> fixup used by the closely related UM3406HA. That fixup configures the
> headset microphone pin and chains to CS35L41 I2C speaker-amp binding.
> 
> Signed-off-by: Colton Jones <cjones1308@pm.me>

Applied now.  Thanks.


Takashi
