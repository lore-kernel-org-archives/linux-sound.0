Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0A2C21F1
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941185; cv=none; b=Dhndwr8H69pnV36LnVbaJd4yeQpotAfprE3zfgOqShHKxf8MdijTGOratJNWnoPre8UPPN9cHkrju/ReIS+cRov6mWexxYGtOIqLR2G6tpPh/3+suQjMTL0bdKuOla6oYNRWJJ3IE7x2AZIQCe+vz9VCpQcg7f4yMfrRUmBmQZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941185; c=relaxed/simple;
	bh=MHf8LIusjuICwFja5RbRkGp4xGsGolI4Rba1esp7lsI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vE0Xakr3cI3PS+IXxHi1Y9svKrLQjf5SLeEHRL6vDPpfyYe/ve5E492QaZ+yeBIZ0aC5BSGkOJB7oncfUKhmwtRa+9tXA/YiFfpw0TObQuEAz/FJG+WE7Gv4DHW+ZIinWFlyNBQQoUK6spUyH1bgbtQRy7KkDle8oWCqFxZJ5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EHNk/GUp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8F+CXGG1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vc/tlK2I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RbS1m318; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EHNk/GUp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8F+CXGG1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vc/tlK2I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RbS1m318"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44E985CCCE;
	Sat, 16 May 2026 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778941181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M9iZL3c6P3SC2Kq8YFubSkfA4LmDkFoJ2vekoH3U0S0=;
	b=EHNk/GUp/Z9jLGlzz6ZBbOx4J3zYndxvB5p6weQ5Ui20OtPmbFiz4DWAa1JS30QaOeiU/2
	Ywb8NOirb4hG3AWwFeK/EoZHVep8rO0r0RmqeB2p5ruRMwmdWdH4/YmuS4lqCVcgr/+yhS
	z1TQRok49zcI98y/xv2qNZ0GOPveVm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778941181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M9iZL3c6P3SC2Kq8YFubSkfA4LmDkFoJ2vekoH3U0S0=;
	b=8F+CXGG1KQeTE2qRXGvKSZmp8SzvnHT/n52cbKdC3DkTNPhr/umWAOYPJNQRuVzCO3ipL6
	fNaTf8FALQ6unIBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Vc/tlK2I";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RbS1m318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778941180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M9iZL3c6P3SC2Kq8YFubSkfA4LmDkFoJ2vekoH3U0S0=;
	b=Vc/tlK2IJkUnkOLNx4AfMGqo5ehaaAWplc7E48IsLgkqTr6UsYEovqWJd7m4QhCIymomSP
	RgqK7y7HHVxXL3aw6B7O8y6VLsVaPXN9v2zPQTp+zy+nErHK0sBW/664fc35o/MrryiXBR
	tG4DnAXjuwZLzmivQeZhcvl+JQKbjjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778941180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M9iZL3c6P3SC2Kq8YFubSkfA4LmDkFoJ2vekoH3U0S0=;
	b=RbS1m318q64QzE6K+hugGzqT5ErXoajzuER3C4m89ImyjZksenFCmIilaSdRxmccoUGxDB
	rZCv2BZYqMQEl0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EBBB593A8;
	Sat, 16 May 2026 14:19:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZL9SAfx8CGoaAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 14:19:40 +0000
Date: Sat, 16 May 2026 16:19:39 +0200
Message-ID: <87mrxz8mis.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ALSA: pcm_drm_eld: rate-limit ELD parsing errors
In-Reply-To: <20260516141244.21801-1-pavone.lawyer@gmail.com>
References: <87zf1zy22e.wl-tiwai@suse.de>
	<20260516141244.21801-1-pavone.lawyer@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Queue-Id: 44E985CCCE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sat, 16 May 2026 16:12:44 +0200,
Francesco Saverio Pavone wrote:
> 
> 
> Mirror of Mark Brown's ASoC: hdac_hdmi rate-limit patch (commit
> [lkml.kernel.org/lkml/2025/6/13/1380]) for the generic snd_parse_eld()
> helper used by ASoC hdmi-codec.
> 
> When a HDMI sink is disconnected (e.g. a board with two HDMI outputs and
> only one cable), userspace audio servers like PipeWire keep probing the
> disconnected card and trigger:
> 
>     HDMI: Unknown ELD version 0
> 
> at every probe ― easily 30+ messages per burst on rk3588. The same
> applies to malformed ELD (MNL out of range). Both conditions are
> expected when no sink is attached; rate-limit the dev_info() so the
> kernel ring buffer does not fill up.
> 
> Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>

Applied now.  Thanks.


Takashi
