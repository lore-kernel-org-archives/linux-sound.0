Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDFC1C11
	for <linux-sound@vger.kernel.org>; Sun, 17 Mar 2024 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710664525; cv=none; b=thuHzuR1SGwQrFVS1HE8ARqksXxQqLH7J7CE1NyhqKABJqNABTbJCAkn9F/BWOxV5UaKgNOFTPZd40oDQotQ3E9Y9TUA3zJs0IHcpe8W5KFiEJWXcKoIS1E685HYxWncQJQ/gqj7apHVO4rHqzE5veBqCp/JXjDJZ+XKuQ8E0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710664525; c=relaxed/simple;
	bh=znTX9eAIHyWQ7f5ssmtNNZv+t2Yeo0/G0gKKGQUKCnE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CKYy987u3nOQtGmadLbxXoNBeUY06CWRLg4+t+TsRqh1nMVX8h93RDGWruRprojk4FPfoRegfJ2rLEyGxjjkG1nQhYAV8duK0mHVrTWu3mzSUWb2E1Kgcb4y1Q9SCyyqrUc8Dc+G2fNdfRn7OdK/CFR9aPzDY8VxjSbf6tz7Iig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPA/uIC5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9BpFYTqp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPA/uIC5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9BpFYTqp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPA/uIC5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9BpFYTqp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPA/uIC5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9BpFYTqp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 026CA20883;
	Sun, 17 Mar 2024 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710664516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=BPA/uIC5hgPhnKuLVsgq/zVJJ9u6Dxz7vT5vWLPHZPdPofgLcuizOmVMap0WKnGVzE3Tzm
	rdM13D6HMRxTsRaivpSGSpyYOG/GVwLwLpKnvRxA02YgIyDi/xGOuZwm7t3JsWArmVKSGc
	drwTxxsOfOUoJNnwXHTtpJ9/PFa1FSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710664516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=9BpFYTqp/GPWjJbYU/kv4P3pSWzd+NJfXk7GbxY+MDk2W5ruhFF43sqKAZZYtKBRnUH+Dw
	dbhPnVZB0bRtgzBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710664516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=BPA/uIC5hgPhnKuLVsgq/zVJJ9u6Dxz7vT5vWLPHZPdPofgLcuizOmVMap0WKnGVzE3Tzm
	rdM13D6HMRxTsRaivpSGSpyYOG/GVwLwLpKnvRxA02YgIyDi/xGOuZwm7t3JsWArmVKSGc
	drwTxxsOfOUoJNnwXHTtpJ9/PFa1FSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710664516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=9BpFYTqp/GPWjJbYU/kv4P3pSWzd+NJfXk7GbxY+MDk2W5ruhFF43sqKAZZYtKBRnUH+Dw
	dbhPnVZB0bRtgzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB74E1349D;
	Sun, 17 Mar 2024 08:35:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fRgrMEOr9mWbRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 Mar 2024 08:35:15 +0000
Date: Sun, 17 Mar 2024 09:35:15 +0100
Message-ID: <875xxl9ry4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ian Murphy <iano200@gmail.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add in quirk for Acer Swift Go 16 - SFG16-71
In-Reply-To: <20240316094157.13890-1-iano200@gmail.com>
References: <20240316094157.13890-1-iano200@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.45
X-Spamd-Result: default: False [-2.45 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.15)[95.92%]
X-Spam-Flag: NO

On Sat, 16 Mar 2024 10:41:57 +0100,
Ian Murphy wrote:
> 
> Keyboard has an LED that is ON/OFF when mic is muted/active
>  - LED is controlled by GPIO pin
>  - Patch enables led to appear in /sys/class/leds/ as hda::micmute
>  - Enables LED when mic is MUTED
>  - Disables LED when mic is active
> 
> Signed-off-by: Ian Murphy <iano200@gmail.com>

Applied now with corrections of white spaces.  Thanks.


Takashi
