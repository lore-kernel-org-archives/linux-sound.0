Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129015;
	b=E/aMibn7bLWyrY2p5/2opsqmxdFdJ9wEK3bjxYQE+C67kGDveRtsFodMMNKWW8IbD11A
	 Vy+IlJ+iKMIkMJgxHaZn3v3AMV5G6c/vdoBF3NlyThNNKVmCnZ0w3By2E7w9ez6qolm7B
	 rpcntlA8ILGtLOzcpecewbRMvjWOZhVHBckPT1oyF2P2K4t8N8B8D7ezpONfpX5mo864Z
	 sbmRa8b3S3PoROnG9LwL5K6C9MTPAW8gnywEPe2i6HYHt3TADO6Z6cHK/oHaUqntGa80O
	 f2iu2zrvLuMVE1rGr7UE41fGJy8y4M7mtAjjo96VdX81jzBadQWkZeTzT5VnoU+b4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129015;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qb+z+KGmRKyH2UaEELGKStSnmnPknK++vk9eoJe2Jbk=;
	b=J0yvaiHmuzQTqnbMVicL1TbqP8i8hR4TIj972OxuDZcWxVB1ZC28DadLGbaLbJcu7Jm6
	 opmHaYaqor4qwM7YAk/6pzAtAeg6zpJdGOFGYzD2ntLYqwR8ez7cXSfMyoVBaTg3D3DYL
	 spJE1Mc0uHDqvWJ2b12sgH3W5dlRL3DInCiDg53vBoMFz/9j6CGwOwAWIN3nd1ZDCd1xb
	 GUB5n8RuU7h/+fbrcL6RFo09BbaIhIoGxDdPEUWJI1IUUQW8b4mencgyW9QHuxVKojCsZ
	 d57bmoLkEXpcubReLCalCrUEM+p1u9uw2fDubl2yVPVGffYNZ5bfar2t4eFQ89ZNLJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b="10u/iijc";
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD72606A324
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD72606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=10u/iijc
X-Virus-Scanned: by amavisd-new using ClamAV (23)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793129010;
	bh=qb+z+KGmRKyH2UaEELGKStSnmnPknK++vk9eoJe2Jbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=10u/iijcYxftUuwbWRStM+9nF614qigXRYUv/6YsuxkZIINqF//KF6F3tabhVAZMC
	 MPtTv8EZd6DjHkr9dseCpRZe9IjZ9VLcDgy5esxhKkFyzw9gegyq61s3zzraM3mPqa
	 La6InVFERajdyn2Dd039FsHlKCyUnR7+ECaDfgTrp2WtXPZUVgXTd4Vz78odm8UFpi
	 4wPGSt1LZtxDZ8IksmQvT7dO54KNN4wQzP7u5ZX12tHTVRepct8+rWbOxkyztd/CYO
	 Ft8HmjNIYfaI/F1FzhxykoQY6IFvLV1fX3sN4O+8Ea+unpiHC2RpfooDDJ7WU3N10J
	 aSc1Ce0Su7UMg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 5CE991BD758;
	Tue, 27 Oct 2026 20:23:30 +0100 (CET)
Date: Tue, 27 Oct 2026 20:23:29 +0100
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/12] ASoC: codecs: wm8994: Implement set_jack callback
Message-ID: <20261027202329.3d148492@milkyway>
In-Reply-To: <sashiko-outbox-185729@kernel.org>
References: <20261026201915.57184-1-amade@asmblr.net>
	<20261026201915.57184-4-amade@asmblr.net>
	<sashiko-outbox-185729@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 20:34:59 +0000
sashiko-bot@kernel.org wrote:

> [Severity: High]
> When snd_soc_component_set_jack(component, NULL, NULL) is called during jack
> teardown or card unbind on WM1811 or WM8958, wm8994_set_jack() passes a NULL
> jack pointer to wm8958_mic_detect().
> 

On one hand yes, on the other current code doesn't have those cleanup
calls. It should probably be fixed as a followup series.
