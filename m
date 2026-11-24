Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524193;
	b=NX1sEs4KE2eZy7ezatX6zA2At/YVPpKGmQDJLV74NC/f/Dxf/dV+Z2057MeQI+1io5mt
	 LxSs6imoi9gfaHflfkFoXH/SkfoQZImPlOmgWvDwT/2597VmMJWoq8BrDWgkU1Lnt6an4
	 SXU6sklOFwtn6IJszLJd3DSVb0P+UOeIEVw4Qg2rwWfmcZ5Wkn6i4UXcSCC7MDuzabe2N
	 +O9NOBvINiiThgnnI2Bp862KmAw9XRtUW5CJNgBQ8YySSR3ypkwnXQTagXWBMOP0HIikn
	 q1nIijS2dEYUJLVrb8tKJp4ry9yAzNt46ynfDTNSOshq774HbgjiOxhpgkz/JQ0WV3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524193;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=8UNHwkdaQB5yIX4eU3brjsCMy98sleSsU1Z/42N7wZ4=;
	b=oqm80FHnxWTtGUtQczWzi5Xi9aBhFKSYaTbw+VutVIg5DdTpy0mYJVcIauLgdKpH0LXu
	 I1KDww7gU88cGTGZfjcXGgyWBk6vLDFf1bKErSeaWcqzpJ2JznOysutzgbhmrRJQEQthO
	 MaV/AnMHCRmn5d5O0D+sKW6zsunvOoCA8tmHX24ovVb52JyAFYOlmCoTghs3yrD7dcYW9
	 ClPrn5C088S9I73H/VTpakGaWiZEdEbETe4RsbhJviaF5q1S6q12C1vo9CTm253bHHo3T
	 qW9Y9Sh0B1UBtGkK83dSyHwxXBnt1za3Mop0uDRv18N7pFJRUtZzV8kaSXycyceflmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ZX8Wqoz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qSWBDsKV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ZX8Wqoz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qSWBDsKV;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F73606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ZX8Wqoz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qSWBDsKV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ZX8Wqoz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qSWBDsKV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8FB42205C;
	Tue, 24 Nov 2026 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UNHwkdaQB5yIX4eU3brjsCMy98sleSsU1Z/42N7wZ4=;
	b=1ZX8Wqozh4Z//vn6afZ9fEVYPTOw4u9+YXKBx3eXsyh3GOllM5U3pE1+hDlK0FfcaOnwSM
	5faWoPyjR/Y76MAqisiU4DXzGhSk6Jg1cBSM/NjovParUsJhw7Fsbm1u0SrvdQfFbWk7rM
	P5PZyCL3VVSvrhLZCyGWd3g4FAmXEVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UNHwkdaQB5yIX4eU3brjsCMy98sleSsU1Z/42N7wZ4=;
	b=qSWBDsKVFjXuaF89ZmqN7wIwt4zvyVxJwV1yIlMv4Ed/J2zw8tPPE3puvTkThD3xYATYE2
	bXAz7pSKPNgrEIAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UNHwkdaQB5yIX4eU3brjsCMy98sleSsU1Z/42N7wZ4=;
	b=1ZX8Wqozh4Z//vn6afZ9fEVYPTOw4u9+YXKBx3eXsyh3GOllM5U3pE1+hDlK0FfcaOnwSM
	5faWoPyjR/Y76MAqisiU4DXzGhSk6Jg1cBSM/NjovParUsJhw7Fsbm1u0SrvdQfFbWk7rM
	P5PZyCL3VVSvrhLZCyGWd3g4FAmXEVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UNHwkdaQB5yIX4eU3brjsCMy98sleSsU1Z/42N7wZ4=;
	b=qSWBDsKVFjXuaF89ZmqN7wIwt4zvyVxJwV1yIlMv4Ed/J2zw8tPPE3puvTkThD3xYATYE2
	bXAz7pSKPNgrEIAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97DF01339F;
	Tue, 24 Nov 2026 12:43:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8nDPHF6GBWtYEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:43:10 +0000
Date: Tue, 24 Nov 2026 13:43:10 +0100
Message-ID: <874id6bdsx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lord <mlord@pobox.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
	<b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
	<c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
	<87ik1ndgkp.wl-tiwai@suse.de>
	<0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
	<874id7d336.wl-tiwai@suse.de>
	<64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 23 Nov 2026 18:51:47 +0100,
Mark Lord wrote:
> 
> On 2026-11-23 09:39, Takashi Iwai wrote:
> > 
> > Are *all* devices including both HD-audio and USB-audio gone in the
> > broken state?  You should look deeper and compare in more details
> > between working and non-working cases.
> 
> 
> I am using the Kubuntu Desktop, and the Sound Settings in the GUI
> show no devices whatsoever when it fails,
> and many devices when it works normally.

When this happens again, check what fails actually in details.  Were
all kernel drivers probed?  You can compare the kernel logs between
working and non-working cases.  If they have been probed, have they
appeared in the device files?  Were permissions OK?  etc.


Takashi

> That includes each of these:
> 
> HDMI/DisplayPort 1 Output (Meteor Lake-P HD Audio Controller
> Speaker (Meteor Lake-P HD Audio Controller Speaker + Headphones
> Digital Output (S/PDIF)(USB PnP Audio Device Digital Stereo
> Headphones Stereo Microphone (Meteor Lake-P HD Audio Controller
> Digital Microphone (Meteor Lake-P HD Audio Controller
> 
> Since none of those appear with the culprit patch in place,
> to me this suggest something is locking out the rest of the probing.
> 
> There's probably a better place to look for more clues,
> and I await instructions.
> 
> Cheers
> -- 
> Mark Lord
> mlord@pobox.com
> 
