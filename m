Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5421D591;
	Wed, 12 Aug 2026 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512924; cv=none; b=Kc7VLKhv56YUJPHOkjYzDcMQY9nJRzmiT2xcf7v0soPuxZ05Q6qfMf/tO2FuKcYvTTsyltdydX84n2/k0lgUDxGDrf5TdXgkqBLN6mSg8tFgS7dLsPRUOZQLPGFIGxZv6McBRc1Ioj8eOAho1TmLf5idl3isZo1HLDCihZ+SrBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512924; c=relaxed/simple;
	bh=XIzpzZXmMkLSa9vlQQZxKSkvvqdLpSaolWi5ga8scmQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJkjAvK2GQ/cVaB36vEpcGw7CPMKCGz2ef/lEdwp/ns1OMbxRTEnPT3Sbzi1W315PZ8wHs3Hf2JpMZnUhRoLwTdRa92xBRHpyqwHq4X4Rc+8iGh29V8upWdTOJSjmBpYGrv/IRx7pIX4nHFY1kMZ3haGemLgXgH9UqP51wcM/0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ieg0QHvP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3b5ctMIc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tqqBR2nX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZgIDJeh6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ieg0QHvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3b5ctMIc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tqqBR2nX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZgIDJeh6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B25DC3E29;
	Wed, 12 Aug 2026 05:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndE/G1QYq1Db1qry6PxM5b35dr1q7Rui1mKJ/heYoGo=;
	b=Ieg0QHvPXwR1tcnRy1JD0pflSu7mSYSC+zX6Ra0mkl7AxDQDFF4Y4C5FSoKvrpFCMKYtt8
	vfZ8oriVFBpe4Pnmy2F5s2Xpa7sMovQdM3e+csapxOeAlWB/rH9WHgev28WyT/IrEyBDub
	Lw+eNnOGfYEl+OJILXHmIDyM6e6vvOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndE/G1QYq1Db1qry6PxM5b35dr1q7Rui1mKJ/heYoGo=;
	b=3b5ctMIc6+tmpjRZiinLkKuMNSl2mnYcxDd9O9cMai7utkn45s+5Viq9u1ujW8Agjx/xdP
	2KgTfZYlemTwuQBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndE/G1QYq1Db1qry6PxM5b35dr1q7Rui1mKJ/heYoGo=;
	b=tqqBR2nXeABbsoj0WxHAqkk3NCX1h27syXhhDJW00bwRLD3OCTI1YYVZp/aqnCdHJsUkV4
	aIFC0yQVkUqKYWkKpT8/1akwihcd+i8VG9g/H6e3xURBoYZbFdzcXvxFXyl32q5g9/4aQZ
	gZixBF5+iMgbs0er0m7iRY9TNsy/FtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndE/G1QYq1Db1qry6PxM5b35dr1q7Rui1mKJ/heYoGo=;
	b=ZgIDJeh6eGNUGKLzwK1cMrGEF+pwTqSYnrBBGAVYYpRFD2otXTM0P5OKU77Ijd+IAsYgHz
	e+CwwQYmS4DfqAAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B54D779B1;
	Wed, 12 Aug 2026 05:35:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aILHIBAGfGqvcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 05:35:12 +0000
Date: Wed, 12 Aug 2026 07:35:12 +0200
Message-ID: <87ldab2967.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/ca0132: set codec->spec to NULL after freeing
In-Reply-To: <20260812033019.635010-1-songxiebing@kylinos.cn>
References: <20260812033019.635010-1-songxiebing@kylinos.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kylinos.cn:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 12 Aug 2026 05:30:19 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> ca0132_free() and dbpro_free() call kfree(codec->spec) without
> setting codec->spec to NULL afterward, leaving a dangling pointer.
> Set it to NULL.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Applied both patches to for-next branch.  Thanks.


Takashi
