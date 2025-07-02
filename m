Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903F2C031D
	for <linux-sound@vger.kernel.org>; Wed,  2 Jul 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466554; cv=none; b=n66KWRekx1Eia29LMLPSzaTq6+SAkrHWRiNTsRQZXxuOc3RslwSX5bzLnqHP0vxDmJaT1Lvg3YMhwlT4Y7+/ANuG7MLD5nvS7+JUk8niWBK3aW1y6Ptp4600iG8xM0sZLzLRu72mdXiJhueU82zJfiMupHqMvNhd12daBgIQOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466554; c=relaxed/simple;
	bh=p6ltyrR7BPxN8hnhg7Ybr0rPh50tQwnImp9Eq84AWUc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eziAJ18EYa/5wXu7GW6+TuLXwhyoImldAt9PvSMCQD0SKFdOQPYiUGjS1xhXIJZ0Ea+DbcCf0evZ5OlWyl/5KQi9jNT5SikSOad2PzUEgZTlEf5ZiOA+YnF71GESljPCUgBC7qP6fP3joKgZa7kJkXCCnkhjUfH8dF8nPxFUKlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbHBiscQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZeMBH88s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbHBiscQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZeMBH88s; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbHBiscQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZeMBH88s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbHBiscQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZeMBH88s"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4AA821F38D;
	Wed,  2 Jul 2025 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751466551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSIKYLQ8nFXiPHuvx7GTf4/lRarYit6NwcS/zxh2Ydw=;
	b=LbHBiscQrT2ECu0e1VP6XBHhQp/vqccnSvI2kS0MaZDn4F4AQRjBiiOej1LyCm9NT0Bn0P
	0aitNnoIy6kq4GM2eCmQtxLtEQLchQuV5iEujEFGtxaGGbeXxHEEh3uQ3IeVDjuMzmnvq/
	FKWqL+muP9XrwrJBRMAQxlDiCD0TgdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751466551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSIKYLQ8nFXiPHuvx7GTf4/lRarYit6NwcS/zxh2Ydw=;
	b=ZeMBH88s+9zXaqFzMOhNs23iSWasrsw7EBdjAGipwuTY5L8W/QGT7rZoQfGJ+y/+9EHPA1
	gZhVcL9aN3gt0aBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751466551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSIKYLQ8nFXiPHuvx7GTf4/lRarYit6NwcS/zxh2Ydw=;
	b=LbHBiscQrT2ECu0e1VP6XBHhQp/vqccnSvI2kS0MaZDn4F4AQRjBiiOej1LyCm9NT0Bn0P
	0aitNnoIy6kq4GM2eCmQtxLtEQLchQuV5iEujEFGtxaGGbeXxHEEh3uQ3IeVDjuMzmnvq/
	FKWqL+muP9XrwrJBRMAQxlDiCD0TgdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751466551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSIKYLQ8nFXiPHuvx7GTf4/lRarYit6NwcS/zxh2Ydw=;
	b=ZeMBH88s+9zXaqFzMOhNs23iSWasrsw7EBdjAGipwuTY5L8W/QGT7rZoQfGJ+y/+9EHPA1
	gZhVcL9aN3gt0aBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20D7813A54;
	Wed,  2 Jul 2025 14:29:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 43DRBjdCZWjPRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Jul 2025 14:29:11 +0000
Date: Wed, 02 Jul 2025 16:29:10 +0200
Message-ID: <87ldp6vf7t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ExpertBook B9403CVAR
In-Reply-To: <20250701133411.25275-1-peter.ujfalusi@linux.intel.com>
References: <20250701133411.25275-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, 01 Jul 2025 15:34:11 +0200,
Peter Ujfalusi wrote:
> 
> ASUS ExpertBook B9403CVAR needs the ALC294_FIXUP_ASUS_HPE for the
> headphones to work.
> 
> Closes: https://github.com/thesofproject/linux/issues/5472
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Applied now.  Thanks.


Takashi
