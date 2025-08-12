Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC01A9FA5
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982113; cv=none; b=ae+492BzqU3ooJWBFfAbr7fQtH9FLpFFWsfvVAIDUusjTkvzt8GsetwTK/ITYZjP/hO8SnsFA+9/VTtGQLZkSrpsXeXOxg4UlVtTc6i87UTSbJsFNoW+mNIm5uRH2CUavF+M3G06LGc0rjuzRr/jmwyFCCYmyWGWtOmxWHnomgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982113; c=relaxed/simple;
	bh=fxk7ZvCgGJ7FcvGq11Qw8ox2RenPJmtB3BA5xDquLK0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fM390ZngSU0bQ6obsrnq9qj0BjbxApdm6M2r0ixk4oeFPgmTV/+dAYsWo07KKFUIa4twnOIthl3pHmiE9LjM2FixYpRBi3ZC0yBXAhJI6gz5ycdUP3GGDyirzg2CYCIKI6bbT0htA5Ed1HXqqh9yk530AAx2Z0i5aA/DGi9R4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DOQ1CWDK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rY4n/pUr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DOQ1CWDK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rY4n/pUr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DOQ1CWDK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rY4n/pUr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DOQ1CWDK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rY4n/pUr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA9E521C14;
	Tue, 12 Aug 2025 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754982110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIuXacPJunB51SFFMyrVjrYJBnMzGcvIHqSEYD8obz4=;
	b=DOQ1CWDK/UZxuvk2IQ/IbawVHkKa6q6prAhCuFhlYyLd+muT6Dj+CkLDSwHDo+fZV6VZjx
	9ZLGbRz8n3Phjx8zPPRDOfFZy3VVcAmMTTvW+mpDv9lR3rWzDYa0hGi24s9C8xoC540zqW
	5tMBDDjGLyJnGjmJkFN/Oe9L0W0yZlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754982110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIuXacPJunB51SFFMyrVjrYJBnMzGcvIHqSEYD8obz4=;
	b=rY4n/pUr7I1snaOsEaA3aXHAsiBh/kBihj9c81v5sm32KlXkJx5RwU+p97EjEcRXCq2g1H
	t4t9c9tZn119ZEBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754982110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIuXacPJunB51SFFMyrVjrYJBnMzGcvIHqSEYD8obz4=;
	b=DOQ1CWDK/UZxuvk2IQ/IbawVHkKa6q6prAhCuFhlYyLd+muT6Dj+CkLDSwHDo+fZV6VZjx
	9ZLGbRz8n3Phjx8zPPRDOfFZy3VVcAmMTTvW+mpDv9lR3rWzDYa0hGi24s9C8xoC540zqW
	5tMBDDjGLyJnGjmJkFN/Oe9L0W0yZlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754982110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIuXacPJunB51SFFMyrVjrYJBnMzGcvIHqSEYD8obz4=;
	b=rY4n/pUr7I1snaOsEaA3aXHAsiBh/kBihj9c81v5sm32KlXkJx5RwU+p97EjEcRXCq2g1H
	t4t9c9tZn119ZEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EF7E1351A;
	Tue, 12 Aug 2025 07:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HdqrId7mmmhdTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Aug 2025 07:01:50 +0000
Date: Tue, 12 Aug 2025 09:01:50 +0200
Message-ID: <87o6slyqe9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?=A9erif?= Rami <ramiserifpersia@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: usb-audio: Add driver for TASCAM US-144MKII
In-Reply-To: <20250810124958.25309-1-ramiserifpersia@gmail.com>
References: <20250810124958.25309-1-ramiserifpersia@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Sun, 10 Aug 2025 14:49:51 +0200,
©erif Rami wrote:
> 
> This patch series introduces a new driver for the TASCAM US-144MKII USB audio interface.
> This device is an entry-level audio interface, and adding
> support will benefit users who want to use and fully utilize it under the linux kernel.
> 
> The series is structured as follows:
> - Patch 1: Add initial driver for TASCAM US-144MKII.
> - Patch 2: Adds the core PCM infrastructure.
> - Patch 3: Implements audio playback functionality.
> - Patch 4: Implements audio capture functionality.
> - Patch 5: Adds MIDI support and mixer controls.
> - Patch 6: Adds deep sleep and code style alignments
> - Patch 7: Integrates the driver into the ALSA USB audio subsystem.
> 
> The driver has been tested on a TASCAM US-144MKII device,
> verifying playback, recording, and MIDI functionality.
> 
> This driver was written for the TASCAM US-144MKII.
> However, it is possible that it may also work for the original TASCAM US-144.
> 
> ©erif Rami (7):
>   ALSA: usb-audio: Add initial driver for TASCAM US-144MKII
>   ALSA: usb-audio: us144mkii: Add PCM core infrastructure
>   ALSA: usb-audio: us144mkii: Implement audio playback and feedback
>   ALSA: usb-audio: us144mkii: Implement audio capture and decoding
>   ALSA: usb-audio: us144mkii: Add MIDI support and mixer controls
>   ALSA: usb-audio: us144mkii: Add deep sleep and code style alignments
>   ALSA: usb-audio: Add infrastructure for TASCAM US-144MKII

Thanks for splitting, now it's much easier to review.
I commented on each patch.


Takashi
