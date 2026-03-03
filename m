Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C374D38642B
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521285; cv=none; b=J+vJgG/3J2LklrXW7jA64U/5GsOL3gOpyoks2lnYNGoZ2bxouz2AjKo/mgUjU/eRSPlRxUtCMeoQTJyIYP5ZC3rao6lqdnrulgY6BtNruPJAZjXx4xEpnQlJ2ZAPgsIHvlpuXHtwoP4H9aom/fpHj72o3qyt3VvsZhigT9LyolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521285; c=relaxed/simple;
	bh=S4W4SlOPek1o6+UEfR3LLAkJJzlnYCpXXDuktf/LMJc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cg53YdDguqXu6gTesX2cqUPrnBtkxKGsV0SeG8bdGP1K5xkzMwCXbCY3vRN7UctAfCd1MS9uf6yzQD4GUL19dUL6EUygJfwSoL+0xWL5JFYWbrR09sztnoxwckH6laEPq62kh4mcnnSHQ3Kuxna2k69f7YO6ihaxJTK0R2FH0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nUg3hpef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wu9XWUax; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nUg3hpef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wu9XWUax; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nUg3hpef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wu9XWUax";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nUg3hpef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wu9XWUax"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 082215BDDA;
	Tue,  3 Mar 2026 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772521283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb74L+VFSECUQ5wzgoc9k9OZk5WMCPgrHZjQPumpT4Q=;
	b=nUg3hpefqRoviD8yBllsztJRlEeh6Bm0TmfF+WvytOgYEn+liAFwzBBOdTA0yf+0NZYJf+
	tHwUS6vfRuiK27ReQa0kXkWw5UHpbqP/BCi3Iad1YNAh20GusApd04oV9DsGJf5caBPmkD
	zSD/sr5c37Lfc9iDUzUvduGluJptB7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772521283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb74L+VFSECUQ5wzgoc9k9OZk5WMCPgrHZjQPumpT4Q=;
	b=wu9XWUaxtloAOm5xA1bROSCmq6RU4z4tF4UrdgIonkvOmeDWIqG/FIR9pg3299kNXM8WHL
	TOQTTEragOSBkcDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772521283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb74L+VFSECUQ5wzgoc9k9OZk5WMCPgrHZjQPumpT4Q=;
	b=nUg3hpefqRoviD8yBllsztJRlEeh6Bm0TmfF+WvytOgYEn+liAFwzBBOdTA0yf+0NZYJf+
	tHwUS6vfRuiK27ReQa0kXkWw5UHpbqP/BCi3Iad1YNAh20GusApd04oV9DsGJf5caBPmkD
	zSD/sr5c37Lfc9iDUzUvduGluJptB7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772521283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb74L+VFSECUQ5wzgoc9k9OZk5WMCPgrHZjQPumpT4Q=;
	b=wu9XWUaxtloAOm5xA1bROSCmq6RU4z4tF4UrdgIonkvOmeDWIqG/FIR9pg3299kNXM8WHL
	TOQTTEragOSBkcDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C89DC3EA69;
	Tue,  3 Mar 2026 07:01:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BnPIL0KHpmm4KwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 07:01:22 +0000
Date: Tue, 03 Mar 2026 08:01:22 +0100
Message-ID: <87bjh5l7lp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/senary: Use codec->core.afg for GPIO access
In-Reply-To: <20260303054242.318062-1-wangdich9700@163.com>
References: <20260303054242.318062-1-wangdich9700@163.com>
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 03 Mar 2026 06:42:42 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Replace the hardcoded GPIO node ID (0x01) with codec->core.afg.
> This follows the standard HDA driver practice and makes the driver
> more robust against different hardware configurations.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied now.  Thanks.


Takashi
