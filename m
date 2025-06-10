Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036224679B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579881; cv=none; b=EVtVomgSD2gG8WQ7p/JrlZCnG5kgbVKKNKUnwuhGfhNpdilqXJZeAxNymOlycCVFBj6DTUUFt3BdriptoggqTWIdMvi8Dl6ny8MJmyEx68KW3I5gGXAoCFZ/uQ3av5wI5N6J4aqtM6zht/0Si4nu77A+emadnILwLzBjOhlo4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579881; c=relaxed/simple;
	bh=N5O7QClzS+xPg/704/a/+5GeTEQq1LEo0P1EhpMvj+Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBRzgkKYVqoUeJ61bfarMV4lRhIqrp06XNwFVZj9VrKxJMlI4EUN/vrrrvxi0MAAMmQZbWfaoWIuCGvM3J7cVWpLG9L00At56m8YKepon98odeHBYDFrVj2CjXnm0UfjixhVTrafbUIfnxYhjndwtJYJbKja1rpDtHTOySz9T0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ET7iZLe5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8LLyh/Pz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ET7iZLe5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8LLyh/Pz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ET7iZLe5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8LLyh/Pz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ET7iZLe5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8LLyh/Pz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B7FF1F84C;
	Tue, 10 Jun 2025 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749579877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8R0XF6U/7DyL6xnYxPa4WxZ4cLKE9/0KhOPJKSixK0=;
	b=ET7iZLe5B9V3QoU/UBhZDqsBKjL7WjKCZDIb5qvM7tNntKHBYU35hLubYryrMkKrMaSgut
	atxdLwaeicZQr4i9ofCm7RofEm102mNIlYR5jb8Srb3ifMlUopVmtDrO7+OkokuB/R3ov8
	DxZMO9wY0qA1c6RbwomfukJ1c1nruZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749579877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8R0XF6U/7DyL6xnYxPa4WxZ4cLKE9/0KhOPJKSixK0=;
	b=8LLyh/PznDcB56hCenjos/XyF79/8zADeVZLs77xpcb6aRYrxMoGbdTai25RBeiitBikV/
	nfx/ewFGvaQv7pCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749579877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8R0XF6U/7DyL6xnYxPa4WxZ4cLKE9/0KhOPJKSixK0=;
	b=ET7iZLe5B9V3QoU/UBhZDqsBKjL7WjKCZDIb5qvM7tNntKHBYU35hLubYryrMkKrMaSgut
	atxdLwaeicZQr4i9ofCm7RofEm102mNIlYR5jb8Srb3ifMlUopVmtDrO7+OkokuB/R3ov8
	DxZMO9wY0qA1c6RbwomfukJ1c1nruZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749579877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8R0XF6U/7DyL6xnYxPa4WxZ4cLKE9/0KhOPJKSixK0=;
	b=8LLyh/PznDcB56hCenjos/XyF79/8zADeVZLs77xpcb6aRYrxMoGbdTai25RBeiitBikV/
	nfx/ewFGvaQv7pCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C754139E2;
	Tue, 10 Jun 2025 18:24:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BI72GGV4SGjqBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 18:24:37 +0000
Date: Tue, 10 Jun 2025 20:24:36 +0200
Message-ID: <877c1jxxnf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 0/2] Regarding recent patches
In-Reply-To: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
References: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 

On Tue, 10 Jun 2025 19:50:10 +0200,
Lucy Thrun wrote:
> 
> Hello Takashi,
> 
> Thank you for the response to my last patches.
> I've created them in response to the kernel test warnings.
> I apologise for the left out description, while I have experience with git,
> I'm new to using it via email submission and must have not realised after getting home from work.
> I hope the following patches are suiting your requirements better.
> 
> Regards,
> A Linux enthusiast trying to get their soundcard to work without having to deal with dkms after every distro hop,
> Lucy Thrun
> 
> Lucy Thrun (2):
>   ALSA: hda/ca0132: Fix using plain integer as NULL pointer in
>     add_tuning_control
>   ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control

Applied both patches now.  Thanks!


Takashi
