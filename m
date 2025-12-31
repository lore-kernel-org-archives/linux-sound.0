Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFF1DFD8B
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195456; cv=none; b=I2B/3hOkxEQ9HoEMzrYHugxl/q9COi4g0THMZfk5Hs5z9tSoB65CayeEWFKIcY0XFyYx8pitMbRTAzg/PXrZ5tnhFzudZNMeo86jYncnB+X18uRN5s5fP237ZCdU8Lq/1oG9t6cz3yuyrnkkbgzbgUvbRT2BJ53xhHFZqj7BPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195456; c=relaxed/simple;
	bh=JXoFZ0Qyfo5kGBHyTvghfs3wTljkCh5aDVRQ5O3h5Ug=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOIO/VVoeJl/9C1JGD/68pJZ+hZCfeejjmeeUdSdr+PIqZhGXYIJTM3AQ7ysnEjeYEWHOLcjxfiMb+kujn32sORtav8p0wg3gbx4cjBIaDI3lDUjIkczqlFXG3SD1L/fbLIMyIvXKCFwjXZCKOiJlGsOsAjzUQnemOPIj1VB4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NVtC7KAY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qcofNpr3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fA3PqOGk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s8JobQdR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NVtC7KAY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qcofNpr3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fA3PqOGk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s8JobQdR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D40F336EF;
	Wed, 31 Dec 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIaA+Sxz18la0057kcqZ3vEdvn/+JxCjeNeQijXQhGQ=;
	b=NVtC7KAY2IFyA6ViJ7JZHm2aGC1xvPQOtVWs3Nbp261k788Ezqrdu5s8qYiVpKUuC9+cbc
	lMrdOMKfIM0/4TAUv2lzflQNCaEHCBnhNGJ8de6GFWpM+EqYiYKFzlWIZpcoJh028+BkHL
	n8ylZFWCxekL7ecSmoiOhom507zbAUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIaA+Sxz18la0057kcqZ3vEdvn/+JxCjeNeQijXQhGQ=;
	b=qcofNpr3kAv5CxDho1FTaxq5/mNpPTAsupxsh/TNNvy6rtXf8VnZFdqFpChfmPUF32r4RH
	FATq9R6Y+GJcZWDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fA3PqOGk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s8JobQdR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIaA+Sxz18la0057kcqZ3vEdvn/+JxCjeNeQijXQhGQ=;
	b=fA3PqOGkTIJUGnMx+Kl0F+I0/C6KRmv948gvLadNj/R9b9bHnxL2spcGqArsEDOx0oXrP0
	ZY2T+AV/9s6q8ppx1iIullN00++cY8PABvAvuC7anHNg5dW1uROzTZJ//jJIZ+MUosgKmQ
	4sWxAu/x5keO01ZgOz92TgbYzjbjIio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIaA+Sxz18la0057kcqZ3vEdvn/+JxCjeNeQijXQhGQ=;
	b=s8JobQdRu0X4Vj6gYGZd19JEcolB8k5a8Q6bkiY6ZmE3wnaCEnGesHzIS9CQebUZb5jwK4
	TYtyj7sEERwBjBAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13AC4137FE;
	Wed, 31 Dec 2025 15:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kJU3AzRDVWlnaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:37:24 +0000
Date: Wed, 31 Dec 2025 16:37:23 +0100
Message-ID: <87h5t6y85o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: <matouslansky@post.cz>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
In-Reply-To: <ew.6bOzj.272VHi0zCEN.1fIfEp@seznam.cz>
References: <ew.6bOzj.272VHi0zCEN.1fIfEp@seznam.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 4D40F336EF
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[post.cz];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[post.cz];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[post.cz:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Tue, 23 Dec 2025 14:05:55 +0100,
<matouslansky@post.cz> wrote:
> 
> Add headset mic quirk for Acer Nitro AN517-55. This laptop uses
> the same audio configuration as the AN515-58 model.
> 
> Signed-off-by: Matou¹ Lánský <matouslansky@post.cz>

Thanks for the patch.  However, unfortunately it can't be applied
cleanly likely because of your mailer setup breaking spaces and tabs.

Please try to fix your mailer setup and resubmit?


Takashi
