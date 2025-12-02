Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128CE21CFF6
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764659247; cv=none; b=NVIPRhDWuXVDM5KdEFBVGx5Lm5Y5AamtZmeeDHZVtnbK9R5GzQX4gYxoyOGgmgoWfRFiITMqlBHVB6T5IdtyXB9WVeGsVM1poYy3rWasDf90Mdsgnla3N2TWPu0lwG+0as8xMcKZSsPItTCnH74DNRoFhY+PrsTA1NVZHf2AUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764659247; c=relaxed/simple;
	bh=7G31mkT0SzJ1n2ILzoASeJbDhjgzgPRphQeXpztpDzU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHq11O1asS6y9JzJyub2O0aCvSsgXFR2od0RV5ae40mkFQI8iq2DkPOvOIPjFxlQAGdJlE0BEzQ/foyk9FmsEP3R/5s9ixg0erb04m8RwMM0vC74U/qDy4Gps2fNa/cLCskQjrOIuit1LsoysWAYmYXqZSzFx0fcwvkHZv/RE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T3VSVT6t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lEe92eFs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R6g5oraO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yiKif4ID; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T3VSVT6t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lEe92eFs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R6g5oraO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yiKif4ID"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 06DF95BCC3;
	Tue,  2 Dec 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764659243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vjxYFPHFlXqgTigtxQRBL7MS0qPjMCXrqMKfAxAJTQ=;
	b=T3VSVT6tBtWhtVYS+vIIx5R/Dv5MVGGM6aEVjfG2gFUtJTQpPbSib8pj9TWHIdjdiuQltJ
	h0WIz5ynH+jkDKVv8bfIFO7ZU0qqmwYKIwJ22N6/g+VDsaMwjfb3EfSmibAj3N7ZwjLqmA
	5b8R+QYCig60DQMuHuQJ/zSG2L83zKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vjxYFPHFlXqgTigtxQRBL7MS0qPjMCXrqMKfAxAJTQ=;
	b=lEe92eFsSOGVIiKKeilDNcSS33qd9w8oVypeT0WsljiLJbrZ5pvs8v1ym+8ZKEiNhzBGnG
	KkLhe9IovQ23BpBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764659242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vjxYFPHFlXqgTigtxQRBL7MS0qPjMCXrqMKfAxAJTQ=;
	b=R6g5oraOKu8jtd7qfb43sqdNoEBZWAX73w6sxh0LbiqnSi+g6Et7mH5m2tNQS8PBIwfCfL
	6y3cyDtrVkZtkaQpN8ZFZ1Im83xXqBJ3NNUhYT9ghJ4SwoltqEAQzmcIpjAk4V4kf+DAUk
	JiLVhzY/ZFk9+2L5LxnoQHuej/sdjXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vjxYFPHFlXqgTigtxQRBL7MS0qPjMCXrqMKfAxAJTQ=;
	b=yiKif4IDqqmdrh8zaIrYinZRYQ1TdR5wkuJSZ4l5HEvrtTCDJk2O3uZoZc3UL1QZlTNXKF
	4vLpqWg4OOPoY5Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D16153EA63;
	Tue,  2 Dec 2025 07:07:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +wbMMSmQLmnDXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 07:07:21 +0000
Date: Tue, 02 Dec 2025 08:07:21 +0100
Message-ID: <87tsy95pli.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for more HP laptops
In-Reply-To: <20251202042534.174755-1-chris.chiu@canonical.com>
References: <20251202042534.174755-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.736];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.25

On Tue, 02 Dec 2025 05:25:34 +0100,
Chris Chiu wrote:
> 
> More HP laptops with codec ALC3247 need the extra coefbit2 to make
> mic-mute/audio-mute working.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi
