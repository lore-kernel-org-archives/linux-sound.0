Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E19CA73
	for <linux-sound@vger.kernel.org>; Fri, 26 Jan 2024 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706281677; cv=none; b=n+IZNwrDo0Nxa40gJnXPWJso1z+m5WWwNMfY0SV+wSt+ZKr+HabvtqlHRG3KCOJVIYB+znFzg1kFd1ZGwANzPTXdGs9IYFlOL00NBhJmlSolkqwAdXIfU6tcHuHojrm8XzXyIkHZLLz1hTcYgP/j5nO5FrA8M4udirxZF1PielE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706281677; c=relaxed/simple;
	bh=UaBm6tk9/xK6AU1JINB5cWR5yL1fxUxYSDUl2BMe59M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ue7CMVSnW+kSDEq5kRb2LwuR6roTYUK6SzHqbbmFeL59F6AcovJaKCpDBIOCST8hggNVJgVA0gFV7wurXUukaeFmk7oPPNgwm7cEUnPEpTzVeiUMhVfxVaQz7bOCKhpCd7KbkLbRTFe3KA3Xd44ErMbw2kPeJ+JtD5NOwIjt3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=06W/5p7E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PzT8WFSr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lv+owXlf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+vjWWbet; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="06W/5p7E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzT8WFSr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lv+owXlf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vjWWbet"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D08D51F747;
	Fri, 26 Jan 2024 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706281673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck6wqNfe7d3hY6raPSmHFrFBhIFxFB0/ZOXAuZenv3I=;
	b=06W/5p7E9F2DAkFgouCvkhAuDGSQee24wnSBD2o9RXg6pgiPMokJ0Qxj8ZMArFeMVUbLYe
	rCmfwTxqwnFfNQAOooJlM46r4VEsXsBBXRoe2uraDzFoKS1YUmMe6eUbC1mZWc0spoI26X
	h5HBROcciA0kP//vbTLz0EErLpI3cc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706281673;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck6wqNfe7d3hY6raPSmHFrFBhIFxFB0/ZOXAuZenv3I=;
	b=PzT8WFSrunW0F9gST/JGvrT0DbQkQDOTzGKPJ56mRyraZ4BW+9hVERsN+r1qsjhvKBzksd
	QufBina8+m2wvcDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706281671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck6wqNfe7d3hY6raPSmHFrFBhIFxFB0/ZOXAuZenv3I=;
	b=lv+owXlfkk/Ms5/t8EmotgubNtVI+1P+wbk08NgnftDFpb7uskWXit3e0MqjmKjJtj1iav
	t12BqSZBqS4whUCmwAGHTIJlva/Nw0dAH3AccuqOGVU6AVgkZPlYQDIVDIeY8EUzXNpPmT
	URxrjEA20RtHhX24K8tbQQQvvstGtac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706281671;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck6wqNfe7d3hY6raPSmHFrFBhIFxFB0/ZOXAuZenv3I=;
	b=+vjWWbetK6KegsgeL1AY69VXDZt/Frn1EVfjXhiMA8ZiE7QMN+qOQzSpJ1jjC1XAAxqp31
	PZxafEhv7Ghn8rCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A216A134C3;
	Fri, 26 Jan 2024 15:07:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T4DmJcfKs2W7fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jan 2024 15:07:51 +0000
Date: Fri, 26 Jan 2024 16:07:51 +0100
Message-ID: <87y1ccnneg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Support read-only clock selector control
In-Reply-To: <20240125205457.28258-1-alexander@tsoy.me>
References: <20240125205457.28258-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lv+owXlf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+vjWWbet
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,tsoy.me:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.19)[96.13%]
X-Spam-Score: -4.20
X-Rspamd-Queue-Id: D08D51F747
X-Spam-Flag: NO

On Thu, 25 Jan 2024 21:54:57 +0100,
Alexander Tsoy wrote:
> 
> Clock selector control might be read-only. Add corresponding checks
> to prevent sending control requests that would fail.
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Thanks, applied.


Takashi
