Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8F433AD
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986955; cv=none; b=M1BXLpWjxvSKYLUfy/ysgOu6kXaI81D8P9PImZsIjvtlnqHbrOARkHVHJ6PqoDS7IWuKiIny3YFyiLo4uFWjkC5T2yK/9NmL/A9RUaPBUc3bL5y84OD4hJx6tY/glAZI6b6Wb7A07PzrNzvweDGTAWdt5/TlmMEiitnCxo78os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986955; c=relaxed/simple;
	bh=ifQitQfYPIxHyihvUfz4cXgUS8nWbtwaQ1czwUqSQfs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umldEgxJ/Kzv4iTwhyDBb1ekKVAdwF7qxZb4lAVjvdWHW81HlJAMlGD4G0A7RDOTjiBLyywd0T5IaobxNpPLW6fDujojiXno6pGn4apsKC+8OC6YhUF7dcn0BCVyHAqxXjqVtTjUfgVnTp3WUiRnqZoxrgwhAarW7X8lRzcYQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eyiEAb+D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oXL/9EKB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eyiEAb+D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oXL/9EKB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eyiEAb+D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oXL/9EKB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eyiEAb+D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oXL/9EKB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5D7021162;
	Mon,  3 Mar 2025 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740986945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=eyiEAb+D4iglhNX1W2qidimrUsTzicwGQpI6yJaLvtTkTMuoPvI4D/KRAEOVjLQr7O1dEe
	zHV7wbnQ7ChvOqLpunvU/FR6Aa8Nhhe9i/l6V1XCzHvFIHIIp1nGbi3b1FZrSxa/P/XivV
	kxAIuqX/q6jh1DIT0knfYF3ECV5UntA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740986945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=oXL/9EKB0kafog3WSKkTKWfFhHXZDVA8TxPZe+EJMKdCnvja+HxpZC13ZihF2lFZv/2a0B
	XAMgg06ndH8aFkBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740986945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=eyiEAb+D4iglhNX1W2qidimrUsTzicwGQpI6yJaLvtTkTMuoPvI4D/KRAEOVjLQr7O1dEe
	zHV7wbnQ7ChvOqLpunvU/FR6Aa8Nhhe9i/l6V1XCzHvFIHIIp1nGbi3b1FZrSxa/P/XivV
	kxAIuqX/q6jh1DIT0knfYF3ECV5UntA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740986945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=oXL/9EKB0kafog3WSKkTKWfFhHXZDVA8TxPZe+EJMKdCnvja+HxpZC13ZihF2lFZv/2a0B
	XAMgg06ndH8aFkBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69B5513A23;
	Mon,  3 Mar 2025 07:29:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l/90F0FaxWceVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Mar 2025 07:29:05 +0000
Date: Mon, 03 Mar 2025 08:29:04 +0100
Message-ID: <87v7sq8tdr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Turn on LED function
In-Reply-To: <c211a2702f1f411e86bd7420d7eebc03@realtek.com>
References: <c211a2702f1f411e86bd7420d7eebc03@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 03 Mar 2025 08:07:30 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Support Mic Mute LED for Lenovo ThinkCentre M series.

Thanks, applied now.


Takashi
