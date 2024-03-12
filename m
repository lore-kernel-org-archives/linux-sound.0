Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A813A89F
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710269979; cv=none; b=qD8FEPYY2DUxkyjFlfS0CWOqNYoWyzmhdnk91s+kaRDzVkrd/Sv5SS1TY6EhPrUIprCGqNxGw23VBdpk4mMI3NfTqW/DWjvuariDOmTbFt4aYyc9dPkNlDN3bxUk4aYdmI9u7kbAPuiJXaH4fyh4l+RmXqOM1NRVCq9qr8RHrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710269979; c=relaxed/simple;
	bh=Um9Cdr7p2NGzYx+UewVDIbOW7Ep0K8MOJIYulRmmW+s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCULDsHZa45m0DPbES+XcgGt5/iljZ7AkK/RBxS8ff3jC7gZmunbJtRwXdnw5osOslfNgsNWUZAKGdEnoQZY7RyqCwVW6B5ZzghMXIPFSW36rGAOBdPZhOW/luJtj97cYiRq3FyZ3USu3apMhFGr9gbvdkysr6lDfxC9tMKu580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n+D8cVlY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RthqbobR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n+D8cVlY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RthqbobR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n+D8cVlY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RthqbobR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n+D8cVlY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RthqbobR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB5E01F441;
	Tue, 12 Mar 2024 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710269974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ8j6VCOU3ux2MkTuTrGJfuvWM4tIJiHKxwq+Xh34MI=;
	b=n+D8cVlYq+IhNw/sCoWd3pMMAGE2vI+RuTr4r7fxnxrOdZ3fwwNAqG0Wf2Nv7du++6ZaAb
	oyLisq1A3n8/23j6ZBUvppSbmOpWYtYBODhxGlUAQatIKMB9UoyVlsPontxZ/48HWtWL5X
	KI2jDq/AdIJTvvVVEeF2+sTDcbpsUwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710269974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ8j6VCOU3ux2MkTuTrGJfuvWM4tIJiHKxwq+Xh34MI=;
	b=RthqbobRT3Sy4mDkbfaY75hoN4yBLX68pb0L2ba8FTBoFP0YfmVF2r+ysuhentxQbo116C
	Lc3UxNh6lAa4bpDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710269974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ8j6VCOU3ux2MkTuTrGJfuvWM4tIJiHKxwq+Xh34MI=;
	b=n+D8cVlYq+IhNw/sCoWd3pMMAGE2vI+RuTr4r7fxnxrOdZ3fwwNAqG0Wf2Nv7du++6ZaAb
	oyLisq1A3n8/23j6ZBUvppSbmOpWYtYBODhxGlUAQatIKMB9UoyVlsPontxZ/48HWtWL5X
	KI2jDq/AdIJTvvVVEeF2+sTDcbpsUwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710269974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ8j6VCOU3ux2MkTuTrGJfuvWM4tIJiHKxwq+Xh34MI=;
	b=RthqbobRT3Sy4mDkbfaY75hoN4yBLX68pb0L2ba8FTBoFP0YfmVF2r+ysuhentxQbo116C
	Lc3UxNh6lAa4bpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81AE213795;
	Tue, 12 Mar 2024 18:59:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kREnHham8GWMewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Mar 2024 18:59:34 +0000
Date: Tue, 12 Mar 2024 19:59:34 +0100
Message-ID: <87le6np97t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?f=E6talize?= <faetalize@proton.me>
Cc: Takashi Iwai <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH V5] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
In-Reply-To: <kOqXRBcxkKt6m5kciSDCkGqMORZi_HB3ZVPTX5sD3W1pKxt83Pf-WiQ1V1pgKKI8pYr4oGvsujt3vk2zsCE-DDtnUADFG6NGBlS5N3U4xgA=@proton.me>
References: <kOqXRBcxkKt6m5kciSDCkGqMORZi_HB3ZVPTX5sD3W1pKxt83Pf-WiQ1V1pgKKI8pYr4oGvsujt3vk2zsCE-DDtnUADFG6NGBlS5N3U4xgA=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n+D8cVlY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RthqbobR
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.18 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.17)[96.01%]
X-Spam-Score: -6.18
X-Rspamd-Queue-Id: AB5E01F441
X-Spam-Flag: NO

On Tue, 12 Mar 2024 15:42:00 +0100,
fætalize wrote:
> 
> From: Valentine Altair <faetalize@gmail.com>
> Some HP laptops have received revisions that altered their board IDs
> and therefore the current patches/quirks do not apply to them.
> Specifically, for my Probook 440 G8, I have a board ID of 8a74.
> It is necessary to add a line for that specific model.
> 
> Signed-off-by: Valentine Altair <faetalize@proton.me>

Thanks, applied now.


Takashi
