Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D322CF0C;
	Mon, 13 Jan 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736768172; cv=none; b=JTXi1piDSBpopIsPMYKrLDTbPPnuL1WZhpPdL76V1M0WflVKOL/Hpn/RMBlJFnxAhS6iZO0uEPKilveOHHxtk8H7DBzRuk+KlMVd/fHH08hxYrpngWTLcFqLNU+oQNU2qQr4hjjvykPkh8JYifhUheoW8bhgwFlk0WFjfGFy7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736768172; c=relaxed/simple;
	bh=tmADMhGl+CbAmxOrDUaGYbQPgsCRLI/poXyP1fWwTyg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3rgfPv54ZySqngPmM51p/YFTY7exZTAq9epN9Ukohw09j7rSJqGUJNh0pfmrb6gaMjxD2Q9UwcAPChGG4DdvoA4ZOdWLz1Nez+Ku3UeTPN4cdEyDx55+CtlnpQBR1nmfG84izd2d9t6sDeJ/J6TqO/EgE0cEHKfHOYYTb/oS4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IUISksMi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0WF9EbGA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IUISksMi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0WF9EbGA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IUISksMi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0WF9EbGA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IUISksMi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0WF9EbGA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4F8B1F37C;
	Mon, 13 Jan 2025 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736768168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qCre/YS7qWet8fDBKUpP/qr12r1ky1g24G7VB5/MCM=;
	b=IUISksMiLL7csQ9kYK/EOpf+d4BIdbzFOsg75sUTm8Q9zpFDbxzhbJwvS76lsXN7DXW9Oc
	XAA0eAL0XGEFmBsWo2tEUR4wzoez38PyszSJjMA4vPlxo7s5OLbOMIgb3dyOMCZS4sedpS
	wIZeAEwLiymFxe7APD00nLYjlf4V85o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736768168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qCre/YS7qWet8fDBKUpP/qr12r1ky1g24G7VB5/MCM=;
	b=0WF9EbGAD5ccMgxOhzPYXRBelRfDNGFuGriEVG0T+25LNbQQw4GLbuHfJB8nyCLvT3LBcX
	Cwjb9pbowZ7mhaDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736768168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qCre/YS7qWet8fDBKUpP/qr12r1ky1g24G7VB5/MCM=;
	b=IUISksMiLL7csQ9kYK/EOpf+d4BIdbzFOsg75sUTm8Q9zpFDbxzhbJwvS76lsXN7DXW9Oc
	XAA0eAL0XGEFmBsWo2tEUR4wzoez38PyszSJjMA4vPlxo7s5OLbOMIgb3dyOMCZS4sedpS
	wIZeAEwLiymFxe7APD00nLYjlf4V85o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736768168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qCre/YS7qWet8fDBKUpP/qr12r1ky1g24G7VB5/MCM=;
	b=0WF9EbGAD5ccMgxOhzPYXRBelRfDNGFuGriEVG0T+25LNbQQw4GLbuHfJB8nyCLvT3LBcX
	Cwjb9pbowZ7mhaDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F7E113310;
	Mon, 13 Jan 2025 11:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZjASHaj6hGesfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jan 2025 11:36:08 +0000
Date: Mon, 13 Jan 2025 12:36:08 +0100
Message-ID: <87sepn2bfb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yage <icoderdev@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix volume adjustment issue on Lenovo ThinkBook 16P Gen5
In-Reply-To: <20250113085208.15351-1-icoderdev@gmail.com>
References: <20250113085208.15351-1-icoderdev@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 13 Jan 2025 09:52:08 +0100,
Yage wrote:
> 
> This patch fixes the volume adjustment issue on the Lenovo ThinkBook 16P Gen5
> by applying the necessary quirk configuration for the Realtek ALC287 codec.
> 
> The issue was caused by incorrect configuration in the driver,
> which prevented proper volume control on certain systems.
> 
> Signed-off-by: Yage Geng <icoderdev@gmail.com>

Applied now.  Thanks.


Takashi
