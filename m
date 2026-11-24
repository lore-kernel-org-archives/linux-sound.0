Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540098;
	b=UXhuGCOifVY9zuPMPawIU/Owvi7+2aOksB3DUdV3Q6EBG3ndm4EvAeGvHhyD2Oo17DR1
	 qLive6nsVtITGFv9DhXUGkWdpfeGvz7PaHsCmPRuzzx1yT2THl0BjZItZHnC2cxqUFP1z
	 SFmsRCQoHHnIsnDLV3i4gDY4gJx/kQVVjt/wOxgN2I40Gk34NI6XLQDeUj+RlHTTGDzjM
	 OYgWVF3fPQ7lD/StJLQ4giMGNz1ckGmpsUiXi3Htlyu9m1/t5igOE2CQqNLoYjjV/vgBC
	 dHh2OywebXbxTgjbvKCU8QoAdYsr/dLmjDvr2ezPKDPpWFe5zw4EB5bFoQvcsmHKrqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540098;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=byvNNUGwMzyrc7EMDGHQLkTSZj88Bg9G6wmnNp2pa3Y=;
	b=lygHcKmtisquv6Xp85ih5i37H3vTDYcpQTe8QfU/Uy9zpTGtjyBzjc6KEFRLDJ78cBF+
	 q8nxvzUkfs+3Jvxwz7ORkLaDibQ7WedMzT7L3fFwgd3SDFrMMH6vn308Enkf4yc9d52YX
	 VQZnNIDK1/ARwhG5fHuHZXjb6QDYCo8/aSPHak9L/sc5G2PsQhI4K/i8pi7R1/yjlRt5X
	 F6FwVeBsfFXR4YxKwdpjA+o86Qo3CUMRUKpPO9Nsnv8poceOS5ZLBT4kmH5TXIULuz96D
	 8ApqWDd5SyEU16nMBq2R04u0GrronDgsGpzdhxe0whB00VGtPNe4FRdmzI3Lf0Gsfog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=dHOW2YWa;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gzsjwHDI;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27470606A69D
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27470606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=dHOW2YWa;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gzsjwHDI
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 503FD7A0581
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:08:17 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-01.internal (MEProxy); Tue, 24 Nov 2026 12:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795540096;
	 x=1795626496; bh=byvNNUGwMzyrc7EMDGHQLkTSZj88Bg9G6wmnNp2pa3Y=; b=
	dHOW2YWaW5Kp6noYukH9e3knyXLoVlNgmyQO+o2ZLQgPJiUmWYv2oRb2gp8z+TAx
	Mp8pRa4okv9goCGy6h+5hnkfU1GZpQesV/iYiFHb+GlvJbybTpDIlCzCPrLtnl3S
	znUMucC2Dl5+UN52Bls/kOCepjQXwwlUlk4rWC/VfhYDQJzYFnqKrQMvYBqHbMBA
	91KbiQA8JpPSXFWSfzxmHzkdHh4V7xxa5azi7iOjQVMRRpyVU42Rm9cBVB6DVaG3
	Sv1F40oLjRm7Je75zrlQQvlubsRhiUu4qWIsYXMOwPm8KuhUVju+7sd8HWgQLFsa
	yjUe5ozOkvPijBprSkFtCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795540096; x=
	1795626496; bh=byvNNUGwMzyrc7EMDGHQLkTSZj88Bg9G6wmnNp2pa3Y=; b=g
	zsjwHDIf8EBGVrlfAniKIcm5cRWLhZJqiAQHkz/ecBp0vBdRFypGLvGbPPnXBboB
	D0ih1H2mSqYXjk12F2ubTU312ium8IUJtf++05BejtgxcgSUwFKLMZIOD5QsmWZi
	seI22TeCVeNDM9TgCQAcxWzipfqaZr2C3CVtyjgNZ9OWKW2k13e+4bMT9vP/k572
	VjTIVVXZ4N0yN1X4C4xL3j8+y3znB1pwzBUhrwkzg8uYLthhGjD+ZCWmRbYV1OE8
	BK6Jn1ynlQnssG8yDy3l7Ej1sCW3eYBnFdsz510H35X6XR+0Ib4uSUEedJ4zfaoL
	tv32+TSvtX43VmAgGFwRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795540096; d=pobox.com;
	mf=PG1sb3JkQHBvYm94LmNvbT4=;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:Jt0Cy+Vu45zwPGO91agYSO4uChbVGcxjiIBSmJ38sJ+AoyJ
	R+X/mgYzLciyah51GWDhEfhpy91TVuR3EKvluyaXNSNpRp0ykq6hguuvNf7eovAx
	mdCphl/1C6C4BlzitFgnT+df8mFt4bJKEOSiWeDfOu5QJ0VxxBvmzJKiZ7q+V4vx
	zS4q1akm8pZbdeS0oJzMTwdI8zrCS0ncUlnz1bOtpN6jgAuwUGeWnFRmqboIHOhu
	qWvVYmPU3rwZqEOeslcmEUu1ey3YRXMuXKTLuxjVoT6guagV097WIe3plWU9l+QY
	our615Yl1lUqf9uIDVh8Btm4Qswx9upZm8+Cjnw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:C3cqv8tZk8f7dpLwVOT6dUJuUaIY22jDxBhvzngEQjE=:rfiV/GtkfDtYiQ8x5lonbfbG078sz0O6POxlCD02Jeg=;
X-ME-Sender: <xms:gMQFawW0J059hayvBwkRI48HlqnjIHyU-PYKmtAPLgYM7Z2LEOz_YQ>
    <xme:gMQFa8AbEu_cpQ8HVkPEJNUvRHTOMT9LYJLwsxTrqVsGCAGeEjJEoIFhM0Yyv2zIp
    Fpbi3P6Rkc9Q651bKac4J-GJ4wU26CNxitN7kldYEFD0cmMln0p4EAwQg>
X-ME-Received: <xmr:gMQFaxxZIlmNSb-5We8Kqw-cfPSO0nxQaBTPVR1YafHoI6WUy9tb2ese7os>
X-ME-Proxy-Cause: dmFkZTEhQULKDtT0lfXRlTvEl+okrz9YU1J0yFhHhf6NC/xwx4bAB3L1cDqAHYa3yMs4A+
    kTSxjFOsHFZXBeDGFCg9V9XRQEHrBAWjGz1pSNds7g4+I/adK8G5GP5LhJzV3pjQL8M4P0
    SzQn5C4wJ/DbVihZ2NVd8qLKms4tjB7fVLlnvDMoVM2uou0NISz5eml8geOKOFXVwk9DS0
    YgqTf676oyOmp3dshYpOnoEin1ChNYaUOS60sW4Gi03K9iBTFYd+xefiVwUE4HudMDk3/Q
    o7jlThFC89wroYtJdelpJ7s2NTS7llzKW95C/AmsCi/TrS72G1s/ekAIKH4FRsEcGHSUb/
    IFOCYSajMktaYHzG85JIh1k2xATgxKUe/JnZZU/gnZvBULU8R7IWNVOkiuaX2rZvJGiG0v
    ACTKsRuF1YR5N/fo/1yXBTJDZSyx8dca7d9yaIOG3QgDdwse3diOqlq9524crb/upsnZK3
    8tAHr4acjVO042s/glSaorknnxopXAfWpfZrGlNxXc+AvL9bkVUTWBPtzp3nBNVn/UuGMD
    EsDD5PI42XhWHzh0yovNXttVus3YUg4xNrIFkPS6mt1jKP4Gb3xwwOzt4+xZnE0RLwdqs6
    jupnaQyc7T17oKfk/3UrU7qe4RGB5hpxbIcy3lQsyhyrJC3yPXSNnJVcOctQ
X-ME-Proxy: <xmx:gMQFa5CcSSboivFaoeAhDMuzTn_XECrhd-FO5IuL6kOOjjY25yptdg>
    <xmx:gMQFa-aEIg9zT18odQf8yCGDeb2r-2j3TxcnncHySu-rxcizSx6BAw>
    <xmx:gMQFaxi7sneNj4Q_kD_J3SRSYfaFCVmMA4aPWpRypUdI_GSuo24HqQ>
    <xmx:gMQFaw5DJEPIPwvklvQjUCB9nzlWJRwQNW4nNquNSDvE9GbnTJrGjw>
    <xmx:gMQFawD2z45t_eN6KWLNd2wQGh58AsomAKo9CpRN6VCZ0uQmknULd8SO>
Feedback-ID: i55d94976:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 12:08:16 -0500 (EST)
Message-ID: <f136f37b-6423-4272-82bc-86755afb1858@pobox.com>
Date: Tue, 24 Nov 2026 12:08:16 -0500
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
 <480cc2f7-999a-4458-bc53-7badede872df@pobox.com>
 <87h5h69u0b.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Lord <mlord@pobox.com>
In-Reply-To: <87h5h69u0b.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-24 09:36, Takashi Iwai wrote:
> 
> Mark, you told by yourself that it could be a timing issue -- which
> may lead to no kernel bug in the end, too; the git bisect result could
> just be a coincidence triggering such a problem. 

Yes, it does seem to be a timing change or something similar.
With the alsa-info.sh script, I can now see that the devices
are still there, despite the Desktop not seeing them.

Restarting pulseaudio at the right points gets them visible again.
So for the Linux-7.4 stream, a userspace change is required
to maintain working audio.  No problem here, I've done that now.

Time to leave on holiday here now.  Back in the new year.

Thanks
-- 
Mark Lord
mlord@pobox.com

