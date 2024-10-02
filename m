Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C91E7676
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866186; cv=none; b=eSla/lsI4v92zkowjgF3BMNildvQxkE4RPqEDbSuy3oXTNz4EaGnMSYW/tlDkmtxWg+5RSAidCMpqOkJYNT9CFK6ArmS/h/0Qb74RrAsmWR+dtFbfkseYe69rLhGYPEPXv5aCQUp0IKJ4MsrHRf7jRLDjQzkq4WqDQFs4z2xQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866186; c=relaxed/simple;
	bh=zEBrp7aIFAUYIX2jYnSJoOZw1lXuGC5bg3qZZ8CFpTE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDNZ+PRd63fsz0qaFdxqZVf17asIiRI9tTijnYxgvMVQRvrLPZorkuwCELtZa6l1jIaBj7cj6qKuXn+xUfrEmvIhzPmfIbaw2NPqk99/gaMZJN6NQlm1UgLNx52W3yMC/7HoNCOKZozwS2rRoeEGNfofrx0OBt+cdEhDFotzjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0hvFviM/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UPE7sQPK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0hvFviM/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UPE7sQPK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0hvFviM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UPE7sQPK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0hvFviM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UPE7sQPK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70F6C21B57;
	Wed,  2 Oct 2024 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727866182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulobXuHQizO9D/mnZuHR/lFc+kcJS/x2/2W08vLOms8=;
	b=0hvFviM/F1rkDo22SgLI+gsTX3+J0iPZXAmQgP+eSJ4HrPWk10Dm83T5KEG/PRFTHQuJ5u
	naE2uNv1cgdj2DgR/08CpqzNBwqCq3acM+s9o7iD0GnEp6rlqTicrskfITOXtjGT5wO6h0
	N9iEf84nxGKpwCEyWXiVivi5rOhVGUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727866182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulobXuHQizO9D/mnZuHR/lFc+kcJS/x2/2W08vLOms8=;
	b=UPE7sQPKFRqaBu3IOvEZl7bXcnKZl1Ny+gLdCGhM/clwuvcF2zySR+7oCco2gHLxrQGs2k
	8Kh5TCvt5Vi1aYAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="0hvFviM/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UPE7sQPK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727866182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulobXuHQizO9D/mnZuHR/lFc+kcJS/x2/2W08vLOms8=;
	b=0hvFviM/F1rkDo22SgLI+gsTX3+J0iPZXAmQgP+eSJ4HrPWk10Dm83T5KEG/PRFTHQuJ5u
	naE2uNv1cgdj2DgR/08CpqzNBwqCq3acM+s9o7iD0GnEp6rlqTicrskfITOXtjGT5wO6h0
	N9iEf84nxGKpwCEyWXiVivi5rOhVGUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727866182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulobXuHQizO9D/mnZuHR/lFc+kcJS/x2/2W08vLOms8=;
	b=UPE7sQPKFRqaBu3IOvEZl7bXcnKZl1Ny+gLdCGhM/clwuvcF2zySR+7oCco2gHLxrQGs2k
	8Kh5TCvt5Vi1aYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41D6913A6E;
	Wed,  2 Oct 2024 10:49:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vhjmDkYl/Wb9aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Oct 2024 10:49:42 +0000
Date: Wed, 02 Oct 2024 12:50:35 +0200
Message-ID: <878qv6n5hg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Zeno Endemann <zeno.endemann@mailbox.org>
Subject: Re: [PATCH] ALSA: hda: fix trigger_tstamp_latched
In-Reply-To: <20241002081306.1788405-1-perex@perex.cz>
References: <20241002081306.1788405-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 70F6C21B57
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 02 Oct 2024 10:13:06 +0200,
Jaroslav Kysela wrote:
> 
> When the trigger_tstamp_latched flag is set, the PCM core code assumes that
> the low-level driver handles the trigger timestamping itself. Ensure that
> runtime->trigger_tstamp is always updated.
> 
> Buglink: https://github.com/alsa-project/alsa-lib/issues/387
> Reported-by: Zeno Endemann <zeno.endemann@mailbox.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Thanks, applied now.


Takashi
