Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470837;
	b=k7WcA626HmAWUUPWUL3u8Iu2rNd/gAk2Iot1+z/jim403pKN3XSwvdgd24n7Vsao3UHZ
	 IDvqqKtum1tZ6Dq5ZBbJzCNmTVmODuKj1Ln45hgKg77nAtHmrZoe0puWPfUmVr+dz0afX
	 ZeZOJjdyEZR67Fey4Yvfj7aQ4beHEePdeqxtpL/b75luyoR5oQUZV6qS39pWY2SwV/uD8
	 n3BSIR7dXukiNvPqHOGS0k385VF5JkbX+AUj82IdrDLqQt4HLd/1QSKsuJd08Rg+pqA0e
	 jcA3EydTrdM6JNbVC7KmgUwlboUP+wMVdTpCJaXGm8Ndbh57xJuRvbg+Kd3X750ZOdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MVzHdM3I6SnN6zmsxRrR7/Au1RK86BaJBRj8tVee0zs=;
	b=fAI1W2FLhHMBiuw/OPqhZkcKaqsr2SEc2L4OTLp7MN95x6/vN2P3acUxWfV3WaY1xjNQ
	 YsBcRlZxOXKoPmHKWrBDraRUrubqy8/Jj6vAId22co+1VvBEq0vxmBIdBbwv7jgUIXzx7
	 6avTLsoQT2qioHh/ZmBAYYm2pnRDzyG9eTu5h7jFsrFl9Lleswo3i/tg8IpB8WqTTsEqt
	 kgnRiOLqFD4YhNovEzfuDo3FuyxjYCg0VRzO/pHYEPTr8lqYKC+DKSMbO1olJp+Dwrr2O
	 k0VPmf1qqovM2m/zxGpmO0eyl3gwapgBA8wnpbQgPM6w734Ann3N8+k3OU5cO6ujbwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLM4GjcE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BE606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLM4GjcE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0FC1F00A05;
	Thu, 12 Nov 2026 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470836;
	bh=MVzHdM3I6SnN6zmsxRrR7/Au1RK86BaJBRj8tVee0zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cLM4GjcE0ShcZjgt95RYlq4myJeA/K+nHVmPTFcKACoizaRl/8B0KMFPhu15fgxoU
	 OXa56W4lmEouG2zfkEO5+EknueAV761dgrFFxDllxb8VsQ3nUcFAT6SI7sXDDDZsLk
	 L2nbSx7mK3sr4KR2dBbNk0xKi3OBGdO7QfKoVb15tCW0rUN/7ze9/k+igtGt9/BCnT
	 n2FIhC2LJbysRkHG7raNNSNUBHGJGOr4Osd1UKiDsHPuNivyR0n5UpebyIm1XtX1Go
	 SoQ85VbPXRmBU6MadJmexMGsRt/6Q8QHgHFsDLd4AY1jOkEKSz/G4Hft2lODiKEMnC
	 pjfh0A4RAsBfQ==
Message-ID: <sashiko-outbox-210669@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: Remove Headphone MIC support
Reply-To: sashiko-reviews@lists.linux.dev
To: Kailang <kailang@realtek.com>
Cc: =?utf-8?b?bGludXgtc291bmRAdmdlci5rZXJuZWwub3Jn?= <linux-sound@vger.kernel.org>
In-Reply-To: <3c8129fbfa6d4ee2b464735f2f31dffa@realtek.com>
References: <3c8129fbfa6d4ee2b464735f2f31dffa@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:07:16 +0000
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
- [Low] ALSA: hda/realtek: missing subject prefix and email text in
  commit log
--

commit 5825158cd0bc2543d8e2f6371d06ebd4d7af6e08
Author: Kailang <kailang@realtek.com>

> Remove Headphone MIC support
>
> Hi Takashi,
>
> Dell QC DT unit don't support Headphone MIC.
> This patch was changed model to NO Headphone MIC model.
> This modify also fixed headphone popping noise issue.
> Many Thanks.
>
> BR,
> Kailang
>
> This unit don't support headphone MIC.
> The popping sound will disappear when you remove it.
>
> Fixes: 97272a5704bf ("ALSA: hda/realtek - Fixed Headphone noise issue for=
 Dell QCM1255")
> Signed-off-by: Kailang Yang <kailang@realtek.com>

[Severity: Low]
This isn't a bug, but could the commit metadata and message be cleaned up?

The subject line is missing the "ALSA: hda/realtek:" subsystem prefix and
does not identify the affected Dell Pro QC1255 machines.  The changelog
also retains email greeting and sign-off text ("Hi Takashi, ... Many
Thanks. BR, Kailang") that belongs below the "---" separator, followed by
a duplicate paragraph repeating the explanation.  Finally, the Author
header uses a single name ("Kailang <kailang@realtek.com>") rather than
the full name in the Signed-off-by trailer ("Kailang Yang
<kailang@realtek.com>").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/3c8129fbfa6d4ee2b46=
4735f2f31dffa@realtek.com?part=3D1
