Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6930F54D
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764224765; cv=none; b=VJqhatyVMT28wGaB6puVYCZFf9L0IxiyD9PMv/lD0Dxa5tMHg22757wMMV+qkRq5QgLGZmd46QGVn1f14NHR0r+XQukxIbaBRhKI9Lu2PnK1Axw3tNW5cuA18z2rw0yyIcVEqxHY8IUN4xima18u9Ez+zrY/gcA+aFDK8G5C77U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764224765; c=relaxed/simple;
	bh=w8YVsZHFkXkjVe7BKciWNhdJ/VOfeqKPRozy2AhhJp8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDW2eEpeAq+FWodI3k5/h5xhDirEsHG6WBqN+x/3ELEvZmktg00TOgVqIWN9G3OJBynJG7ItqWd/1z2zOwUbSlL3aEPPRcivEvYo6n+mUcDvfOLiTN7+S33V4es5n7Zq3iCMFfWY0iqFRF/QWPR/cfZ9e9fHN8G3r/K3Egcx2r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXM6pajV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P9WSL0GP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXM6pajV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P9WSL0GP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXM6pajV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P9WSL0GP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXM6pajV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P9WSL0GP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97F495BCC4;
	Thu, 27 Nov 2025 06:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764224761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7tYPxwLhBmjqwdIkKSp4grBbWrqq/y0w+qLXw6NRNEc=;
	b=MXM6pajV0l8OIP8lN4DDEtLH5cQU/HWsffBE6Y1CB5OGHsEv7Ywufsq08YiCoqaueyjmaf
	slssuueyD9uW4uMz/S20r6Cqq/hKfBOvZeFALaOnHRhm2hNF3XijUoHoMClvn0m7DB26fA
	DRygO6yC+FLr3jBFgN+4pTlE3ycPphs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764224761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7tYPxwLhBmjqwdIkKSp4grBbWrqq/y0w+qLXw6NRNEc=;
	b=P9WSL0GPT73Kti5yvtGJ0c7XFIwzxESLOelJWH5Oh1agcUyoMxBlnfaxc0f/3nPdnOSb5W
	USkukRxI+PQM0WAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764224761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7tYPxwLhBmjqwdIkKSp4grBbWrqq/y0w+qLXw6NRNEc=;
	b=MXM6pajV0l8OIP8lN4DDEtLH5cQU/HWsffBE6Y1CB5OGHsEv7Ywufsq08YiCoqaueyjmaf
	slssuueyD9uW4uMz/S20r6Cqq/hKfBOvZeFALaOnHRhm2hNF3XijUoHoMClvn0m7DB26fA
	DRygO6yC+FLr3jBFgN+4pTlE3ycPphs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764224761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7tYPxwLhBmjqwdIkKSp4grBbWrqq/y0w+qLXw6NRNEc=;
	b=P9WSL0GPT73Kti5yvtGJ0c7XFIwzxESLOelJWH5Oh1agcUyoMxBlnfaxc0f/3nPdnOSb5W
	USkukRxI+PQM0WAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56B9B3EA63;
	Thu, 27 Nov 2025 06:26:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5aAcE/nuJ2nnNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Nov 2025 06:26:01 +0000
Date: Thu, 27 Nov 2025 07:26:00 +0100
Message-ID: <87h5ug9ekn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dirk Su <dirk.su@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: fix mute/micmute LEDs don't work for HP 200 G2i
In-Reply-To: <20251127025651.13627-1-dirk.su@canonical.com>
References: <20251127025651.13627-1-dirk.su@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]

On Thu, 27 Nov 2025 03:56:39 +0100,
Dirk Su wrote:
> 
> HP 200 G2i needs quirk to make mic-mute/audio-mute working.
> 
> Signed-off-by: Dirk Su <dirk.su@canonical.com>

Applied to for-next branch now.  Thanks.


Takashi
