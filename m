Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA02A21FF2E
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216451; cv=none; b=eperrZsIB08EP1ygSOFIuep2eeDDflAg6f0MwJ2uU0Zr8Fv25zcy+uTUOO+kXetbTjIv2tb5QEzQxAewfV6Lr0Uu/6FMp8eD9ZpXYtDPLTAjtXbZW4cDzc6ZBNJKT6buzZ7oRPCV3o16vMNNdkyJC4LLJF69pMtITtIsVuCYGeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216451; c=relaxed/simple;
	bh=xUJhKqiJ7CXUIBdFz3zU9vzeaIgArcP0t+vlG+CWhBM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WoqdHPvZq4niZrBPz/QvXyO0ms10vWrfJm81NOYm8ewiXOpOA1u393i2bV6yHPf0Qc83mDsmaRtoJ5tXYobhWG4p1C01kYea/THi9GpWcPXj4RE/pROuMcNKuxCwl1Fpk1yCGlgQYRtCpYXZxVnYJjJKzLYCSRoqWdfm8ggrXtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z3NdA0kS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Xxhgsml; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h0mYQdbM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cdQ6+o1P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z3NdA0kS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Xxhgsml";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h0mYQdbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cdQ6+o1P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2DC95BD66;
	Wed, 11 Mar 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773216447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AofbZcMfpL6IEhDDdL4S64zeOSrhqrPopNEJjNnkIWo=;
	b=Z3NdA0kSa0xXs9eFjdSvotlEuudNZrCrPqJIvMfJB9903q5fhH0oGfValqoyHGtGp0TXcp
	Ws3fdfZvlXStN/f+ZihtCO2qNXYBkUWyqZsOwZnz6tutnS9yc7qPMJ6VzP6XS8BXtYZ2Cn
	/Af2JWgkV1ke+ItNLaF+sL1S2tyjNFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773216447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AofbZcMfpL6IEhDDdL4S64zeOSrhqrPopNEJjNnkIWo=;
	b=/Xxhgsmlck3mSwd1mP1mvvRJJYnFFsdEGsFmHjsbI8On5hhvXPtAUZicsh/eErwzLXFumx
	XuhNKhOWKQzwf0DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773216446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AofbZcMfpL6IEhDDdL4S64zeOSrhqrPopNEJjNnkIWo=;
	b=h0mYQdbMJ1bqzCkg/++eKlO8U6eF6x7OW53TQWZyV1e/0ZH50gyZ2lyxjGi/N9tr2lbXZF
	UWHjiEsThkh9sI+LHlpApQBbWe4Q2k1LINb6ly6t3IaDf3Vv1bD/5WOV0iP20jkJ9GfukC
	LDJ4/H6iMwEbA+UJwOBYac+8BrCtvo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773216446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AofbZcMfpL6IEhDDdL4S64zeOSrhqrPopNEJjNnkIWo=;
	b=cdQ6+o1PUt86uEhyTbbsX/Pub8a2Iokv/Zt54pOuP6NEU2d++Dl77hF0gCspdKrM8UYdlG
	QETXktzHADI6fACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A55CD3F8F6;
	Wed, 11 Mar 2026 08:07:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M7MZJ74isWmFfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Mar 2026 08:07:26 +0000
Date: Wed, 11 Mar 2026 09:07:26 +0100
Message-ID: <87fr664wn5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk for SPACETOUCH USB Audio
In-Reply-To: <TYUPR06MB6217ACC80B70BE25D87456B0D247A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217ACC80B70BE25D87456B0D247A@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,vivo.com:email,suse.de:mid]
X-Spam-Flag: NO

On Wed, 11 Mar 2026 08:22:38 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=0666, idProduct=0880
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: USB Audio
> usb 1-1: Manufacturer: SPACETOUCH
> usb 1-1: SerialNumber: 000000000
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
