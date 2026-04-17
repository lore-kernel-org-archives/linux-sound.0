Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF333F8DC
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441176; cv=none; b=hVfPsP7RfJMXlzOBJwsHNO/zZN7MvL3d9jbQGdYaU+Uy45AWXLw/DgxQqBOSvU6wHgvx2sKAA+ItZWc+12DYQ+SxCRQlmXsEnq6rSNxUlXKZLN7TW4hIYr8a0z/frcySyI/PADeMzlB944QDIoSr6UNrGdfjn8NtMfmEBpE8lAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441176; c=relaxed/simple;
	bh=zQeSgiIdbW4m0KVnphG7HpGoh6s1gW1rUDwDkNXvR+g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvlmIbgS5FwWJ18IbDk3bp9RRMHckZGmJ7QlAlhsBZsIG4dCvlGsvWkIhlk8PlFgLq/wZQReDT3uMCuMem7fEM+1/A64xeSoWsOPpUB2MgYnz6LgbyStKSsq3tXMz7phgG2oIva5vXiCcG63VU+UPW2+uF5QGkWww3eouSdckdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Modl/xGZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YXlFlsfA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ffs5QNuk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ORaJ3PFK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Modl/xGZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YXlFlsfA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ffs5QNuk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ORaJ3PFK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4ECBA6A862;
	Fri, 17 Apr 2026 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776441173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ozrQLMSBHe+aF6adsk58qDbKLhtOFv7Jy5N+7BmHc=;
	b=Modl/xGZtZmrYMarsnuTPW1fAIR899d9CA+bedGEBXGnRC7wiQy3fft+B5sLY+7lf6/vLm
	BdVYGtI97XcMhsas0KWBTWpdLn3bpvYAex6eTjNr6yD60hMbPI1DSBt1SqfFuP2keSdqYn
	UhKaDX+P9D+a7w7NxxwSslImBwHO0kQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776441173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ozrQLMSBHe+aF6adsk58qDbKLhtOFv7Jy5N+7BmHc=;
	b=YXlFlsfAhtSOFYnVzMWc2cpDgTuPcpM5v0b9J05ULhkDVcPpnnrQb5Y2ORxYFzhmQz9Ktp
	4dLWDjqJ5fKp9sAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ffs5QNuk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ORaJ3PFK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776441169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ozrQLMSBHe+aF6adsk58qDbKLhtOFv7Jy5N+7BmHc=;
	b=Ffs5QNukHMKrYhB1i3mYVgIwNkDoyhDLQ6NPqvDtBiUIC20W5YfqLe4ZjL3dCry241coa9
	Q4yJXxOlaTZo8K3wBAsP42blfaoLurKzqb10SBbTKvtyLtAxuF2t9yvelo4FnbVF5ESizx
	Q8Z0c8IfFieE83dyHBw3Sfk1HKjlfuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776441169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ozrQLMSBHe+aF6adsk58qDbKLhtOFv7Jy5N+7BmHc=;
	b=ORaJ3PFKkaUoAV84X1ituqq/YILgb5NcshQKDIKiEtjaAhOJydQoeWC8akhPs9f3NYevyL
	BP653vjAEmSBqJDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11F6D593AE;
	Fri, 17 Apr 2026 15:52:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y/UnA1FX4mlzeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 15:52:49 +0000
Date: Fri, 17 Apr 2026 17:52:48 +0200
Message-ID: <87pl3xd1nz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <daniel@caiaq.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: caiaq: Fix control_put() result and cache rollback
In-Reply-To: <20260417-caiaq-control-put-v1-1-c37826e92447@gmail.com>
References: <20260417-caiaq-control-put-v1-1-c37826e92447@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,perex.cz,caiaq.de,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4ECBA6A862

On Fri, 17 Apr 2026 15:41:33 +0200,
Cássio Gabriel wrote:
> 
> control_put() always returns 1 and updates cdev->control_state[]
> before sending the USB command. It also ignores transport errors
> from usb_bulk_msg(), snd_usb_caiaq_send_command(), and
> snd_usb_caiaq_send_command_bank().
> 
> That breaks the ALSA .put() contract and can leave control_get()
> reporting a cached value the device never accepted.
> 
> Return 0 for unchanged values, propagate transport failures,
> and restore the cached byte when the write fails.
> 
> Fixes: 8e3cd08ed8e59 ("[ALSA] caiaq - add control API and more input features")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
