Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54543A5E80
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561070; cv=none; b=ndDxvyDxXkl42+jqDDyBFiEf7Ba6iljpeeNXSYDT2mbCxdeONSSavmOKxtTE1rk9k5h21HDRyOEFMg9bSkIXY4yxvvF0NDgF9sM/sGK2ktTYl6D9gKGePvVeFWe5jKENfcadJKq2txVPaD4OKEwzDeFeJ6hdlwZqUNWkoC/I6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561070; c=relaxed/simple;
	bh=pTI5RrUNdtbcnKWqkxTWxQbXccnjtu2+GTjLsRnD640=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZyHfdXD2Xfatc8wWyZbUnYPAMzAW8qMQ6nAgqcoOqCe32lmTEL2FauCRWylPmBqg0qAmsYeCNzljwht5asx/Twd8BUSXbatbyKtJD+mq5fHSxhtmMXYtmyiWtMpasvdJW4OKum0oPh2p2tCRZLYZ0YIcby+FEnVUocJoekk4d2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ol4t+19B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gSPAJeiC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ol4t+19B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gSPAJeiC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ol4t+19B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gSPAJeiC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ol4t+19B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gSPAJeiC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 294C46AB28;
	Thu,  4 Jun 2026 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780561067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0aMK8iFbNwmfZk58aIcP2hPpqxwrs9fUs/+4aSfnELA=;
	b=ol4t+19B0gbgeXh1e0gKDKxJ2no2yUc5cN7DKulZK3ga7gUg0mHP4tkOQwVJ3DC4NPc2oV
	fqEgM2lQlYxnNNPqfw4hUxlOz0UrJS+YJ6x3nBCxmX9oxs8Ve479S0UP/fdtGbsnWZfYay
	KRi4AyEO43NhjixoMzDL2yQSMfBhUTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780561067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0aMK8iFbNwmfZk58aIcP2hPpqxwrs9fUs/+4aSfnELA=;
	b=gSPAJeiCgoCLsSbRO4JJN/JDCxalUMGC+vw9jUbF4VoejzWGYx2mntm07YX0dmKqVUrWmt
	zs03uqkTUqhhp5Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ol4t+19B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gSPAJeiC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780561067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0aMK8iFbNwmfZk58aIcP2hPpqxwrs9fUs/+4aSfnELA=;
	b=ol4t+19B0gbgeXh1e0gKDKxJ2no2yUc5cN7DKulZK3ga7gUg0mHP4tkOQwVJ3DC4NPc2oV
	fqEgM2lQlYxnNNPqfw4hUxlOz0UrJS+YJ6x3nBCxmX9oxs8Ve479S0UP/fdtGbsnWZfYay
	KRi4AyEO43NhjixoMzDL2yQSMfBhUTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780561067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0aMK8iFbNwmfZk58aIcP2hPpqxwrs9fUs/+4aSfnELA=;
	b=gSPAJeiCgoCLsSbRO4JJN/JDCxalUMGC+vw9jUbF4VoejzWGYx2mntm07YX0dmKqVUrWmt
	zs03uqkTUqhhp5Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC076779A8;
	Thu,  4 Jun 2026 08:17:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HWoSOKo0IWqvAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 08:17:46 +0000
Date: Thu, 04 Jun 2026 10:17:46 +0200
Message-ID: <87bjdqwwgl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrei Faleichyk <andrei.faleichyk@noogadev.com>
Cc: geraldogabriel@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP
In-Reply-To: <20260603213313.6298-1-andrei.faleichyk@noogadev.com>
References: <aiCaJlTA8j9oahdt@geday>
	<20260603213313.6298-1-andrei.faleichyk@noogadev.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 294C46AB28
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,perex.cz,suse.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noogadev.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 03 Jun 2026 23:33:13 +0200,
Andrei Faleichyk wrote:
> 
> The internal microphone on ASUS VivoBook X509DAP (subsystem ID
> 0x1043:0x197e) is not detected without a quirk entry. Add
> ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to fix the issue.
> 
> Signed-off-by: Andrei Faleichyk <andrei.faleichyk@noogadev.com>

Applied to for-next branch now.  Thanks.


Takashi
