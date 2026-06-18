Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8810F3EB0FB
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779250; cv=none; b=h1v9eNG0kOd/j8qFWdk7Uai3hJxgIchSblhPZbyQk5PmfZanvZKMbQM+vtRwrer5PMFByL/O22BAL0HwddggoIn+1LuL3Af2xhwfiNtUv5FPskDjGzU9gbtg6UJ8kmFXy2xYSyPEbOhK9ukcle2JZIJ56TniANwAWhBv5/NEqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779250; c=relaxed/simple;
	bh=FdYt6JxPpS6CfGFJnJOJw/htKGcn98jAe7hRQlV+NTo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YS/ffVFXMkzcNNgXb9ZXVn4HXkNdVb5kyk72QCa0yfiUjca7+cwTT8kT2yikoGOg/KhMN8e0VX9k2gwu743ULtFaZI7FEHrlnI5ZB7lsc0sqObqV2wqUg8kab7CGxP2S7ec8xI6NwMscWeaxRL7uGvPHPsmfrPyOQ3t+nqTwTh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0V9Lbemy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XhruoZ7+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BSLHUafI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0YDWczqt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0V9Lbemy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XhruoZ7+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BSLHUafI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0YDWczqt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A14775B80;
	Thu, 18 Jun 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781779245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YSU2Og0RCaGEk7ADRw5In4fmfOCHn19D+DwKQR2/tIc=;
	b=0V9LbemykjyJt3Ii+52oSw+KD51y7uPw6iSY3dqXYddYBQYFnrcCyBZW853hq4L9ZHFfaJ
	fl4KQvkj7N1hsoMAmeK6yRdv//JMD1LhVXCBuzkyCnS6gCxa+86cC/ORvYpqBZ1cd06Smm
	nHUee7Fx9sHNAbMjClJZ0Y9JRuw7+Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781779245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YSU2Og0RCaGEk7ADRw5In4fmfOCHn19D+DwKQR2/tIc=;
	b=XhruoZ7+jI1eb3R+ZCoWpjVtVvLQi4Ca/ktMIFUKvOIsyzCVx7G6oF7kKbreccMi5gcx+F
	3T6uQWE/gp//37CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BSLHUafI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0YDWczqt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781779244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YSU2Og0RCaGEk7ADRw5In4fmfOCHn19D+DwKQR2/tIc=;
	b=BSLHUafIyjFPiwVw79M4kuwikoDR0AGKtxQMeTs3gU46abPfMq7XuwfXfOKg7ezadUM455
	GPVv+trz+xAa8L8lZ90ZmOVM6nP1312f0da3lPc+OukDmLevSx0O5Uq96H+71RwozKT+sF
	y+KxFV1BiYPVhKi8ZrNvvyueKHN0bA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781779244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YSU2Og0RCaGEk7ADRw5In4fmfOCHn19D+DwKQR2/tIc=;
	b=0YDWczqtWD6myrXNbrPvLTjGZ12/pgXgCIU03rA9OPQICKyrqJQe+fZRrGlPau7Q3ZObNi
	ANx0AWYpQCNNTsCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 591F7779A8;
	Thu, 18 Jun 2026 10:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KURkFCzLM2q2NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 10:40:44 +0000
Date: Thu, 18 Jun 2026 12:40:43 +0200
Message-ID: <87a4ssnnbo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@uniontech.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add headset mic quirk for Acer S40-54
In-Reply-To: <20260618075431.1116988-1-tuhaowen@uniontech.com>
References: <20260618075431.1116988-1-tuhaowen@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9A14775B80
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Thu, 18 Jun 2026 09:54:31 +0200,
Haowen Tu wrote:
> 
> Acer S40-54 with ALC256 does not restore headset mic detection properly
> after S4 resume. After resume, headset plug events may no longer update
> the headset mic state, leaving the headset microphone unavailable.
> 
> The system uses subsystem ID 1025:161f. Applying the existing
> ALC256_FIXUP_ACER_MIC_NO_PRESENCE fixup restores headset mic detection
> on this machine.
> 
> Add a machine-specific quirk for this system.
> 
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>

Applied now.  Thanks.


Takashi
