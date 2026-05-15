Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858263E3C6F
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828940; cv=none; b=q94lRkYxaabxJeI+zCL6B+QTVcoIMy6Ci9AZNHaSC4tFiKeiu49o3vO9jQ4K0mFwYsBOOXlTzXDtf1hcdbmJ7ZLDxUyokSw4H1PMiYmUwM8cnONBh7WMFrzvvdbtZW8dGggxcR1kGWnykG3eXrnNIZ+XP68VSQ/aq/Txa1soXBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828940; c=relaxed/simple;
	bh=86ejFq3rb9bRbylZXChI7VBwk4nDY5IeLVwBUg+x87A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xsp78wN1AMM14sPd6Xb5N8JttSYWPRpN74YW42XUVMMjaASblZxu/Lgi9Z+0Idk9DC/mrvwVh17lYBiTyqpk50cpNcEK6Hz1zK/bLlZz9T+/t84Of5rfMCUbBWd/CZpOs2+oV47lOrIzuQtarpzx/hUDjDB8uV/Pyu5jcOZPhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XSbyoXho; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ow/aKMKl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bw0zTaQw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vKq6LRjY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XSbyoXho";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ow/aKMKl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bw0zTaQw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKq6LRjY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B817A6AF0C;
	Fri, 15 May 2026 07:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yiHXj/41w3NeF6xoYKIc+0rusShmBu2JMTnP67EJVAM=;
	b=XSbyoXhoTD2zqvyno7XbSRNy5dGMoEsrEcVqxEiI9mHw1dZFWDlWclipuAkTDiCYHq4ug6
	8bMjulMmTfr4n3Vlci/ZpBOhmQtwKBjo9AN1gbLG3clcAh86z6rfbPUUNWqISGnVpN/Ms7
	9nqGiPl98KZSudUZFpayFjmKQXIXEZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yiHXj/41w3NeF6xoYKIc+0rusShmBu2JMTnP67EJVAM=;
	b=ow/aKMKlv9+2fp/MeV4nKppFKc+WelwY4yx6MlVTPDZ7fA+eGYICMXHivAwj756yyG+Okw
	ODeRs74X9+rCuBDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yiHXj/41w3NeF6xoYKIc+0rusShmBu2JMTnP67EJVAM=;
	b=bw0zTaQwtyCTyGMkqI5ZHJo+xj2muo/YioTXbLqPW8tZZq+UwWIyGTpnuVH22LO1adHGLb
	FbWC5i1x90y4h+MOQcrGxmODzMpTK24ZdANgqYkQD3pGuExYhJyBkxqnSzeJJf7sSv1iek
	3lZtQN6ncPcWYJtTIAI4dhcIU7ze3SE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828936;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yiHXj/41w3NeF6xoYKIc+0rusShmBu2JMTnP67EJVAM=;
	b=vKq6LRjYj359aJBWCCX4Y+FTmEodd2NsSavfhTUkEzpWoyxLA0Pjjk5mEI8Olzfcy2A5RP
	Tn42bYH2+JVfnxDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82A35593A9;
	Fri, 15 May 2026 07:08:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id doyJHojGBmoLYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 07:08:56 +0000
Date: Fri, 15 May 2026 09:08:56 +0200
Message-ID: <871pfdup2v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Markus Kramer <linux@markus-kramer.de>
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book5 360 headphone
In-Reply-To: <20260513222818.14351-1-linux@markus-kramer.de>
References: <20260513222818.14351-1-linux@markus-kramer.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[markus-kramer.de:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 14 May 2026 00:28:18 +0200,
Markus Kramer wrote:
> 
> The Samsung Galaxy Book5 360 (NP750QHA, PCI subsystem ID 0x144d:0xc902)
> has severe audio distortion on the 3.5mm headphone jack. Applying
> ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET corrects the output path
> configuration, consistent with fixes already applied to other Samsung
> Galaxy Book models using the same ALC256 codec.
> 
> Cc: stable@vger.kernel.org
> Link: https://github.com/thesofproject/linux/issues/5648
> Signed-off-by: Markus Kramer <linux@markus-kramer.de>

Applied now.  Thanks.


Takashi
