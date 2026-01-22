Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DB320CA7
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085387; cv=none; b=M02uQICdi+MOkn6xO4cl7TGGsEi8N6767BBMdG8bvheDvPXAUCV0aTa+KcSED8d5bzBUK0cjVdVVLtLlt4Uhp++AB9w/h9LTmJPm4RFyX7re4kMojIBnYcOnOl8C6ZJcfiVZ2VZhp2VdJg66NqMhq/3MD2hGQar1KYqQLxXMOew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085387; c=relaxed/simple;
	bh=6fOkHFFuzEgFWZpaqhn/RelrouvrWSbTg2ER5ccpxVs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sHX9LKcnuny30V9SavHrRgT2RJ2CzSHQyJAL+hJjlH5577SQpEF4YU/lcW+wPciWOFVKtgS20ZHk+sAi4PHl2qQ6qLYHTeHbz7InLpRKPmbHTmagzbM93qDqfifIKqCzqxqksQgvpKpS2Ur992wRqXpCkh5YEQETpd4uuQtGJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XOM+1QMB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vm57WCY3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XOM+1QMB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vm57WCY3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XOM+1QMB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vm57WCY3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XOM+1QMB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vm57WCY3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9B8233705;
	Thu, 22 Jan 2026 12:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769085383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vI/BOXUkmTlCYxAndchsrhDnag7FdNew/mePPWYhAJQ=;
	b=XOM+1QMBtVFXe77uoM4J/wH80gEUNXI1V+u37Vpr/tHYhdG/Cjl5o/44N8rXZxa9xheC73
	iFP9cvqcijDPt0PJyc5jUmY8bgi45NRn+pzL2OvtB85GrACPv4gRG7knUEMAjwZGvfrYSw
	m8HIWshzpqunrPpCKqFGlx7WsbF4yOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769085383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vI/BOXUkmTlCYxAndchsrhDnag7FdNew/mePPWYhAJQ=;
	b=Vm57WCY3+YHA3spNTz7glJMEYb/0IP4ZPQOVYT6Q5AOXkX1c/1eCP/oW+AEODjL5fX+nFF
	U6X2OkX+SdCGYjCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769085383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vI/BOXUkmTlCYxAndchsrhDnag7FdNew/mePPWYhAJQ=;
	b=XOM+1QMBtVFXe77uoM4J/wH80gEUNXI1V+u37Vpr/tHYhdG/Cjl5o/44N8rXZxa9xheC73
	iFP9cvqcijDPt0PJyc5jUmY8bgi45NRn+pzL2OvtB85GrACPv4gRG7knUEMAjwZGvfrYSw
	m8HIWshzpqunrPpCKqFGlx7WsbF4yOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769085383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vI/BOXUkmTlCYxAndchsrhDnag7FdNew/mePPWYhAJQ=;
	b=Vm57WCY3+YHA3spNTz7glJMEYb/0IP4ZPQOVYT6Q5AOXkX1c/1eCP/oW+AEODjL5fX+nFF
	U6X2OkX+SdCGYjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9742213533;
	Thu, 22 Jan 2026 12:36:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kSulI8cZcmmWDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Jan 2026 12:36:23 +0000
Date: Thu, 22 Jan 2026 13:36:23 +0100
Message-ID: <87wm19hliw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: gongqi <550230171hxy@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gongqi <550230171@qq.com>
Subject: Re: [PATCH 4/4] ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
In-Reply-To: <20260122120652.3471910-1-550230171hxy@gmail.com>
References: <20260122120652.3471910-1-550230171hxy@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,qq.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,qq.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 Jan 2026 13:06:52 +0100,
gongqi wrote:
> 
> From: gongqi <550230171@qq.com>
> 
> The headset microphone on the MECHREVO Wujie 15X Pro requires the CXT_FIXUP_HEADSET_MIC quirk to function properly. Add the PCI SSID (0x1d05:0x3012) to the quirk table.

Please put line breaks appropriately in the patch description texts.

And, above all, could you give a Signed-off-by line?  It's legal
requirement.  Please resubmit with those corrections.


thanks,

Takashi
