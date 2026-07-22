Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9946C4D8D8D
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719768; cv=none; b=PjDS8DP3QYSxALzsl2kE6bvSL4hz++JZlSAXO8dfzu538TSSQ4tnOzu8OND7kazzN0TLyJ1Fu6NqzgIHxSAXz9C7ugWtalQDkaPnrcmp3+L2L4nP3A6xROok5+fbWT0rEXWKd7WKZVk1ElPU0QUy8ZA+/0RSBHXGMqmOHB0NnPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719768; c=relaxed/simple;
	bh=bQM9IwzoIgkd9dOqMpQ5J2ZmaLowIcCUTHvM4XnB6pQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+KjHw0fhmrKgunu1eCebj5SA0zdDQTdiAcXyxF0iAUggAkMaL1MfVAmtV0scRhtqdh4TeHulxlo0PB+BEoACZN762rllX3Ky7mFgzOtZ8Mz314MF9WxxufGURyb/WGzdjBTJxYQUHPurYL3UEIBX3E7bBcDosS5KVZV67NdoOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nlNOc4HM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jBFSmt1V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nlNOc4HM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jBFSmt1V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nlNOc4HM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jBFSmt1V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nlNOc4HM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jBFSmt1V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 86DD67AA6E;
	Wed, 22 Jul 2026 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DcELPloPVrg3Hid8tGjDl4j74P2XHsuznFEXusGvEEM=;
	b=nlNOc4HMN9NjxtzOzf8XZvRnlZsorUvZyo5BLE9SrBspi2xxxStVvZ7t/7ay3+b7p2wXth
	uiw5M8nTqa3kIKRUoPTxFqqkSXjJn1x6d6jRaBG61TpFslpx/yX76dOfOBWtfRbrXBKl2D
	5apNfikW1LQtfb90OcSeRdXIIzTbSKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DcELPloPVrg3Hid8tGjDl4j74P2XHsuznFEXusGvEEM=;
	b=jBFSmt1VDHkg6ipTKhbbBToQj5BWLXW30bqKCVxlui+KJnwdmVUJoTp6u8uWTAA7Kg9WMA
	l3DKcBl+NlT/VnDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DcELPloPVrg3Hid8tGjDl4j74P2XHsuznFEXusGvEEM=;
	b=nlNOc4HMN9NjxtzOzf8XZvRnlZsorUvZyo5BLE9SrBspi2xxxStVvZ7t/7ay3+b7p2wXth
	uiw5M8nTqa3kIKRUoPTxFqqkSXjJn1x6d6jRaBG61TpFslpx/yX76dOfOBWtfRbrXBKl2D
	5apNfikW1LQtfb90OcSeRdXIIzTbSKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DcELPloPVrg3Hid8tGjDl4j74P2XHsuznFEXusGvEEM=;
	b=jBFSmt1VDHkg6ipTKhbbBToQj5BWLXW30bqKCVxlui+KJnwdmVUJoTp6u8uWTAA7Kg9WMA
	l3DKcBl+NlT/VnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5463D779B0;
	Wed, 22 Jul 2026 11:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xk5HE4+pYGp+NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jul 2026 11:29:19 +0000
Date: Wed, 22 Jul 2026 13:29:18 +0200
Message-ID: <875x27gt4h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add quirk for HP Pavilion All-in-One 27-ca1xxx
In-Reply-To: <20260721113539.317561-1-zhangheng@kylinos.cn>
References: <20260721113539.317561-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Level: 
X-Spam-Score: -3.30

On Tue, 21 Jul 2026 13:35:38 +0200,
Zhang Heng wrote:
> 
> This HP All-in-One desktop (model 27-ca1xxx) uses an ALC274 codec
> and has no sound from either the internal speakers or the headphone
> jack. The audio output requires a combination of a specific verb
> setup and GPIO configuration to become functional. Additionally,
> the power_save feature must be disabled; otherwise, audible clicks
> or pops occur during power state transitions.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220694
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
