Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC828A3FA
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774897; cv=none; b=mYaEj7PqHedGPTP1uEWY1t4uXCNEZrOJAHj4qa/HPv0pEbhlVObtM3lg6k/+lHWTmh85sk+dADWKY5tT+K3zkiUNfqLtrqxG8D3P5kb0l5NSvmzDR5HjNTrYmP+wNA7GtLOGJ54UqHudMjqE14OQNwZhqUgVvhP+8lR3zIObnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774897; c=relaxed/simple;
	bh=Y0Mhy2BCn/HUvzQKu2EmZDkRV0pFt0RBDiRdj0WiUlg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSm/uoU05FM2LsOhnawxMyOWribNx/uONMIrM2swkgvKf/+qVcknnHjybSseArMFFukO9qNTKuIFR5PyHrLd0/8C68oC5pyph7c/FJvT5RnT67MQVfOmalFdc7qIO2Poft4DzbTFsqXZw693YBlNYHNOYVsij+g208g9ZxWWMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iunk5Ad+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v5c+J02m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysTBcVpl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rQD5v509; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iunk5Ad+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v5c+J02m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysTBcVpl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rQD5v509"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C3CB175CAC;
	Tue, 26 May 2026 05:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779774894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTo7OxEfpMDfq2BI6RVZIjtdN0gsBFP9pFq9Jc553HY=;
	b=Iunk5Ad+W1MYi3dOCo7EzaqWSr2DmupipOPfHuhGkc06b9xIYBTR/VyhlyPjb19cILhqIO
	Oy1BSO7LBSlvNS7/rBGt+0hoZ1P/7i5tl9h2R1NTMoYyWr5DrIDUJARU47OCGulvx93WpL
	c5nkIKlm/1NLvanq8S083+1j4dppPG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779774894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTo7OxEfpMDfq2BI6RVZIjtdN0gsBFP9pFq9Jc553HY=;
	b=v5c+J02mjDJHODpZ5tWF1AcOO6sZWDqx4jxHn/eeEnhm4M2xmEgp7uIZtzBgaQZaMWZ00o
	E5T3cdC6hnNB7XBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779774893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTo7OxEfpMDfq2BI6RVZIjtdN0gsBFP9pFq9Jc553HY=;
	b=ysTBcVpl1yyx0nMV91fScuDAlWYK8Rhz4inWRepjMz+cCk3zjXzgYV1Pu07VOMthwYdMfE
	UsaKRO0OHJ2ELEjiDOgjA31CskrUOmvpZuGM0/zDyi5deddBNsVmKthL/h/Gl/JS6uDzr5
	jdUwTkFjFONMbzz3UpLwtYENKsnVcmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779774893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTo7OxEfpMDfq2BI6RVZIjtdN0gsBFP9pFq9Jc553HY=;
	b=rQD5v509DnFheVmKbpUfFt+SFTFssKOIMtSqTHrH369fCi1OtHbZduxGeLetwHjBLeZ7Ma
	KhqjLV9eKiQ4DrAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9025A5A055;
	Tue, 26 May 2026 05:54:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Fv5IK01FWq2KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 05:54:53 +0000
Date: Tue, 26 May 2026 07:54:53 +0200
Message-ID: <87o6i2zpea.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Remove arbitrary prioq insertion limit
In-Reply-To: <20260525-alsa-seq-prioq-limit-v1-1-16c348df5ff7@gmail.com>
References: <20260525-alsa-seq-prioq-limit-v1-1-16c348df5ff7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	internal_greylist_whitelist(0.00)[10.150.64.97];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 25 May 2026 16:16:09 +0200,
Cássio Gabriel wrote:
> 
> The sequencer priority queue insertion path uses a hardcoded traversal
> limit of 10000 entries.  The value is intended to catch a corrupted list,
> but it also becomes a real limit for valid queues.
> 
> The event pool limit is per client, while a sequencer queue can be shared
> by multiple clients.  A queue can therefore legitimately contain more than
> 10000 events.  In that case, inserting an event that has to be placed past
> the arbitrary limit fails with -EINVAL.
> 
> Use the queue's own cell count as the traversal bound instead.  This keeps
> the protection against inconsistent list accounting or cyclic lists without
> rejecting valid large queues.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next.  Thanks.


Takashi
