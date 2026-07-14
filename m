Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448E281525
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008964; cv=none; b=Y/ugTyQkbkubY39znoIvIb6i1ARdEz+BzEZSlps8voxTumQVU8CDCYXdabwFF1yje6ckB6TDSvVUBtAD9cBNO9DXlbtsKY3CiOboV1ucsxX8sNjtZetvSVMe6QXqB+8lm6IP03B8Xxc4vtpWvm76+trhmmBjGwetCGDcWbLwl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008964; c=relaxed/simple;
	bh=AcgH7pd+JG42zIuGssQJtn/Gi3qDqXSrO0ZSPZEzsA8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCMCZT5OMIn38Ok85Gr+4DZmUs0VkuRAdC9a8AiY/ABoWOutP7pzPG5qy5HNn/tAiOAnWGc6dNS+QSwSQBf9llx00ZvYKmUSvrj1yVDW8t7cX0647RngX6sa+4VQq4nFdEN1GVo3xCbB6mUZRemwZNw5DN8qeyciiagl1QNEQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=szWkkGvK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b5cur6lE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=szWkkGvK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b5cur6lE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="szWkkGvK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b5cur6lE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="szWkkGvK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b5cur6lE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9045277CDD;
	Tue, 14 Jul 2026 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784008960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+BH5ryeSc82yGFbGJgvIDe+K1ykZOWVkgBukcr6nGQ=;
	b=szWkkGvK5wVWa3K+NC4+Q65mUZyrbQO5BH/cX8S5TF8QVOd+FkEeLMo1+vSIgvdm4Ujxws
	yio1i509QCEMfG/k/BBFOvpsrnJstOKqsv5QgBVCPbsxqzM0ceL8O61w6Fhk/ocJcUrMbL
	t+jpY85wCUuEr5v/L3gttkFAZIA0AfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784008960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+BH5ryeSc82yGFbGJgvIDe+K1ykZOWVkgBukcr6nGQ=;
	b=b5cur6lEGSzAofL4xowHgLyqCBkBlvx5YctnDr2ip7SBud+K4zZgxWA8Jbc475tTUpJjyE
	tHf9O0ewY985KdCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=szWkkGvK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b5cur6lE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784008960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+BH5ryeSc82yGFbGJgvIDe+K1ykZOWVkgBukcr6nGQ=;
	b=szWkkGvK5wVWa3K+NC4+Q65mUZyrbQO5BH/cX8S5TF8QVOd+FkEeLMo1+vSIgvdm4Ujxws
	yio1i509QCEMfG/k/BBFOvpsrnJstOKqsv5QgBVCPbsxqzM0ceL8O61w6Fhk/ocJcUrMbL
	t+jpY85wCUuEr5v/L3gttkFAZIA0AfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784008960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+BH5ryeSc82yGFbGJgvIDe+K1ykZOWVkgBukcr6nGQ=;
	b=b5cur6lEGSzAofL4xowHgLyqCBkBlvx5YctnDr2ip7SBud+K4zZgxWA8Jbc475tTUpJjyE
	tHf9O0ewY985KdCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6424D779AE;
	Tue, 14 Jul 2026 06:02:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XrtdFgDRVWrxHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 06:02:40 +0000
Date: Tue, 14 Jul 2026 08:02:39 +0200
Message-ID: <87o6gajegw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 0/4] ALSA: clean up kernel-doc warnings
In-Reply-To: <20260713180303.526409-1-rdunlap@infradead.org>
References: <20260713180303.526409-1-rdunlap@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9045277CDD
X-Spam-Score: -3.51

On Mon, 13 Jul 2026 20:02:59 +0200,
Randy Dunlap wrote:
> 
> [PATCH 1/4] ALSA: ac97: use struct keyword for kernel-doc comments
> [PATCH 2/4] ALSA: hda: regmap: fix all kernel-doc warnings
> [PATCH 3/4] ALSA: firewire: fix all kernel-doc warnings
> [PATCH 4/4] ALSA: usb-audio: um144mkii: use "var" keyword for data

Applied all patches to for-next branch.  Thanks.


Takashi
