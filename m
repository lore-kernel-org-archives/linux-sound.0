Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F842BB17
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788383; cv=none; b=NGLvf7Qb1JmShIP/U5IK5OKzYaenzodt1mvZ4XAo1at1ZngHtS5hSQggesk5EzbZx0DNN8SLVN8197jPbAszJQkWUFvhNVV3NV6Nr92EkmfWX5+9OQbKOJOiJFKTKKTx3TmhISeW5KN80ZCKCUV3DmHKUlYDVCX7uCi7FqxmbOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788383; c=relaxed/simple;
	bh=EfjAQQsL27Jojsn1SlZFbwmlWkyQ5b0m56nH4ft7OfI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jaQuzENL9VtGynTvjukuDeFrS4qU1ce5btfLPC0n2r4dJ562tF+SNwuhQRE855x3gIPcPJ4G8dH0ljrOA7T2eutUzAUSJSuszmwhe8gpAff0U85lY5G9OUEVfY8nz1EB61Xq5gwGZxL2Qs6EAQrZF0FDUi5u1S5gjMzF/M6BrAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xcg/kDkp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K04QsIDd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xcg/kDkp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K04QsIDd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcg/kDkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K04QsIDd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcg/kDkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K04QsIDd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AF006A7FE;
	Tue, 21 Apr 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776788380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+6oMGYUM3vtv8/UMHCfX99sHQIi0mnicTNP8kP7vTs=;
	b=xcg/kDkpncOJTXmtwVDFK4VtSJFk9gZOsR5aZnnPMK8nT7WvxOfsNJYgrviC9R030UVKQy
	7oS9iLrdLPHIT/ORyq+nVDetaBpKoYAQT+6kFjObSUU3wbVaF84GTcFi0VhPwgCwsAOIPM
	MEwA285uBcibgMqDO4o3mXcNS/aNJQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776788380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+6oMGYUM3vtv8/UMHCfX99sHQIi0mnicTNP8kP7vTs=;
	b=K04QsIDdIuUe//4q5BUGokyblCApHCdNfJfDUERezqUYUwkN7EmssxSqNShG5enX1vDw3F
	9qqF61zhMk99QnDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776788380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+6oMGYUM3vtv8/UMHCfX99sHQIi0mnicTNP8kP7vTs=;
	b=xcg/kDkpncOJTXmtwVDFK4VtSJFk9gZOsR5aZnnPMK8nT7WvxOfsNJYgrviC9R030UVKQy
	7oS9iLrdLPHIT/ORyq+nVDetaBpKoYAQT+6kFjObSUU3wbVaF84GTcFi0VhPwgCwsAOIPM
	MEwA285uBcibgMqDO4o3mXcNS/aNJQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776788380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+6oMGYUM3vtv8/UMHCfX99sHQIi0mnicTNP8kP7vTs=;
	b=K04QsIDdIuUe//4q5BUGokyblCApHCdNfJfDUERezqUYUwkN7EmssxSqNShG5enX1vDw3F
	9qqF61zhMk99QnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5859593AF;
	Tue, 21 Apr 2026 16:19:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cP4nLpuj52nbNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Apr 2026 16:19:39 +0000
Date: Tue, 21 Apr 2026 18:19:38 +0200
Message-ID: <87v7dk8ew5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Spencer Payton <spayton681@gmail.com>
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa2xxx
In-Reply-To: <20260421084918.14685-1-spayton681@gmail.com>
References: <20260421084918.14685-1-spayton681@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Tue, 21 Apr 2026 10:49:18 +0200,
Spencer Payton wrote:
> 
> The mute LED on this laptop uses ALC245 but requires a quirk to work.
> This patch enables the existing ALC245_FIXUP_HP_MUTE_LED_COEFBIT
> quirk for the device.
> 
> Tested my Victus 15-fa2xxx (PCI SSID 103c:8dcd).
> The LED behaviour works as intended.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Spencer Payton <spayton681@gmail.com>

Thanks, applied now.


Takashi
