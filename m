Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F2237CD33
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151184; cv=none; b=mGymVmIJYf40YwRCWcd6LuAEgvI+6gSmbwJECJelr+K9Hp2eVqldwh8BpJHyeqAD13anQq1GiFV4yazgmnS1QtnWdcOKB8i7238Pwkmy6kVIik3T2rrc7ICUKu8oU5k5KzVSrSEXGFeVgqAryfJQ4l0mWCK/FVMHGaVFrNSPQbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151184; c=relaxed/simple;
	bh=s4xzCWW+ffE/rLyBPqkpWGkP1xnKwhANTa6zp31RPaU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6tXWq3t+nCcZvkLuW9g8EsaMp6Nr5Z6psJaJY8Ct4mEByqqbEey5AoKENH0+SR8TQ1kBV4Wf7XHMFZcQuCEO9GVw7Rz5KK0qnAzmRmBmT80OY5OZCRg1JrvkpRvHYykfsUdtszwN4wJB6E/G19JZJR0VO4LPNFXm9x3+n1AYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KHwLs7Te; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1FWZGjWi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KHwLs7Te; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1FWZGjWi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KHwLs7Te";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1FWZGjWi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KHwLs7Te";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1FWZGjWi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE0A85BDB5;
	Tue, 14 Apr 2026 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776151181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZWwu7gc66Exm0iB6mQaDqy0pjIdOaKeT5e7pSELJU=;
	b=KHwLs7TeslRRLQk/PMVuL6YAOefhBOjOUXRA4Tg9svafHag9KXSQXDxBHA24oqV2992/x+
	/IEo+7G25ofnC60AFyQydKTKrSsoXoaxvqdRtBi0p/7PEygTSk3gXQlWc3I2Cd5W+0/WWK
	i24LT3LvCdG2oVFH4huyOD+CzhAQDMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776151181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZWwu7gc66Exm0iB6mQaDqy0pjIdOaKeT5e7pSELJU=;
	b=1FWZGjWiroXBb4evUbW9KC39JKDbYsEubTP6xCc4poxOzwaaifGGt/sSzETdgYPMOF+I3Q
	XCpgee69GMTIIiBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KHwLs7Te;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1FWZGjWi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776151181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZWwu7gc66Exm0iB6mQaDqy0pjIdOaKeT5e7pSELJU=;
	b=KHwLs7TeslRRLQk/PMVuL6YAOefhBOjOUXRA4Tg9svafHag9KXSQXDxBHA24oqV2992/x+
	/IEo+7G25ofnC60AFyQydKTKrSsoXoaxvqdRtBi0p/7PEygTSk3gXQlWc3I2Cd5W+0/WWK
	i24LT3LvCdG2oVFH4huyOD+CzhAQDMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776151181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZWwu7gc66Exm0iB6mQaDqy0pjIdOaKeT5e7pSELJU=;
	b=1FWZGjWiroXBb4evUbW9KC39JKDbYsEubTP6xCc4poxOzwaaifGGt/sSzETdgYPMOF+I3Q
	XCpgee69GMTIIiBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD8A74B30D;
	Tue, 14 Apr 2026 07:19:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ESM+KY3q3WnCSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 07:19:41 +0000
Date: Tue, 14 Apr 2026 09:19:41 +0200
Message-ID: <874ilet3ea.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Faye <faye.opensource@gmail.com>
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer PT316-51S headset mic
In-Reply-To: <20260413212645.117119-1-faye.opensource@gmail.com>
References: <87lderwhfi.wl-tiwai@suse.de>
	<20260413212645.117119-1-faye.opensource@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: DE0A85BDB5
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Mon, 13 Apr 2026 23:20:25 +0200,
Faye wrote:
> 
> From: Faye Nichols <faye.opensource@gmail.com>
> 
> The Acer PT316-51S (PCI SSID 1025:160e) with ALC287 codec does not
> detect the headset microphone due to missing BIOS pin configuration
> for pin 0x19. Apply ALC2XX_FIXUP_HEADSET_MIC to enable it.
> 
> Signed-off-by: Faye Nichols <faye.opensource@gmail.com>

Thanks, applied now.


Takashi
