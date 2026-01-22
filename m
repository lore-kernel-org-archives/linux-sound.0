Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAF8346E50
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085200; cv=none; b=CZ92rQVX8aMpwYN4TmL4D84QvFtdTvlm+4ddOJRPA4T4wyDWp0wjpsYMsJSJlHz6vXBRRXGEs/65PIdlIZfSuLOJcMBDoOYLgzq2sOwQvTJXg4nt+we8Imx55qBX+4q/0O8FOgdNfHRkFc2SjKHveA7U36gkyAe+qVgVzJGUif8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085200; c=relaxed/simple;
	bh=ALbcLl8uokk9H6x8tA66C5FLwVN1RZNN0BqtCgoRoJ8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFXlTAoi5tBpymOo53aacrKtvvT0HFb6nsmpXzIgJQf1p+uIdZbVdlrCcK4gMQSPnS3MCqV+MlQQ4QFJGgQqJyi3dK0c9FOZUooDD3DAoyAHbfvFZRUwN0YXSgcpJ4hFukqAuPOBJ+TvUMgRl5jMINnPWlTZUDfgh0p5j/WYoIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lyjbR/Mn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HF7jQ0dZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lyjbR/Mn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HF7jQ0dZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lyjbR/Mn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HF7jQ0dZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lyjbR/Mn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HF7jQ0dZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA7BA5BCC7;
	Thu, 22 Jan 2026 12:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769085195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0iX6pX1UbAHS3EnZvXdsqpQs9agwPrmslZb/baAtyYc=;
	b=lyjbR/Mnn275woA2EMI5QuKKN99w33rxp0RlX9FFqXkJSVNv0LFO7zC4ppUo3PkbCwcT9H
	xWQwnF3ov1wni5nIRHBj8Vje7IEx2PYQUny6xXliAxke+EpANyE8ZAKeRkpV8wpwlweiQV
	ohpdNeUkhV9irdGWxtoXxpvKKGtZvW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769085195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0iX6pX1UbAHS3EnZvXdsqpQs9agwPrmslZb/baAtyYc=;
	b=HF7jQ0dZITr7fREmprVhvCFq6pUODL5+HK6y1z0p3ti9MzG9L53Vc3bEGFntJE3pDInEp5
	Xicil/sIk5WavQBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769085195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0iX6pX1UbAHS3EnZvXdsqpQs9agwPrmslZb/baAtyYc=;
	b=lyjbR/Mnn275woA2EMI5QuKKN99w33rxp0RlX9FFqXkJSVNv0LFO7zC4ppUo3PkbCwcT9H
	xWQwnF3ov1wni5nIRHBj8Vje7IEx2PYQUny6xXliAxke+EpANyE8ZAKeRkpV8wpwlweiQV
	ohpdNeUkhV9irdGWxtoXxpvKKGtZvW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769085195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0iX6pX1UbAHS3EnZvXdsqpQs9agwPrmslZb/baAtyYc=;
	b=HF7jQ0dZITr7fREmprVhvCFq6pUODL5+HK6y1z0p3ti9MzG9L53Vc3bEGFntJE3pDInEp5
	Xicil/sIk5WavQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A37713533;
	Thu, 22 Jan 2026 12:33:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dRDDFAsZcmmVDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Jan 2026 12:33:15 +0000
Date: Thu, 22 Jan 2026 13:33:14 +0100
Message-ID: <87zf65hlo5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	edip@medip.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Samsung 730QED to fix headphone
In-Reply-To: <20260122085240.3163975-1-zhangheng@kylinos.cn>
References: <20260122085240.3163975-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 22 Jan 2026 09:52:40 +0100,
Zhang Heng wrote:
> 
> After applying this quirk for the ALC256 audio codec, the headphone
> audio path functions normally; otherwise, headphones produce no sound.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220574
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
