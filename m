Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6F237AA95;
	Fri,  7 Aug 2026 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126675; cv=none; b=bdJ2yiXQijQhuJr4jXnU3Cadkc0fWHW5nQxdRSny3UsRqAHCy0YnQOPgcIXNlbCEDBpp2vkI12aLrMKIQNuHwiyRnYGewPMAyFG4g+wCqzhaMMHxUv1hY9yEnd5CssxbGnLZS2ES0RZ5T33cZpHctKqms856Bxk4sQsXd+OM5Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126675; c=relaxed/simple;
	bh=UElm1K2Z4On0HHCO5Woin7Eckmd5BBFXd3WeHgK1LNc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wo+zc/6233KRavVy20dr0+r29FJY9LlCy3cQIsIlfCI2VXNOpE+YBqKO0X7V7CPNG6ire19hVoMC3CW57IR4smZpdCgiig0uscKc3RadL+fZmABY34jb8J8qH5WJAs5CsANGzyVfbluUmqQLd0/F13Wg39kkmFJ2U9GliGTwCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LHTp0/fH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VtW29VOX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZpHEdQbg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bqzw4HZa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LHTp0/fH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VtW29VOX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZpHEdQbg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bqzw4HZa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 04CF6400D;
	Fri,  7 Aug 2026 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786126667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TK6rAmg+0x404VpAcFDdiYcKMDaxYG25WsCdM0LP2VY=;
	b=LHTp0/fHdfCohaK5vPQrDyJTOJfnY+NaomCNnCSYeTF0UwnUEJusnu8frKSEHw2YYnLwUO
	Yc1igGPeSzkJAJYhPFeY9g6QksQM7vt+XlUu0/knPFIf8EmluzoxBZsIj6L41I7O4AvpUA
	wifvm4OLBz0BqMc9OsUNaiLqJrBKXkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786126667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TK6rAmg+0x404VpAcFDdiYcKMDaxYG25WsCdM0LP2VY=;
	b=VtW29VOXvpvv5EVrbmsx0iW5b+8baG+PjYPLCzCTGMq29op4lwfYu3waHdcXrZC6gIF1Nw
	NltpArMsDhBo8sAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786126663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TK6rAmg+0x404VpAcFDdiYcKMDaxYG25WsCdM0LP2VY=;
	b=ZpHEdQbgDx+Lhc2t43b3s1aY3DERaMm4D9oS87b7rkxYhC6d5UeiH8POpEPZggt+Z/CbU8
	NDxg5fsUG2D8AgkW8b8UR+ZgMyMN9wLvIJqFb31biMo8TsEg8EVnl6NJJzzX9DXXK5SM68
	x3rpimHNXylcdWLC2io1EMyqMU4ZqDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786126663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TK6rAmg+0x404VpAcFDdiYcKMDaxYG25WsCdM0LP2VY=;
	b=bqzw4HZaqXUUDiPY4pKO+aJ4vuyTPTWmaQOqmT04H1D60Aqnrhp9fsQ7JhLcpDt/VmQaHc
	q2mZcS5wATI95QCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF0B7779B6;
	Fri,  7 Aug 2026 18:17:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rPBVMUYhdmoCBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 18:17:42 +0000
Date: Fri, 07 Aug 2026 20:17:42 +0200
Message-ID: <874ih5bxrt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: Add quirk for Acer Nitro ANV16-42 headset mic
In-Reply-To: <20260807125857.678297-1-zhangheng@kylinos.cn>
References: <20260807125857.678297-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 07 Aug 2026 14:58:54 +0200,
Zhang Heng wrote:
> 
> The Acer Nitro ANV16-42 (subsystem 0x1025:0x1909, Realtek ALC245)
> does not detect the headset microphone jack. Adding the
> ALC2XX_FIXUP_HEADSET_MIC quirk resolves the issue and restores
> proper headset mic functionality.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221623
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied all four patches now.  Thanks.


Takashi
