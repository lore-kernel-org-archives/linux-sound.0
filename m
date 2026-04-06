Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460442F7AAB
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464949; cv=none; b=gmBeIzJUmmCnEMLRCCqLaWgdmFzeN925aAUp9ls5oNrwoTKhvsHW+At8O3Vk62a5510u3rYRXCImBTgDhPQrmSiTFpzm1SA3He/u/r2r+rIpmtY4eGm5OrOi4h0PB/+hIqMoGiLDdFCkhglCeq1qnnOG5rDOeH+65lpKWLONeYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464949; c=relaxed/simple;
	bh=te45yGSGLpkmDg2/KfdkmKeEpXZ6F1B2j5VisUtKQKY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K34/ymsISqXbJ0xnmipc8+WKJKK/dcB5IUvvRn+iF9cYAq4Qsg0QqccS4mpmVUiHw/Ish4L3jZS+u7U0YIGvwvOAKDn5vOgAl9DnvETcCO2MXsbXe9yUMQB8SSoDbzokHFjuzTx38RaXDAIn7+f4Xp7PS3Pf6Iwg+yUx94QHDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LqK7Gzk5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pQ8c5Mtk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LqK7Gzk5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pQ8c5Mtk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LqK7Gzk5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pQ8c5Mtk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LqK7Gzk5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pQ8c5Mtk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DC014DDE0;
	Mon,  6 Apr 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775464945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmWV5mRDjHBbu1iBM+LtZ0hSnZFAg7aBYJdMM7GrCCg=;
	b=LqK7Gzk5F3Nk+rq8QvgOpjwVsIeNn3L4QA6ldNeZ/XTGf5phOHL3HhIp3shzdoa5EhHM3Z
	Alre7qY+9D/0vu5JbPNtJb4WJ57vfsaxMCfGZWPZH4zBpSn15hcooyCdYgVXBvC3Fkx7oZ
	ORJvQC7Uhu9llNVXFcG+YsRw3PmJ3Mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775464945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmWV5mRDjHBbu1iBM+LtZ0hSnZFAg7aBYJdMM7GrCCg=;
	b=pQ8c5Mtkr+vzqrdIzJcvOq7UABPsAMq8nYEdwAKYRqGj45nx/pc2VyHPll80/hX4wlhu60
	uUXWWkwGL3ay4fAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LqK7Gzk5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pQ8c5Mtk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775464945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmWV5mRDjHBbu1iBM+LtZ0hSnZFAg7aBYJdMM7GrCCg=;
	b=LqK7Gzk5F3Nk+rq8QvgOpjwVsIeNn3L4QA6ldNeZ/XTGf5phOHL3HhIp3shzdoa5EhHM3Z
	Alre7qY+9D/0vu5JbPNtJb4WJ57vfsaxMCfGZWPZH4zBpSn15hcooyCdYgVXBvC3Fkx7oZ
	ORJvQC7Uhu9llNVXFcG+YsRw3PmJ3Mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775464945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CmWV5mRDjHBbu1iBM+LtZ0hSnZFAg7aBYJdMM7GrCCg=;
	b=pQ8c5Mtkr+vzqrdIzJcvOq7UABPsAMq8nYEdwAKYRqGj45nx/pc2VyHPll80/hX4wlhu60
	uUXWWkwGL3ay4fAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B9A74A0B0;
	Mon,  6 Apr 2026 08:42:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j8gKEfFx02nTJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Apr 2026 08:42:25 +0000
Date: Mon, 06 Apr 2026 10:42:24 +0200
Message-ID: <874ilomqdr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix code style error
In-Reply-To: <20260405014208.167364-1-songxiebing@kylinos.cn>
References: <20260405014208.167364-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7DC014DDE0

On Sun, 05 Apr 2026 03:42:08 +0200,
songxiebing wrote:
> 
> Output of checkpatch shows error:
> ERROR: else should follow close brace '}'
> 2168: FILE: sound/hda/codecs/realtek/realtek.c:2168:
> +	}
> +	else
> 
> So fix it.
> 
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
