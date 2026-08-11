Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BAA38D686;
	Tue, 11 Aug 2026 06:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428829; cv=none; b=XKuKYA0N8RgCBcfWB537v1GS8n0B+YzJlxDJC/Nvg2dkkr0mbGsJ4BqMLsC+qFALEszGSCKrrjBAJt8Xo8wsPTE/Z2LqFERsOTnbMb4CBDCNCsI9cwKADAYllEglaV8nCxxVqKu64IkDplz8bjbhMrceDYld5JZ0XNYvqvdy/xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428829; c=relaxed/simple;
	bh=gdTBtVVXxszGtrcDJeKws7+G0qB4Bz0eLQvp+pre98w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGdj+GrUiGIZCUbIrcJ1mW0ElqqbeNEuKEX6PXLMpds9sA5xYLBG8Wo6RehDUuxrnbThV2S7NPpBLfV6CLyZ7k+5D1e9wn/U55ThU30kNtgn0kCGYzXbrQ+Ot73ywCRzUWv0nulIfPWFQt+Lb3/v7TkkCcnT+w7d/z8UeaMEhEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SlfDuqJl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7DeqN7wr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m7/MnXzG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XElr9RU1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SlfDuqJl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7DeqN7wr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m7/MnXzG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XElr9RU1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99E418189E;
	Tue, 11 Aug 2026 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qv9KjV3zJ4chJxTpXMv3LwMeQ1cRuHhv3pSwPS0A3sw=;
	b=SlfDuqJlJuxwwMhZS1YN2srG4Q85Wcgj8Z/Az6EvGe2tKtn3EzE8fM6IHdt7lmGSoe5aFX
	SsjCi1m9MOysFiwEVyGIKG47R8/iaB8PZdbWBZQogdFO6xgKKzHB25V2ORxrIAcvI0e0/t
	XovOil4EmZQ9obY94/lNxng9yVBvUCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qv9KjV3zJ4chJxTpXMv3LwMeQ1cRuHhv3pSwPS0A3sw=;
	b=7DeqN7wr5YIoJ8E0DgNaTa6+Bz8aYx3JVASnsNk43oGLmjctBRQaMTNCMKoddyBmMu8II9
	/Jz6kTaxOEwR44AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qv9KjV3zJ4chJxTpXMv3LwMeQ1cRuHhv3pSwPS0A3sw=;
	b=m7/MnXzG4CO+9ah4gMPeS073s/vFy12i7TC0Y9Kwh33bXOIBTbqRCVD0Rs1srIWN+og2Ma
	dpcJ4DuBAPoD6F9qaxWQqEUKvzz4rcN9AudHX8izRzR6YxNwXgrqKPfsU+ZGmps3BE8YrM
	DWiQMKvWG6POJdq6IQKTckx+rO76iIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qv9KjV3zJ4chJxTpXMv3LwMeQ1cRuHhv3pSwPS0A3sw=;
	b=XElr9RU1M1Ntj+8ILTIgeWwYDXC+fWGg+H33PFs5EKdrNcTXJbxCa3t9iwVdfT7A/xSLMD
	9+efik8l3DS6ARDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F34C779BC;
	Tue, 11 Aug 2026 06:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id njPKGZK9emq4PgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:13:38 +0000
Date: Tue, 11 Aug 2026 08:13:38 +0200
Message-ID: <87bjb9b2wd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ALSA: usb-audio: Fix popping noise on Valeton GP-200
In-Reply-To: <20260811024902.134457-4-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
	<20260811024902.134457-4-zhangheng@kylinos.cn>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 11 Aug 2026 04:49:02 +0200,
Zhang Heng wrote:
> 
> The Valeton GP-200 guitar multi-effects processor exhibits a continuous
> popping noise (~6Hz) during playback and recording. Force implicit
> feedback to resolve the issue.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221662
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
