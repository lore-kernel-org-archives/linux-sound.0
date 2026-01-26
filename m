Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C1214A8B
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416957; cv=none; b=BGNzKN5Y3kMw9/ZPVARgmQJQ/IMfjhp2LjRJbDsbBP7QDDPiW16r3Yowcq1XVOc6l311gOcpjnfgr+vnJZlpI3bohUpwjcWAaUvSChVC4bzNV+UVxIUizObooAZ2nqqK9i6R3nkN7SBEL+qAbGV6TUeDYbi08cut5DD/yFFimoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416957; c=relaxed/simple;
	bh=ZOW5m/pnZCW7WDiF/nOeeOSKnRdXtebF/bgiA6ksWU0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eMvkWii7zrT8wjkzGf1F7bS4ZcRePFzVULFf3qE3dPG8q8YzKfabh5rvKsEvbZ3ydRDeL4X4AfuwTp0KLVmKiNY9G+0d8CKtqkNGcpYy3sZ5qt3ThTpqg13cSrs+0I3UjWq6iPigG1t1cdSudumbS+1f/AA9gcw/6Iu/lWEr3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zii7k/ag; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PyBhJr9l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zii7k/ag; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PyBhJr9l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zii7k/ag";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PyBhJr9l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zii7k/ag";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PyBhJr9l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE8E55BCEE;
	Mon, 26 Jan 2026 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJp9e9MnFDfaWNQaxHhHP898FPR/7lWxezxw3+j8p94=;
	b=Zii7k/agDe2/NWdSDD4+I79NpHWnGhIQCdmrGBUmaPKE5pVWSsx6YgFW2NwHoVU9u5Gg5D
	5/UNYL0Q+699T0AZzeUNW/IaUC6ihQwEWdL/hYnuPapO4PbvIWyh646w/dU2295vtUmSJI
	4eiISq5e6JA9kCKYr9n8SNub0kPonrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJp9e9MnFDfaWNQaxHhHP898FPR/7lWxezxw3+j8p94=;
	b=PyBhJr9lqVysxk2OlEjGKhjblpRbO416Uz8cXkWO0G8mUjNR2J+PEhFyT//6vKmQv041MS
	2mnBNEJmX1TNcODw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJp9e9MnFDfaWNQaxHhHP898FPR/7lWxezxw3+j8p94=;
	b=Zii7k/agDe2/NWdSDD4+I79NpHWnGhIQCdmrGBUmaPKE5pVWSsx6YgFW2NwHoVU9u5Gg5D
	5/UNYL0Q+699T0AZzeUNW/IaUC6ihQwEWdL/hYnuPapO4PbvIWyh646w/dU2295vtUmSJI
	4eiISq5e6JA9kCKYr9n8SNub0kPonrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJp9e9MnFDfaWNQaxHhHP898FPR/7lWxezxw3+j8p94=;
	b=PyBhJr9lqVysxk2OlEjGKhjblpRbO416Uz8cXkWO0G8mUjNR2J+PEhFyT//6vKmQv041MS
	2mnBNEJmX1TNcODw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79724139F0;
	Mon, 26 Jan 2026 08:42:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 911UHPkod2mFKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Jan 2026 08:42:33 +0000
Date: Mon, 26 Jan 2026 09:42:33 +0100
Message-ID: <87ms20bw92.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	edip@medip.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machine
In-Reply-To: <20260126073508.3897461-1-zhangheng@kylinos.cn>
References: <20260126073508.3897461-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 26 Jan 2026 08:35:07 +0100,
Zhang Heng wrote:
> 
> The HP EliteBook 630 G11 (103c:8c8f) is using ALC236 codec which used 0x02
> to control mute LED and 0x01 to control micmute LED. Therefore, add a quirk
> to make it works.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220828
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Thanks, applied now.


Takashi
