Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4D2E06E6
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775267; cv=none; b=s/KyWIuY5VJ6XCCLnmuRBoN92J7qVwiKhKxMtqSybOcrv7J+n2UeF8LD+AOIN1njtHR1bidRv7u1QLjtU5MVGjFx09HfdqTl77DQojE3InlQ8XLARyvGdyGl6ZF9I1QxbgF9sjuQqRrzQYDsYuayWPvaf3h+CvhPBfZ6ezAVWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775267; c=relaxed/simple;
	bh=dizkQjRvm+IpjDR0BCLGPjeNF/XtyBpG1NRuRU9sKFQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdeTGLBIpqsPuumzX3gOk0u4amRyy1E5/xYQ47BoJOAJCzbIPZqn9NytOGVf2bfaYJYgqZsSXpTFp9A2JyqnzZzRPxBfRF6sJDwGXw/iEDnzqwo29GYlwYHnj4K6rYgPtI5RPQj6SWe5332MW2qV69nJpEIIFl0YuRQDQXgCNeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GgXCjPtz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iQlxLIC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SmaOJOqj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+rDtV4YQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GgXCjPtz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iQlxLIC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SmaOJOqj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+rDtV4YQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC00B4D4ED;
	Sun, 29 Mar 2026 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p01CR7J+F3N4fuWjj/XUJEDI2EYq3kE+vbEKih/2I8E=;
	b=GgXCjPtzwry6rQz4recffclamDze6z76s1vRjh8ezmaCEk/igsW7Rny2rKFWHgpDNV/mKs
	9PLYIf7k8ak4j6PcDaJfpgvtVU2FQ7b5Yd+l+6LRe0CqkfAzF31bJ9dvuPB81w7tGT2XLi
	Pcss41REZa2HeZsQIiZIUL0MGcKF1Ck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p01CR7J+F3N4fuWjj/XUJEDI2EYq3kE+vbEKih/2I8E=;
	b=7iQlxLICGatXdVZvWB+L4cQVitU6/Y7VgUFSW2TlQKGgObZd8eyBaIGqtF7Rvy4XTHmVbh
	1IzKkHoPHU0LKjAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SmaOJOqj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+rDtV4YQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p01CR7J+F3N4fuWjj/XUJEDI2EYq3kE+vbEKih/2I8E=;
	b=SmaOJOqjcFe9ztvxgoGP1RgCjhnHPyknY2/lv1s3LIJWGKieh1xZnYJCWNBmG4btOpfdvX
	20DhM+MeL4vU4F7zbWlBMkzefRy84fRF3UJRLt3XOYlnD1bwRVEl/fv5woviyCPralVrhx
	KSYu5lQySSMSZ9D+LzZkY/g7XSu6VLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p01CR7J+F3N4fuWjj/XUJEDI2EYq3kE+vbEKih/2I8E=;
	b=+rDtV4YQnEzWfF53OoCLk7moAW1q7Urz7Vboq6LC2RuA0P4xnTuBn6VYtNHui0Nsst82FM
	T4QWyv+ziebj4HDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0AAF4A0A2;
	Sun, 29 Mar 2026 09:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mYrELd/ryGknDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Mar 2026 09:07:43 +0000
Date: Sun, 29 Mar 2026 11:07:43 +0200
Message-ID: <878qbbuhpc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: Drop obsolete probe-work unlock workaround
In-Reply-To: <20260328-hda-intel-drop-obsolete-probe-workaround-v1-1-bc43aeafc98b@gmail.com>
References: <20260328-hda-intel-drop-obsolete-probe-workaround-v1-1-bc43aeafc98b@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: EC00B4D4ED
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sun, 29 Mar 2026 00:42:01 +0100,
Cássio Gabriel wrote:
> 
> Commit ab949d519601 ("ALSA: hda - Fix deadlock of controller device
> lock at unbinding") added a temporary device_unlock()/device_lock()
> pair around probe-work cancellation to avoid a deadlock between
> controller unbind and codec probe.
> 
> That deadlock depended on the driver core taking both a device lock and
> its parent lock during bind and unbind. Since commit 8c97a46af04b
> ("driver core: hold dev's parent lock when needed") and follow-up
> fixes, the parent lock is only taken when bus->need_parent_lock is set.
> The HDA bus does not set that flag, so codec binding no longer locks
> the controller device as the codec's parent.
> 
> Keep cancel_delayed_work_sync(), since the async probe/remove race
> still needs to be serialized, but drop the stale unlock/relock
> workaround and its outdated FIXME comment. Keeping it around only
> opens an unnecessary unlocked window inside azx_remove().
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

A good catch.  Applied to for-next branch now.


thanks,

Takashi
