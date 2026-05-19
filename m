Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAD34E779
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170829; cv=none; b=Erli16V5Xo/vqc7iPebJa36gefqLd2JU2ddaLZGlbm7ThnPKafPbJfmIDYMZqAeMNrkMykPUa3IOagFsj2bkcnmdt0X99Dl+fmU/C6vgW9OeEEq7SgoKcP6B9gNtXrc/PtQ2KPIM0jVGNZ/srs/JikDemc/SKjOmLfNA2A1G9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170829; c=relaxed/simple;
	bh=0tU28qYVJolqXNpc6+ihK/EZ2WlEnCHi3qtkakTeGu4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g01yPHWTY6CdoC7SsxKobJ7aOoEJNLYfiPfGd8WsCWuatHnl6+gfNe/TBc+wY4HbgWOoh/x2cV1qg0qtuloDW3991Qr1OMjHhS735ZlFMbu8qURmVGKgfB93XpY7Dl7KFRkxPH3XcW5qCXkDrLIO2YYj2nEYPQo0asbWhX7dGRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DXx/yssb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u8MGBKaB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DXx/yssb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u8MGBKaB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DXx/yssb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u8MGBKaB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DXx/yssb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u8MGBKaB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 255E167E00;
	Tue, 19 May 2026 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779170826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AgLyUbHtsThIQNnA3ECFhlOpDz/gwRYkImdEjo4yV1U=;
	b=DXx/yssbhL7VV0NMwjR6upJjw0wWxZaUudMHYqKt+IoUWvL0ax84/o923rWpbIFFJpwKWm
	/GoRHYUTjEIp7C+hIruD/c7Dbqwc4FFFfpetawYlFEBgcRgFYtQ5mmVFkOYcu6cNUh3YIf
	zNpiQsoRn2HEU4HpuMUFNgBuBU0EPKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779170826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AgLyUbHtsThIQNnA3ECFhlOpDz/gwRYkImdEjo4yV1U=;
	b=u8MGBKaBHQwCTo5dSLkBNDNIp/VXU0r8rk89d2oaf+mQTVTLa6ZbDVFHQzqKr/prxiQuUA
	7U5p0py3STXs1iAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779170826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AgLyUbHtsThIQNnA3ECFhlOpDz/gwRYkImdEjo4yV1U=;
	b=DXx/yssbhL7VV0NMwjR6upJjw0wWxZaUudMHYqKt+IoUWvL0ax84/o923rWpbIFFJpwKWm
	/GoRHYUTjEIp7C+hIruD/c7Dbqwc4FFFfpetawYlFEBgcRgFYtQ5mmVFkOYcu6cNUh3YIf
	zNpiQsoRn2HEU4HpuMUFNgBuBU0EPKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779170826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AgLyUbHtsThIQNnA3ECFhlOpDz/gwRYkImdEjo4yV1U=;
	b=u8MGBKaBHQwCTo5dSLkBNDNIp/VXU0r8rk89d2oaf+mQTVTLa6ZbDVFHQzqKr/prxiQuUA
	7U5p0py3STXs1iAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C689593A8;
	Tue, 19 May 2026 06:07:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QVp7Agr+C2pEfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 06:07:06 +0000
Date: Tue, 19 May 2026 08:07:01 +0200
Message-ID: <877bp03pbu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: usb-audio: Use flexible allocation for Scarlett2 packets
In-Reply-To: <20260519004935.627797-1-rosenp@gmail.com>
References: <20260519004935.627797-1-rosenp@gmail.com>
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 19 May 2026 02:49:35 +0200,
Rosen Penev wrote:
> 
> Allocate Scarlett2 USB packets and request buffers with the flex
> allocation helpers for their trailing data arrays.
> 
> Keep the computed packet sizes where they are still needed for USB
> transfer lengths.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
