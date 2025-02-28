Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5562566F4
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735266; cv=none; b=qciAAUsK4pT1R7qMfRqBmzx8ED5OeWn34cnbspqWBiCSVmfy3cPO4DcMqUnNpOuMwNc6RlWz/PI/PBP4oTY1WPBL6u0DmoglV2dEQdLONTULXc8DsDUhirXMelLdUi2GJnLSWo5Ki1MRHpIn5RI9T7u0acHcosiUqxViOUpV+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735266; c=relaxed/simple;
	bh=Im2a/0X06QiaDgfIu1zzZCTXu2OE9FAUimiT0s41/dc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FP6CXA6cVgY94t4U5odlBK/TAJUfUza3kKEKv8yL26oyG8Oa3JtqkhoDLLJFyOz7HboX1vlizZXEuRiQ/3inMoGbox3o+96zQWuSB6nHFLxNuTKFh4SEad3X3otyO1Zhf+a/yasnt7GQ2aqy1XAcEvQjvFcmPdA90SxrqtYk3dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHdIQEge; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Aacb2I55; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ez2YI5Os; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yHxR+hdY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHdIQEge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Aacb2I55";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ez2YI5Os";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yHxR+hdY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 321F821162;
	Fri, 28 Feb 2025 09:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740735257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QHqqJ0Tar941S5F+zuDGQ2UdVkNKuFWs4oLy55LKnRc=;
	b=OHdIQEgexqzB3TJNQHkNlWt38s8LTjpA5LkL8+IV9fBCu+Xw2vkQ00SJq1Y+IJxkS4iMUl
	9cVLdV1/QX4MebUxCd4xKQMQr1h5RSCXb/Bcq7ZgrsMrpilxreUGsNrn7GMdlsMKskNu+V
	lmDA2Sv2n0xXDzP+nzgHADucb98Xv54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740735257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QHqqJ0Tar941S5F+zuDGQ2UdVkNKuFWs4oLy55LKnRc=;
	b=Aacb2I55Xq1zMcPLI2JdbCjRPH2lSDKi4OUagQlh1433H+orFEmTm5x1LE9t/NWl7tF+4b
	naBjKJf4fWK8JODQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740735256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QHqqJ0Tar941S5F+zuDGQ2UdVkNKuFWs4oLy55LKnRc=;
	b=ez2YI5Osl+KbKemlWGdUEz3pyx76u8CbJ/WZv43xOc8FsNZSPCWv8D8Fd29fAJQLwtd2xP
	NKSSS/bOH8P+lIvMJytOqDkz8WfpdPj0CBY6HlsDsG2rlGWAc/vLA83AVWkb0mPjUZmtuA
	pJkpZD/qdsQCfdl6CuQQJfYhT1N2pC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740735256;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QHqqJ0Tar941S5F+zuDGQ2UdVkNKuFWs4oLy55LKnRc=;
	b=yHxR+hdYwi4D1F3LCmlEn1cP6wzYMSChPrBt5Kosd62yLXJefBOdppV7izwHvV2B+Nk+kw
	V/BrElWe9hGcgNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 036131344A;
	Fri, 28 Feb 2025 09:34:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ciDFOheDwWcoUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Feb 2025 09:34:15 +0000
Date: Fri, 28 Feb 2025 10:34:15 +0100
Message-ID: <87frjyct0o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amin Dandache <amin.dandache@googlemail.com>
Cc: linux-sound@vger.kernel.org,
	Amin Dandache <git@amin85.de>,
	Amin Dandache <amin.dandache@gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: enable support for Presonus Studio 1824c within 1810c file
In-Reply-To: <20250227133027.21148-1-git@amin85.de>
References: <20250227133027.21148-1-git@amin85.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[googlemail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amin85.de,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Thu, 27 Feb 2025 14:30:27 +0100,
Amin Dandache wrote:
> 
> This patch adds support for Presonus Studio 1824c, a usb interface
> that's UAC2 compliant and it is enabled by identifying the device
> ID 194f:010d and works with the code brought in by the 1810c change from
> Nick Kossifidis in 2020-02-15.
> 
> More infos on the card:
> https://www.presonus.com/products/Studio-1824c
> 
> Signed-off-by: Amin Dandache <amin.dandache@gmail.com>

Thanks, applied now to for-next branch.


Takashi
