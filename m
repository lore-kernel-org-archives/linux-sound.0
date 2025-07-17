Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80161F92A
	for <linux-sound@vger.kernel.org>; Thu, 17 Jul 2025 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756905; cv=none; b=AdYXfzoAY8HFROZ0nc2x/Ub5KRDh4LdLHgby+F5it/hwAR3yY3P3IBh2SGECyNsxCdgIYJbqMcBT/67hav6R6SgGdBjSjXsgUv3dXKvoGcA+8hzSLdSGBhUkGcfHWSPVr0bubB3P6XOE0MTHL9fsAcgxOq4vGZ3VxBBRdqUyWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756905; c=relaxed/simple;
	bh=7WhetJ5wf4BPVPCgjGiJPfQF02jcOWcQnWrBaoIyiEA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIr7utKD6btAHsBVtTOSkxBzE+aX+NYjy756Dsymzd49FGlSxt9F7o/57bG7lQzG1U7z1i9IVo28ddnOg0W8C8UGfkNLRyoDYP/8K7NoeLDX6neFs5+Qna1XI8okI5TUcIp/8AFQXeyhF7vzeM5APOhutZFB3XbgnnHI4FAFtzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EF9+IgXX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iMDqvDoy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EF9+IgXX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iMDqvDoy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EF9+IgXX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iMDqvDoy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EF9+IgXX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iMDqvDoy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B9001F399;
	Thu, 17 Jul 2025 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752756902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=EF9+IgXXLXLceKyqx92q/baaiNzHq96FZQY4I1FFu+RU78ed1qVZYGOXutcqdRd8oQV/Bp
	0ZICiOo1ObSs51H3dRZxwH1EPk2CsksQbtUcZExltbk1BV89ZBR0lUG+7sPuntDboP43l8
	iA/YOZQh8h0R6Edb4EbiQYupmRHKrs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752756902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=iMDqvDoy6t8Hg/b120z7dOZ+MZ2sSG2pegQW+XLFLkWUGMc8NCtyAPDdwQbmaB3YL6D335
	tcUSgXoIylycmgDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752756902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=EF9+IgXXLXLceKyqx92q/baaiNzHq96FZQY4I1FFu+RU78ed1qVZYGOXutcqdRd8oQV/Bp
	0ZICiOo1ObSs51H3dRZxwH1EPk2CsksQbtUcZExltbk1BV89ZBR0lUG+7sPuntDboP43l8
	iA/YOZQh8h0R6Edb4EbiQYupmRHKrs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752756902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=iMDqvDoy6t8Hg/b120z7dOZ+MZ2sSG2pegQW+XLFLkWUGMc8NCtyAPDdwQbmaB3YL6D335
	tcUSgXoIylycmgDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E27941392A;
	Thu, 17 Jul 2025 12:55:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9ooMNqXyeGiJFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Jul 2025 12:55:01 +0000
Date: Thu, 17 Jul 2025 14:55:01 +0200
Message-ID: <8734av9dui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc6
In-Reply-To: <1d784c862857c2d2f3870c0e140863da.broonie@kernel.org>
References: <1d784c862857c2d2f3870c0e140863da.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 17 Jul 2025 14:32:44 +0200,
Mark Brown wrote:
> 
> The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:
> 
>   ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc6
> 
> for you to fetch changes up to 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d:
> 
>   ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx (2025-07-16 11:50:33 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A relatively large set of changes, but most of them are quirk
> information for various x86 systems.  There is one more substantial fix
> for a NULL pointer dereference when removing the AVS driver, plus one
> for Kconfig dependencies.

Thanks, pulled now.


Takashi
