Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1B13BAE3
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732607291; cv=none; b=Me81VLqxWMnxj5oRWLXVkKUl46H4Nww8UbXXP71p54huoXz/d1t3rnzIfbNVmISiHEjkc36eiaGSIS7xdH0FFHU6wvHlYrlIcTzIdTUwOhpHmreh3TB2bZKJwcdlZ5V4JIZIv9B5ckQ5dC1/gBCUpNk8VtUmiAma2vUuN9z5/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732607291; c=relaxed/simple;
	bh=TcEGDgkPsRK4pg9r5LSjKyTpCdzPMsSKQ5SxI+FKxO8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8+3nUO+cb+jlnRBv7XB+NqX0BSvYzJ3f0R9lgOIr6uEfTrb5/YTormO4/rz4NsHzQFeJwrumfEH6f0yY3z2h/tCfCsqf5B29SaW9FlsK3pmnHY2CSLd2e1XtvJUdiIQNld1fzKF8R8Qe/K2MVHvlxezbqzqrzEtwqkngc3o88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1t2TWcsm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pkChUaap; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1t2TWcsm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pkChUaap; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1t2TWcsm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pkChUaap";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1t2TWcsm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pkChUaap"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C111210F9;
	Tue, 26 Nov 2024 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732607288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTJs5EPDM/NvdFwVIv4Pq7eK5ZkDllbi4IPboFa/1Ww=;
	b=1t2TWcsmkUXHOAyg4BFdZu/a1hfb41hfAurigocBq44arCJ2ODkHFJbcXcHC4qFxAeqlXT
	Woae2MRgO8fD3rtWah9uBGfGSMxRFhWp1oTBNZjnf612GhbNC4fGcWqAbzorQFXvYvDkjy
	GCqXicnyPZuYyg2hVRnVfygE25eHN00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732607288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTJs5EPDM/NvdFwVIv4Pq7eK5ZkDllbi4IPboFa/1Ww=;
	b=pkChUaapsStPWo8srNVp6ge/OPf0J2AA7pdCMKhuEBswT/gB5yb8SzAi9QQ5AIMqWOMiUF
	WjDSxZw/5+WREsDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732607288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTJs5EPDM/NvdFwVIv4Pq7eK5ZkDllbi4IPboFa/1Ww=;
	b=1t2TWcsmkUXHOAyg4BFdZu/a1hfb41hfAurigocBq44arCJ2ODkHFJbcXcHC4qFxAeqlXT
	Woae2MRgO8fD3rtWah9uBGfGSMxRFhWp1oTBNZjnf612GhbNC4fGcWqAbzorQFXvYvDkjy
	GCqXicnyPZuYyg2hVRnVfygE25eHN00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732607288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTJs5EPDM/NvdFwVIv4Pq7eK5ZkDllbi4IPboFa/1Ww=;
	b=pkChUaapsStPWo8srNVp6ge/OPf0J2AA7pdCMKhuEBswT/gB5yb8SzAi9QQ5AIMqWOMiUF
	WjDSxZw/5+WREsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0751713890;
	Tue, 26 Nov 2024 07:48:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WfyLADh9RWcFZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 07:48:08 +0000
Date: Tue, 26 Nov 2024 08:48:07 +0100
Message-ID: <87zflmjv0o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable speaker pins for Medion E15443 platform
In-Reply-To: <eac4f3aca2ab45e59ccd207a90ee60e9@realtek.com>
References: <eac4f3aca2ab45e59ccd207a90ee60e9@realtek.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 26 Nov 2024 07:28:37 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach was fixed speaker no sound issue.

Thanks, applied now.


Takashi
