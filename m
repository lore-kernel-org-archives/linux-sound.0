Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCEF149DEF
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719309240; cv=none; b=PDanrHysNHah7FEvcHiqTk8uZdYmFW8/Yx7d0TMjtyfbWEnoQcpjFSdh4bdDQKAUwqjcm6F9AXZuThfG/XFiFNYjf2veaMb4PC57F1ePIGZO4spcH+hlMtKL2fAzLgFCeZ2EhMYA4JVRPd8lXnxrHwP4MvczJF+IV/ZWQb99/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719309240; c=relaxed/simple;
	bh=Dn9xumzNxKzSiOrP0SToKJFbL4BntE2Ijb85gF7JMdg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMDvK8PKB6YlyWNtFSFH9I4/wbekeT5gKFaCCKbkZxmLedlmX9Ky5HNJ0ArT2OWYzpE5Gc26JVkTCgF5pAn0aDO+QR742af+a9C5C3louN+23v+6U1MIF0ciHNdAcSyGgx549FbiM3Qa6q3ZNeqssf21UynWSEWLlVbdukkOlrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HuNYe7cV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SayzPGPy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HuNYe7cV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SayzPGPy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HuNYe7cV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SayzPGPy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HuNYe7cV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SayzPGPy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5742021A62;
	Tue, 25 Jun 2024 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719309237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMuhUMaMAUKqFOpcc9zoFOkAh531EPpKjLpyQNCnezg=;
	b=HuNYe7cV9dG5tliatshF2+6rfEAOnXT2r4l6aewusX589QJW1BhwVS6v6S7i+SwpqlfnP0
	7O5wz1t0eST/LnJAoKzNGogrdWBq/DubLXt9UghA6+FTLY8FoYXU3EAbnFEfl3pInRCaN+
	39wdADJ2/z5X/wJ9ql1ijY9BkoM5x4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719309237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMuhUMaMAUKqFOpcc9zoFOkAh531EPpKjLpyQNCnezg=;
	b=SayzPGPyBWfWTMmeD0oQhLmlr1tEikFlxxq9dNs93yDdRXATuxE+ENJMP+D06q3NZNEtQ/
	5K+j19zQbEEU1MDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719309237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMuhUMaMAUKqFOpcc9zoFOkAh531EPpKjLpyQNCnezg=;
	b=HuNYe7cV9dG5tliatshF2+6rfEAOnXT2r4l6aewusX589QJW1BhwVS6v6S7i+SwpqlfnP0
	7O5wz1t0eST/LnJAoKzNGogrdWBq/DubLXt9UghA6+FTLY8FoYXU3EAbnFEfl3pInRCaN+
	39wdADJ2/z5X/wJ9ql1ijY9BkoM5x4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719309237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMuhUMaMAUKqFOpcc9zoFOkAh531EPpKjLpyQNCnezg=;
	b=SayzPGPyBWfWTMmeD0oQhLmlr1tEikFlxxq9dNs93yDdRXATuxE+ENJMP+D06q3NZNEtQ/
	5K+j19zQbEEU1MDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37C8713A9A;
	Tue, 25 Jun 2024 09:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AtLSDLWTemYOUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 09:53:57 +0000
Date: Tue, 25 Jun 2024 11:54:24 +0200
Message-ID: <87zfr9mjov.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aivaz Latypov <reichaivaz@gmail.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
In-Reply-To: <20240625081217.1049-1-reichaivaz@gmail.com>
References: <20240625081217.1049-1-reichaivaz@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 25 Jun 2024 10:12:02 +0200,
Aivaz Latypov wrote:
> 
> This HP Laptop uses ALC236 codec with COEF 0x07 controlling
> the mute LED. Enable existing quirk for this device.
> 
> Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>

Applied now.  Thanks.


Takashi
