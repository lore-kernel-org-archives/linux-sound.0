Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772087;
	b=dDp3EhNz4OO51uU8F0xkCrYEj08WArWGJfckKso30opQz6v9fSl6XZNC3WFdcS9jTbXq
	 FAtwnzwMZrQZGKkyHccrfb+xLBdQv3pbSbto/sqcMMmVZBVqY0aHla46VSLvnZqZ+CNil
	 To0BEaUG95cI2JM8gg4EDbg1x4ONHkkxoDNxOd7lxiA8211FneMe5XWS5dyV9yI0dqerx
	 KxcymcQG24e5VP8Mlqpmb/2NPEghkc7K09uAgME4rmDtpTUdmQi8UEUtDvNSYuoIsG+9M
	 fnIEEABVhPJ9YXwtPON2u4DSlC9hRvwaAB08KpWQ/vw6BWvky9Qd8KTl+RrCAOp4l7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772087;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mqfXI8oVnuISV3M+l7GMxMZ95VYLbyPVMIB+ANQUEk4=;
	b=4alzEz5AHM1dVHkAG5QlY30enui6U3tzzewXvXR5jVz5JronYyKfPXRs49RZ9dtnAfoh
	 f0Pih8HAoruEdq2lKxibUG4hCr6ZDyQJv0O37MsEk8P9+5kDdlJD39F44EAAPTsoBPguS
	 byVyAAwzqc3pG4HXIUxjXAK+UkUPXB2JtOzWgIYMkHY2Oo0ucgQ8c82OldvtAXilhjgOS
	 utU9gKecYkTeIp2SpM7j2yEz2y+6LkNEzgNBGuETg7K0gyDCaECqB3CHCJWkk408gmTd9
	 3LC9jVRcvQVV4Sdy6WuzPjE5r1D8/u30RYJAy9lK2212zSFKkQLqay3JH0zMw54wnEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3FjNYw5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02484606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3FjNYw5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297CC1F0089A;
	Fri, 27 Nov 2026 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772086;
	bh=mqfXI8oVnuISV3M+l7GMxMZ95VYLbyPVMIB+ANQUEk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3FjNYw5IY4Wd57USelyoLAUUT1JXksatuhg3HUiXMM4BqrppJB2SYqREv4gSVBz+
	 UU5GQAyTjrgjY9vy9b1rpxpapIvYWrh+5k0JtdofdRIrdRVbKrBCID7k0UUplsggob
	 ZAqXoxhvcXBPs8DWyWaqutEhs3ukh/9ddarNuQ5g7ondOhFydsUCAk5lXviBi5eRBh
	 0p6ZbMq4Cp2QJCraP3CzrTcOM6vwh7TcyDB0skkxiOE0kKEHMJINAcpU8CtEgB8zJ1
	 km8WpfVgNDqHkz/ZR3CsD7DMaIw4oZwAzGDFIA3gkv6C0iRkLsKrLNpwkLxg4JySSx
	 zSB9bMCYjxdyw==
Message-ID: <sashiko-outbox-236987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: stm32: spdifrx: Fix refcount on sync failure
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127092345.12383-3-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
 <20261127092345.12383-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:34:45 +0000
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
- [Low] ASoC: stm32: spdifrx: missing Fixes trailer for
  stm32_spdifrx_start_sync() fix
--

commit ae61d099c35451778ed63b763187aaa9cf5f2bbb
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: stm32: spdifrx: Fix refcount on sync failure
>
> Roll back the refcount when starting synchronization fails.
> Disable interrupts if no users remain.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
This fixes the refcount and interrupt mask leak in
stm32_spdifrx_start_sync() introduced by commit 03e4d5d56fa5 ("ASoC:
stm32: Add SPDIFRX support").  Should this include:

  Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127092345.1238=
3-1-phucduc.bui@gmail.com?part=3D2
