Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353477;
	b=B2o2sQHFGktbIkWgQHuoNDgvDNCRk733pGwHvJAZvnqprhfmiF/nOiJQHM5rV11sCiO4
	 SnMG3t1/ZYhbam81SB2cPRNPi+ejqSj42IO5WFF1tLlihKNqykRhY4hGkjZQf1mtuLhQe
	 cjPS1N/npMZOy9vy3kWDE31i8nT35US4FSk5+dO0XMoPfT59qLyKiYySaHQjwhSISQAOU
	 INy3AAMhEo0fZ8OFoTWFTKbIaPdETUlQjvnr/xBafbaEp0ghcp+psVwPc3KxLrEeLNDqh
	 gBfj0zssrdwSsl+A3R+hL4VNYgr4ufOUtPtjgaSZ/C8CWMLgoBbE1+12a7t4W5Bcbng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353477;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fvlZSAhLg8bGLT8RqiJpA4DYdMhQ5TtKUqm0SgXDsp0=;
	b=RSR9j3gF1r4SdYPIe9QEXdCHvQEVmDX9ADsabpqVHApSCFGsM0tsnzVSCyzkNEfeXd21
	 7KdNZhhA2R/6IiF/NogSf3IwJTjAjwHG4Tq91uqW3R2I6K+vZeo1/P0heChgTBrCljMzt
	 uYFGD7S3Ux2Oa6SFNLYdoxirx4RX2O4bBIzetCqIVd0jjIq+AHOhSjxh6+VZM9cYmDoPO
	 b/lQKz1xQ7pshtPDe6S5eQ4/wRCQ+YAadDguxrjdiQCmw2WS4krojTJxWYoBCpBqatBE0
	 LZSTKMTu0QG3y06AotMQ0gXf5IwMoK33V5NIhsJcRMXflRmz2+IreZTiwxHtPkuHX3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=f+xuSQ1c;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=t1R0q+Sn;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA54D606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 13:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA54D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=f+xuSQ1c;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=t1R0q+Sn
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4B9DE1D00536
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:17:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 22 Nov 2026 08:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795353475; x=
	1795439875; bh=fvlZSAhLg8bGLT8RqiJpA4DYdMhQ5TtKUqm0SgXDsp0=; b=f
	+xuSQ1c/zfJNpkM2PsJBR96mc5ccqZghivv6GW/B+3dBoVevAWmiXWFbf09cOuHN
	Q1AL2vMW7gh46AE+nYuv5h7l8cenmGYndBmHpg/VRblFNCsvRUhCXTol2vfhu2zS
	JVi5k0Mpb1vOVg/wZbUrnoMWF7EJaAKr0gaN5wtL7Zqooa4wbzFbueUz8Ae4j6Jf
	/YsYO1kr9u2GYWN0LgVBdgkoZr8Da7Qpxktd5xclALh7FR4diNOWzJMVvb9TDhUo
	0aGQ5XEn/xtGUg6kLQ+1BHqgixeZFkMA+Gd3hHn8M0gfG7h029qcl3ZAGKXJrYA3
	97LTUvu9w2yx/9Rpen/2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795353475; x=1795439875; bh=fvlZSAhLg8bGLT8RqiJpA4DYdMhQ5TtKUqm
	0SgXDsp0=; b=t1R0q+SnMqTsR9ADrKfBQLIkaY1+am9wLODutoKOM6DZYtRY2YE
	7MTLPrKzwXPruLcUEamcK86VbzwvIJOqeLgDVTIoNARoDYIDcgsGZTZ3jCMjvL3a
	84MbmTYk/gC+P6ZJwaoVEJ+YSwvuSLhZDS+WxqL36mRh1P+8aG7W8naGMWG22aHG
	6/smWNNJthK+JjEHuUtjGSKbwTbdfBzRuM140pkzDKIPWvMhD0zR90AkqDTOjkk4
	zRzgLHMQBEISimLz6/t69G2/r6g7RwJsfpIZm+8ZgVTbJoQDcTT/gMahsNjgP5Nz
	+H37Mmsm5wsS6Hu5iKFkH+5xeX/UmXX3CUg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795353475; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:jpRNMIDQaw9r+Pst0KgQ43mev8zcDWzsI1EOoK4qW4j5QNV
	N9dux7Ycu+UlEgYoVpaC5fE7x8eCjs6RC6VYcVIf86mogmeOxsq0hF2vgiLf/8f8
	1KSarzfDJi0W+MRKIyiXFN5ARlfxt/HvMSjuAtC4z727YKvIho6r/+TzX1hrE1Ft
	RnlGa8FN7sdLL+Zadewhwx1xFDKdFqAnfGOixh7+eO947PjGgGZ5bOm1+6RT6QZc
	B6kLaM3RF2ZHh07WL63OVmdwussnKvbxbN2YjCgDtHl9ORS7wBVu6+FTiDzN1VMI
	zxWJM32lABK3T59qeirRRyOUxkHJp7RDFYt0AFQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:s6utCHA9jdJTqLDk2uXgtAer2yH44WFHm6vSz7F+G3I=:VS/nq5N4SzRG3f/8cSJVJJ+NZhA6DMRsT9d+DC4wnWQ=;
X-ME-Sender: <xms:g-sCaxwAQ0CdU_e4mHZEsiGE2u10xsqHgCBzfV0oUqHf-yDICKTGCg>
    <xme:g-sCayxeEXY1AYMX2_O-g3D0ek8Qb32P7r3XTpOLQ-MS8JiDTCltyltxYEuAKWFhY
    JIO2ZOTWElKeqFK8gk5VNCDRfGoK32IPabOksxcKgr_thbtjSX3y1dn>
X-ME-Received: <xmr:g-sCa7Zdpg1avQ6fAoapLhtALW9t2uSky6OR_dAdwZRepV1jBGix7ByH--AHhBvdNzWpMETniOhN4hp-6MFUOECXU6N95w>
X-ME-Proxy-Cause: dmFkZTEYqN9yFjYv3FbVdjdtpM1yDm6I1a/l6r5fmpFrY3iRgh54NkgL1+D8AATMbs0sBn
    tyYqSI2bp04DFSAx5ZZWVEqdM299z/7tcfDZJB/WX+tuMC42GQKkPw7IO/yjAXZ5WqX3rd
    AOx+gq3iblDX1cVfV2AQzHHVUlhUOZHVh12fHPZLs9IPmdBZbA+2qM7VPW2Ab/7QeFrXDo
    HRoLYinXvqeHxPqpoKAbAHWiHShtALGNPC0QyMIZTQd1LXeHeCBC2T3lqbPTKUT09EWt0A
    Inf24KSfwsh7bvT2jXS5q4TlnE85+AnTcZlj20+es06FmrI4uLzrKY0Gb1brNeFaSFsjVP
    aMyQeeGChO64xumarrSEY9/lZqE/2kfprBn87wGlg/P2zvKB1/yTyXhXPlAzrTxEji+Ogv
    OouKoL9x/ItqsrzaynALrrpzCaWKDFF9o16McCrHJpL1QiGcBdXeDqHV0nTjFlo2hMJcEo
    OzuK5RAjaej8n6UwRoqS2Q2xei91Xo1RwieYh+lFWktwUMv/96XIQZgKObteSZF5+ZAY7C
    4fg0mh8dm3MAk/ewHNUODo+sxGM1iAqgJAKdNIhlfXOwwgIOtu5plPDB2yGtW9YUzvxa8U
    SgFswWdwR03zGsjdmyKq4ZZFJmMXnFfHnpOc62XmvbnrIJtSco3B76MHcgsA
X-ME-Proxy: <xmx:g-sCazXEy4NLSF15r4-ncUzfNFaiY4NRZVVox_6o6VnryEE6Rzyu1w>
    <xmx:g-sCa5hwH12NFfREvURR32VSjpSkbDtC_frvmIudbCZXou9U7O9PLQ>
    <xmx:g-sCaxvCHHmN4or9LX_SSNKJ6FZUSTjYrX26b4rzBuseqHf2TEqDlw>
    <xmx:g-sCay5CSgsxo5HU3gHUnbn53GTU2ASSK4DILdplRl9IewNlUYQf-A>
    <xmx:g-sCa_CyIt1aOyG0Qpz-vAf6tYy0p8kIauYUIXClU4S5Boz4ULGM_24b>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 08:17:54 -0500 (EST)
Date: Sun, 22 Nov 2026 22:17:51 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: shyckless@gmail.com
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: firewire: Don't loop forever after a bus reset
Message-ID: <20261122131751.GA503983@sakamocchi.jp>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	shyckless@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
	perex@perex.cz, linux-kernel@vger.kernel.org
References: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>

Hi,

Thanks for the patch.

On Fri, Nov 20, 2026 at 05:38:04AM +0000, Suyuan Wang via B4 Relay wrote:
> fcp_avc_transaction() and snd_efw_transaction_run() resend their
> command after a bus reset but never move the transaction back to
> STATE_PENDING. The response to the resent command is then ignored and
> the wait returns immediately, so both loops keep resending the command
> after each ERROR_DELAY_MS pause, without a retry limit, until sending
> fails.
> 
> Each patch sets the state back to STATE_PENDING before resending.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> only (x86_64, W=1); I don't have FireWire audio hardware.
> 
> ---
> Suyuan Wang (2):
>       ALSA: firewire-lib: Rearm the FCP transaction after a bus reset
>       ALSA: fireworks: Rearm the transaction after a bus reset
> 
>  sound/firewire/fcp.c                             | 2 ++
>  sound/firewire/fireworks/fireworks_transaction.c | 2 ++
>  2 files changed, 4 insertions(+)

I had a look at IEC 61883-1, but it does not specify any particular
requirements for handling bus resets during an FCP transaction.

However, I found the following statement in `AV/C Digital Interface
Command Set General Specification Version 4.2 (1394 Trading Association,
2004. Document number 200406)`:

 * If the target detects a Serial Bus reset, it shall reset its state to
   be able to accept AV/C command frames. In this case, any in progress
   AV/C transactions shall be discarded without the return of a response
   frame.

Although the function that issues fcp_avc_transaction() acts as a peer of
the target, I think it would be safer to abort any pending transactions
as well when a bus reset is detected. Since the bus reset would initialize
the part of device state, the initiator should also restart the entire
transaction sequence.

I would expect Echo Audio's Fireworks transactions to follow the behavior
described in the above specification, since Fireworks also supports some
AV/C commands

Could you revise the patch to abort any pending transactions when a bus
reset is detected? Returning -EAGAIN to the callers would be reasonable
in this case.


Thanks

Takashi Sakamoto
