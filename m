Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444768;
	b=l9rWl8+qYBAW59CrBhzcu0lurkhWLMD2W+v/kTTD2egTqmnBLeEztW7PeH4ogmdzDJKG
	 qGF7qNV895Zmt1PsKx6FCFWRiZWY9rnOgfajmOO57iPvR+41simCxNIx98VG1y9twJ03c
	 +fHWUbPMkof74NUalDfhJvycOeWfipbWF5Ri9KDVX50de67IiExmO4l6XINQwNy7mBJ7X
	 /xfzYU/LdluEjfk4i6OFUfMq25kNquJp87WD35JTvFcy8GUj1ROcU4agXiTnVDN/6YnMp
	 l0n3D7EE9MisUIIu3Vcc9aUBlrUd+44/tyiM82y5bUipm5iaLYDCzuq9bnJTDDpWr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444768;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=x5128RF1R8MsjwfXOL3ERB90bZU5yiU/fWbuvhB7uFw=;
	b=H9O7G1SrLHBTZu2c15HxZCDoefMqBHA7n50Zt6PVBYRYqHxOaUQGP+LDvEgeNCM+7UWR
	 gGg39Z/QvnUnK5K3iKI5d+VNj9I2nVHSyb6elkmAeWUls8S2m29IH2n7mtgAMPxKS/GCR
	 CaakcgXNXKc+qNhRl4n7iwPlVm0oOR9naS7qbSx399Qgr9yHyzP2NXhYvUX5utQ6+G4rD
	 xQ5p/hawvHYLWlZtFsbekRZjBqCtzn7t4A6yhrEuP8vXZ8v6FN6as53flBq1SmQWfp40I
	 N0LILzJJughYtEbI/7WW8EXxUC4zemm4MwYPDUjAwlo3e2XmvLqLjdqyv1sYHPFNZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YgCNRYL+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RIH5K8sO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YgCNRYL+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RIH5K8sO;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F621606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 14:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F621606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YgCNRYL+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RIH5K8sO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YgCNRYL+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RIH5K8sO
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7295A1F82C;
	Mon, 23 Nov 2026 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795444766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5128RF1R8MsjwfXOL3ERB90bZU5yiU/fWbuvhB7uFw=;
	b=YgCNRYL+upWYKi3tcyxpyOS0gUXbdhp0jFW4Y9GRwIKh9086MAq2Iiy7dUO1IvznvmscWe
	huPfSILQ3SBz5eOY/h6APLYDHeFn5avEsBJG4uKU6/DqQ3Xu32qu95O63Q64wIqPFftpEO
	j6JV+kbv2LTftvkH9p0U4CSlEmsKaNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795444766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5128RF1R8MsjwfXOL3ERB90bZU5yiU/fWbuvhB7uFw=;
	b=RIH5K8sO4MUIAQ8eO17kJg/WNLvgDBf1kECcfxgG6EHY+ZKXWIm204SP0EqFqwpeNrHgYA
	R6Q6E0fgh5gOPRCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YgCNRYL+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RIH5K8sO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795444766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5128RF1R8MsjwfXOL3ERB90bZU5yiU/fWbuvhB7uFw=;
	b=YgCNRYL+upWYKi3tcyxpyOS0gUXbdhp0jFW4Y9GRwIKh9086MAq2Iiy7dUO1IvznvmscWe
	huPfSILQ3SBz5eOY/h6APLYDHeFn5avEsBJG4uKU6/DqQ3Xu32qu95O63Q64wIqPFftpEO
	j6JV+kbv2LTftvkH9p0U4CSlEmsKaNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795444766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5128RF1R8MsjwfXOL3ERB90bZU5yiU/fWbuvhB7uFw=;
	b=RIH5K8sO4MUIAQ8eO17kJg/WNLvgDBf1kECcfxgG6EHY+ZKXWIm204SP0EqFqwpeNrHgYA
	R6Q6E0fgh5gOPRCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E7EC13510;
	Mon, 23 Nov 2026 14:39:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e3S+AB5QBGsoZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 14:39:26 +0000
Date: Mon, 23 Nov 2026 15:39:25 +0100
Message-ID: <874id7d336.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lord <mlord@pobox.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
	<b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
	<c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
	<87ik1ndgkp.wl-tiwai@suse.de>
	<0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7295A1F82C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Mon, 23 Nov 2026 15:20:41 +0100,
Mark Lord wrote:
> 
> 
> Yes, zero doubt that the bisected commit is where the problems began. 
> Reverting that commit at that stage in the tree eliminates the ussue, and
> leaving it in brings back the issue.  At that stage in the commits.
> 
> Subsequently, as described, mant thousands of commits later on, behavior
> changes again. But that original bad commit made it too difficult for me to
> bisect the later issues.
> 
> It smacks of a timing issue to me.

Yes, likely.  Even if the commit casually looked like fixing during
bisection, it doesn't guarantee that it's the actual root cause.

For example, if the problem is tied with the previous device state
(e.g. the device got runtime suspend/resumed before reboot), you can
see the problem only after a certain condition no matter which commit
is tested.

Are *all* devices including both HD-audio and USB-audio gone in the
broken state?  You should look deeper and compare in more details
between working and non-working cases.


Takashi
