Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE835DA6D
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118637; cv=none; b=VK4JG4LRpfRPOIc1tdAIxrA32XzelK+fnz3GIMgx8/s2bPOOE1wADUvDhVUuTW/P7uMc7IKL0t0Gwz9WHuWuL9TtZGcPs59ezQjR7xO3k282VXDxWuxgtn1x8D52rUKZ4og86gKlZcl4RpnWTgayRQDBgAmU2dSS/o7uC3kOIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118637; c=relaxed/simple;
	bh=Dbn64q5y+86I1LQLDzWKGJpDMLP64eaT4JkU+UTy8SY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1k0jsV+jobyRPM+bExjOikSgz5FrKE2EJBZke+E8+sRWgZVMSRLc9bUcjo8Zm1v4g7WHdQwbeIkNb7rZp40oidozU5gPGcmyBpyfBmzIQR/hFEAnaNfv0isM+HhXsjpFqnfGcmsm9NzAeHAzTTBiQ1hycjGWv0AweeNTVS2Jm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jNzNT0EI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i7rknezu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jNzNT0EI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i7rknezu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jNzNT0EI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7rknezu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jNzNT0EI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7rknezu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87C6B706E1;
	Mon, 22 Jun 2026 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782118633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryqN7ub4YyZrmro5ESBBuzsMdgLZcbJEJecFv1BPG0c=;
	b=jNzNT0EIPsEO+iPvKiyJp74S6K2IHq99ddl00TJjEeZA5avVtyimN0EMndE/gjhQdVnTfX
	hr1ZXalpmn/3Q/WdOOiHpeENtAtXGp72WKSEB/G2mxrdlFESYRsCCfPFt819lKfYpLgkAp
	q00thjUv055/l1qHvqLtD9PAMLjq+tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782118633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryqN7ub4YyZrmro5ESBBuzsMdgLZcbJEJecFv1BPG0c=;
	b=i7rknezu/xCtq97p8SHa8ayj33qan/jfoA1T0RbJBSpTwFGm/o6OmfeUOiHREulZUZjFCd
	OxpcsWSgKWSBVdDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782118633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryqN7ub4YyZrmro5ESBBuzsMdgLZcbJEJecFv1BPG0c=;
	b=jNzNT0EIPsEO+iPvKiyJp74S6K2IHq99ddl00TJjEeZA5avVtyimN0EMndE/gjhQdVnTfX
	hr1ZXalpmn/3Q/WdOOiHpeENtAtXGp72WKSEB/G2mxrdlFESYRsCCfPFt819lKfYpLgkAp
	q00thjUv055/l1qHvqLtD9PAMLjq+tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782118633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryqN7ub4YyZrmro5ESBBuzsMdgLZcbJEJecFv1BPG0c=;
	b=i7rknezu/xCtq97p8SHa8ayj33qan/jfoA1T0RbJBSpTwFGm/o6OmfeUOiHREulZUZjFCd
	OxpcsWSgKWSBVdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FBC6779A8;
	Mon, 22 Jun 2026 08:57:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NaUnEun4OGrbFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jun 2026 08:57:13 +0000
Date: Mon, 22 Jun 2026 10:57:12 +0200
Message-ID: <87ik7bdkbb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dirk Su <dirk.su@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add LED fixup for HP EliteBook 6 G2i Laptops
In-Reply-To: <20260622072019.56351-1-dirk.su@canonical.com>
References: <20260622072019.56351-1-dirk.su@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 22 Jun 2026 09:20:04 +0200,
Dirk Su wrote:
> 
> The HP EliteBook 6 G2i laptops requires specific LED control method
> ALC236_FIXUP_HP_GPIO_LED to work
> 
> Signed-off-by: Dirk Su <dirk.su@canonical.com>

Applied now.  Thanks.


Takashi
