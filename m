Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B70207A02;
	Fri, 10 Jan 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496702; cv=none; b=NcbdD3e+WxgeVt05r6lj4DXN1P+yfxY4XB3wWpZAmH6e/fo/geGqpstEWchFNNCDRdJMddY5KteGMErLI4fyvE73O+FLP7+Jr/1O99Wt9fr2D69u+bTEuLlahBq67rf/BiXYioE4Xc2CRr6Jf9sCRU13GUqg7uvwiRXbHReesmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496702; c=relaxed/simple;
	bh=8fS6HSSmWvCByX2BxRnXFznAzSIUqxAra/WtaaHKtWM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IujlAxOxs9T2XO0WkcAcoJk8ZoJmfUStF/L8RE3NWGcEWeRyjB0opwunH9pvS48eaY+3rfkw0hK/WCwvV0Hr20oVjUKo2Zt1D/dFMiSjEc7EyJ25+7CvulJjLzA7azhEDYxzuP4nSJT6OcRdbKO4m9kOvuvu3DOksx2NqMACb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nVtrZr17; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e+45LYKX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nVtrZr17; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e+45LYKX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nVtrZr17";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e+45LYKX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nVtrZr17";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e+45LYKX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40E7121172;
	Fri, 10 Jan 2025 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736496699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxjRF/99r945om/djwaP0fIedjpWOQA66II2YhpnGyQ=;
	b=nVtrZr17GvUCF/BDR+Tc5XvrV8Nqg/zPSIfyhPBOvzolOkBrtau4163xuHZpISm2VG0anF
	d60j1L5RzXAbL9rquqnfAPKfyR/FReYqIGk7rd4ZF0aT2tP5r6hb8V32rca0L1FKVgwNtm
	cw1N5sw3tzlX9AaIsg3F0CL4HlPRCZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736496699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxjRF/99r945om/djwaP0fIedjpWOQA66II2YhpnGyQ=;
	b=e+45LYKXnmL+Rm0LvDRWM7AW0mRnqoxGhBMbDKQjpE6MuBfd6FP12+1CyQsJc8I+4KYP6c
	bDawVfn8eW2n9CAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736496699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxjRF/99r945om/djwaP0fIedjpWOQA66II2YhpnGyQ=;
	b=nVtrZr17GvUCF/BDR+Tc5XvrV8Nqg/zPSIfyhPBOvzolOkBrtau4163xuHZpISm2VG0anF
	d60j1L5RzXAbL9rquqnfAPKfyR/FReYqIGk7rd4ZF0aT2tP5r6hb8V32rca0L1FKVgwNtm
	cw1N5sw3tzlX9AaIsg3F0CL4HlPRCZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736496699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxjRF/99r945om/djwaP0fIedjpWOQA66II2YhpnGyQ=;
	b=e+45LYKXnmL+Rm0LvDRWM7AW0mRnqoxGhBMbDKQjpE6MuBfd6FP12+1CyQsJc8I+4KYP6c
	bDawVfn8eW2n9CAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E1D213A86;
	Fri, 10 Jan 2025 08:11:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V4wzAjvWgGdfeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 08:11:39 +0000
Date: Fri, 10 Jan 2025 09:11:38 +0100
Message-ID: <87r05bulz9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Use str_yes_no() helper
In-Reply-To: <20250109223809.198582-2-thorsten.blum@linux.dev>
References: <20250109223809.198582-2-thorsten.blum@linux.dev>
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
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmx.de,suse.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 09 Jan 2025 23:38:08 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
