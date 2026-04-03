Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8459029D266
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203872; cv=none; b=HmkHu0u8LqIo9BWaiDyrxQRzWPEkIHemhbIWN6FpIR8XqyEr5aBtdmA+ODPKjroOgRf5H7863PZ+5pqoXU9dNdPHXL/GMX0l0kKPheLqu6jd7kZmMc+T/BeufwXwX4Ww47CrKn/Axf2XXQHK7IuA9MwtLAFEeiHds3EzWXy6sbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203872; c=relaxed/simple;
	bh=vsphRMpdChpl4XVJz/qrJybr8u1lgbl2inynjL76WDY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFO7EK43sH/8b6xFKxrq24+4AVDw9gdbs81DTnWqgbGmwqpzv23LXN1NSCtrJX2azTjrNNfSYePO2YCsRsIFbJJ6QXbb+norWCKE7VxHX5J86wsePNmGxRCtdVUB0d75//DBzuT0wroEFvsCl+M5gDJOAnGm1e3/taCLZruBalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZjapW8jF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lpDrm4gB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZjapW8jF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lpDrm4gB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZjapW8jF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lpDrm4gB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZjapW8jF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lpDrm4gB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B207F5BD57;
	Fri,  3 Apr 2026 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775203869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKTj+fuw+V2CSJJ06hFpU6rHWXveJU/kjg5LgshKBS4=;
	b=ZjapW8jFn+ffPxdody7EeAXjP3qFwL1hz3EpGCSf8VEImvuXSLJsUnhALORGFLXWTzEwmF
	qg6Uwvk7ByjPNIjFjrgJgT0j6coewIKlBOLSxJnJZ8+NwuzKEXxJ/m5gQIg4Pp5VAAcTHU
	zT+bP8PmtCGVRlHd2z3jZsQr1qNhkW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775203869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKTj+fuw+V2CSJJ06hFpU6rHWXveJU/kjg5LgshKBS4=;
	b=lpDrm4gBQZVjSNqzwJ8u02Vc+sPyplzJwIgcIsNR5a//N8Hk/7iBMZZwlv2HzXUvd5XCrm
	E0Td6ppUMBEf4cCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775203869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKTj+fuw+V2CSJJ06hFpU6rHWXveJU/kjg5LgshKBS4=;
	b=ZjapW8jFn+ffPxdody7EeAXjP3qFwL1hz3EpGCSf8VEImvuXSLJsUnhALORGFLXWTzEwmF
	qg6Uwvk7ByjPNIjFjrgJgT0j6coewIKlBOLSxJnJZ8+NwuzKEXxJ/m5gQIg4Pp5VAAcTHU
	zT+bP8PmtCGVRlHd2z3jZsQr1qNhkW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775203869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKTj+fuw+V2CSJJ06hFpU6rHWXveJU/kjg5LgshKBS4=;
	b=lpDrm4gBQZVjSNqzwJ8u02Vc+sPyplzJwIgcIsNR5a//N8Hk/7iBMZZwlv2HzXUvd5XCrm
	E0Td6ppUMBEf4cCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C5A14A0A6;
	Fri,  3 Apr 2026 08:11:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L7wEHR12z2mfbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Apr 2026 08:11:09 +0000
Date: Fri, 03 Apr 2026 10:11:09 +0200
Message-ID: <87bjg0ihuq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2 1/2] ALSA: aoa/onyx: Fix OF node leak on probe failure
In-Reply-To: <20260403014736.33014-1-wangdich9700@163.com>
References: <20260403014736.33014-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Flag: NO

On Fri, 03 Apr 2026 03:47:36 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Add missing of_node_put() in the error path.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied to for-next branch now.


thanks,

Takashi
