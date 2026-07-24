Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FC3F5BED
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884133; cv=none; b=HdFG0caPnJxN/fWu9mJVZg3//XZwR4BKHynr8+2cn94We84vWeb1ksso8LvhG+wj6zJIvRo9NAeC7frqHbUvKeeCz0RD4iWei28KR545xbYdhyGPOWLWWBRM8KiXUk7WLpVlA+FIsjbxi6vnSPnZs/XHwel2CUOyDwCv3d0U8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884133; c=relaxed/simple;
	bh=J6kov1GGvhyqU9BEdeLkuDQ0OjOPl6lRqaiCFoOcnz4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwnU3bJhDjMnDUh5KVve2Sx1L/+Y3wiPSyauHVwbwKalswSYN3Kola/9TpSEye9cqvooBIdx4oGTu+lUzx0JBYv/ICcR3cAsXd5FWQ4DzD8gFHUE+EZgchdg8KUAoRYckOKO4ARERnkHIUFHs9d5D91Snd9YG0en+vxaVaGRi/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PF7JduyH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gVGWvkUM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PF7JduyH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gVGWvkUM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PF7JduyH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gVGWvkUM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PF7JduyH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gVGWvkUM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3CD33EDD;
	Fri, 24 Jul 2026 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784884126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1bSD4NJypCPOxwOibXyRbqcRNKhzCHaKZsk680khcA=;
	b=PF7JduyHlYbNmQ5CUPAhkDF/Q7n9g6nPMDrMCBnq0vOkF36ND48BsoV0APuRMui93V+uwI
	i/fASCVh4nthvCzMJLY7wX7+M3Vb27gBUqtAviTle/hoOOYAqWW8f4b3QukwQzhNyF7f5C
	VH1IRoMRtyCwO11WsSbzciiP3jcyGrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784884126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1bSD4NJypCPOxwOibXyRbqcRNKhzCHaKZsk680khcA=;
	b=gVGWvkUMAs6ZwtcFFHMv+neGP/BlPxXVfZozToRfoGnAKZewi5Khn+wOATU0bgg8O1xhoE
	HudgrFVIOJVWYHBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784884126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1bSD4NJypCPOxwOibXyRbqcRNKhzCHaKZsk680khcA=;
	b=PF7JduyHlYbNmQ5CUPAhkDF/Q7n9g6nPMDrMCBnq0vOkF36ND48BsoV0APuRMui93V+uwI
	i/fASCVh4nthvCzMJLY7wX7+M3Vb27gBUqtAviTle/hoOOYAqWW8f4b3QukwQzhNyF7f5C
	VH1IRoMRtyCwO11WsSbzciiP3jcyGrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784884126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1bSD4NJypCPOxwOibXyRbqcRNKhzCHaKZsk680khcA=;
	b=gVGWvkUMAs6ZwtcFFHMv+neGP/BlPxXVfZozToRfoGnAKZewi5Khn+wOATU0bgg8O1xhoE
	HudgrFVIOJVWYHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86481779BA;
	Fri, 24 Jul 2026 09:08:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SWOYH54rY2pNIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Jul 2026 09:08:46 +0000
Date: Fri, 24 Jul 2026 11:08:46 +0200
Message-ID: <874ihoeov5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"i@rong.moe" <i@rong.moe>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for JKY Technology Q2A
In-Reply-To: <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,vivo.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 24 Jul 2026 10:29:31 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> Note: This device misuses the Apple VID (0x05ac) & PID (0x110b).
> 
> usb 1-1: New USB device found, idVendor=05ac, idProduct=110b
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: Q2A
> usb 1-1: Manufacturer: JKY Technology
> usb 1-1: SerialNumber: 330270D2251225
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
