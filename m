Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296209;
	b=NguBU4lhqOYu5kE6eLynAURSx6vFnhItEzcHTt9mVzMcErDL6XB3iESpfwX5J+sM/mDU
	 XT7jnE8a3J35qjToH3iLho82UVz7wuISstItzm+gymqk7UP1HyvAyX4UsuE9+No8g1Bsr
	 kRx7ELdTZdW8IWdwo2D6KNfmf+66yNzqk0TLgll6aNKbtYydcx09+D8LIaokFWJrrTFYt
	 nQsxHkshuDy6p53q6XLKb5vhnaMO1jKeNwmZjuywlp5fAyik8zLqBOIOlTlaVoQ9zdJ8e
	 rSY/HuilMPaAa/wFamndaWBzxPl6W8y5Kwo2GSR2Y/VeicBb/m5QURtHxWmd7u0hSWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296209;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vdyywx4KkNXGPQ2MmtWyZby9dJLd737J4rdywfryQcA=;
	b=IVmNL8luppzklmDZdnzIZ59JKWHdbljcCseeCukAu918qdL5Bwk4JxQ8c9IFdDwX8hpi
	 nZV9R8ivwLQ+f44SjYZMo3JhvbC/6EmuBeGy3V7c3YaLTFsKuRMp5jZX9g0I1OduBYigR
	 Pn/v5/HRDvjKOFjHq3e8lwTZ2yYLKLx1mGf3ROrcia69W1e0R9WZKJ5v65f1OYEKuaJWp
	 eUVWe+jhHk4dzKX9LLHQzLhp6G4oGijm2wye2nSMatu+qgisgN0C1i9yYR13o9bRmLo16
	 k8hp1bfotBE5oFvZuy+v7r2vKgbO5IOf0037H4HAWGrKKDaGpvujjDdF87BqtmsNOjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iU8cuVL0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E42A60A2627
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iU8cuVL0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18F21F0089F;
	Tue, 10 Nov 2026 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794296208;
	bh=Vdyywx4KkNXGPQ2MmtWyZby9dJLd737J4rdywfryQcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iU8cuVL0ub/fT6TrjMZjQBVCT4kriTAlxM5/hQ3DXMsdksETuObgC0GApPr/MTKcw
	 prqkuq2Qr5Td7Tu1/Wdq0H/NiZ9ozJYxG9U4MReZr0niOitCs+HFhwFShUOZCpe0Dy
	 IT7hhnYK4E+ajix31RAZ4qTU/HS0CQN41IpBPf5UfcOAAgWS+zibuwB0+ZBVrGu8LO
	 xblM+wVMF0Ct1X98vcQrCi8i+4mMiwX8p/ldNFkGjPyKj5z98A3DeyXWWcuX+eFaoW
	 oKK0JMDdVBBPjer/Y4gYeztlebW6VK668r8gmEAC4pJXe0W+K/SnsWMEdav16FmVCx
	 1UIA2obu64hJg==
Message-ID: <sashiko-outbox-206522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: rockchip: i2s-tdm: add the reset value of
 XFER to the regmap defaults
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261110-asoc-rockchip-i2s-tdm-v1-2-f32951b3c527@gmail.com>
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
 <20261110-asoc-rockchip-i2s-tdm-v1-2-f32951b3c527@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:36:48 +0000
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
- [Low] ASoC: rockchip: i2s-tdm: missing Fixes trailer for I2S_XFER
  reg_default
--

commit fcc3b955539c797b954dd2c22348b8e552e615ec
Author: Arun Iyengar <aiyengar1990@gmail.com>

> ASoC: rockchip: i2s-tdm: add the reset value of XFER to the regmap defaul=
ts
>
> I2S_XFER (0x1c) is writeable and not volatile, so it is cached, but it
> has no entry in rockchip_i2s_tdm_reg_defaults[]. The flat cache then
> treats it as uninitialised, and the first cached access of it -- the
> regmap_update_bits() in the trigger and stop paths, or regcache_sync()
> after a runtime suspend -- warns
>
>   rockchip-i2s-tdm fddf0000.i2s: using zero-initialized flat cache, this =
may cause unexpected behavior
>
> It is the only cached register without a default: TXFIFOLR, INTSR, CLR,
> TXDR, RXDR and RXFIFOLR are volatile and all other registers have one.
>
> Add XFER with its reset value of 0 (TX and RX stopped), which is also
> what the zero-initialised cache assumed so far, so no register value
> written to the hardware changes.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Since I2S_XFER (0x1c) was omitted from rockchip_i2s_tdm_reg_defaults[]
when the driver was added, should this include a Fixes: tag so stable
trees can pick it up?

  Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-asoc-rockc=
hip-i2s-tdm-v1-0-f32951b3c527@gmail.com?part=3D2
