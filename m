Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CE91EB19B
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767196027; cv=none; b=XTuCzuSZBGI6EUNC+je39fhsk48MubCydiI59FGst9+v9u036L2gKluvosYiFtV4PfG+9YQ4JBp5L6QiRstqUXI7GsiFpYq3TzaUkuK3DulopKMuoLC7kkJ5XJO/An0/PB7j+KmCshM8NH+GjF2hPjffPvR1NkqZdwN97lRP674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767196027; c=relaxed/simple;
	bh=E9MNTMb1EdpRzCN4TJ0A2tcXNzQynfcTDywTFjl1lTI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnJU9sbraVZwzuoJFTbsV/0o5Ir2hLcAJopMfWcQ1Y4wK4vj1aYQ6DzWnGvFZNlmkvIqNX7RSReYIGmsVyC5TliVqZ6MTzJtFMiL3ntxlRM++1Ebs3XWz6UCkLVpcEXk6Xku7+KD3+DhQDMHs7LjgdCm18+OflT2kYnxgKxYNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dSdVdjW3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jiuxtA5y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dSdVdjW3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jiuxtA5y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dSdVdjW3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jiuxtA5y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dSdVdjW3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jiuxtA5y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05512336EF;
	Wed, 31 Dec 2025 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767196022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rx/51tlfMDxdjGbVu5HPtml3a5JSyu4/D/6RdZOQirQ=;
	b=dSdVdjW3EUKUsIDfZd8tK3caFK8vpw/o+ZqkWP4+BCDSE5I3TktG1qWUzpzjXr6OR7Mjcc
	mmkAu6UQ4OzCpbPGdPFO2dRIjv7nSmcuvJdwpiqsXjJNVOYI+QPjOlEt48R1Sh1yH/ohBC
	XWPoptIX/XqBdPTaLJeJxAM4Ildj8xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196022;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rx/51tlfMDxdjGbVu5HPtml3a5JSyu4/D/6RdZOQirQ=;
	b=jiuxtA5yPyWSZAeYSk0gtXxDVWAKCetc++v/b+9+skPUPl3EOZip33lwa4q0Amwegw9gwv
	rTpiNygqHEwgJiDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dSdVdjW3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jiuxtA5y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767196022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rx/51tlfMDxdjGbVu5HPtml3a5JSyu4/D/6RdZOQirQ=;
	b=dSdVdjW3EUKUsIDfZd8tK3caFK8vpw/o+ZqkWP4+BCDSE5I3TktG1qWUzpzjXr6OR7Mjcc
	mmkAu6UQ4OzCpbPGdPFO2dRIjv7nSmcuvJdwpiqsXjJNVOYI+QPjOlEt48R1Sh1yH/ohBC
	XWPoptIX/XqBdPTaLJeJxAM4Ildj8xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196022;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rx/51tlfMDxdjGbVu5HPtml3a5JSyu4/D/6RdZOQirQ=;
	b=jiuxtA5yPyWSZAeYSk0gtXxDVWAKCetc++v/b+9+skPUPl3EOZip33lwa4q0Amwegw9gwv
	rTpiNygqHEwgJiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8BBF137FE;
	Wed, 31 Dec 2025 15:47:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OV4LKHVFVWn7aQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:47:01 +0000
Date: Wed, 31 Dec 2025 16:47:01 +0100
Message-ID: <87bjjey7pm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: echoaudio: adjust function name reference
In-Reply-To: <20251230133525.91837-1-Julia.Lawall@inria.fr>
References: <20251230133525.91837-1-Julia.Lawall@inria.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,inria.fr:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 05512336EF
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 30 Dec 2025 14:35:25 +0100,
Julia Lawall wrote:
> 
> The code just below the comment sets chip->pipe_alloc_mask to 0 and
> then calls restore_dsp_rettings, so it seems that restore_dsp_rettings
> is what was intended.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
> 
> The code in restore_dsp_rettings() looks like restore_dsp_settings()
> might be a more appropriate name.  If it is preferred to change that,
> I would be happy to redo the patch.

Yes, let's correct the typo in the function name itself.
Please submit another version.


thanks,

Takashi
