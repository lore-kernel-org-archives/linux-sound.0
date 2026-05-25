Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2483BED44
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693808; cv=none; b=fWqG1BsMFpKYhMJZeKlxJeBe9C61W45wzSU2ZNlqpgjhHsWpg3ajK2nYFesVyEtAetb4lTUv8boiTc/m2DSB727BqT750mKssMtuA565WuRDrKUIDxvgnTn9IMImBEcn171aXSUAlaDla5m7FvGmsUHg+yMdfcY4y94lZN62btU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693808; c=relaxed/simple;
	bh=16AzfyjkFGYPQLSiMvzRihkksc8m1m/DNzRYBjGi/Rc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XiPNew1zsRjd77X9m5HmjoPk0zWTb+Kha4OHPrmImGW58cVI/VbKsMBuLa4Clpe3Ogy6Ka+EuGuag27KXqcJyfwMXggHpexNubFi1199hGVkDfzd6uXF6naleVjFKLcY4GVVZAHoME+vP5v6tylnPbDXyxN99TJXUPDl709GBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h6MVOI0T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SsJqtrv8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h6MVOI0T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SsJqtrv8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h6MVOI0T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SsJqtrv8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h6MVOI0T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SsJqtrv8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D01F68A24;
	Mon, 25 May 2026 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwKAHCPufmcvwmVoubxbEP61XxbKOS+31Zsa7Rt93Ks=;
	b=h6MVOI0TM6zdX0c7JNRu1a78H/NNU/CgH6z7NLaV/BxgGler1E5aIdEjKAPcMpGXC7qFLM
	mQdqgpjrCkdfj9l+BF/Fgfkr2d7LWgqUabVFPcqU6ksd59J2va1BrKrWa8ScGVe0l/DKE5
	KfIIA7X4w3zQy4b3OnPKQRN76lXgKPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwKAHCPufmcvwmVoubxbEP61XxbKOS+31Zsa7Rt93Ks=;
	b=SsJqtrv8yzohfaISo7DeLBXGiD8n/HaQl0SgqWu+DKWLTweJf3O9cSu36dWSalQkUkd2fJ
	28zIktwc965LVnAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwKAHCPufmcvwmVoubxbEP61XxbKOS+31Zsa7Rt93Ks=;
	b=h6MVOI0TM6zdX0c7JNRu1a78H/NNU/CgH6z7NLaV/BxgGler1E5aIdEjKAPcMpGXC7qFLM
	mQdqgpjrCkdfj9l+BF/Fgfkr2d7LWgqUabVFPcqU6ksd59J2va1BrKrWa8ScGVe0l/DKE5
	KfIIA7X4w3zQy4b3OnPKQRN76lXgKPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwKAHCPufmcvwmVoubxbEP61XxbKOS+31Zsa7Rt93Ks=;
	b=SsJqtrv8yzohfaISo7DeLBXGiD8n/HaQl0SgqWu+DKWLTweJf3O9cSu36dWSalQkUkd2fJ
	28zIktwc965LVnAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C57159B07;
	Mon, 25 May 2026 07:23:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5BZXCe34E2rxEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:23:25 +0000
Date: Mon, 25 May 2026 09:23:24 +0200
Message-ID: <87cxykgdg3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: pcm: oss: Fix setup list UAF on proc write error
In-Reply-To: <20260522-alsa-pcm-oss-setup-uaf-v1-1-40bdcc4d17e8@gmail.com>
References: <20260522-alsa-pcm-oss-setup-uaf-v1-1-40bdcc4d17e8@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[8e498074a794999eb41c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 23 May 2026 03:09:40 +0200,
Cássio Gabriel wrote:
> 
> snd_pcm_oss_proc_write() links a newly allocated setup entry into the
> OSS setup list before duplicating the task name. If the task-name
> allocation fails, the error path frees the already linked entry and
> leaves setup_list pointing at freed memory.
> 
> A later OSS device open can then walk the stale list entry in
> snd_pcm_oss_look_for_setup() and dereference freed memory.
> 
> Allocate the task name and initialize the setup entry before publishing
> the entry on setup_list. Also fetch the initial proc read iterator only
> after taking setup_mutex, so all setup_list traversal follows the same
> list lifetime rules.
> 
> Reported-by: syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a1062b7.170a0220.35b2b7.0003.GAE@google.com
> Closes: https://syzkaller.appspot.com/bug?extid=8e498074a794999eb41c
> Fixes: 060d77b9c04a ("[ALSA] Fix / clean up PCM-OSS setup hooks")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
