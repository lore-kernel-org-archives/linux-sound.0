Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4BF481AB
	for <linux-sound@vger.kernel.org>; Fri,  5 Jul 2024 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166610; cv=none; b=bHQgD+fHVw00OcJriJtaYGULXZgPC0M8JwvE8XZtChxKzZQqBL48ffDv5tHGJcdicrtVAyxSLZJZZ4+UopjugCOiGVrt4dvxtlGeT/PxeCQ2iJFejZM6LXL4YzA5T0zgsps0tarD+dGXTQIrey4R3otxFgtfP4Xq492wNqsRRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166610; c=relaxed/simple;
	bh=tLhCFbNSJ4NL6UbmjVnv3bYn0x+SwDanE3BPOQqnSuY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khq0rahKA8GqZC/RlkJ7eNQAMJkBiPu1U2T7DpF9JFlkYZhxC5c/EciELjOxLJAbA/RwpY+ggeKeVjm9PFDcuMeLBZeKHcX1WzoVBnvMVBVl2i7HKUfq70yVnyq6C7RmbskhSmW1VswB7IOFOISGwPl/LyJERMqE1FdlBRVEFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oP6LQXqz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mDEg1ste; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oP6LQXqz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mDEg1ste; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oP6LQXqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mDEg1ste";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oP6LQXqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mDEg1ste"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 916E921B46;
	Fri,  5 Jul 2024 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720166607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTPaOyhZpKUvXD1QfJsD29NY4E+8VztFuZifr+OyNdc=;
	b=oP6LQXqzqofC6PFoOqskFpPJXH55n3ynqlGV7gf76mbIjJ1CYVY4LWfmWhaf0VOwZW455W
	FlzlPmJTNHKWRH6WSTQAZmd/MjRqxhKDkBJ4iLb56SiTAM7olPsCGpOH1th8woJNODPrDN
	h07uZtydDD4f1mD8U1NAAHndIkQmiqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720166607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTPaOyhZpKUvXD1QfJsD29NY4E+8VztFuZifr+OyNdc=;
	b=mDEg1steip0sSVJlx84I2f36HBrc6g6NG2SIGqk694fK3DxIBGAOGm4UFgpY54hbjOjoUG
	Iq9Q5nivKyP83NAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720166607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTPaOyhZpKUvXD1QfJsD29NY4E+8VztFuZifr+OyNdc=;
	b=oP6LQXqzqofC6PFoOqskFpPJXH55n3ynqlGV7gf76mbIjJ1CYVY4LWfmWhaf0VOwZW455W
	FlzlPmJTNHKWRH6WSTQAZmd/MjRqxhKDkBJ4iLb56SiTAM7olPsCGpOH1th8woJNODPrDN
	h07uZtydDD4f1mD8U1NAAHndIkQmiqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720166607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTPaOyhZpKUvXD1QfJsD29NY4E+8VztFuZifr+OyNdc=;
	b=mDEg1steip0sSVJlx84I2f36HBrc6g6NG2SIGqk694fK3DxIBGAOGm4UFgpY54hbjOjoUG
	Iq9Q5nivKyP83NAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A83F1396E;
	Fri,  5 Jul 2024 08:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ufqhGM+oh2ZGMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jul 2024 08:03:27 +0000
Date: Fri, 05 Jul 2024 10:03:57 +0200
Message-ID: <87wmm0gt8y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: pcm: Fix id copying in snd_pcm_set_sync_per_card()
In-Reply-To: <20240705075828.19746-1-perex@perex.cz>
References: <20240705075828.19746-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 05 Jul 2024 09:58:28 +0200,
Jaroslav Kysela wrote:
> 
> Avoid to use strncpy and do proper length limiting (12 bytes)
> to avoid out of array access.
> 
> Fixes: d712c58c55d9 ("ALSA: pcm: optimize and clarify stream synchronization
>  ID API")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407050501.o5Z3bibi-lkp@intel.com/
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Thanks, applied.


Takashi
