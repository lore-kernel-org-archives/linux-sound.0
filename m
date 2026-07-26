Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468337269C
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 06:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048830; cv=none; b=g2cHg6V8U0+eWqq8FUMQcsxDeQxj4CDnuAmaHlbYg75qEPyoakd4g+YWs9+2+ZKJR/gV3Zz2H0htEZz72MzAxVLLyyiDiNhNuthHPXUiKEjGMCei9WzuhItl2I2OYmRQP5uf3JQvLQBIUOSDsa090DaGoeAYLWuwICrv8DcDo44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048830; c=relaxed/simple;
	bh=uhCTPtPDTPwMmQ5stizuQMA34EasAntAXLFwYlgTQR4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGFYNHwhVXgKLeQJ6pKjOLJ5UMUUgfYdd++fWvm78aBkDmBenMFu2U3XSjswis1s0eEWxYjs8VI4Vnlmb5AGjtL+/cVUp2WXe1DDqirsk6BCHoYmYJl5iffYZC7a+Y+ef01DR2eHyGeD1znTRMlkjyvfk13jdjKsb7CpV13+R10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gQGP0ApT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jPzMx/hD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gQGP0ApT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jPzMx/hD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gQGP0ApT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jPzMx/hD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gQGP0ApT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jPzMx/hD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76EF73EBA;
	Sun, 26 Jul 2026 06:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785048826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZxkpMKj6ebQrlUdXkrd6DHCHs1l73GhnU85NWwQkQw=;
	b=gQGP0ApTNmwWoKHzabzDHvgpyNMeqGXFBYI3AJuBYcOlhdZGNEJsMaGR1kf3xY60wYMi0H
	Pu1/MmXp0+IbD9bchtzms1z3MSwO0vFqh6zlYn9ejrFV4h2SAvtC1LiAV0gUvVeDxIiOEk
	C2OH0yDPW9MBdHKywj8gifT8zVEzs8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785048826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZxkpMKj6ebQrlUdXkrd6DHCHs1l73GhnU85NWwQkQw=;
	b=jPzMx/hDTf8N+fxJ0z6Tf4nhAWzOFXNvuObEGDodzkS0MDJvMhUWNQZHcDo15IYgH6NoCR
	n44rH5+vrJUNSdCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785048826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZxkpMKj6ebQrlUdXkrd6DHCHs1l73GhnU85NWwQkQw=;
	b=gQGP0ApTNmwWoKHzabzDHvgpyNMeqGXFBYI3AJuBYcOlhdZGNEJsMaGR1kf3xY60wYMi0H
	Pu1/MmXp0+IbD9bchtzms1z3MSwO0vFqh6zlYn9ejrFV4h2SAvtC1LiAV0gUvVeDxIiOEk
	C2OH0yDPW9MBdHKywj8gifT8zVEzs8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785048826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZxkpMKj6ebQrlUdXkrd6DHCHs1l73GhnU85NWwQkQw=;
	b=jPzMx/hDTf8N+fxJ0z6Tf4nhAWzOFXNvuObEGDodzkS0MDJvMhUWNQZHcDo15IYgH6NoCR
	n44rH5+vrJUNSdCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E427779B9;
	Sun, 26 Jul 2026 06:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1yjqEfquZWpRdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 06:53:46 +0000
Date: Sun, 26 Jul 2026 08:53:45 +0200
Message-ID: <87ik62b5s6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Madhavender Singh <madhav@disroot.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Laptop 14s-dr1xxx
In-Reply-To: <20260723104736.23386-1-madhav@disroot.org>
References: <20260723104736.23386-1-madhav@disroot.org>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,disroot.org:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 23 Jul 2026 12:47:36 +0200,
Madhavender Singh wrote:
> 
> This laptop with an ALC236 codec requires the
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2
> fixup for its mute LED to function correctly.
> 
> Add the subsystem ID 0x103c:0x86c8 to the quirk table to apply this
> fixup.
> 
> Signed-off-by: Madhavender Singh <madhav@disroot.org>

Applied now.  Thanks.


Takashi
