Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000387261D
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767360920; cv=none; b=CK8ys3ERBfL3dzbjE9vhJXMGYF7XdjeW2p8AOcupiFUoIWXUym4qu+lXrVVTa2JAJ81DLmfw5Dt3yoQ8UeP8G2ckCEF9iqzBR7fQzku58tYSnxZM2p9RSUw5Oc6aKNIklhXJcf/5DSXPSxrBe2qCQlA6UExQJFLq5Z7IQsSVSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767360920; c=relaxed/simple;
	bh=E8L/pmNFGG17wfRvtbnS5nHU/Rv7rK83vLvsKL1zjmw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MoB+nWZRkofjBSynHdh8yiPnyUVH+Ky2jSR8mN/0DllYQ0L5RLMy54oQPCiCJPdwVoSF2epcAkbaVbJjbrwgNsh15L4P0kANCQ9jWG6lXM59D4e/wEc+O4JA3slb6RF/EbOyVidVayrzw6CG8wktF8OBWPQuUdXtSTitrp4PGsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yyq3sYyK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7P+LvZNx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yyq3sYyK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7P+LvZNx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yyq3sYyK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7P+LvZNx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yyq3sYyK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7P+LvZNx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7517333681;
	Fri,  2 Jan 2026 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767360910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PGSWZJyRRKUooY686lSq6a0kdkqtgXpzsTDAn8tQMg=;
	b=Yyq3sYyKj4rp9Sjm4FdgrtnS+SgLKSSrA7xuQlpAO3Q1GRnpUQdlh6dFsCbG+wio+qVff/
	04vb49h8QOprDWG2D0gur/9UV49bccoVQvu12yUxx9uxOobyVc2LjfijF5jWLub/zFgp48
	++RkEuuviCbJDOC8GRNmGL01y6PqV7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767360910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PGSWZJyRRKUooY686lSq6a0kdkqtgXpzsTDAn8tQMg=;
	b=7P+LvZNxFEfh0aqRFMm/e1meXcTAg7PTsSnc4+4SjLgxmIX7TPDWD26ZB9tCdeNtlAKRG4
	RmEMgdwni6ZUu5Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767360910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PGSWZJyRRKUooY686lSq6a0kdkqtgXpzsTDAn8tQMg=;
	b=Yyq3sYyKj4rp9Sjm4FdgrtnS+SgLKSSrA7xuQlpAO3Q1GRnpUQdlh6dFsCbG+wio+qVff/
	04vb49h8QOprDWG2D0gur/9UV49bccoVQvu12yUxx9uxOobyVc2LjfijF5jWLub/zFgp48
	++RkEuuviCbJDOC8GRNmGL01y6PqV7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767360910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PGSWZJyRRKUooY686lSq6a0kdkqtgXpzsTDAn8tQMg=;
	b=7P+LvZNxFEfh0aqRFMm/e1meXcTAg7PTsSnc4+4SjLgxmIX7TPDWD26ZB9tCdeNtlAKRG4
	RmEMgdwni6ZUu5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5041113A90;
	Fri,  2 Jan 2026 13:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QadjEo7JV2lwLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Jan 2026 13:35:10 +0000
Date: Fri, 02 Jan 2026 14:35:09 +0100
Message-ID: <871pk83zoy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruslan Krupitsa <krupitsarus@outlook.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
In-Reply-To: <AS8P194MB112895B8EC2D87D53A876085BBBAA@AS8P194MB1128.EURP194.PROD.OUTLOOK.COM>
References: <AS8P194MB112895B8EC2D87D53A876085BBBAA@AS8P194MB1128.EURP194.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.939];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Fri, 02 Jan 2026 00:53:36 +0100,
Ruslan Krupitsa wrote:
> 
> HP Laptop 15s-eq1xxx with ALC236 codec does not enable the
> mute LED automatically. This patch adds a quirk entry for
> subsystem ID 0x8706 using the ALC236_FIXUP_HP_MUTE_LED_COEFBIT2
> fixup, enabling correct mute LED behavior.
> 
> Signed-off-by: Ruslan Krupitsa <krupitsarus@outlook.com>

Thanks, applied now.


Takashi
