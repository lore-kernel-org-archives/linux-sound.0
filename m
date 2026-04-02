Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DFF35CBD7
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775126721; cv=none; b=mKykv52qyGtjOVheaARBzDshmI4kERh1Oz84xBkDLYVvCYCELHu2hy9h3BsCNxaQosv0IOREeA8pOSR0vapKKWqEDIuR2syNjPtw08bxFKTizVkoTTyVwybw41zt7DJR78VCn39DV/KOsfbP77ReTCLuf2XVHSBNudGioVeBpxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775126721; c=relaxed/simple;
	bh=gsRN9NsVI+FlI3jNhl4tz62XnhzacY/iteHZASsTNqQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/VFObK/nwtU3L8WWf7IS3+MnLgKDv4+psddggp1zptuD0AtoSKiSwXJgCpFGA73cNU5AH2Weu6BNvvsPnxcwSbkYZpraU5KRkYWB4f3JiwWjU9tgaC77WeM8Hbz2eTPwE6WX+RLlKL4R8ENXvaX4o809yN1Ru8V/CatKm5JUZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BW1+59JP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+99mYPAP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BW1+59JP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+99mYPAP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BW1+59JP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+99mYPAP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BW1+59JP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+99mYPAP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 088A14D326;
	Thu,  2 Apr 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775126717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN9r+YdJEttpK+JZfDTR06eavLClbuEbW6kYkNpcEVE=;
	b=BW1+59JP15UKiqCNSR5VPIZyXG0N0RWSVExIvIWvUZmhcvFghzBEYB2ayXtfAjE36pyvbz
	fYvaFpsvVvI8BBNBjuIqm8I2Q9IOLQYaKFi58K1VBGL6LdYiH5/saHBxxSNWU274hArREE
	MhwpftEs0CMmEnzlLkT1elkbYrQ+38s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775126717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN9r+YdJEttpK+JZfDTR06eavLClbuEbW6kYkNpcEVE=;
	b=+99mYPAPe6X9rK85IwBs79Pmar728No+gMqEUwduGI2Wiz4XSGKZCh2K/qnZiRaG/h/VRP
	GKb+PyDfU3zX+wBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BW1+59JP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+99mYPAP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775126717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN9r+YdJEttpK+JZfDTR06eavLClbuEbW6kYkNpcEVE=;
	b=BW1+59JP15UKiqCNSR5VPIZyXG0N0RWSVExIvIWvUZmhcvFghzBEYB2ayXtfAjE36pyvbz
	fYvaFpsvVvI8BBNBjuIqm8I2Q9IOLQYaKFi58K1VBGL6LdYiH5/saHBxxSNWU274hArREE
	MhwpftEs0CMmEnzlLkT1elkbYrQ+38s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775126717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN9r+YdJEttpK+JZfDTR06eavLClbuEbW6kYkNpcEVE=;
	b=+99mYPAPe6X9rK85IwBs79Pmar728No+gMqEUwduGI2Wiz4XSGKZCh2K/qnZiRaG/h/VRP
	GKb+PyDfU3zX+wBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC0CC4A0B0;
	Thu,  2 Apr 2026 10:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z654MLxIzmmCNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 10:45:16 +0000
Date: Thu, 02 Apr 2026 12:45:16 +0200
Message-ID: <87se9diqtf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 2/2] ALSA: aoa/tas: Fix OF node leak on probe failure
In-Reply-To: <20260402023604.54682-1-wangdich9700@163.com>
References: <20260402023604.54682-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 088A14D326
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 02 Apr 2026 04:36:04 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Add missing of_node_put() in the error path.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
