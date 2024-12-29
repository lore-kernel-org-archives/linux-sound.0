Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14641F94D;
	Sun, 29 Dec 2024 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735460722; cv=none; b=gdi1gfA8X6ENrdH3SuRd7VoHxpRnlbLn4m58P4KmifA1Q3eeH+hlapcdZugObWOwBtp0QdL2ff7oJAXPxy8tHOiS/7K3WMbdiGrX6KmGpBG/NdKwWFP/znxDhcypvTFP2JleOG82NpAigzQxFScV+jEXoN46Q0LbG67PI7pwBT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735460722; c=relaxed/simple;
	bh=le70J51oWC05erI3JB89zMtrQEyExv4srzb14lC5ff4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lf8pGBBOSeJAFEM7MpEbCcH8soGwJaJn6D+bxaJwHHymuKuPTeMOBrAuCsOQRUu9WYD/mMcDoPLz0hC2+rU5AEVIm7Ao2AmjpoAEF2G0i/7oEvBqaD/N5AEeZXN8b/UWDQkoSYHO2emhap/xkZ6GXrvkKJfYREesAtBPsjplNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wk90IAVv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xO68GIg+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wk90IAVv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xO68GIg+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wk90IAVv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xO68GIg+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wk90IAVv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xO68GIg+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9043B1F7D7;
	Sun, 29 Dec 2024 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735460718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TKLnveSpbyA0AlyxpmMA0vCOlehCj2/hp1xtUeCWHo=;
	b=wk90IAVvbgTLqyOjXYTLk0AneAHdt7t4zfBs8zshgsdgnnCHNEmgleAwC/Xy4jbPwplyUb
	gVs9iuXshp6rBZSU5bX5Z8hSs9baYK2uRQCVRT7R3SQFeUuN6OdBi0ycK9PZm23UB0nQQO
	Qf4/h+94RlDasVGYnbMEXHo6+PrtcKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735460718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TKLnveSpbyA0AlyxpmMA0vCOlehCj2/hp1xtUeCWHo=;
	b=xO68GIg+mn75/roezXH7+jJCk2maa9Df1jZjHRUDULfTLe1UI0RVchtJx6LncWx8aZn688
	rY5huc08IwbY8CCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wk90IAVv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xO68GIg+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735460718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TKLnveSpbyA0AlyxpmMA0vCOlehCj2/hp1xtUeCWHo=;
	b=wk90IAVvbgTLqyOjXYTLk0AneAHdt7t4zfBs8zshgsdgnnCHNEmgleAwC/Xy4jbPwplyUb
	gVs9iuXshp6rBZSU5bX5Z8hSs9baYK2uRQCVRT7R3SQFeUuN6OdBi0ycK9PZm23UB0nQQO
	Qf4/h+94RlDasVGYnbMEXHo6+PrtcKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735460718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TKLnveSpbyA0AlyxpmMA0vCOlehCj2/hp1xtUeCWHo=;
	b=xO68GIg+mn75/roezXH7+jJCk2maa9Df1jZjHRUDULfTLe1UI0RVchtJx6LncWx8aZn688
	rY5huc08IwbY8CCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FCE0139D0;
	Sun, 29 Dec 2024 08:25:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ShPRFW4HcWeIQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 08:25:18 +0000
Date: Sun, 29 Dec 2024 09:25:17 +0100
Message-ID: <87seq6dhg2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: AC97: Use str_on_off() helper in snd_ac97_proc_read_main()
In-Reply-To: <20241228233849.686755-2-thorsten.blum@linux.dev>
References: <20241228233849.686755-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9043B1F7D7
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Sun, 29 Dec 2024 00:38:48 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_on_off() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
