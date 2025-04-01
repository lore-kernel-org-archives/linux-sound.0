Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808B1E47B3
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518967; cv=none; b=UlUTUx3nAX4reizpa+oB7nBtmz6KR7b1rB7C1p6hCELLZMnWj0iHtr+y8kaH4nBI4OauXdVTIezkgC4tiwALtlK5rjz+U5gtgY/hqIgcQYZnLeQqPdiFsT5VnOttHUWAocQpoNK0q+3zPy3ky/KU6vadh5dpw0R7rBAAo5VnuBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518967; c=relaxed/simple;
	bh=kw37yhsRpviVEM0rKhRWe3rMz/IjbFzqXRpqheOpduE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AChLraUkrQjIRpSlQNjGhSwn5wqGdIo228ogY0cMD+9zJW/ndqdCnFnyTo9T7U5vAWydsySWkuxc6WGyZfP0tph0hIyLi6fR30hZlAwzuCiMq2O7+cKLyhkG6j0ebwz5JCXLWWVIhCP9lTIViKvHxCgUXEOI1E6UCiAzoJHkRaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Acm4RsPg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SEo3DkNd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Acm4RsPg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SEo3DkNd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Acm4RsPg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SEo3DkNd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Acm4RsPg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SEo3DkNd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6798F211EC;
	Tue,  1 Apr 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743518964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKY/AQmdOJjsaQqialKpDUVJ9m1R9sgMSYbQgcbT2hg=;
	b=Acm4RsPgZOvVbSHmPcWe7tc8U6sHm73ku5ZP+0RADzwJnYgshJGgT8VQ1Ce7eKvZTxZmWX
	FJ7Y30Zzd79GMCYHSAv3AGyb2bvkxTBKJsv/xIpaV5HYB547nyab8DIPWnIp3zTseJ8nCL
	7ysBbj0xStQZ5wNaybCLqLJYuarvips=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743518964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKY/AQmdOJjsaQqialKpDUVJ9m1R9sgMSYbQgcbT2hg=;
	b=SEo3DkNdNaJ74bEjVgQJzVPLJ5+5b/hHnGTgxr1bf7Xeyt49P1qzfklEbWdDZZ6aIDGNK7
	mOXOSZWtIivNrrDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Acm4RsPg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SEo3DkNd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743518964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKY/AQmdOJjsaQqialKpDUVJ9m1R9sgMSYbQgcbT2hg=;
	b=Acm4RsPgZOvVbSHmPcWe7tc8U6sHm73ku5ZP+0RADzwJnYgshJGgT8VQ1Ce7eKvZTxZmWX
	FJ7Y30Zzd79GMCYHSAv3AGyb2bvkxTBKJsv/xIpaV5HYB547nyab8DIPWnIp3zTseJ8nCL
	7ysBbj0xStQZ5wNaybCLqLJYuarvips=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743518964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKY/AQmdOJjsaQqialKpDUVJ9m1R9sgMSYbQgcbT2hg=;
	b=SEo3DkNdNaJ74bEjVgQJzVPLJ5+5b/hHnGTgxr1bf7Xeyt49P1qzfklEbWdDZZ6aIDGNK7
	mOXOSZWtIivNrrDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4176013691;
	Tue,  1 Apr 2025 14:49:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aD5eD/T862etbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Apr 2025 14:49:24 +0000
Date: Tue, 01 Apr 2025 16:49:19 +0200
Message-ID: <87r02cym1c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6798F211EC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.com,perex.cz,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 01 Apr 2025 15:36:52 +0200,
Peter Ujfalusi wrote:
> 
> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
> does not support RESUME then on system resume the RESUME trigger is not
> sent, the stream's state and suspended_state remains untouched.
> When the user space releases the pause then the core will reject this
> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
> 
> From this point user space will do the normal (hw_params) prepare and
> START, PAUSE_RELEASE trigger will not be sent by the core after the
> system has resumed.
> 
> To fix this issue, release the paused stream before handling the suspend
> if the resume is not supported.
> This will ensure that the stream is properly suspended for suspend entry.
> On resume no attempt will be taken to resume the suspended stream as the
> resume is not supported, userspace will eventually going restart the audio.
> 
> Link: https://github.com/thesofproject/linux/issues/5035
> Link: https://github.com/thesofproject/linux/issues/5341
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Applied now.  Thanks.


Takashi
