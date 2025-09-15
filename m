Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228182652A4
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921131; cv=none; b=ScWKDw1y+BgmQqm3lmxhJq3I5EXXbZFVScGmkPOttHRgOL6wcvXhRWWj2GCrp/wpQZ5FBTZcna4xvjWUNFOqZHmmfGGb921zxjucvR9JF1kImo34nBphOQpn/NwvZultX1mL9USunWiEaWRWlqWAJ1IWX3m7KCyri1kFK0ikRak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921131; c=relaxed/simple;
	bh=8fCUQ11DL5F/0Lqpm8GDwb6J3QMNm+ADL0F4mfEKQwM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwzfRCRZCywFeBZzvICqXOb5MHtGcKXPQx2h3nb/vESoHLmB1ABD+w1iXoJ6x+psLXgbgAN6DeIhXJR7XV/DhfzdS4HYzKKaMneokd288rGMD4b+tJSjITbpyVi6ZLg6oFBKWcG5osGqqrCQgT2s/9mF3J5x7yKmw64qSC5w1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p3kZ88AV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FxOytutH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p3kZ88AV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FxOytutH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p3kZ88AV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FxOytutH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p3kZ88AV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FxOytutH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CF9B336FF;
	Mon, 15 Sep 2025 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757921128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JMd/nitlP8qOmRswa/STelaVTi/2uUpbJw5r3qvELl0=;
	b=p3kZ88AVDINYgirTiRNy7MuPJr+zSmBv5Tf1yZNg0bqMw7HmF5Acjz1QahXg4FnHmkw2bL
	j6EKrSP5ttv8Ld2lVHkP4MyakP9oEKP5IMVgoyHT63KjgdoHWPU0uweDoR1e5kPHOaBKPV
	k4o47gy64vfCu94xP5P3wFafFX3Qk24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757921128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JMd/nitlP8qOmRswa/STelaVTi/2uUpbJw5r3qvELl0=;
	b=FxOytutHmctOdbjNXNqafKylY725oOB8t5y5u39t7tIQas/dYoeOcNZCUFGyrZppOTRw+Z
	Q9mmIi9bASpulCBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757921128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JMd/nitlP8qOmRswa/STelaVTi/2uUpbJw5r3qvELl0=;
	b=p3kZ88AVDINYgirTiRNy7MuPJr+zSmBv5Tf1yZNg0bqMw7HmF5Acjz1QahXg4FnHmkw2bL
	j6EKrSP5ttv8Ld2lVHkP4MyakP9oEKP5IMVgoyHT63KjgdoHWPU0uweDoR1e5kPHOaBKPV
	k4o47gy64vfCu94xP5P3wFafFX3Qk24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757921128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JMd/nitlP8qOmRswa/STelaVTi/2uUpbJw5r3qvELl0=;
	b=FxOytutHmctOdbjNXNqafKylY725oOB8t5y5u39t7tIQas/dYoeOcNZCUFGyrZppOTRw+Z
	Q9mmIi9bASpulCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CF811372E;
	Mon, 15 Sep 2025 07:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k+FOBWi/x2g4UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Sep 2025 07:25:28 +0000
Date: Mon, 15 Sep 2025 09:25:27 +0200
Message-ID: <87cy7sp47s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bou-Saan Che <yungmeat@inboxia.org>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: hda: cs35l41: Support Lenovo Thinkbook 13x Gen 5
In-Reply-To: <20250914191537.2530-1-yungmeat@inboxia.org>
References: <20250914191537.2530-1-yungmeat@inboxia.org>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Sun, 14 Sep 2025 21:15:37 +0200,
Bou-Saan Che wrote:
> 
> This laptop does not contain _DSD so needs to be supported using the
> configuration table.
> 
> Signed-off-by: Bou-Saan Che <yungmeat@inboxia.org>

Thanks, applied all three patches now to for-linus branch.


Takashi
