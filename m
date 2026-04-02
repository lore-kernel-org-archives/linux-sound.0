Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5A328B56
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120813; cv=none; b=D0iNLT0EskJsDb+ITRlFXyMRdHNmFmtCjobutq7cNub1/6J0VBv2bcwmRcnodjwdBGM/5T/xySqsC0QuXxhiPlSZAlYsTB6fmPO1vOpbwmaGL/nlorEyc/wiHVmSNA7qsr7jOyNRP1qdZZHh0V3PvA0LMM07MyhwFsM3zOWYDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120813; c=relaxed/simple;
	bh=uY/Vz+H0g+qgGg9u9zTixZO61DcdI2u5cdhWDXSPHsE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bjwpMF3fM7JsgDbIp3JLjT+NRZ2ngsvhAU7aiEPG8tde+a/MhofCJ0UTSJfNxmRMBD92HyeiXRp/Z2Atna6bIqO8rMGp1k3FgUJ2DnQAFjKGKW0gypJN5UjowKeoQrKmAumwIbHTejcj7l9ConBE0IYpGsXy9XaGrrs9ld15sW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xWplUTH/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ly82zfmP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xWplUTH/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ly82zfmP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xWplUTH/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ly82zfmP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xWplUTH/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ly82zfmP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80EC55BD36;
	Thu,  2 Apr 2026 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775120810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2KxhQhoanl1/lMFqGU7gE2a/7mgcGsZ6oZcdsRFfcU=;
	b=xWplUTH/mKYOuXGb/5d7Ar6ocL4CVZQ3v/TqeSJXlcijhlt5SyKOzPQImEGsGI3Qnd3GUf
	oaXJoL6ErM+5tiGBHkFJrGlUXYfgvcwSCah57jVmz8JahxIEX9P/uiSmQXDSlXDimbRfHV
	7V2RJb4bvixnAbJfrLRozFMO2Xhs8GQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775120810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2KxhQhoanl1/lMFqGU7gE2a/7mgcGsZ6oZcdsRFfcU=;
	b=Ly82zfmPiTTgRs43++JjgO8JQiZ2GtsWK+bmpWDZicThauosDbK6b/v1aX2nUPbx3uVfDT
	wLjHS0gEQxslwPBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xWplUTH/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ly82zfmP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775120810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2KxhQhoanl1/lMFqGU7gE2a/7mgcGsZ6oZcdsRFfcU=;
	b=xWplUTH/mKYOuXGb/5d7Ar6ocL4CVZQ3v/TqeSJXlcijhlt5SyKOzPQImEGsGI3Qnd3GUf
	oaXJoL6ErM+5tiGBHkFJrGlUXYfgvcwSCah57jVmz8JahxIEX9P/uiSmQXDSlXDimbRfHV
	7V2RJb4bvixnAbJfrLRozFMO2Xhs8GQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775120810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2KxhQhoanl1/lMFqGU7gE2a/7mgcGsZ6oZcdsRFfcU=;
	b=Ly82zfmPiTTgRs43++JjgO8JQiZ2GtsWK+bmpWDZicThauosDbK6b/v1aX2nUPbx3uVfDT
	wLjHS0gEQxslwPBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B2794A0B0;
	Thu,  2 Apr 2026 09:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R4PNDKoxzml9UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 09:06:50 +0000
Date: Thu, 02 Apr 2026 11:06:49 +0200
Message-ID: <87zf3livdi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Andr=E9s_Garc=EDa?= Castilla
 <andresgarciacastilla@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	songxiebing <songxiebing@kylinos.cn>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 14AKP10
In-Reply-To: <CANp29eOEubst-somoMv46sbZSpbAV_eWs=pKr5Yf1-VQYgz-uQ@mail.gmail.com>
References: <20260331033650.285601-1-songxiebing@kylinos.cn>
	<87341gtrs1.wl-tiwai@suse.de>
	<CANp29eOEubst-somoMv46sbZSpbAV_eWs=pKr5Yf1-VQYgz-uQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 80EC55BD36

On Wed, 01 Apr 2026 21:29:16 +0200,
Andrés García Castilla wrote:
> 
> 
> Hi there,
> 
> Thanks a lot for applying the fix. Sorry if this is a stupid question but I'm
> not familiar with this process. Which kernel version(s) is this patch going to
> be applied to?

It'll be included in the next PR to Linus, so hopefully in 7.0-rc7.

Once after it gets merged, we can request to backport it to older
stable trees if wanted.  As we didn't put Cc-to-stable in the patch
description, you can ask stable maintainers to pick it up explicitly,
or wait for a while until they pick it up via AUTOSEL.


Takashi
