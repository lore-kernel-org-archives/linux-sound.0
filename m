Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561444;
	b=krW3u6LiQrS985oTz02VH3ldVG/N9tufwteFCqUMTcs+4DdyyJb8TFGp9zmfyiSGCFd7
	 FEXvzPY7Rj8cZE1SLxPPFLsxqtmi+gkyuAqnmbtLuefMHHm/4FNCgp34oikwHdf6Pc/5t
	 7FggjHWnNmA+0lvi1UR5aams6LxCLWgAKr2taqLRfIc7C2cpHM29TVmkd9pN14emnD6vX
	 ATYEtT2YeOZQpVHCl7cat/WnuK1d7fmUJoR7JQNEOjATdsFHAKFGXLxWRX2Eked4G9bJC
	 QbVRK6bYPrGfXqnHmCpJVFbKP4zYz07WmFbZUu1olu1pXBUQXIoBDfzn0loisy7wmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561444;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3J8MQ3Cg/291ATFf6F1kG10ex0EI4Cqv0BT1vZuiqcs=;
	b=UaWqa2WtNeKYerAi2YuX7xHAVcGebJZ3vsDWSvIuVGGTl/Um4WUBgPAonHAgegrdWqq6
	 6euhB2sO3RbGxvjwwJxY6ELYxA29v670A6X/3gaZidyLV9yHF3WrxZfY2AHyGPASP9dLV
	 TwBgQQgikEZuVQKzqWMNpgbdn51Zg69U6raxN+ux/6DCabW+1bTmymE4i3Uk6zklx/S7A
	 YcH4gcwIAVMC8Cfq+sV4jNjSnk7ynnD98YHMcg9idTK3lAXCVmR2qfKJxeZkDI4aRIBqo
	 ELDFxmes/C6E/pNhJEdRFhpCv0iIQxjF3k25GmAnPUjwAl/u48VG/reF+97zK+8bUZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADlF6Ufm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD84606A321
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADlF6Ufm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD281F000C4;
	Fri, 13 Nov 2026 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794561443;
	bh=3J8MQ3Cg/291ATFf6F1kG10ex0EI4Cqv0BT1vZuiqcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADlF6UfmTCSfs9Rt0eH5mNELBuK7skJ1IXZ0lRQAF/q+Q7UAsGRWtVliF2AWg9RHu
	 cKtyNR+i32NZADDV+IOgRqLDoyLLkvrFzYUOGiLfydTGM2Dk8tC1nU8OXiDDSdLLUG
	 2QBojTyhOCOl1wrHbclWPWTKqCIXr6sdOvZppSWwf2AxR7hDRZ5O8vudOpZW+Oc53e
	 RtImr8O4XLELRAV4hZL5LNgMI5/JASGoGJ7dmWo4k5iEOFJM1fsuEbBvN6Nx9lhaBd
	 AUOn12AbilZMr7jkDl5fWGb+gBXF+QnnglqY3LG6mTWiDFIImySnbhO4+UKKfJmsRH
	 iukuwYWLi9IRg==
Message-ID: <sashiko-outbox-212529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: compress: Set metadata_set only after successful
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
References: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:17:23 +0000
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
- [Low] ALSA: compress: missing Fixes trailer for commit 9727b490e543
--

commit 965fa8b5eac2d0c56694f06c6f1691a5d9ac92a3
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: compress: Set metadata_set only after successful callback
>
> Set the metadata_set flag only when the driver's set_metadata()
> callback completes successfully.
>
> Previously, the flag was set even when the callback returned an
> error. This incorrectly indicated that metadata had been applied
> successfully, potentially causing later operations to skip metadata
> setup.
>
> Update the flag only when the callback returns zero so that its
> state accurately reflects successful metadata submission.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Should this commit include a Fixes tag for the commit that introduced the
unconditional assignment in snd_compr_set_metadata()?

  Fixes: 9727b490e543 ("ALSA: compress: add support for gapless playback")

Also, this isn't a bug in the patch, but stream->metadata_set is only read
in snd_compr_next_track() to gate SNDRV_COMPRESS_NEXT_TRACK (returning
-EPERM when false), rather than causing later operations to skip metadata
setup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113091159.2954=
-1-sreekuttan2156239@gmail.com?part=3D1
