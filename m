Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2E2E7162
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126718; cv=none; b=o6jWI5AI8n8KQAXFrFbM/lvy+jd2j2bILLTKNh+v5PWw4Q9YPAe3JQk8ygMwBdaleQ67+zTkOIhpyQjJF8uNYRhsRa7Uzka1f26TCxVwpafgO4c0rOgfsRhj5xWeSzGuwU5KMh3xYHMda4xSge4EUQdrzh1bl1tmQ8AInUkfH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126718; c=relaxed/simple;
	bh=DV+zqIFYlOmpnmE8EbMa0YOlo0BKdFFdBbIyhOLKxmY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPbZIF0vJWQiKYsBNKmu0cyDz6tkLg3BCRK218DmfPc59/V73H0aM+dpLkosVQnjOGiepcbPr51eFMUrzvVYN+OSzAOMkFLAKwioeRuwf+iMkS6CgLCP1U5428Jy5wbXqzeyt7Q7sFyBSJobFfSN+e8Qs5oMgP9UtBph19jkVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DXIp4PLQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r6mg3y13; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QnsMhB4f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e/uGbYbU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DXIp4PLQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r6mg3y13";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QnsMhB4f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e/uGbYbU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D23D3E21;
	Fri,  7 Aug 2026 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786126711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LkaFdg888pmDV7eVT/eML+uhFpEyHdTZNUpwSUysIkY=;
	b=DXIp4PLQZlL8co+cfsPxcer8xvfEmKJV71oRxeDNaasu0STfywZv7l2M6gE79k1SHKxWWc
	2oOwQX5g225JuSOu5gjlEdMTD053S+7D4NjiEwTHrwb7zDkhWXJOG+AgER3rOAbPrEtpkd
	Tm9k+OFrh9INkJrbUePOoIJwK3IoeRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786126711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LkaFdg888pmDV7eVT/eML+uhFpEyHdTZNUpwSUysIkY=;
	b=r6mg3y13EU+xIFfRoruruOpylEfyAk7tkTClH/d4EqfdEtqe+/5/mTEcZli6Zl2Y0TLjdw
	QOqp01VbW24RN9Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QnsMhB4f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="e/uGbYbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786126707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LkaFdg888pmDV7eVT/eML+uhFpEyHdTZNUpwSUysIkY=;
	b=QnsMhB4fEYAbGpmvoskK3juqKD6wofB/BfC3astM/XsI1cqIvP1VQDriqJRRSVkw12Vrk2
	a2kI68DsYJkI7OEFFFHR2piPrL+0QW2r9+PhrfVU01mR/huJeQUSd5LRg4HpY7tLyvV6b5
	BiLecycp5uXsZa1kwKJMxLMu6LI2uEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786126707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LkaFdg888pmDV7eVT/eML+uhFpEyHdTZNUpwSUysIkY=;
	b=e/uGbYbUXAq7jsNZbrf8ILUL8lJi2wGpyy3bd0htXFGrBk4ZGiJkLIbE/Ec+atekOrxcoH
	QG7W5NFtVsacj4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59759779B6;
	Fri,  7 Aug 2026 18:18:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PkOnFHMhdmo0BgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 18:18:27 +0000
Date: Fri, 07 Aug 2026 20:18:26 +0200
Message-ID: <8733wpbxql.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Garrett Blackmon <garrett@blackmon.dev>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speakers on ASUS ROG Zephyrus G14 GA403UM
In-Reply-To: <20260807150708.33785-1-garrett@blackmon.dev>
References: <20260807150708.33785-1-garrett@blackmon.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 7D23D3E21
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Fri, 07 Aug 2026 17:07:08 +0200,
Garrett Blackmon wrote:
> 
> The GA403UM (SSID 1043:1044) uses the same ALC285 codec + dual CS35L56
> I2C amplifier topology as the GA403U and GA403W variants, which already
> have quirk entries (1043:1b13, 1043:1024). Without the quirk, the
> woofers sit on a separate DAC from the tweeters, so the hardware volume
> control only scales part of the speaker system and the headset
> microphone pins are not configured.
> 
> Apply the existing ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC fixup to the
> GA403UM as well.
> 
> Signed-off-by: Garrett Blackmon <garrett@blackmon.dev>

Applied to for-next branch now.  Thanks.


Takashi
