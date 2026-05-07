Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0E53EBF3D
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151012; cv=none; b=W2eqht315KXlDtn69R8G+b+200/NHg0nSB3lw9MkDhuMxm0eJFKw/APvLioYahI0zkDcVwls0zyEIFWl8URllxPSWPnYn2vVfH8+TqZKiWJ5F87tlzzt/fzS49bXb/OLNcwcbrdVRs9Ymfq+UDUlE00ZG5q5JV7gNYwJ5iNDKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151012; c=relaxed/simple;
	bh=R/bOe6GRUw3HKwAMrMd0f6ho9ZRiHRqS0NwsI0hEn6M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f138di90oEMq/3z9yZKHHVUOxMmcLchJ0kw/0k87GOnbVQRP/PW1oZBZpYa5fhPKH9cCpNvPQI7Xo20MbL0QTuk6oqps8Pyll5RCl3ORw7XemWZEGXcV2D6ZLPZsjozD03T2eq7oz4VAaRRCWeDZ+VinJD9mYYNftttnlgjLAIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qsya+5FS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JQ6rzE0S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DkKIlvUJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eHbkZq26; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qsya+5FS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JQ6rzE0S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DkKIlvUJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eHbkZq26"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C965A5D65F;
	Thu,  7 May 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778151001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNJvW1ccmC/eSovonjwfDKjh+zgxNdXw6AiBXkutHh4=;
	b=qsya+5FSZGa4SqL6Vyhsqr6EdwCKB2Uep5ibLcBGEhMnCW3Z2gRPYSfCF8ydDBQKsb2PXh
	O3Bg7Hprp/O4xGIBUckMeqseUHph+5M7Zc7VuRbaBIfgGaCNlKg/vtqBWsYIo2ArsJRY4i
	W2BaIeazYeJC53RFwSOBReWipsjxvRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778151001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNJvW1ccmC/eSovonjwfDKjh+zgxNdXw6AiBXkutHh4=;
	b=JQ6rzE0SoEziPEL9zxTBmYcUJ4odyGdpDsvjql45Xw+7LtXkGP9v4K85UC4yWNgje7htAQ
	DniGBgsRxsQZkzAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DkKIlvUJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eHbkZq26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778151000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNJvW1ccmC/eSovonjwfDKjh+zgxNdXw6AiBXkutHh4=;
	b=DkKIlvUJYzjJ5CuHe2QF/5ciCiHvGy5/FZG6s4KALjgtPFwirD39PlYfnt4Oco/BZpZ5Xs
	l1wVaC7hGLDXN96MMIsN6x4SW7DwCFtn9L2PdNr2dFxsi3OeuHs4ef2NRcMKcd1DTzbYZ2
	MdXX80sB4KEztwMOQNNsxye6ceuvMgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778151000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNJvW1ccmC/eSovonjwfDKjh+zgxNdXw6AiBXkutHh4=;
	b=eHbkZq269tBafhZYQDyEZEHhTGPzT3dJ9ijOmAm0DDPQJr4ZWxmhoS8aEkx/GoTKLXcasa
	2uDuGB/bH6UvXfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA924593A7;
	Thu,  7 May 2026 10:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iV9hKFhu/GnSVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 10:50:00 +0000
Date: Thu, 07 May 2026 12:50:00 +0200
Message-ID: <878q9vqysn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?R=E1mon?= van Raaij <ramon@vanraaij.eu>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add codec SSID quirk for Lenovo Yoga Pro 9 16IMH9 (17aa:38d5)
In-Reply-To: <20260506183118.patch1-ramon@vanraaij.eu>
References: <20260506183118.patch1-ramon@vanraaij.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: C965A5D65F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 06 May 2026 20:31:18 +0200,
Rámon van Raaij wrote:
> 
> Some Lenovo Yoga Pro 9 16IMH9 units carry codec SSID 17aa:38d5 instead
> of 17aa:38d6, which was added in commit 56722cfbb78d ("ALSA: hda/realtek:
> Add codec SSID quirk for Lenovo Yoga Pro 9 16IMH9"). The corresponding
> firmware blob TAS2XXX38D5.bin already ships in linux-firmware, and the
> hardware is otherwise identical: same PCI subsystem ID 17aa:3811 shared
> with the Legion S7 15IMH05, same TI TAS2781 amplifiers behind ACPI HID
> TIAS2781, same ALC287_FIXUP_TAS2781_I2C requirement.
> 
> Add a second HDA_CODEC_QUIRK entry directly above the existing 17aa:38d6
> entry so both variants resolve to the correct fixup. Reported and
> verified on hardware by GitHub user 0xEthamin.
> 
> Link: https://github.com/ramonvanraaij/yoga9-tas2781-hda/issues/1
> Signed-off-by: Rámon van Raaij <ramon@vanraaij.eu>

Applied now.  Thanks.


Takashi
