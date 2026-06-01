Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346125333F
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306165; cv=none; b=aFzXCFeqs4hYiKx5xFIgrCpS7En9E1IiqIYkB6uApFVUfq9U3TfZ7p7q6fP3/JC3XOQSpsameBnCundEjchGyTViecYsTQe9l81QacQP69Rrf4pizEf4ILEpcDi9JeaqHTNrcwpDHE05Iez56kg+NTMXO3o3mNR7tiq6jFfqqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306165; c=relaxed/simple;
	bh=DMtLuD1X5k4Dw9Y6xFY5obrELcFKWQxtYqprrlE+q3U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxjX4l1WLSTMZC0uwVVlrtWaQD+oa9HBEB3XC+uXKOh/2NFIRfR+uVWdpOkSn1zeZ1BzwMyAyRqoUvXEBKaKw5iHpOddyBCGqznk4XW3yp/yRqlqawqYKSDtnQKH7ZpRNY2GypCrRNEdRzwV4c2mn9pb0HoAZfmsM0/WogO21ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F4holXQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QeSxZdnR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F4holXQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QeSxZdnR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F4holXQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QeSxZdnR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F4holXQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QeSxZdnR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1ADE06AD53;
	Mon,  1 Jun 2026 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780306161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dICqB9PuSec+EooYvvBBOKRs0Uex2Vbg0PVX0fsM3mg=;
	b=F4holXQAn+jbceRd03wVgDftv6rjbte8DNSBpz40WEBXqCE/YS0bVR5ve134tGgNmnJ28o
	LJlFVR8dJ2w5WkvFzA8ccV0NhQFrd+wThF6a/1HQT56Orn5b9KHylO4aJWgUHO7OUD2phS
	Q9LWtyiBL48gtXcxv8DXNRjikKK6QRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780306161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dICqB9PuSec+EooYvvBBOKRs0Uex2Vbg0PVX0fsM3mg=;
	b=QeSxZdnRWvjZMwa+6uGacJQMrQjpM5Rf83vr9iRC9dyld1LpMh9ylMU1xZL64XN6tpefW4
	ny4mNkFEq/61QhAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780306161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dICqB9PuSec+EooYvvBBOKRs0Uex2Vbg0PVX0fsM3mg=;
	b=F4holXQAn+jbceRd03wVgDftv6rjbte8DNSBpz40WEBXqCE/YS0bVR5ve134tGgNmnJ28o
	LJlFVR8dJ2w5WkvFzA8ccV0NhQFrd+wThF6a/1HQT56Orn5b9KHylO4aJWgUHO7OUD2phS
	Q9LWtyiBL48gtXcxv8DXNRjikKK6QRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780306161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dICqB9PuSec+EooYvvBBOKRs0Uex2Vbg0PVX0fsM3mg=;
	b=QeSxZdnRWvjZMwa+6uGacJQMrQjpM5Rf83vr9iRC9dyld1LpMh9ylMU1xZL64XN6tpefW4
	ny4mNkFEq/61QhAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8F7B779A7;
	Mon,  1 Jun 2026 09:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PE0MM/BQHWrtTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Jun 2026 09:29:20 +0000
Date: Mon, 01 Jun 2026 11:29:20 +0200
Message-ID: <87wlwi1udr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH v2] ALSA: seq: Use flexible array for device arguments
In-Reply-To: <20260531-alsa-seq-flex-args-v2-1-6e068d4ed9b0@gmail.com>
References: <20260531-alsa-seq-flex-args-v2-1-6e068d4ed9b0@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 01 Jun 2026 01:41:41 +0200,
Cássio Gabriel wrote:
> 
> snd_seq_device_new() allocates struct snd_seq_device together with a
> caller-specific argument area. SNDRV_SEQ_DEVICE_ARGPTR() reaches that
> area by adding sizeof(struct snd_seq_device) to the object pointer.
> 
> Make the trailing storage explicit with a flexible array and allocate it
> with kzalloc_flex(). This makes the object layout self-describing and
> avoids open-coded size arithmetic in the allocation and accessor.
> 
> Reject negative argsize values before calculating the allocation size.
> Current in-tree callers pass either zero or sizeof() values, but the
> function takes an int size argument and should not let a negative value
> flow into unsigned allocation arithmetic.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
