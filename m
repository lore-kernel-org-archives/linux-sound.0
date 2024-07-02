Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159B8372
	for <linux-sound@vger.kernel.org>; Tue,  2 Jul 2024 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906484; cv=none; b=U+ERKRnbYNwlvx2Vd+jnOLYSgGmapHINHWNYsoTnjgZh5InqDQYqvIjhowgW6ineLhOznHhmCA5P+f5yiHkNz3v62+5aINGrl/t8bNaN5ZPrioT9iPNKgcesE4lszKM1bHFBYgIbLjz/OaJep/EuJ+I0/3K2iSkgIHZ4ixUSW9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906484; c=relaxed/simple;
	bh=8/1xEUCo77gCe0fWEgy7BbKd1Dm8KxUlIobCk82Jgm8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wrj9Xz7BLVn2LRqD/O/JdxPIT/bYoc37QCQd8kwlfflaERJQAxA8hBt1hbz37/piCNROYezl57k67tQaUlqTRd82/cl/WP8TehjOh7nV2t2O4X1R3HSUC2c7UX4bRGEAp1a+KS6+cr99oe8R8P12sht+bcxuMXTO70Fo1kGs9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fdNJC2Sc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G27PgWTw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fdNJC2Sc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G27PgWTw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fdNJC2Sc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G27PgWTw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fdNJC2Sc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G27PgWTw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4BE42219A5;
	Tue,  2 Jul 2024 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719906481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqBzUyMAZpWa13UZmZLJ008o2LmfVqaJrRrkGDX1J+4=;
	b=fdNJC2ScKm/4iPQCK5n7GMrf0mG+f9/AcsPcePu+WGFjYNtfDiT7TUHlkZ5oTQ8lG219nu
	JkoOiALGWkvc+8FGShuBWCCEsmuw7kIcgcjB1nJbvZN5X+fqrnGD/9cmwuZ0ptKQ7TaSTK
	jN4jGeAbvpSXbH94Q38C5JlGXU+9i84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719906481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqBzUyMAZpWa13UZmZLJ008o2LmfVqaJrRrkGDX1J+4=;
	b=G27PgWTwQktRzvOZdwHY/nQRm3JTH1cM0bZ++93EsJXRQrTTUMN8f8WAFOONBT9UmhVeOL
	n2JA+F0HpqwrYQBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719906481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqBzUyMAZpWa13UZmZLJ008o2LmfVqaJrRrkGDX1J+4=;
	b=fdNJC2ScKm/4iPQCK5n7GMrf0mG+f9/AcsPcePu+WGFjYNtfDiT7TUHlkZ5oTQ8lG219nu
	JkoOiALGWkvc+8FGShuBWCCEsmuw7kIcgcjB1nJbvZN5X+fqrnGD/9cmwuZ0ptKQ7TaSTK
	jN4jGeAbvpSXbH94Q38C5JlGXU+9i84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719906481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqBzUyMAZpWa13UZmZLJ008o2LmfVqaJrRrkGDX1J+4=;
	b=G27PgWTwQktRzvOZdwHY/nQRm3JTH1cM0bZ++93EsJXRQrTTUMN8f8WAFOONBT9UmhVeOL
	n2JA+F0HpqwrYQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DC2D13A9A;
	Tue,  2 Jul 2024 07:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 347WBbGwg2bbCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Jul 2024 07:48:01 +0000
Date: Tue, 02 Jul 2024 09:48:29 +0200
Message-ID: <875xto2q0i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for Clevo V5[46]0TU
In-Reply-To: <20240701111010.1496569-1-michal.kopec@3mdeb.com>
References: <20240701111010.1496569-1-michal.kopec@3mdeb.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.74
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.74 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.56)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]

On Mon, 01 Jul 2024 13:10:09 +0200,
Micha³ Kopeæ wrote:
> 
> Apply quirk to fix combo jack detection on a new Clevo model: V5[46]0TU
> 
> Signed-off-by: Micha³ Kopeæ <michal.kopec@3mdeb.com>

Thanks, applied now.


Takashi
