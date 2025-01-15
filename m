Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351D1DB123;
	Wed, 15 Jan 2025 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736927800; cv=none; b=sOpgmnTyIKaES4If0e3JvdUMi25omYvV2rO+HKX1NxzYLj0SG9pxdf2t7chdeSa2Rdaee8Dy28HKTvoBxrww9UMCrqnHUobCzZ/OMOoMPzNtqylLzIjsbz8MWSm+tI1nCNpRaga/Nf0KTGqtNY6eDoDFrUeoNDOfbzJbc1Wcq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736927800; c=relaxed/simple;
	bh=zMvQW/e0r2Nc68GFG+2S0Rcq3urPwTB9nMg6wd3LDXQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HN78nHVCjd60+Uyz7UZvAXWfJHUm7qZ8Qo/Gpv8JDVqKemyMCPss+WJ+YuzE9Wag8HCNmHYOXnL83IsrKIKxjqvBPEucHjhJD7F2i5CssrIRqiHa0v7sIygmvqRIkABQQaXavMOmVc5Cpu6lYo9xX2ZUjSkbMBtPMuhC1+2Rut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r1AaZ5FQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jzwkN0xY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r1AaZ5FQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jzwkN0xY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r1AaZ5FQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jzwkN0xY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r1AaZ5FQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jzwkN0xY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 354D71F444;
	Wed, 15 Jan 2025 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736927796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GLXHTBa/PWtDExo472NR31NGiJ0WawnyGFVZ842+jk=;
	b=r1AaZ5FQjLHRh44QMDKK+4OgyS6P8VZKEdyGG3AMdfGvnw6zNxaYxFMIf0LI4m5Fvd5mbl
	pRkxomlFN8ctNY7NeaJwafXZDKYro4POnG5uDu8kuIglHfWaFVcjIjkNcm97EBTKjT6ar4
	DdNF4lnhN1kXC5MI6ZbNTqNHN91uqgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736927796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GLXHTBa/PWtDExo472NR31NGiJ0WawnyGFVZ842+jk=;
	b=jzwkN0xYcdYwivnqwm8S0QZ8LUGdkBDwEtHycTqK1wRZ6B3y3n3FOfwTJWDY0Apb3ElCpG
	QCAG+14XcNek+ACQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r1AaZ5FQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jzwkN0xY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736927796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GLXHTBa/PWtDExo472NR31NGiJ0WawnyGFVZ842+jk=;
	b=r1AaZ5FQjLHRh44QMDKK+4OgyS6P8VZKEdyGG3AMdfGvnw6zNxaYxFMIf0LI4m5Fvd5mbl
	pRkxomlFN8ctNY7NeaJwafXZDKYro4POnG5uDu8kuIglHfWaFVcjIjkNcm97EBTKjT6ar4
	DdNF4lnhN1kXC5MI6ZbNTqNHN91uqgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736927796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GLXHTBa/PWtDExo472NR31NGiJ0WawnyGFVZ842+jk=;
	b=jzwkN0xYcdYwivnqwm8S0QZ8LUGdkBDwEtHycTqK1wRZ6B3y3n3FOfwTJWDY0Apb3ElCpG
	QCAG+14XcNek+ACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA5D2139CB;
	Wed, 15 Jan 2025 07:56:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3DFKMzNqh2eccAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 07:56:35 +0000
Date: Wed, 15 Jan 2025 08:56:35 +0100
Message-ID: <87bjw8ldcc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset mic on Positivo C6400
In-Reply-To: <20250114170619.11510-1-edson.drosdeck@gmail.com>
References: <20250114170619.11510-1-edson.drosdeck@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 354D71F444
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Tue, 14 Jan 2025 18:06:19 +0100,
Edson Juliano Drosdeck wrote:
> 
> Positivo C6400 is equipped with ALC269VB, and it needs
> ALC269VB_FIXUP_ASUS_ZENBOOK quirk to make its headset mic work.
> Also must to limits the microphone boost.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

Thanks, applied now.


Takashi
