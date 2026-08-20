Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AB3191CA;
	Thu, 20 Aug 2026 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216225; cv=none; b=htIYS17Ix4sXimXibYLlHNXolAQ0i4lgTAJkMRvKcP0osPh2HrnO/mg/L+4lIvvy34J5nm3mt84JcqhQsBlyib8dassbCqCfYJw/VAP6J7M+DSD58kPQxM/nYXyQ7OROlNL/9f5/0XqVdDXkA4X1TbQjHS0m3LKc5ha83e6G780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216225; c=relaxed/simple;
	bh=z+wgzxFSMr8iD9DWDRtEzcKj1JcMuh7wh0SSbnLLMSQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufoW6FxpgKuuAPGR1QPA13lDXGWK8+FkT9eDoQbwfLjbwBfg+bmDAe0SDuLullC4KYIf+a5LxO51MxkS5P9roiOEKHi8LceWjGqHlvtsZYpzexodU31XBwd/ATuZNRU6F3+dN1f3wDjpLyMK6kSrYr/oO2gwaow3kFJXaiOd14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w+HYVw2J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=19hQc4HA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tfjizkmt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0uGAsD49; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w+HYVw2J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="19hQc4HA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tfjizkmt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0uGAsD49"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01EF984F9C;
	Thu, 20 Aug 2026 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787216217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jXXLK6GgqEk9nuUgW+39MrmU/BPAtGjZOPvfpu2hw=;
	b=w+HYVw2J8F4eNTiNhHb28Nr0Xbx9cQSt6n6eRK/49EA9NpYM2x7p3Pau5FNMcjkaUJwP/M
	FokhKHOBbtjFtUeAfURud7gA8RVHWbC1EiUxYXVXtkMbY846zEklHJ3F5rn93g7INOc2PQ
	zHiM/yCVBjyHjQOUB0Os4aA7l/PASWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787216217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jXXLK6GgqEk9nuUgW+39MrmU/BPAtGjZOPvfpu2hw=;
	b=19hQc4HAHi/AYKi2UkrNGEL6eSxaFFi3faxh07HjSBD77wscZL+EiTTcVfM/z0BLgG08SY
	DL4wJM32jMEN/QCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787216213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jXXLK6GgqEk9nuUgW+39MrmU/BPAtGjZOPvfpu2hw=;
	b=TfjizkmtMakOFwM2nsjm6/MTJZaeu2uKj5WULbkI8qnmhY5hKETYoAoVJFqWFET2YT2e7E
	WXbrMdcZqic3FMpqdulesyyemLHiRabHc2RrjJAFSYetq5ln58PFTj/Y80O6ATNeISC302
	5gKW5+F89SR9kZXwsfRWhTWKnsDooL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787216213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jXXLK6GgqEk9nuUgW+39MrmU/BPAtGjZOPvfpu2hw=;
	b=0uGAsD491+IKGdzoDDBfiXOYE5304Q5S5CnFDgu0wmUzfU75PPR7oaAdKYUE/jyURVMaVP
	zqPiztbuuVeSS5DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0C1C27A8;
	Thu, 20 Aug 2026 08:56:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0oSxMVTBhmoyKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 08:56:52 +0000
Date: Thu, 20 Aug 2026 10:56:52 +0200
Message-ID: <87h5kpmap7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Simplify headset plugin type handling
In-Reply-To: <20260820073744.521680-1-zhangheng@kylinos.cn>
References: <20260820073744.521680-1-zhangheng@kylinos.cn>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 20 Aug 2026 09:37:44 +0200,
Zhang Heng wrote:
> 
> Both the CTIA and OMTP branches of cx_process_headset_plugin() write the
> same value to the headset-mic pin, differing only in the debug message.
> Merge the two branches into a single one, leaving the codec write
> unchanged.
> 
> No functional change.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
