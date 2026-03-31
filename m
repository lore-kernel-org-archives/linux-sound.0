Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985723B0AFD
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945254; cv=none; b=ZXU+U8XVINhKeO0jIUqDUaVn6oofb1Ap7IWCpHruzSoq5wi132if/FdZvQSfo3gMGw1pDuNdvK4WzkZJWgztfFSCl3dMaOe0U3E9zyN7LwROrEtcI4//92pf1ZuLWjzrj+Te+FgJRym8TE//r6KUQ3pn+VNyKgSo3Y/iyh2UqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945254; c=relaxed/simple;
	bh=H0LY2K5KG9LHC0bA2RhbZFfGAuKbe5c/xBBfPgGOCJ8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSBwtVUhu57hppGajitpg0tnbEifbNIlMCzkGwiamMzAol7JOCl2CALHN7UvpeE+v3NzccozPGJcoxqtUeHXYSiFkkiiKzsYPEX+Jo1GELgkH/yISmArHVuCG5ZgDGrs0J7aMlyfnjpS7NZ/jNw/ry4LjoB8qySCXI0PK+iVBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LBjf/cfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XJEbV88Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LBjf/cfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XJEbV88Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBjf/cfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XJEbV88Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBjf/cfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XJEbV88Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22F4A5BE8B;
	Tue, 31 Mar 2026 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774945250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr+d9hu1If1zhY2wYS822XxKWqkhhBL2De2hBJdBbTQ=;
	b=LBjf/cfv6lMFfp1fJXPfEAyVOr1zhkkQnWNz2g0HorOn3/OL/+u3h/vlVR/BjCMknbjE8y
	fxmuWt9crbs0YJS2dheDXzShtIMym/70aF1BQuTmbc9x8cnTqNQH3BfsdZNjJbdNbyjBVQ
	P/lhBl0PnZniTQR9rohq9XMDrDynV3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774945250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr+d9hu1If1zhY2wYS822XxKWqkhhBL2De2hBJdBbTQ=;
	b=XJEbV88ZIGHXO1diwCghz79bZvIq5KfLt4BmCthfw63FiKPJMdva17V1Dvs6+5w/WFXO31
	hc3jvTICacdhbzBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="LBjf/cfv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XJEbV88Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774945250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr+d9hu1If1zhY2wYS822XxKWqkhhBL2De2hBJdBbTQ=;
	b=LBjf/cfv6lMFfp1fJXPfEAyVOr1zhkkQnWNz2g0HorOn3/OL/+u3h/vlVR/BjCMknbjE8y
	fxmuWt9crbs0YJS2dheDXzShtIMym/70aF1BQuTmbc9x8cnTqNQH3BfsdZNjJbdNbyjBVQ
	P/lhBl0PnZniTQR9rohq9XMDrDynV3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774945250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr+d9hu1If1zhY2wYS822XxKWqkhhBL2De2hBJdBbTQ=;
	b=XJEbV88ZIGHXO1diwCghz79bZvIq5KfLt4BmCthfw63FiKPJMdva17V1Dvs6+5w/WFXO31
	hc3jvTICacdhbzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E90FB4A0A2;
	Tue, 31 Mar 2026 08:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fqOrN+GDy2m5EQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Mar 2026 08:20:49 +0000
Date: Tue, 31 Mar 2026 10:20:49 +0200
Message-ID: <87wlyss93y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lei Huang <huanglei814@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: fix code style (ERROR: else should follow close brace '}')
In-Reply-To: <20260331075405.78148-1-huanglei814@163.com>
References: <20260331075405.78148-1-huanglei814@163.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,kylinos.cn:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 22F4A5BE8B
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 31 Mar 2026 09:54:05 +0200,
Lei Huang wrote:
> 
> From: Lei Huang <huanglei@kylinos.cn>
> 
> Fix checkpatch code style errors:
> 
>   ERROR: else should follow close brace '}'
>   #2300: FILE: sound/hda/codecs/realtek/alc269.c:2300:
>   +       }
>   +       else
> 
> Fixes: 31278997add6 ("ALSA: hda/realtek - Add headset quirk for Dell DT")
> Signed-off-by: Lei Huang <huanglei@kylinos.cn>

Thanks, applied to for-next branch.


Takashi
