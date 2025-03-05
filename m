Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6F70831
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741161224; cv=none; b=ganH5ZOhDslD+UJhb/3pKvlNyHe6CsFzifmWtq7n6FMUcQpI0/I0eDuXLJ6Tpk726CHhqNzYFvHBf94xAOuer1fvZke/RU1Jjk+P4Q464nVmRUIV3CxOyeLkWP8z8C668MLylB6ktpcqVWeahdT3Dz5af2w54/B4dQgk28Zf0+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741161224; c=relaxed/simple;
	bh=K36fAm89X5SrXPwH67TCmdU7lnTx7IUpwd2mFi3bTCc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s8pCG2biDKNP+8LfVKeHZPQ/rIgf6QB2Owm6a7TI2qJfartxYICFPcZjZc9RUl6JUv9sPjyqK8ieBfCozO3+Ttd9UJ6cRz6hd4eAfXkHdLE/iegx/Deo0Cv8c0Z+9HkAQyYpZNfhu3z7H6JlrMKdxZuoHI/vzuJlRPDzmzqsM2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rV2rbFjY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T1pGKUT+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rV2rbFjY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T1pGKUT+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rV2rbFjY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1pGKUT+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rV2rbFjY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1pGKUT+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BC3D1F393;
	Wed,  5 Mar 2025 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741161220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=rV2rbFjYWUw2K1OEqJ+TgsMd8Cu9jrr7Bq+XJ0zpMGVGvLyKULpodikWWb1IDfNH2qdYGD
	NRPp5M4jVDZq47xpSI10XW2Ps6Nqy8EwKpoVdUO0kYsnO6VLfEQMD2BmdTal5njApw5Kta
	QxFEO47MgTlMCyCy6YKlq3nOBCCFJhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741161220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=T1pGKUT+3nZVnVcxJXqCPvR56c+xXo0RUTQ0jvVwOhalI2ItPOwh5n4l9+JPQU49i5DRtG
	G3m0cdHbKrInGbCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741161220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=rV2rbFjYWUw2K1OEqJ+TgsMd8Cu9jrr7Bq+XJ0zpMGVGvLyKULpodikWWb1IDfNH2qdYGD
	NRPp5M4jVDZq47xpSI10XW2Ps6Nqy8EwKpoVdUO0kYsnO6VLfEQMD2BmdTal5njApw5Kta
	QxFEO47MgTlMCyCy6YKlq3nOBCCFJhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741161220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=T1pGKUT+3nZVnVcxJXqCPvR56c+xXo0RUTQ0jvVwOhalI2ItPOwh5n4l9+JPQU49i5DRtG
	G3m0cdHbKrInGbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75A621366F;
	Wed,  5 Mar 2025 07:53:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2v4KGwQDyGcRTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 07:53:40 +0000
Date: Wed, 05 Mar 2025 08:53:39 +0100
Message-ID: <87zfhzud4s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 05 Mar 2025 07:32:00 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Update ALC222 depop optimize as attach.

Could you give a bit more background info why this change is needed?
Is it a mandatory change to fix something, or it improves something?


thanks,

Takashi
