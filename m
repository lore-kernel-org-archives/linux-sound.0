Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC6EEAA
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751188608; cv=none; b=qnOPAoLezdxVt5G4utZtgrI3S/5TIPMX5VZDlh/KYOoFRpPLFabgiT2zcJny5nkOhjslo+Q85GXpF9e5qiI+Z9ayuCYMbOUQnpxgBbpyuqPOGM+cPIbhyNtH0a1si/a4Q3/6hZbn0ZTer4zMc4lp2vE9SQg+HgYs8LTKgaTGITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751188608; c=relaxed/simple;
	bh=B5wrve7KNYE+JqYWUfUrx0k/O/q0+dqQbX3LC7R6lbU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtLY6SbUq+lctmnCZnXaX2GSseIErwRfEr+5L9SjQxh9gHR3WsMpGsPlQBsnbfS72RBtc5DmjzBZCd5kHIRc4Xt9M9qPqL0A3Kwr/wmntrPqUFhizcX1E6JIA5N+JC3upSI4rKPwJrdrJ+Bu5VdmuqqbjBJa2W0FwElOEHWtQQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WmFUYLlf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PuJsy5/9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m8jfzCcO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TK3CMtof; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WmFUYLlf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PuJsy5/9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m8jfzCcO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TK3CMtof"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D27BB1F388;
	Sun, 29 Jun 2025 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751188603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5lbfpWEuw4TXMVbcee3ykHJnjJcxZUgRbmGKfS3XA=;
	b=WmFUYLlf+fjC2YMcHqYdpzjKwMhPCuFUfZQct4hrgYahjo7IAhpodHbu8ZnjT9/aMWob7V
	4OiCt5jjBuzpcOHLLEqJDwjawoM2q1QPOXv09WzGOzgPMzjiEaN9IOnw+tJb1QE2Mkg8vO
	w4sTHUUszNu7INFxAUulxlhJ69+7i+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751188603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5lbfpWEuw4TXMVbcee3ykHJnjJcxZUgRbmGKfS3XA=;
	b=PuJsy5/9giFVGg2pZVSGKv2D6b4CSwXlMbMTJgL/EPsfkeFhH7FO9mi8VDecbYu33h5SrK
	usBb4JImiJ4dlWAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m8jfzCcO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TK3CMtof
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751188602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5lbfpWEuw4TXMVbcee3ykHJnjJcxZUgRbmGKfS3XA=;
	b=m8jfzCcObpyIs69KvUKrQJ9bQdaJy7In1WdhrtR2exaUfG91gH/XPnxl+WHiDtNMze/6iw
	5iykeLjv2Z4GBq12mmTqAsYR/7MoJ4AFDQ72j2dj2YNhrsPL7rVrdpX+qqOV5e4kvyQ0yk
	Zo52WI3R8oj99kEjOatyAPoIkGhIdEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751188602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5lbfpWEuw4TXMVbcee3ykHJnjJcxZUgRbmGKfS3XA=;
	b=TK3CMtofyfongqC6i5QxEqs3aRMZLcWsC2oAdXcvRXp7fPF0r3URjFPPy7m3dBHnqPCzf9
	1OyM8cK/MqLHnbBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1D5F1379A;
	Sun, 29 Jun 2025 09:16:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3Fv0JXoEYWiGMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Jun 2025 09:16:42 +0000
Date: Sun, 29 Jun 2025 11:16:42 +0200
Message-ID: <87jz4ugb5x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda: Add missing NVIDIA HDA codec IDs
In-Reply-To: <aF24rqwMKFWoHu12@ddadap-lakeline.nvidia.com>
References: <aF24rqwMKFWoHu12@ddadap-lakeline.nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D27BB1F388
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Thu, 26 Jun 2025 23:16:30 +0200,
Daniel Dadap wrote:
> 
> Add codec IDs for several NVIDIA products with HDA controllers to the
> snd_hda_id_hdmi[] patch table.
> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>

Applied now.  Thanks.


Takashi
