Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15133F8A8
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939865; cv=none; b=Cx0TIaUiLsPyBaigCk6u+6lW/HQjZGj9J4Ouey2LXbOtzd3MneFiNNnG/lq2JRUT+7ut1cqufj7vgSFoziF0j2STHbq1GrnHw2VoZt0ZaaPtbsXc2R+TXSj5pTuc1QnwoY3Q5x07ueXAv4TMuruil0fqUozMcW8WlCvDojhgrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939865; c=relaxed/simple;
	bh=vFGj/1263xWSbTZmP0i/Tdz3/USOuqsj0WbnZ0QGDPo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtevXCLNwYkZhDCRZxIQP/vJ4F2U6h8sC78saqJSJYA951LPyT7KIQFsT8kyvYFfHcB6JbfynaVa4lQyDcYnYbnLHWtnLRKbBn47tZDlAo/BIl0JHhRwTN7qfySeihPTaMxvVyjjlUPm+fHX/GEdVmCVCMazQN4ydMOkg1XLYxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fb6GCAjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VfBd39vp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nf8n7LQG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K5b6dI0f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fb6GCAjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VfBd39vp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nf8n7LQG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K5b6dI0f"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF99B5BE9B;
	Tue, 31 Mar 2026 06:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774939863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3/MDLmpmSfnIiB1Vd2UuS0eZ1QJ2+euMjUxVldkguxs=;
	b=fb6GCAjMX0GQIkwpMh5ezeSdXwapJj6gar9LyqcYUhOwRS/adYJHMRxby0l0e7fdLKDbaq
	nmxTBqv6id0Io4LN4UmNdCXZEmSsLtuGMQr3feW5Z494eUJLWDpzE1JkFEPpy52mJac4HJ
	jZe+KxC47tcdCe+DfqWL45XOb6Xe2Fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774939863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3/MDLmpmSfnIiB1Vd2UuS0eZ1QJ2+euMjUxVldkguxs=;
	b=VfBd39vp8zQETNSzrJuX9HiL3H6y9ZWiY0KtOgrda5fncFTPk/p0hikewJww5uOSOCHPBB
	V7HwIZDN9xdj3WDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nf8n7LQG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=K5b6dI0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774939862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3/MDLmpmSfnIiB1Vd2UuS0eZ1QJ2+euMjUxVldkguxs=;
	b=nf8n7LQG5a6Mp0PXrX8Vl2+DxHBTIFinFwR/yS0nzjTGu3WGjtLx2tmwmmSiFWPoaIEIHv
	aIVvkWqREyRx+Ynscpve/taWYSlrEQ7SI7cVPRmIdDt+6CEwBew8d4QNycx+IU9N2oNPyT
	nSp33eNhZWc7CmBqjcZef/QmjG5v2Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774939862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3/MDLmpmSfnIiB1Vd2UuS0eZ1QJ2+euMjUxVldkguxs=;
	b=K5b6dI0f56gfkjR6g/dUEUHMm17qZAUxO96/xyi3qw/2vPfdM0nunmC5qUTzZg3PIu2ACX
	zM75+tdXrKbJ6EBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CAA04A0A2;
	Tue, 31 Mar 2026 06:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id se3jINZuy2kHMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Mar 2026 06:51:02 +0000
Date: Tue, 31 Mar 2026 08:51:02 +0200
Message-ID: <874ilwtru1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lei Huang <huanglei814@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/realtek: fix bad indentation for alc269
In-Reply-To: <20260331024036.30782-1-huanglei814@163.com>
References: <20260331024036.30782-1-huanglei814@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BF99B5BE9B

On Tue, 31 Mar 2026 04:40:36 +0200,
Lei Huang wrote:
> 
> From: Lei Huang <huanglei@kylinos.cn>
> 
> Mention complains about this coding style:
> 
>   ERROR: code indent should use tabs where possible
>   #6640: FILE: sound/hda/codecs/realtek/alc269.c:6640:
>   +        [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {$
> 
> fix it up.
> 
> Fixes: 5de5db35350d ("ALSA: hda/realtek - Enable Mute LED for Lenovo platform")
> Signed-off-by: Lei Huang <huanglei@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
