Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DB396B73;
	Mon, 24 Aug 2026 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557196; cv=none; b=pDujwTfkCK3XQkd/CattIY9d5KJ9SxpE+BIQb570VCQjQry+WXr24Kw6hi1ZV6MZSVLg8myGN/KnHaQIF5IHxDYytaP9JCZIUvpoRwxWrzygG+nMTGyLwo0sXcVyyx4cJN2+juyN7EbC0vpe/zZZP9bgyYCb50aIdHFu9S4buq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557196; c=relaxed/simple;
	bh=GDEXThkB8H3FZO+3bxkw9ov2cE7PdUcHbI5w4wRyjcI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emDJr9xAZjJaLfu2pE34ymOJozKPT26Oz2joREM1bn5yb35/wMzaZMiWADQvKmi6JLTUNGajn/7oWtjTW+4RRe4/9fE5X76fW4tQCmyg6Jjea89pz633kefXj25HEwQCJ+rj4aIy7t3Z00ygQ2VPFvDzVFw9b+HrBjkCE79QKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=14XOj+j8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L6tXXRIP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pWW/++9J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r1M1fEsE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="14XOj+j8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6tXXRIP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pWW/++9J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r1M1fEsE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 025543E29;
	Mon, 24 Aug 2026 07:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787557189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f69aPH1yFk3+qvb0kzYom+rr0jMtowZxSsNrXjEEDHI=;
	b=14XOj+j87PJdkgS/iwKGHVvvQ2Gv020js1thVPR+FG3Afg77TneN871P3csZuJWkvO+F6S
	Nijo7X4Iz3uMUi/N3FIvxoZu5ELzvLcF5XUNYOzlHZ16a3DdIhzbkAmG9n3NqKT/M6chpz
	3cQA/G+TRrDTlVhhNEXdtUGsWSkFRik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787557189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f69aPH1yFk3+qvb0kzYom+rr0jMtowZxSsNrXjEEDHI=;
	b=L6tXXRIP837xc/Xsj/3i3RASRqzyW5hzvTlIFH4vLmhgYyaLSxCQWCAMfVoRPfQaQ1dvH3
	1O331HyLHGl5Q/Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787557185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f69aPH1yFk3+qvb0kzYom+rr0jMtowZxSsNrXjEEDHI=;
	b=pWW/++9JlQMxzF90I5qdfD+Pn90++XM43anwW3h4uJrEtR8U7Iwc7kuJFNmV3QEXveeP6Q
	0I3iWXDYneuekrwlN09ptLcw52vCSvKS42qVXuKiWXvh4M9jOOmh3kr/5ASCNhuqTWsYNo
	Kh0fN7FM7RZn/nNjhXrvaa+pjTCk8ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787557185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f69aPH1yFk3+qvb0kzYom+rr0jMtowZxSsNrXjEEDHI=;
	b=r1M1fEsEcQ75IUDYzm9x3ONdkBYDFiUjzr3MtV8QFXrf1CTJ9ArepQ96INq3y+oK4IBzhd
	cdPJv414ABJQcKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C92C113332;
	Mon, 24 Aug 2026 07:39:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EXFsLUD1i2r8eQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Aug 2026 07:39:44 +0000
Date: Mon, 24 Aug 2026 09:39:44 +0200
Message-ID: <87zeycufun.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Eckhart Mohr <e.mohr@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for TongFang XxAF5xxx
In-Reply-To: <20260821144437.27233-1-wse@tuxedocomputers.com>
References: <20260821144437.27233-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 21 Aug 2026 16:44:34 +0200,
Werner Sembach wrote:
> 
> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> 
> Fix microphone detection on built in headphone jack for some devices
> 
> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Applied now.  Thanks.


Takashi
