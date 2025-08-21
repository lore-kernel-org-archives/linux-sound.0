Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ADE276038
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760338; cv=none; b=SJkli8W0kmPhGmukAcOhUE5mHKUVrjqGMQKyQMLO8gH+gnx6YUygmeBjlYV9dD9JVTf00E0wZKz3XR3PEET2FcavUcCpgP3uxxpbEv3zoJ1HwFmVpQoJXB18sH/s17sqPyvacRNwgA4I9hyAkcgwz/LclE5xOiVrprHZAZaN2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760338; c=relaxed/simple;
	bh=BYRNFkireHleEmmy0KTdwkXPjUC2Xdzolhv+YEAvMj4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lJdpjmPg71DzC0d/xJo5wV1ab79frhveB3C1vohKgoJ3gyGCucZba7r1WBO6HS+fXSQXRnPdX623MqKqTZimuJS1c8vCkSJGIkDUt7r00Aq4FN7nkTNyGV1Oqg2N2EaLJnCSyMLPwI9B8gk3D2jfI1sMia1uICv7+p9KlYH8258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GpsF0yAX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iTG1BXdv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GpsF0yAX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iTG1BXdv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GpsF0yAX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iTG1BXdv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GpsF0yAX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iTG1BXdv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D4D221C35;
	Thu, 21 Aug 2025 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755760332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=GpsF0yAXqVbJDkL92N0CBMQks4gAifwhJEiF+SZUKLHMtmY048WQzkdQL4BuffW11sr0k8
	tpmq6WB/5EjbwLMFWxlOKHbVHxf/by2wml/dswIdoNA6M5PUnfRFBLzWu4DlvAugft2QLQ
	AWI7QgthXTppwLGBV73dt/QKb/U84YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=iTG1BXdv84suosNVe50vwIU8YzOLcsT7wBwDPMfWgslhZt3jLcNcpYgcV8ZgBXjMRzd2rX
	CczX5QbX70ghhDBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755760332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=GpsF0yAXqVbJDkL92N0CBMQks4gAifwhJEiF+SZUKLHMtmY048WQzkdQL4BuffW11sr0k8
	tpmq6WB/5EjbwLMFWxlOKHbVHxf/by2wml/dswIdoNA6M5PUnfRFBLzWu4DlvAugft2QLQ
	AWI7QgthXTppwLGBV73dt/QKb/U84YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=iTG1BXdv84suosNVe50vwIU8YzOLcsT7wBwDPMfWgslhZt3jLcNcpYgcV8ZgBXjMRzd2rX
	CczX5QbX70ghhDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59C1E13867;
	Thu, 21 Aug 2025 07:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9peUFMzGpmh9fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 07:12:12 +0000
Date: Thu, 21 Aug 2025 09:12:11 +0200
Message-ID: <87frdl6tdg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc2
In-Reply-To: <c76f8af82172ef5d00fce6f17a50eae6@kernel.org>
References: <c76f8af82172ef5d00fce6f17a50eae6@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Thu, 21 Aug 2025 01:25:59 +0200,
Mark Brown wrote:
> 
> The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:
> 
>   Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc2
> 
> for you to fetch changes up to 7c15e4cabfa96ed3cd717a2ed7a9961268ab21f7:
> 
>   ASoC: cs35l56: Fixes for CS35L63 for production (2025-08-20 19:56:20 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> A few fixes that came in during the past week, there's some updates for
> the CS35L56 which adjust the driver for production silicon and a fix for
> buggy resume of the ES9389.

Pulled now.  Thanks.


Takashi
