Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006376;
	b=UeQyooqeREEjqcJ5y1sbIKI3M2as4Kv+BK8uy0JujmSSE25Aya7j+kbYFon1rnkPUTfs
	 8Hjh4UvkQWh8jTF4HbI7G+QkHAQP9qCqPNN0Z5el9SlJekX0zK5LNLDr5MZdDs4I5Dqt+
	 YuIoHol7Zaha1L1UsABeQChLqY0kR5J0AU+iqFgWf2V2ihawiuCB4Q7tzOjdXPiyLPbs0
	 SV3dZBsiUeze+XnrbQ1ElMB66oQO5YRdAVJZt79S9dHTjdrqyki78hp3OXIekS/RPPiBv
	 zF9TkWirVSO8bdv3vYwWQ09jxaEtMQ9xsVrAINytzDR5ZEznVkagtyslD6LlpC1ZJ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006376;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=5RlJ9JaXzON+bp/ydprBt7ZaxWIYfrJ/mgoQlSmVRQU=;
	b=GjFF9QycuKAbzo339/4MnifFEM3PsIV3zGwW8sceVXrMPO1VUDcTeSfT3tz5dVY5sw1k
	 IO3q+ZA5WUAY1cgEWjyOgBO7BgoO/uKy1Ai/Le+Un661zCqUF2bL3xY0uffMqkrtZ8WjN
	 hNcdUEk98kR0LYJLjEa4z8xKeaUmG7D7DCRSrM6e+wf//UYtE/i0JYR8yxcLhS0gt19Ag
	 /zBwSvD+TEQwAWXJe5IJo2EbVvyk02mR+L4n9s0gINZ4dQIcqbaCZ/1h4ocs2E8xCUl+4
	 FuzP9s9wAb9EhE5NJnENxEdWWuk5j/W97kGNV6jEp9kuJr+JtqyCGFJ8O3dbfP7B3dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cb3ESMEn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ym9JweC4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cb3ESMEn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ym9JweC4;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D7606A325;
	Wed, 18 Nov 2026 12:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373D7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cb3ESMEn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ym9JweC4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cb3ESMEn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ym9JweC4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7258622318;
	Wed, 18 Nov 2026 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RlJ9JaXzON+bp/ydprBt7ZaxWIYfrJ/mgoQlSmVRQU=;
	b=Cb3ESMEn6TwbkaqQcBY8Wl/Uj6YxvSJCLLSKisDU7k1b0/MIBPVm4o3cbegGyCXysoQwgN
	ciCokrHw3nrlBFrMULN2qRfZrpz8aOcXayBrwLncjnIxQOusaOEiscwn1/hnUIlanWa84K
	ispEwI6chu4ua40K9AIkG/6Uw1WksU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RlJ9JaXzON+bp/ydprBt7ZaxWIYfrJ/mgoQlSmVRQU=;
	b=Ym9JweC4WKz8KgMp9D6FeRR8LmRywH6g76REvHx+754NdY3UOjj+KZJdpIrA1s7Hw2G2/t
	Jj8uHEo5fPG9dIDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RlJ9JaXzON+bp/ydprBt7ZaxWIYfrJ/mgoQlSmVRQU=;
	b=Cb3ESMEn6TwbkaqQcBY8Wl/Uj6YxvSJCLLSKisDU7k1b0/MIBPVm4o3cbegGyCXysoQwgN
	ciCokrHw3nrlBFrMULN2qRfZrpz8aOcXayBrwLncjnIxQOusaOEiscwn1/hnUIlanWa84K
	ispEwI6chu4ua40K9AIkG/6Uw1WksU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RlJ9JaXzON+bp/ydprBt7ZaxWIYfrJ/mgoQlSmVRQU=;
	b=Ym9JweC4WKz8KgMp9D6FeRR8LmRywH6g76REvHx+754NdY3UOjj+KZJdpIrA1s7Hw2G2/t
	Jj8uHEo5fPG9dIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29E60134E9;
	Wed, 18 Nov 2026 12:52:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f4QLAaaf/WoeWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:52:54 +0000
Date: Wed, 18 Nov 2026 13:52:53 +0100
Message-ID: <87y0aqwbbu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: core: Validate card indices in lookup helpers
In-Reply-To: <20261117153931.2784-1-sreekuttan2156239@gmail.com>
References: <87se0zxzyt.wl-tiwai@suse.de>
	<20261117153931.2784-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 17 Nov 2026 16:39:31 +0100,
Sreeraj S Kurup wrote:
> 
> Ensure card indices are within the valid range before accessing
> the card array or lock bitmap in snd_card_ref() and
> snd_card_locked().
> 
> This prevents out-of-range indices from causing invalid memory
> accesses in these lookup helpers. It also protects against
> invalid indices passed by existing or future callers.
> 
> Warn about invalid card indices and return NULL from
> snd_card_ref() and 0 from snd_card_locked() when an
> invalid card index is supplied.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
