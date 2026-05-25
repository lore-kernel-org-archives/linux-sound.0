Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640B26B764
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694122; cv=none; b=QTUJHlGZII92pB2lvlxEzNlUbVhjS2hyKyDxBZyyUuQ9fR2mzQ7O2CCtv3E7Ta9olOQ4rWa0oI9sWdRYpquwUzKMa4NuM2JbEtZSOhvUgwxAaq0oL0i4TtUdSzw+uHDjYkPyol/7vO1WET05AhRINdiH9cGjZei8HWrQ5a2cEaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694122; c=relaxed/simple;
	bh=Z+ZD+v235Giz8Tj97lDfEZ+oSt88UX+xZb9SpOXQNcY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0AwKLBdmNfLn3uTuug6VBtX863WQF5rGeCUhvCxm/t0BtxxFPecs63+lH7wG+9voqHZZkaV+BxJEuIWPPpm4q+oGf7J+CxTJJ4zKTBiLse7e8MzlTHkqlv/y9IH8nvUWXCeZZKzVRUj/xGhGik/1E2ogpTNVAG4D1bQfsLzIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EsOH9QHE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sy/yue/T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EsOH9QHE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sy/yue/T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EsOH9QHE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sy/yue/T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EsOH9QHE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sy/yue/T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A04664AB4;
	Mon, 25 May 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YpwQB9IIhAjnqg+r5vKOLmvKWcuPCHzqaXIJw5+5Ky8=;
	b=EsOH9QHEloONvn6IbpF83kWuwu9HN92QXhp+1QZreqy4qzJk8/RF0OjWLsEisRwdkhPmhX
	nsG9zdac8WUUSh8tzzulcECOcHMUJmzGV8laSyNnvoWMi38TKoIKYeCHMQomMRWyPeB4nQ
	Yr3gxktX+jd7oSWHjRAEFqDGh3f8ykM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YpwQB9IIhAjnqg+r5vKOLmvKWcuPCHzqaXIJw5+5Ky8=;
	b=sy/yue/TXb6BXGcWQHGApVmJv835wFrRXSt3JBO2ycwA08nkhELWPe5zYaJ3uUb0KedvWJ
	Ltemgh2szYydysAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EsOH9QHE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="sy/yue/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YpwQB9IIhAjnqg+r5vKOLmvKWcuPCHzqaXIJw5+5Ky8=;
	b=EsOH9QHEloONvn6IbpF83kWuwu9HN92QXhp+1QZreqy4qzJk8/RF0OjWLsEisRwdkhPmhX
	nsG9zdac8WUUSh8tzzulcECOcHMUJmzGV8laSyNnvoWMi38TKoIKYeCHMQomMRWyPeB4nQ
	Yr3gxktX+jd7oSWHjRAEFqDGh3f8ykM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YpwQB9IIhAjnqg+r5vKOLmvKWcuPCHzqaXIJw5+5Ky8=;
	b=sy/yue/TXb6BXGcWQHGApVmJv835wFrRXSt3JBO2ycwA08nkhELWPe5zYaJ3uUb0KedvWJ
	Ltemgh2szYydysAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4542159B13;
	Mon, 25 May 2026 07:28:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W7GlDyf6E2rhFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:28:39 +0000
Date: Mon, 25 May 2026 09:28:38 +0200
Message-ID: <87a4togd7d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on firmware 2417
In-Reply-To: <ahIWTueUlWA5xiV+@m.b4.vu>
References: <ahIWTueUlWA5xiV+@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 6A04664AB4
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,b4.vu:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO

On Sat, 23 May 2026 23:04:14 +0200,
Geoffrey D. Bennett wrote:
> 
> Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
> gain parameter by 4 bytes, from offset 0x2a0 to 0x2a4, breaking the
> "Direct Monitor X Mix Y" controls.
> 
> Special-case the offset in the get/set config helpers when the
> running firmware is 2417 or later.
> 
> Fixes: 4e809a299677 ("ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> ---
> Tested on a Scarlett 2i2 4th Gen by writing to "Direct Monitor 1
> Mix A Input 01" and observing the USB traffic with usbmon:
> 
> - Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
> - Firmware 2417, patched driver:   write targets offset 0x2A4
> - Firmware 2128, patched driver:   write targets offset 0x2A0

Applied now to for-linus branch.

It seems that this can be merged without conflict to for-next that
contains already your previous series.  Let me know if any adjustment
is needed at merging this with the previous one.


thanks,

Takashi
