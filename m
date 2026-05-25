Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA573D1A81
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693962; cv=none; b=XhLkw1j4Wr/iUkRV84LSGEzq3JK0DMk+MBpJ7PNLP93Op6CU/q04EVxBM+a5MtGp6vxwz1dU/IXpcq2xqOnTL35V2bsviev4gKuyLzgiz/gHUEKcUFeJJpVqSazyxUeyfbcWKLaAMv42mXJqZGpzxFt2cvUiMXE+XGuU1wT4Bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693962; c=relaxed/simple;
	bh=qyMXiFwmFZpzW9vNsBIu0YwgvWRiw/CuKtJLYjCBvQk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJ1NVvTtevgYiajpUpOBu6UBiYF0miW9ccB9tYHBWZ9FEW99ExyeOZFcAydMzzR36OihIKfUc8zvNWWuEEwHAUzg/Prq55e7IcajKO41jYxYx5xKEDPU8tsg70ytaIZ3piMMP6DNVLcSjwbG2xyHGDmDzXT8hXVbPu/2i9+Pb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1weElSEs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Ne2oi6p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1weElSEs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Ne2oi6p; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1weElSEs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Ne2oi6p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1weElSEs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Ne2oi6p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EFCD64AD1;
	Mon, 25 May 2026 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZIiHiUOaRWhj9P4LGuO1xwToPKx5RqM/a54MXvh5I=;
	b=1weElSEsBoUI9tL3PLBGmb366nSZNLdExeAykq6W9faEnBH0Ex680kVvinP54excInquAa
	5Jm10CGSYznxDsQEi3tY7zBzV3NZkYYZKenCrxk2pO978JQ8UlF7ip+2VOaNRQGAnhSH76
	DB/DkS+WkHpRey5d3XxwO0g8O+x8CBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZIiHiUOaRWhj9P4LGuO1xwToPKx5RqM/a54MXvh5I=;
	b=2Ne2oi6ptYTCX+VD5NQBWFbDIU/BTUGUtA9fDxeZpQGP7xb+gaSBSehvWB9d8FqItENQjh
	5yHgSLTU66Nqx4Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZIiHiUOaRWhj9P4LGuO1xwToPKx5RqM/a54MXvh5I=;
	b=1weElSEsBoUI9tL3PLBGmb366nSZNLdExeAykq6W9faEnBH0Ex680kVvinP54excInquAa
	5Jm10CGSYznxDsQEi3tY7zBzV3NZkYYZKenCrxk2pO978JQ8UlF7ip+2VOaNRQGAnhSH76
	DB/DkS+WkHpRey5d3XxwO0g8O+x8CBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZIiHiUOaRWhj9P4LGuO1xwToPKx5RqM/a54MXvh5I=;
	b=2Ne2oi6ptYTCX+VD5NQBWFbDIU/BTUGUtA9fDxeZpQGP7xb+gaSBSehvWB9d8FqItENQjh
	5yHgSLTU66Nqx4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 517CA59B11;
	Mon, 25 May 2026 07:25:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z7eSEof5E2qaFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:25:59 +0000
Date: Mon, 25 May 2026 09:25:58 +0200
Message-ID: <87bje4gdbt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Limit mic boost on Positivo DN140
In-Reply-To: <20260524185324.28959-1-edson.drosdeck@gmail.com>
References: <20260524185324.28959-1-edson.drosdeck@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 24 May 2026 20:53:24 +0200,
Edson Juliano Drosdeck wrote:
> 
> The internal mic boost on the Positivo DN140 is too high.
> Fix this by applying the ALC269_FIXUP_LIMIT_INT_MIC_BOOST fixup to the machine
> to limit the gain.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

Applied now.  Thanks.


Takashi
