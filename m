Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072588;
	b=QMSEcL0Gyg0fK99A1lPkg+vi+aLsviuzk40WCJKSHqmovO37gNDisR15PMsOWWSwdkXg
	 j7mS4L5pQRtlVysMQkEhddQNOUd7GVl18R5XKOfyVHaWWfOCHR1v6h+ZWOy9npbugq4UN
	 iBMC1LHKwNSF6bCNnFd1vFLbwZW2eNHyoxs1+TJenEIPMSq7frwW4qzlMHSgE0zgTR4Ig
	 njJz6E2HTecR9cP9jBwfkVtafNriZTfzufEtBGC2mWu9IsZJuM+P7kZ3L8oEw5NNEwV6k
	 ytU3ipDcxhn+GhMHP6c8SO/+YFFAUAea3GKMXhzQaWNCUgvmsALvhb4W8mSbN+FfRgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072588;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i6xuX7LxlHGLYSStvhJZwjG7M3Bk0LU8AQm9unoRZSA=;
	b=xVMEqFHLGbG8bz4wYV04jqB1OSypxW76pzZz7UE/SwIs9sycO+WZa79aNpGI6p4m7c9s
	 JyrP/tvzXDX109dh1xH/xEyQ3uSHOUuzrb+O0q0nfAY38wP1BQxw1rq0QDpDCCFE7MdcC
	 fpzunc5f4Kb3k6yCimCgsErhpP9kcaqQHIMoSCYqmKLUDVjV4FOvWhwtKKDaN2QF7IZ/w
	 IPYKd+D5MX1xHF1NdeP66JvlKZbP1ODc9r/2w5whCaeEhs/LDwY4STCvn2N0XgxViSrNe
	 QLabgdfVF9ESV/+eeYlux/9ge/A3m+C1pMTBM9+img3vLswv1PyrDBtIsf9TBq5bTug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APmWnISR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B94606A32A
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APmWnISR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A71F1F0092F;
	Thu, 19 Nov 2026 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072588;
	bh=i6xuX7LxlHGLYSStvhJZwjG7M3Bk0LU8AQm9unoRZSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APmWnISRrnwXTCGc+DIzKC95c0QYh+h/ZwUKVWv2YVBREmmL6iUDLIyNx0hIyLjna
	 pLfm+MJcsahhObWGna3JGaKQM0iRAGA+TDEDrUp83KLgqWhk7XDCZ3VX1KYCb9XOFg
	 pchw5gdO9D5bO8uBoeVvVqAi1mZF+aOKSN3/MTcdLv0BBvKL550hB0oSdHd335gHzw
	 kg68aAsHN5MRLlvYdxUpAxbXF8b+IBDh5xNtQ/IX5GZfQR7/tbs25S5kUDgb+CX6nX
	 RSFFvq5B3C3+LClYfdNm/fkyvHsmoMWhXWo8MoEqXMluhkH6pqxkPq2ed3U1ImB3RH
	 28dRxMvlU+scA==
Message-ID: <sashiko-outbox-222552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: dmaengine: Check DMA submission errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
References: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 07:16:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ALSA: dmaengine: missing Fixes trailer for dmaengine_submit()
  error check
--

commit 66f30a85918defe781d5eb22843181f804a52ee1
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: dmaengine: Check DMA submission errors
>
> The dmaengine_pcm_prepare_and_submit() function does not check
> the return value of dmaengine_submit().
>
> dmaengine_submit() can return a negative DMA cookie if the
> submission fails. However, the function currently returns
> success unconditionally.
>
> This makes the PCM trigger path believe that DMA has been
> successfully submitted, even when the submission has failed.
>
> Use dma_submit_error() to check the returned DMA cookie and
> propagate the error to the caller.
>
> This ensures that DMA submission failures are properly
> reported instead of allowing the PCM stream to continue
> as if the DMA transfer had started successfully.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Since this fixes the unchecked dmaengine_submit() return value in
dmaengine_pcm_prepare_and_submit(), should it include:

  Fixes: e7f73a161356 ("ASoC: Add dmaengine PCM helper functions")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119071043.2943=
-1-sreekuttan2156239@gmail.com?part=3D1
