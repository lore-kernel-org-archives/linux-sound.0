Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256561917D7
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728561735; cv=none; b=Y9nQxqfXP9wkGqSHASpes0EL52zemjVZV1bUvRu+GCVk45aptMNWxrOjweCmcwg5RQ+DB5sul9PeO1Cz7aYGl/ixZ2ic80+SXVNM6LOLliZd0eG8hcbudWxoOd2YW6HzHTF6mhGTvhwaJp1rOGUYGtJi42OrcOoNnhEBz8AxXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728561735; c=relaxed/simple;
	bh=yiwicAnp1tNzwNgVlTNt2znjodfWFJ3RQjE8x83yvJM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVf7NNtqIs5Jf4vdKNvl11tIvZSyAkbpL+av4EJoCE+jQXCCvBe/LNbeUZBAwEHXFHGvYs3HV31n9Q3/uzRdyWS+4iqkKTf0yh/32NXlZsIC8JvCPqbohLxAr7p5ZNKdiiSzkVDMghGOjTU8qqhISpf9hyh+hVgP356fM9qJW4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q8VA5vWz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lc7gzGX8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q8VA5vWz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lc7gzGX8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q8VA5vWz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lc7gzGX8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q8VA5vWz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lc7gzGX8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D6FE1FEF0;
	Thu, 10 Oct 2024 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728561732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nQgKIcuI+q+IqyxmkEq+GC+bGIQEdmJh/MjoOFjSL/8=;
	b=Q8VA5vWzBwfUaT9XoE64xaxI0xZ6PQTV6YoZQguebvxaoAIfd0cIk953KkD4kv8ntfCZ1Q
	oh/Btzbpqz8yLkX9NmuIg/AglYdH6ZOLTMX/2m4HIOVpbnheRf1r+9ABYZ7HK72iitZDaz
	Q3WJ1TTCTxfn2lg+Fe4wzqChoTVZzeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728561732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nQgKIcuI+q+IqyxmkEq+GC+bGIQEdmJh/MjoOFjSL/8=;
	b=lc7gzGX8jvgLafzTf+Gy4MvR/PU6cV28NpQgMxyzulCOXvM8BZZpC2oiudZJZ0jB9T+Y85
	SVrCXrcN9bSxMLDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728561732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nQgKIcuI+q+IqyxmkEq+GC+bGIQEdmJh/MjoOFjSL/8=;
	b=Q8VA5vWzBwfUaT9XoE64xaxI0xZ6PQTV6YoZQguebvxaoAIfd0cIk953KkD4kv8ntfCZ1Q
	oh/Btzbpqz8yLkX9NmuIg/AglYdH6ZOLTMX/2m4HIOVpbnheRf1r+9ABYZ7HK72iitZDaz
	Q3WJ1TTCTxfn2lg+Fe4wzqChoTVZzeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728561732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nQgKIcuI+q+IqyxmkEq+GC+bGIQEdmJh/MjoOFjSL/8=;
	b=lc7gzGX8jvgLafzTf+Gy4MvR/PU6cV28NpQgMxyzulCOXvM8BZZpC2oiudZJZ0jB9T+Y85
	SVrCXrcN9bSxMLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 141A11370C;
	Thu, 10 Oct 2024 12:02:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QLCdA0TCB2eTOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Oct 2024 12:02:12 +0000
Date: Thu, 10 Oct 2024 14:03:08 +0200
Message-ID: <87y12w17yb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Markus Grabner <line6@grabner-graz.at>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: line6: update contact information
In-Reply-To: <20241009194251.15662-1-line6@grabner-graz.at>
References: <20241009194251.15662-1-line6@grabner-graz.at>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.27 / 50.00];
	BAYES_HAM(-2.97)[99.85%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.27
X-Spam-Flag: NO

On Wed, 09 Oct 2024 21:42:51 +0200,
Markus Grabner wrote:
> 
> The Line6 driver source code files contain an outdated email address of the
> original author. This patch updates the contact information.
> 
> Signed-off-by: Markus Grabner <line6@grabner-graz.at>

Applied now.  Thanks.


Takashi
