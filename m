Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A4227E8E
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875480; cv=none; b=X3JoVImZyBl9Ku9H8Ozi4pmF8o9poHZcaCkQVHzjiuDuiM16tXweZhDnlvJiEXCnxjP7SVML4StgeDLwVkChJkLG6Q9KJ7GNIuUAHbhQtx/gVlyIvcrxhD04/oBfexoD4fNgARiT4GLfAmwT4Yuw6Tqg7qB6uL/kRp+jy2MY3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875480; c=relaxed/simple;
	bh=LmNero/r4HBXzSg94XUSgg1Z6gVOfRg6gOESsxsJkHk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aknDfppe9qGxrA2zejYii91l3SmoGtO6doytid5oiQERFH5Xzpv0rVe322uoKl9twVzdlU5R33LmtDYP/rxm0f6DimUnHl8OMLIK20O8QqqkCBoGEp5L3kNmNo+9wBtMcfcSsoQwPBJzYCvjtgXTUpMmgvjGCwsMbRU0KXptSDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oVyxG2z1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y+a3UUNZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oVyxG2z1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y+a3UUNZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oVyxG2z1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y+a3UUNZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oVyxG2z1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y+a3UUNZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13A4D21182;
	Mon,  2 Jun 2025 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BxuHmlNUq53OeMEKRd1KvqCZQauO38bFG64FLWU+IE=;
	b=oVyxG2z1OdIhe9B5Zm+vvjoVqCi3NY3SOX5C3CDJ/BZIRX40CcLoXc9HPyOKeTS44XOgDR
	jPVy1684cEWTUjTs1TLfhU0EqcJphqFk5aKzFUIE/JHLJObSQkiQ2y1Fcmn/7/yxaruBh/
	F1vSV6/R+bsNIAtCPmEZt5a3vO/GFDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BxuHmlNUq53OeMEKRd1KvqCZQauO38bFG64FLWU+IE=;
	b=Y+a3UUNZ8griH0W6EE+aWN05UyRaV7bfr4Wjm9YvFMgtEl2yVDnH9mIAw7SJ80gxP2+PBM
	/vn4nnhsh0auilCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BxuHmlNUq53OeMEKRd1KvqCZQauO38bFG64FLWU+IE=;
	b=oVyxG2z1OdIhe9B5Zm+vvjoVqCi3NY3SOX5C3CDJ/BZIRX40CcLoXc9HPyOKeTS44XOgDR
	jPVy1684cEWTUjTs1TLfhU0EqcJphqFk5aKzFUIE/JHLJObSQkiQ2y1Fcmn/7/yxaruBh/
	F1vSV6/R+bsNIAtCPmEZt5a3vO/GFDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BxuHmlNUq53OeMEKRd1KvqCZQauO38bFG64FLWU+IE=;
	b=Y+a3UUNZ8griH0W6EE+aWN05UyRaV7bfr4Wjm9YvFMgtEl2yVDnH9mIAw7SJ80gxP2+PBM
	/vn4nnhsh0auilCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDB6813AE0;
	Mon,  2 Jun 2025 14:44:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TpqhMNO4PWgpXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:44:35 +0000
Date: Mon, 02 Jun 2025 16:44:35 +0200
Message-ID: <87y0uaxkx8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
In-Reply-To: <20250527172657.1972565-1-superm1@kernel.org>
References: <20250527172657.1972565-1-superm1@kernel.org>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 27 May 2025 19:26:56 +0200,
Mario Limonciello wrote:
> 
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The audio controller in the Lenovo Thinkpad Thunderbolt 3 dock doesn't
> support reading the sampling rate.
> 
> Add a quirk for it.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3:
>  * Sort by other Lenovo VID (Takashi)

Applied now.  Thanks.


Takashi
