Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E81E0E05;
	Tue,  3 Dec 2024 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733220609; cv=none; b=ny99q077T+WHmDC2JbOfR6SUG8JVFRD8l4BiXMaYh3P+4P+9x0B5skww2c78j7L0ngxLIzn8FE6DpYbSwVNBRCzLdoNw34uyWZ1vNwyLRDhxDSQO8bP34PUn4L5hc7rlOo4OVltbnz2Oxb7n08laM6gLUbwCoKVirP6GtWumhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733220609; c=relaxed/simple;
	bh=WwCSbsmvpjUPgghgVCiRLhSw9HKGXsY8NDQPSlXJIcs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UrxBW614cibN+PaoBScJvQCLUwNoEL79sOLD5uo3QQPdiwlbcRWxQVGk43LGUGH6xxeqe57tiKA3Iw+RlxQYQdfzJsFMg6XJsZ1RQY3aQiC0l1cd3NIHNU2q0U27E9WxKjvZy6+GMNzAaaJcNF+XiJmfzlUX4A0gXBXzieRM6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZzDsjmAr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sjqzGBBp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S9nlXBw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2y+PBf8u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZzDsjmAr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sjqzGBBp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S9nlXBw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2y+PBf8u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB4F22116E;
	Tue,  3 Dec 2024 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733220606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqMJ+JoPpI3mxjrt9fWyt3oKqviqlysSHPcrKDPLJHY=;
	b=ZzDsjmArR1EaFbbz0Fg9ry1bq3G2LxwS6M+SOBT9rDlFaN96mlkjX/bt2dmMwIxnf6jeV2
	Ckut3Mx+ThTCgwBVNrLmtI1fh+xZ+C4ohz+CAVBf9KeASNSDP3hlSsUw/ST0s42HuZ9+di
	zxXRdFUTirF1cioOSzhT47FPquzDWBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733220606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqMJ+JoPpI3mxjrt9fWyt3oKqviqlysSHPcrKDPLJHY=;
	b=sjqzGBBpwLNEoLygO09R3W7At+FmN9sCh3dBug8/oT9sgCa+83FtmwE8Gd3irTL6eykeO6
	zNfps2z9xnKTu9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733220605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqMJ+JoPpI3mxjrt9fWyt3oKqviqlysSHPcrKDPLJHY=;
	b=S9nlXBw/IkbFDWdydwy+t1sQpReapHpG8of9FKNMUF4OW79P9b/NCsfdCS6saaDHALjvZO
	MpY0FjXssbDndVdO3wV4tT6/7DLm0WCRiXuY3eLhcX8jSuH8vqESRk49oHEO1qzEV0H/+d
	ouWY8IqGB8fJQ/NaWjJuuBDRu5v3FDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733220605;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqMJ+JoPpI3mxjrt9fWyt3oKqviqlysSHPcrKDPLJHY=;
	b=2y+PBf8u66Ts+nd/TB5Yc7drFqmb5ZSP0R0uWmR9gzx1Sx+6OztHb1AAHsIM3enh3vq5pY
	ztyqEYCSrY4qGJDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC3AA13A15;
	Tue,  3 Dec 2024 10:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VFthLf3YTmcoXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 10:10:05 +0000
Date: Tue, 03 Dec 2024 11:09:57 +0100
Message-ID: <87cyi9yt56.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: liujing <liujing@cmss.chinamobile.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ac97: Modify the incorrect format specifier
In-Reply-To: <20241203063553.2825-1-liujing@cmss.chinamobile.com>
References: <20241203063553.2825-1-liujing@cmss.chinamobile.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 03 Dec 2024 07:35:53 +0100,
liujing wrote:
> 
> Replace %d with %u in snprintf() because it is "unsigned int".
> 
> Signed-off-by: liujing <liujing@cmss.chinamobile.com>

Thanks, applied now.


Takashi
