Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447F3D6CD4;
	Tue, 11 Aug 2026 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428805; cv=none; b=lHwOq5cjPFtsgM+WMt6Rp5lWH9ZI6JEfJDuIHr22pE/VXREvqAHs9i/8FBfnP7wq+0o3FA/tt2KIJbptxb2OuEL65AdN1Uka3esE/TBvBNSVOYwdS1RqYKqhczyZ/V9auVqyxCavs4B7dBfoTSvW26pcporHma4/vb1HmS5Kd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428805; c=relaxed/simple;
	bh=nB/NQLGn4qXqzVcI+z6fM7LhabJE33bWCrUsEapJcnA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWG8DDFJVN2oWn6UrrzZqUoczO58zLmus5qihA1v7oz7YBzgYEYH1spDfF7TkLeWIjBXPgSeyYnJeC/UK93mGh9jgbawDPYcLYs/y7KaIc9yNizpbfTE00x9AraeZu9xDHB+9mnk2/jZyu7UJxBoRuE2e3WwDPMVMwQbr/aIkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rbf98goG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kZ+vK9I/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=heEpS+Sa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pnOUpgtx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rbf98goG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kZ+vK9I/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="heEpS+Sa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pnOUpgtx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 21B09818A8;
	Tue, 11 Aug 2026 06:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6WqyQLp5vFJ1YnMmHJ2CruBdIJcR9m3OhAbaUDujiXQ=;
	b=Rbf98goGrMmHiEgyY6yVWz339emcCvKLrCo6l0a6tmYYqgmOFYdhQ+OpjdjRKrVNnmuxem
	ZLP3EQfuU5KQXdMWDvGPgJsZHB9zQpj4RUPf4+VMWYn0KbNCo+yKkPlmSD8Po7Cqn+/Z3M
	dxQ1Cf649+CcVG6KLrpSgZX81wbsuJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6WqyQLp5vFJ1YnMmHJ2CruBdIJcR9m3OhAbaUDujiXQ=;
	b=kZ+vK9I/0U3J2/NMC3m7LFjTPE+bk7r9h3ZTD6N43Zc9BIlfO4AZZNp/+79xqX+/+gmfJe
	dAbgcjL4xPeZUMAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6WqyQLp5vFJ1YnMmHJ2CruBdIJcR9m3OhAbaUDujiXQ=;
	b=heEpS+SawnabMAHBAIEi3xQuET2eGv5KCVR/HS2w3CWY5yf07PZyLFbV40TXHYqkHbHGAh
	txxv1wu1Lj9ZJKYmpvDzal0JAnsef1tdyWf2AzCOvtEI0pHJe/roYeHj1oNvgvtFoatnGO
	nPTrL6c7GcbkfxrhoOyk1KDU2JJGmgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6WqyQLp5vFJ1YnMmHJ2CruBdIJcR9m3OhAbaUDujiXQ=;
	b=pnOUpgtxUNb2Kjtmjcjudmw+BlDDlERE3zsawj6ht28pkkYP1yxfmgiXYv1fgzzyPSy8zj
	gdarPMtdWjMhldDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E43F2779BC;
	Tue, 11 Aug 2026 06:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vfFxNni9emqOPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:13:12 +0000
Date: Tue, 11 Aug 2026 08:13:12 +0200
Message-ID: <87ecg5b2x3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ALSA: hda/realtek: Add quirk for Acer Predator PH16-71
In-Reply-To: <20260811024902.134457-2-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
	<20260811024902.134457-2-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 11 Aug 2026 04:49:00 +0200,
Zhang Heng wrote:
> 
> The Acer Predator PH16-71 (subsystem 0x1025:0x166c) with Realtek ALC245
> codec has a non-functional headset microphone. Adding the
> ALC2XX_FIXUP_HEADSET_MIC quirk resolves the issue.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221641
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
