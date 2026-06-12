Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124D38238D
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255012; cv=none; b=vBMlOqy0y7bGhbFvvBDv+FOIJbDZ6ow1FaOP+pFbmIpkT+2FGTziOIYTP5msp64hWhYO2xUOsha7r9upLnNCgpKIKuync7+N2HrXF4LtWoEjBkuj3LmGHI9t6X1H9MaKG+yh1HbdkgxHgasEQm3mCJ2CQJeej4GBF26z/Hl6nxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255012; c=relaxed/simple;
	bh=FRLgHHHejbeVIszfgcTeL9+nMYHSUeWw8/FL8+qxmxM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LP6nyIw1ggAp1pj0MykyuX9ZbqHUd0uE9OI6S8FQ1KOyDtEs8SsLFdl1RRb6vcHJ1jNpTTOgskTcORrjOgVXUJ5JJbd0T/ma3IF9A2b3oocB6c0liTn/XHq7CLudQE85GjKmruuGyhxp7QgZVGovD41KMWPvp/XI1tZL4OEaCeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DBy1IYJ4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=37WAc0Ol; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wkYkNdKL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e8xJcNqT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DBy1IYJ4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="37WAc0Ol";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wkYkNdKL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e8xJcNqT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DFDAA75E89;
	Fri, 12 Jun 2026 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781255008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OYFP/akkbuFZcWuDplTIWJvN/r50m3B8cDzeF5D0Do=;
	b=DBy1IYJ4rEpgvruB/XxsV3DfiLsmeYGB3SkCPjfzCr0tWi5Ul/71ysn/f3AjqOqRXUDkJi
	Px9MUIhkF7BMMr9fcsDbG7OY/XQtDWE1VG5vNoHoG/u9iWsPJwPhg1ov5s417tiqSJasem
	1RRT0uZlKLO9jF7kh91y7D5bK5Wke+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781255008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OYFP/akkbuFZcWuDplTIWJvN/r50m3B8cDzeF5D0Do=;
	b=37WAc0Ol1prUEI9HnN6g4ze2Gdy7a5JJSx1YtPuZZkM03cslclLaFfJtmgQHFxbpNYlS6a
	wDXHyoKcU21CBdCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wkYkNdKL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e8xJcNqT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781255007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OYFP/akkbuFZcWuDplTIWJvN/r50m3B8cDzeF5D0Do=;
	b=wkYkNdKLfU5kG4HVcQST9xamCP6S5MAuqPRV//2zsXLJDzoXUMEzxhOnucYw3DIgF/Ogk3
	PIuGzB8kDE2fExfEr9L2Z+CYULwKxlYWWPbwgxkkoJK5kMtbvaTjKS7WdGFwDf0dZULuZH
	uUXH9M6IkdA83SqVPAnpnpqiO9VQI9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781255007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OYFP/akkbuFZcWuDplTIWJvN/r50m3B8cDzeF5D0Do=;
	b=e8xJcNqTM1WPq16PWlZNjMiSR3vRMXVsc/ZxdkrUZiG0CNFp4nzcu8SVNHa1fhG4s3/KIl
	eVqc712ZO+xMCgAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A602779A7;
	Fri, 12 Jun 2026 09:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EsNaIF/LK2pXZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 09:03:27 +0000
Date: Fri, 12 Jun 2026 11:03:27 +0200
Message-ID: <87pl1wi10g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Guard sideband endpoint removal
In-Reply-To: <20260611-alsa-usb-qcom-guard-sideband-endpoint-removal-v1-1-00e73787c156@gmail.com>
References: <20260611-alsa-usb-qcom-guard-sideband-endpoint-removal-v1-1-00e73787c156@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DFDAA75E89
X-Spam-Score: -3.51

On Thu, 11 Jun 2026 15:57:22 +0200,
Cássio Gabriel wrote:
> 
> qmi_stop_session() conditionally looks up the cached data and sync
> endpoints, but removes each endpoint unconditionally.
> 
> The data endpoint is always present for an active offload stream, while
> the sync endpoint is optional. When no sync endpoint exists, ep still
> refers to the data endpoint and the code attempts to remove that endpoint
> a second time. The current sideband implementation rejects the duplicate
> removal, but the teardown path should not pass an unrelated endpoint for
> an absent sync endpoint.
> 
> Only look up and remove an endpoint when its cached pipe exists, check the
> lookup result, and clear the cached pipe after handling it. This matches
> the normal stream-disable path.
> 
> Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
