Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530060;
	b=AzJsbkMnCvmMpM2fSiqugFFp8gz/WTcaddif5iV92uPKb9S9QiqKSQuP/U8fRJj81w6T
	 12cgXEEOks92FgH41+6/P1SXu5PhQzdMSjGSnUOR+W+b78EovawM47BsUEVFIZyt+MHJd
	 d2hyjwrkzJxfBxLciSnw6IntIrZ5VsA3AMQbeadDJdzRn7fMHwqPvCnMfF6g25H8IZZTH
	 8L5OP3CQZCFxA9mQwgHoo3U20B7TbCFUbiQJqQLXAbGJYl2Vk4SQ0bF0AF8V2SKUsksuN
	 9nzEagYl5XBUHOlZZXiWqID4cUv3Hbj6w98lxejIgQPi/t1gy0qSpelnZzKq3aAuJQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530060;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DAH+HS14aQ7mk4bJwaTWbSKy1Z5lzV6tvMUg+Se3oQ8=;
	b=JlJZeUbjzd51Ronw23ZAL28ZYxHA+U2xjkgWF1BeS5VMmMihE+vBziNJjG6z75JKmz3m
	 vHAbkBJlbi73c59ItgMc9iB46gy/o5yZwX2EyDKWSeoTK54YDNcl1fnjJ5jr9pOFuUlao
	 1QGCBI9cAgIZQ//BXQVnxD8x9eqxv3B8AeGqjwOPEYNSXaVDYicz3dGxEyPk5afHnxNXH
	 FLNlQlHnvRpknc0aWvPL69fqm01k+aoQrgxYmd1dXFG01Gjorc6P7y+914enX6yPG5W+p
	 kAsQKYj9b3IE7LnVexWccjJfD8i47LQgIvuWby9QyxRV5rcicnsmnOjqDDQSSjnedaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=FAPjbWaS;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4JeEakfN;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8006606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 14:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8006606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=FAPjbWaS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4JeEakfN
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D56387A05A7
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:20:58 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-05.internal (MEProxy); Tue, 24 Nov 2026 09:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795530058;
	 x=1795616458; bh=DAH+HS14aQ7mk4bJwaTWbSKy1Z5lzV6tvMUg+Se3oQ8=; b=
	FAPjbWaS01pnd6V0NsjsDjLHD4wdeucrpo8zh+w8H8cwBC3Jodzc+/BBH2XInQhx
	DAsvjsJWlsNjpMg6fncexhXa66FHd66CpTlX1sgS5FUXR+yLvnrSZOOOiYGej8rc
	/ai0RwKyQqhDwT4bIWdEM6aLCagByU7Y0LFaQZ4mXHDNZ9NhJNfYnYO/FLrJShP8
	9+u1lfaeGTqBbhEO15GxeJKIXUFPHySprLkAEKpVmf4vR63fSNKB179H+WgMatrq
	3chRhg6JLw10vnqf4YNT78sjif+VFE4AVILOrAqr+Q6QJ+JAt9wwj+jYj8zKGZ8d
	uVSPhAMarL8UO3JvQwObmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795530058; x=
	1795616458; bh=DAH+HS14aQ7mk4bJwaTWbSKy1Z5lzV6tvMUg+Se3oQ8=; b=4
	JeEakfN9YcNtI0lFDst7fkrZ8uqLUrQHy11AmofgC1heX/MO7SazWni/27Vyml88
	jf2K5pgc0iBfb6bIrYZg/BI8H8EesT/jHM1Q7zTQ/2kz+fV5FaFbP1bb06HAMn9L
	X0XMjpbtp9jspd6xJc6VkRWSb6KvhHT04x+o+dVtHZ8WV7Ok+cZfHI6v/CsTm3Xt
	1TqLB8eLJsZl8nARGx250nbSFXSIHZw3Kl6Gc+6hXHTN2wOTFvI6JemKX0Wf4Mdu
	P/yreNdUESbTnxv6Ggr0hsBxZodGyTsyK8y8th1zZxRLlRlQugII2UyT2BvPUNh+
	hPx+1yUoVerd+N54KrnqQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795530058; d=pobox.com;
	mf=PG1sb3JkQHBvYm94LmNvbT4=;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:KK6HHGPnAwrES3hx3Z8Erd3D6nNh7wZcqfPDQsPSepruO6C
	ro0YGg+wbTSP36AB38aZAPnSBNhuh+p1sAul/bwEyCxpINPuMQ6pRDMdoDvsYSIC
	bPk3sz72Jc6WA/9oVowPUcXmRrRk0c6l5uUSA+buuvUEynWJWmlpjcM5NX7DyntE
	VrKeeF80bE5cIRgjdAUbUr7Bpg7Nok2+RrjtGk5BXG49L30PIrewrcGWjfn96skp
	73XtTvguKocerUSUQscRX6TjD3Jlo9brHLr5tZIjB0LeL7kKye9eaJY8+FlDS0Vs
	cxTCz4VVZjYlAqvZR2kV5kQCDUJMYPDGmC4ShKQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:87NGkxohAryKu+U8ceNks6K+L9heNEqQQGamWjET5GA=:5p8lz5LM4AZAZy5zTOq1BKQLxOXC9DnOF2GDYD6hNfA=;
X-ME-Sender: <xms:Sp0Faxc6cFEDmm7T83urENhwsKxjEQO2BNhp91AgwLQsPOSJnvZQUQ>
    <xme:Sp0Fa2pd_7E0zdhlBXZtxrt6aHFT7xWGpClTSwYVSXEqGjJh5_n1M8gXGTTjNyqhT
    Az2kPRH_dx3KQyNqdes2MQlylPmE73YCHCTLv8w2Gu_2EMPFwR_1JM0>
X-ME-Received: <xmr:Sp0Fa34K3nV-hz6Rn40XhyrGJ4UjgcRRD6kKkCllvu4gT3CirhKTbZuixe4>
X-ME-Proxy-Cause: dmFkZTFbVqGScJQSNyuxum7a9OOnZJmdS7+GFjxZPOb3b3WIXgHLDJvuoAiWbKprlJT38l
    ylZ8FnGFoTMi9T2v08plc/584FETYBifSYVEIuYyXQfU14r25ds3XB9s7NtEyYnMNgVOKa
    NI8++P/gqQP60anCy1tyGfJLHwCJwM2wywGM+36dIBOSdK2KqeoCFVmBtYN22z8SrMSwtW
    eQ+M7V+jXCYPSNVks1EA560Cr37lL45rMWzj8v/Afxz4LiMrn5NiqTTg/46+K0wnjnopCt
    UW8BKWVNWob0l/7tb1Cr0b7fTIogUmP9vOtxBsBrWhT5WDZhXM3powkSlT1uHPWNuFnWmh
    KlFU6/F4CdFAM+rxY8LbWAv/8N47PtGrNjYpJ5zJNWMdBEBRh9l+j1o1ZMltatTILa295u
    Bu6bobe3wmDiTpcXRUD39oilgA5Vyf5wXghwOCkWQatOknaldphb/MtgxRHdklYmEKD0JX
    qnoHElB40YY+Zcw/dfb40IwBmX9VMXdfT0NaSlV3KWzsFVEyzJS2IsPSW31piIXW9j6Eim
    80yximQn/X+MvqwWmXgrnBus9v++mef84IqBsNFBc/bqTGBDqT8XUXhqMhU7mSTMSlMQZh
    1trUjMCX4w8uosDTf8sPPNARaNlGaK91J5nM/iPhFJjZyGnX7LQCaQwOjTEg
X-ME-Proxy: <xmx:Sp0Fa0ov6oXnBlaRqi6EVKQY1n-W-7zDXGxikFOVzakUTfRLS3pmNw>
    <xmx:Sp0FaxgazJkXjfJcTsx3AlJ5p9csdHELlnPgwyb0ycI6VtKMt7U3zg>
    <xmx:Sp0Fa2ItCsTIU4UyGZXAZp6X6P_qXb_oIScysuyNL-KMlGAcAsry3g>
    <xmx:Sp0Fa5BoRt02iDHDD9AneaCLabPgsjbRMPi6IuWLiKO-asjGnEb9vg>
    <xmx:Sp0FayowVuaVzir-WNiEr6L3iE7xFTJ1ROhcjM0pmW_h6RvBd6niBxHG>
Feedback-ID: i55d94976:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 09:20:57 -0500 (EST)
Message-ID: <480cc2f7-999a-4458-bc53-7badede872df@pobox.com>
Date: Tue, 24 Nov 2026 09:20:57 -0500
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: Cen Zhang <zzzccc427@gmail.com>, linux-sound@vger.kernel.org
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
 <b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
 <c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
 <87ik1ndgkp.wl-tiwai@suse.de>
 <0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
 <874id7d336.wl-tiwai@suse.de>
 <64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
 <874id6bdsx.wl-tiwai@suse.de>
 <E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
 <87mrqy9yfk.wl-tiwai@suse.de>
 <d406700a-4a14-4f47-95e0-72704544dce5@pobox.com>
 <87jym29v9q.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Lord <mlord@pobox.com>
In-Reply-To: <87jym29v9q.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-24 09:08, Takashi Iwai wrote:
>..
> Those are about user-space stuff, and rather questions to distros.
> For further investigations, you should ask distro people.

This is a kernel bug, demonstrated by git bisect, traced to exactly one update.
I am using HEAD detached at d1e57f8fb7a6 for the point of this patch.

What I am doing now, is rebuilding the kernel to the exact point of that commit.
Then I will collect kernel driver information about the sound cards as best as I can.
Next I will repeat that process with that single update reverted.

The commands I will use are these:

    pactl list cards
    cat /proc/asound/cards

And any others you need output from.

I can also patch the kernel with additional diagnostic information
to help you figure out what got broken.

You will have to provide any such patches here, as only you
know what exactly to look at there.  I am unfamiliar with the innards of ALSA.

I'll reply again shortly, after rebooting into the kernel at d1e57f8fb7a6,
and then reverting the patch and rebooting again to collect info.

Cheers
-- 
Mark Lord
mlord@pobox.com

