Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527023;
	b=cJAUBBV/E8cpL3MNfL8+iKsGbJ9FvRe+c76+xJbra5oC/vPECha0Z4lEw64js+aeYA5g
	 2FX3Xsb5i89/Ul900yC6wJOglyx69oAsfZbLqIEdHc80Jbu7RMMLrNDDQX7/BnAfXJd64
	 31th0IBwPX+d44gqqr7WidE1M5Khjttfso1mNSWudfgJSkgYH+QHmiSl41UIpmXr7/axi
	 taSYwNMe9gVJ7jI0mSbo8cDEWquGal4pI7GfyOklzcWbYCuubq03hvdljX8AVSitPe4Po
	 0aNl9o8FR8tzmfgFrVw7KDVeLaZJfzoACUB4YU1hYCzjaBCINgapUYENwYjLE8QrdSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527023;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oDTDLsRAh/oODwDmzG/bJFAio6LbHOPEmOELTrpPfyo=;
	b=gXU1UNZ/xrNbHG1OGNuNhabOBzoUuKFvI+/+63MDGt5AH5fzqrcoOe0M7ZGtzmC/jqjM
	 auYak9b5BMexXXQtDBw+rxA0fuC9tamvPOXNBLKCP+EXn4A94/SI3ufDMyHcJGeSjM20i
	 ABv1l0xcoWIaRNmuPW7BUYlVHVvBuXYictRiek5Id4TyHvsqtfD2v9i3e3wxIjGR+vMFa
	 TkKtVTO5WrqKJOlal9nDoCTD4P7rmxUVBINQfcmH5vbkoUCZUm2xxpStYswgd/1XXCinW
	 yce3UMbF2xNmQQA+rEWlSIlZ0BEBmdRY95Ykb70PlLMawWdfGOHthLb7PxkeK06wakA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bg87cX1r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D00606A331
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bg87cX1r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D231F00A3C;
	Tue, 24 Nov 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795527022;
	bh=oDTDLsRAh/oODwDmzG/bJFAio6LbHOPEmOELTrpPfyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bg87cX1rythoezE7Y4BkCyPOKmozTjGY+LC+9ubXOBJoE4ijPD7ZPFrQDIDHnEFeY
	 G5g2nmkDqNuYDuYxO9IuMXKgWfVROHI3CkSqsVnBt3RNQ5BCKonqVj1d5NNWQ058E1
	 /fOcaNKFOQlahoaNaVOMjSJ45uTrX387QBApE9oH5j4YwE/orRQHOi9eBdgJ739TLY
	 KFfOKSxPKlXjTR2vJf75ihsWnoHUD64TFXuPwwQQMqAsYexhu4IPCONXS8KppAn5zy
	 sFsKC+i6G6CxvJUOM4gOqdEo6rJ0GKUom07s0AAuGjA2r4P00jpJ1YduR0998Eu2bP
	 Jp3z3u5E/H2kw==
Message-ID: <sashiko-outbox-231210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Limit the depth of the clock
 topology walk
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?WWFubmljayBNw7xsbGVy?= <mail@ynnk.dev>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124132551.137134-2-mail@ynnk.dev>
References: <20261124132551.137134-1-mail@ynnk.dev>
 <20261124132551.137134-2-mail@ynnk.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 13:30:21 +0000
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
- [Low] ALSA: usb-audio: missing Fixes: trailer for
  __uac_clock_find_source() recursion limit
--

commit 0d53f82d7f2ae58ca83e6e58e10001a394d6a384
Author: Yannick M=C3=BCller <mail@ynnk.dev>

> ALSA: usb-audio: Limit the depth of the clock topology walk
>
> __uac_clock_find_source() recurses through clock selectors and
> multipliers using entity IDs from the device's descriptors. The
> visited bitmap stops loops, but a device can still chain up to 255
> distinct clock entities. At about 96 bytes of stack per nested call
> (x86-64, gcc 14) that is roughly 24 KB on a 16 KB kernel stack, so
> a device with crafted descriptors can overflow it.
>
> Pass the nesting depth down and fail with -EINVAL beyond 16 levels.
>
> Signed-off-by: Yannick M=C3=BCller <mail@ynnk.dev>

[Severity: Low]
This fixes a potential kernel stack overflow in __uac_clock_find_source().
Should this include a Fixes: tag for the commit that introduced the
recursive clock topology walk?

  Fixes: 79f920fbff56 ("ALSA: usb-audio: parse clock topology of UAC2 devic=
es")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124132551.1371=
34-1-mail@ynnk.dev?part=3D1
