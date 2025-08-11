Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0C2D879D
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896282; cv=none; b=qSMXXHlOoeSiR9CGY4/2eAWjRfHVC7PcxZzULMcRy9M8ykrC5GK08PJRjJXYGACse7gqNhgYQ04qYmxHSa4bFCcxx3jjEGyLCkMCn31P3RoESykexuqUaA3mjUsGBPPTRwvVQ6jU0Nnx/5+tx3SH89SHKltdckBeJx4xD4aF2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896282; c=relaxed/simple;
	bh=pynyGWGbBS0DKJxqKYBbD+6nBmvwqpjeYOVQwFlFACA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9ee1X5piBan94AoFUFL2RCJMfBUloRF4PZ1wW1D9qxDrynhA/GO1YlwejL5dn6E2FE2M2MoZHho6VdrQH8fag3fB6rzcHxhez/e65RahrmiRLDwTYYBqYbMK5CRVJQBkq5Ftqku6Kjh9oYop9CeFywy/yR6bQhL+Fnl8qdymEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nnte5X4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fYN0Dv5e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nnte5X4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fYN0Dv5e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nnte5X4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fYN0Dv5e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nnte5X4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fYN0Dv5e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2474822DAB;
	Mon, 11 Aug 2025 07:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754896278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGAdYy/n/8JV66PPaia2pf3mVuvuTzo3irvpd5sJzpk=;
	b=Nnte5X4s1D8gMpEdAN72cpgXmKVcALJ9MrBlv79sp+Z1PyD9LKEZdOQhwhiQZGANvSb4Uf
	0bpKwDBxmN80j+/S/wlwBmW/qu1QJdq2/HWaz0ibPnndIfwtbJMccRZ3ut/k9XHjTKkUMn
	PnX4OBLtzWSrp9rfnxFySqfJuq/NkVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754896278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGAdYy/n/8JV66PPaia2pf3mVuvuTzo3irvpd5sJzpk=;
	b=fYN0Dv5ejuPBq4j0V8fbISKn8Yd66NzvhqpfH7hmCh8uHhkHhePQtCNALQdOAOEY3rUwRk
	Ku61JFfziBugnOBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754896278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGAdYy/n/8JV66PPaia2pf3mVuvuTzo3irvpd5sJzpk=;
	b=Nnte5X4s1D8gMpEdAN72cpgXmKVcALJ9MrBlv79sp+Z1PyD9LKEZdOQhwhiQZGANvSb4Uf
	0bpKwDBxmN80j+/S/wlwBmW/qu1QJdq2/HWaz0ibPnndIfwtbJMccRZ3ut/k9XHjTKkUMn
	PnX4OBLtzWSrp9rfnxFySqfJuq/NkVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754896278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGAdYy/n/8JV66PPaia2pf3mVuvuTzo3irvpd5sJzpk=;
	b=fYN0Dv5ejuPBq4j0V8fbISKn8Yd66NzvhqpfH7hmCh8uHhkHhePQtCNALQdOAOEY3rUwRk
	Ku61JFfziBugnOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4C3813A55;
	Mon, 11 Aug 2025 07:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1hajNZWXmWi5UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 07:11:17 +0000
Date: Mon, 11 Aug 2025 09:11:17 +0200
Message-ID: <87349yxrhm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christopher Eby <kreed@kreed.org>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	linux@frame.work
Subject: Re: [PATCH] ALSA: hda/realtek: Add Framework Laptop 13 (AMD Ryzen AI 300) to quirks
In-Reply-To: <20250810030006.9060-1-kreed@kreed.org>
References: <20250810030006.9060-1-kreed@kreed.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Sun, 10 Aug 2025 05:00:06 +0200,
Christopher Eby wrote:
> 
> Framework Laptop 13 (AMD Ryzen AI 300) requires the same quirk for headset detection as other Framework 13 models.
> 
> Signed-off-by: Christopher Eby <kreed@kreed.org>

Thanks, applied now.


Takashi
