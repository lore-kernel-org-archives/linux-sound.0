Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E613376A9
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771499318; cv=none; b=g4i6CQ9Fp0XBbJgmwqmePNYqXXDsTaS2Y/W2g9jqQhaP6Xm1L803S8R5ZdxYdjklS9Hvo2K0KIhfpcnmnDMHLSYO1jR4MYpsFtb0PQTOCa6Apdg3BvNE9xjrUwP7FhGxVfax4krtVHSPr+NybaniiuGJb/EdUcV8gd8Juy91w+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771499318; c=relaxed/simple;
	bh=s+k5QhVF7dUHfvzC24GlxK7mUzXCPLWUxLkagDjo7hc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBWksCTTm/TlGGGnKouNzI/7OJhk8qVI9yoRSdH/8Kf2FKgPrATPhJyMFi5LRELVmyVd0jc92wDQb4Hw+wW8EoHXg5Rfaj1Wuqqq8DXYTjz6fqKX4RprrA8RUl90eppmQS8OZDyhMJPEDCNjPUqEk8xd00Ileofe37cfGD6SgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cbw51Zpr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JI8W3AWF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y3INA3Yk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9nryR2ZY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cbw51Zpr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JI8W3AWF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y3INA3Yk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9nryR2ZY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D43355BCC1;
	Thu, 19 Feb 2026 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771499316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyOjEf2Qtj+w34iOStuB3QOkaAPeZLOnd1oqpC+qzMY=;
	b=cbw51ZprJYpfA/4TK9QXANR2zKD04UxphYKuzhCK79KPPzcPCf5TabKxEYkvbZew4MPBjC
	l0sqH+ZoWc1hTLP/PX5Upbtxz0jxTnzbB/EAUI+MW4Fj7F/VAmUiskVsjmnFiKMIEpLG88
	xEJzdHd5XEQxFqi7UeBMVeVb/26/bHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771499316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyOjEf2Qtj+w34iOStuB3QOkaAPeZLOnd1oqpC+qzMY=;
	b=JI8W3AWFTpsGzKgLju4j6RJChLJRkunzL7DVBsQZD4Fr1jECQBgIxukkeZA9Qu+5KI1YvX
	NR+nvT1EhF/uvSCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771499315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyOjEf2Qtj+w34iOStuB3QOkaAPeZLOnd1oqpC+qzMY=;
	b=Y3INA3YkCCATaZ+cWBFSoi6yn4k5HwtQTQ2mPbXmiwgRjPbXjbLjFv82Iwd2HSngB7G5jw
	mFUTn4i3KxjbMKISWT/ud6nA/iIcsJHKyI/BEM6IjrRc4br4NQZ5pI3af1lfju911dUG2B
	jyeOYnDiub9kqUZoYua2tfAmOAmdxhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771499315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyOjEf2Qtj+w34iOStuB3QOkaAPeZLOnd1oqpC+qzMY=;
	b=9nryR2ZYSiQZVCWZ98m5GfHG+vq0NjbafM2CSsqnALgOzeoLPU+KIgNPl1/tAHOMQntP90
	StF0Bi3kxaLZE5Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CEE13EA65;
	Thu, 19 Feb 2026 11:08:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jKQaJTPvlmlQGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Feb 2026 11:08:35 +0000
Date: Thu, 19 Feb 2026 12:08:35 +0100
Message-ID: <87ms15q9cc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/hdmi: Add quirk for TUXEDO IBS14G6
In-Reply-To: <20260218213234.429686-1-wse@tuxedocomputers.com>
References: <20260218213234.429686-1-wse@tuxedocomputers.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 18 Feb 2026 22:32:10 +0100,
Werner Sembach wrote:
> 
> From: Aaron Erhardt <aer@tuxedocomputers.com>
> 
> Depending on the timing during boot, the BIOS might report wrong pin
> capabilities, which can lead to HDMI audio being disabled. Therefore,
> force HDMI audio connection on TUXEDO InfinityBook S 14 Gen6.
> 
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Thanks, applied now.


Takashi
