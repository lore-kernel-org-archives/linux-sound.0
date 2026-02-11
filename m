Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2849342539
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800330; cv=none; b=Ghi7Ww9vlgfbkVEIKlpwjke/OIxdqruyo3gFNi+OH1jYdaRrzBEPJer/EU1sHDPPzcJSd7TexWirTTn0J6TErnQ1PeNd+fIpOt+shyYJRPcnCrpoFBA4Z0D5P9XpiL399kDqc766bEGJKxC//F/0Bv1kYMdIU6aDPS20IfQvOpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800330; c=relaxed/simple;
	bh=VOCTj8CIBobsYBDIb6CWbtQhQ4UI1viaPB+/cJpEJj8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InsePRzt/+B7sPDN8gaA5Vo3d24+YwY7VuvSvn74zLDEjSeCGrcC+nconnxellWcU09CkhsqCxwLUO0ZmbvWvHEYztMqEFIBhtysupmdIHaFFzXRVG64P/MtVoljXwgDaYZeYsOD+RG0UF7V3Dzq6enS/flEl15SfzJHs8L9yt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PbWQ2ciE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wtI6Z6GR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PbWQ2ciE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wtI6Z6GR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PbWQ2ciE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wtI6Z6GR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PbWQ2ciE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wtI6Z6GR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3284A3E6F2;
	Wed, 11 Feb 2026 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770800326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV71KXvd8W+k5ABKoyXEOmi0wOn0ULwGJ/gDb7KfQmo=;
	b=PbWQ2ciETHYxNOa7JLTBJM6QT3WEdlT5RSRLJd2N/plf7QUsqHC2hUz4IZcpDVKQWz/A0r
	143/XtweN421ETCSif5XXCBmqhGpe6/StZDcE5liCA6OratmBDLOxzpRsNVrTZLoUhYnLd
	mRwnRgyZtHRTgp8hidNZt4xYZG+U63w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770800326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV71KXvd8W+k5ABKoyXEOmi0wOn0ULwGJ/gDb7KfQmo=;
	b=wtI6Z6GR05GsAGxwnQyDY75taRZWPenTIzgV8ooMvHeECAi+i1htirLkmIVpxhltkDbvgI
	CTSMcTsPcsdBnVDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770800326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV71KXvd8W+k5ABKoyXEOmi0wOn0ULwGJ/gDb7KfQmo=;
	b=PbWQ2ciETHYxNOa7JLTBJM6QT3WEdlT5RSRLJd2N/plf7QUsqHC2hUz4IZcpDVKQWz/A0r
	143/XtweN421ETCSif5XXCBmqhGpe6/StZDcE5liCA6OratmBDLOxzpRsNVrTZLoUhYnLd
	mRwnRgyZtHRTgp8hidNZt4xYZG+U63w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770800326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV71KXvd8W+k5ABKoyXEOmi0wOn0ULwGJ/gDb7KfQmo=;
	b=wtI6Z6GR05GsAGxwnQyDY75taRZWPenTIzgV8ooMvHeECAi+i1htirLkmIVpxhltkDbvgI
	CTSMcTsPcsdBnVDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D96013EA62;
	Wed, 11 Feb 2026 08:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9EyIMMVEjGlyWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Feb 2026 08:58:45 +0000
Date: Wed, 11 Feb 2026 09:58:45 +0100
Message-ID: <87pl6bu056.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Naim <dnaim@cachyos.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)
In-Reply-To: <20260210093403.21514-1-dnaim@cachyos.org>
References: <20260210093403.21514-1-dnaim@cachyos.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,cachyos.org:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 10 Feb 2026 10:34:02 +0100,
Eric Naim wrote:
> 
> Fixes microphone detection when a headset is connected to the audio jack
> using the ALC256.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Naim <dnaim@cachyos.org>

Applied now.  Thanks.


Takashi
