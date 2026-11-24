Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490107;
	b=arB24QjrZVz+xuMRN7yFJWVHCJfVxSKle4R4WXTehq6SxyzfALqG3EQMUPuHpVUgyTL7
	 pFYLeezYuhPZyJav/CJqsCfeFWdyZxc/bcq1ab0Sf+FqRQCgPmTjLxQCrf1wKuIUNCgG+
	 NaV1cuF2bRhzUbx/M+UwMZNmhRgOv6x6/AKu+Xt9rroCvTjLyxtn9NTAMGaS/ZgSfO3Zq
	 iNs9hcQvHRpl34vo+Hjte7fH6D8aDKOqygs7EF8ULWGwT7nEgL91aHpWG92F6BKB2Gb6I
	 xIjN41u+tuE7+0yFAZUTyPcxYGkINsXOSm8BK+ZX2nNxi8VWAa3e6/WtylgcmuTZqlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490107;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5As2+mxgYksPk23zxjvApowfxkAqKbUgK3LEo0MA1hg=;
	b=GX7EX/usreKwB8BuFG+caBBzBHtzMIrucRAkf6CR7a5fEAUv4XOaTnKVfdboSEAvTz8z
	 Ce8DRP1dtcMEDTy9lmqyG/lZWwl8kW9arhTx3aOLNf5t8emtpovZ17bA4CsC0cgszISiV
	 JbpGMZtpRW9GqDyhEls7X6AKgJxvN8PfOEoSUcthQR2pwxkJSBgAwQfmpbVWrFTY6tnx8
	 fs9IBMXUQ5QIziDq7xEbbfnWD0IQMj7SPvWaC76mR3Cb+2k7EqlbEJsWdBNaGl4JA2qf4
	 rtCsvOiuunc3XuNI4wUK3zH70Ez4SStkacDXzvalgFC1WSg/o1C+fFkRl7YkmJ76Q/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGSTlAlx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C0606A31E;
	Tue, 24 Nov 2026 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGSTlAlx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3E71F000C0;
	Tue, 24 Nov 2026 03:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795490107;
	bh=5As2+mxgYksPk23zxjvApowfxkAqKbUgK3LEo0MA1hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGSTlAlxJxeEA07LX8aB193IPMQOFUJgjiaWleXZC4un6/RCMgmM4dENTexcNGFn3
	 1/acZl/DwEB9bF3FMJf3UwD4VmJc2xMQULP3eNG2D1boPlN/03I5gE+IFNRdpfPX8a
	 s/MEJuEkOVm0bzNIweu1m3CrYvy0/LRpm2nfdpogh3guGGoOrTL7D97lqKqrrrHWG0
	 CwGrUyQ7lerK4c77d8gVAQloN61geyOhFfkEKHLDeamDjXCFQBq7C392p7oH1JxP8L
	 g4IHF+MfoDke/aOvW7zSeMs7gf/7nFRKctvJXTW0uwV4DjJLLZ9Za6q8lMtdEk3ZWE
	 Jy4uMITNmKPaA==
Message-ID: <sashiko-outbox-230446@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] media: i2c: it6625: use the standard audio rate
 and present controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-8-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-8-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:15:06 +0000
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
- [High] media: i2c: it6625: missing Signed-off-by trailer in commit
  message
--

commit df45ad662e0b631be85cdfcc0e3f26a74fc6f35e
Author: Hermes Wu <Hermes.wu@ite.com.tw>

> media: i2c: it6625: use the standard audio rate and present controls
>
> The driver reports the HDMI audio sampling rate and whether audio is
> present through the driver-specific controls
> V4L2_CID_IT6625_AUDIO_SAMPLING_RATE and V4L2_CID_IT6625_AUDIO_PRESENT.
> There are now standard controls for both.
>
> Report V4L2_CID_DV_RX_AUDIO_SAMPLING_RATE and
> V4L2_CID_DV_RX_AUDIO_PRESENT instead, with the same range and the same
> values. The driver-specific control IDs are no longer used.

[Severity: High]
The commit message is missing a Signed-off-by trailer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D8
