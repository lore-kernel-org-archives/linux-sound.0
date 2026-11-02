Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609689;
	b=h1vqD1JKArN351FK8JGY3kjwa2MCtH2U6dZh+4agpVYeGNfry00MCjwqg4shFhwMf8dq
	 1SVd2NZ7Udo32DPwgJ4Uo/KPdBSXO1+CnsYAwURXZUbBZqSU2k9D+kcgC1AmW0m23rhpF
	 UEyp/lNSuDOjJSfRPjNgsj19xrUQzTF3gqp3IARQQA9nhdzRRgaYzG+J+YE9RxqMku321
	 6TpUVAoi/Wlkh5nkVm+DA7yS2gxfnmainUVxCUg3HMfXLUCYaWp7hA03lid6nDSaRhRbf
	 tr+e4B4iwMRafWWPZ0vstj2e1W195q07CBV6yNGSb6PZQm4ozFsPxsOf+01J206bI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609689;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=nPfC6NxMQZ8tNG5IkVHkOONR+CfIifUiKxig5K5ukYg=;
	b=X2+F+nCahQLYZQTb9+QFzkpkr4b63lG3+d9UcCnolMbAb/Imdf+ndMW5Zx3/kLQrhCEz
	 Ebpj0eg6qMEMXTjYVwiONUVHefxN0vNQUmElN700itW9+lOFHWrsy4sQ+dI0v7WyNDYKR
	 j6A8+6CF5btqkWTVifdh6zIgRKKOAzh5zyumMdCxMVle6Zo+MHIRXFsjEgfO41kEC936k
	 Ce+fBcy/UAT0qT6W4IB2ZQFqX7uLAp804JFm4VYGMvavFQanSC0qHAbfOpFXQkPvgnkfj
	 rTsZOtXuemBZ2dhOY7g3EuYlROSDdhbI/2clGWXxsAk7lS09belmJTLkOI+sVR16Xww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="gXg+FH/w";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fjj7+SNJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="gXg+FH/w";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fjj7+SNJ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7889606A327
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 08:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7889606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gXg+FH/w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fjj7+SNJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gXg+FH/w;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fjj7+SNJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 167F81F7CE;
	Mon,  2 Nov 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPfC6NxMQZ8tNG5IkVHkOONR+CfIifUiKxig5K5ukYg=;
	b=gXg+FH/whCpv4JpKVArdgJ0E70FkRdH51DOkoDbanP+hN0E2Gq8+0fh28SRlRIXYkSpx+V
	WVDiD71Mb/6W1R7CqHEKKMrCs5kUbR33KzaqzKsTWj4NhhJuibatwHof8xD6hfhWot66ig
	o4cCNGWhE4hkittpL8GzjUmDV2ghmQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPfC6NxMQZ8tNG5IkVHkOONR+CfIifUiKxig5K5ukYg=;
	b=fjj7+SNJdNZm8EAx/a5caO03MeQZyySRuZ/XpDi1NaioUbN6Zf3q44TZCkRxy9cNhzyn2a
	nKvl2EWJ6m9L/bAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gXg+FH/w";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fjj7+SNJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPfC6NxMQZ8tNG5IkVHkOONR+CfIifUiKxig5K5ukYg=;
	b=gXg+FH/whCpv4JpKVArdgJ0E70FkRdH51DOkoDbanP+hN0E2Gq8+0fh28SRlRIXYkSpx+V
	WVDiD71Mb/6W1R7CqHEKKMrCs5kUbR33KzaqzKsTWj4NhhJuibatwHof8xD6hfhWot66ig
	o4cCNGWhE4hkittpL8GzjUmDV2ghmQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPfC6NxMQZ8tNG5IkVHkOONR+CfIifUiKxig5K5ukYg=;
	b=fjj7+SNJdNZm8EAx/a5caO03MeQZyySRuZ/XpDi1NaioUbN6Zf3q44TZCkRxy9cNhzyn2a
	nKvl2EWJ6m9L/bAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C65E2134B8;
	Mon,  2 Nov 2026 08:54:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GiB4JtZP6GqETQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 08:54:46 +0000
Date: Mon, 02 Nov 2026 09:54:46 +0100
Message-ID: <87h5hz4nqh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: scarlett2: Support Gen 4 firmware 2432 and 2449
In-Reply-To: <cover.1793207190.git.g@b4.vu>
References: <cover.1793207190.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 167F81F7CE

On Wed, 28 Oct 2026 18:54:21 +0100,
Geoffrey D. Bennett wrote:
> 
> Focusrite Control 2 1.1210 updates the Solo, 2i2, and 4i4 Gen 4 to
> firmware 2452. Firmware 2449 onwards moves the settings the driver
> uses, so without these patches the driver reads and writes the wrong
> settings, and the 2i2 can lock up until it is rebooted.
> 
> Geoffrey D. Bennett (2):
>   ALSA: scarlett2: Allow config sets to override port counts
>   ALSA: scarlett2: Update offsets for Gen 4 firmware 2432 and 2449

Applied to for-next branch.  Thanks.


Takashi
