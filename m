Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53284A11;
	Sun, 26 Jan 2025 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737885683; cv=none; b=B0vJxESuZgH/ack+z0oa9PbMLN0CIIwvaUUS8LvCwGySrQv9lDJKEnaHCt2HnPk+XV6mK7v/RlQ5PsEjEpH9qFl4MuK9ohuW8zxsqp05CTgzSZZaWLuZIVwQBTUmujKPLFFYPe/NpEazf0R00QB276+seAAlG6SkB43kkLAPJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737885683; c=relaxed/simple;
	bh=CjD2bDlMkgO4igaMcp0U2t+njjLoDAFkIFzOD9Ke1Hc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O9/57O0Fsu1B5fNwYjTLtXz4Kx02Oh4cZdX9c+y5VVLSVryy/iMAE+i51GyZdlAMcKwLAXRpldaaGBKHrI8CvHXbuTQoLhkHhM5oge0qhsrOajYiHRZsvfmZKi65p2rV0YN1go7MSYVbN61vE3m2WbfaQY9t/73B1BSO5LjcOSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ooL2EoUn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SVfwyarj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ooL2EoUn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SVfwyarj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ooL2EoUn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SVfwyarj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ooL2EoUn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SVfwyarj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BE071F38F;
	Sun, 26 Jan 2025 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737885679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ib375BAWBq7Aoeb8R510G4k1bUqfLVZVcy6QBJd4ip8=;
	b=ooL2EoUnxrC2iSkC1WbQOZfvQ44tRBzbliMjyElZ/ASTEaenOMX5kOqqbkDsjigqNYcnAo
	Ul685m9vD6Hr0fvt0NzKz/cT6RlWIhvzSzRqNCkhVPfd44H659RpSo1KuSlHO3rt1jcGqy
	ss3C5kjeQs0EFQxNxORTVGtC9RY70bo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737885679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ib375BAWBq7Aoeb8R510G4k1bUqfLVZVcy6QBJd4ip8=;
	b=SVfwyarjnACmK9YJWPDmYk2ItTQRxhMOvmw+Rjx1CN8Ypr9aUQZyPXZZAzvC0sDsVWNgu1
	h/o+8q57OnGYAqBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ooL2EoUn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SVfwyarj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737885679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ib375BAWBq7Aoeb8R510G4k1bUqfLVZVcy6QBJd4ip8=;
	b=ooL2EoUnxrC2iSkC1WbQOZfvQ44tRBzbliMjyElZ/ASTEaenOMX5kOqqbkDsjigqNYcnAo
	Ul685m9vD6Hr0fvt0NzKz/cT6RlWIhvzSzRqNCkhVPfd44H659RpSo1KuSlHO3rt1jcGqy
	ss3C5kjeQs0EFQxNxORTVGtC9RY70bo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737885679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ib375BAWBq7Aoeb8R510G4k1bUqfLVZVcy6QBJd4ip8=;
	b=SVfwyarjnACmK9YJWPDmYk2ItTQRxhMOvmw+Rjx1CN8Ypr9aUQZyPXZZAzvC0sDsVWNgu1
	h/o+8q57OnGYAqBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5875B13A60;
	Sun, 26 Jan 2025 10:01:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QnvfE+8HlmfoEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jan 2025 10:01:19 +0000
Date: Sun, 26 Jan 2025 11:01:18 +0100
Message-ID: <871pwp28sx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: hdmi-codec: add ELD information to procfs
In-Reply-To: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
References: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9BE071F38F
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 24 Jan 2025 22:14:29 +0100,
Dmitry Baryshkov wrote:
> 
> Follow the HDA lead and add ELD-related information to procfs for the
> ASoC / HDMI-codec cards.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks fine, but it's too late for 6.14.

If Mark doesn't mind, I'm going to take this series after 6.14 merge
window is closed.


thanks,

Takashi

> ---
> Dmitry Baryshkov (2):
>       ALSA: hda/hdmi: extract common interface for ELD handling
>       ASoC: hdmi-codec: dump ELD through procfs
> 
>  include/sound/pcm_drm_eld.h   |  91 ++++++++++
>  sound/core/pcm_drm_eld.c      | 387 ++++++++++++++++++++++++++++++++++++++++++
>  sound/pci/hda/Kconfig         |   1 +
>  sound/pci/hda/hda_eld.c       | 385 +----------------------------------------
>  sound/pci/hda/hda_local.h     |  49 +-----
>  sound/pci/hda/patch_hdmi.c    |   6 +-
>  sound/soc/codecs/hdmi-codec.c |  68 ++++++++
>  7 files changed, 562 insertions(+), 425 deletions(-)
> ---
> base-commit: d5e972e5216ebd4cb9a0bb0b0bd310b86f270d36
> change-id: 20250124-alsa-hdmi-codec-eld-09fcc1cc005a
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
