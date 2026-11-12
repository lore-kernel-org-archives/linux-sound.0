Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481255;
	b=HzKPCWDeB6DTGmwZ/QiL3gUD+DID0EyiBWnkp812KwN4tSDzIICJIUKinFT25TlwuCI3
	 Fjwxw+oUZBfsUwIui1IQmxFEsJSlbLjl40OWWYDEW1KsoDrOR3Pmdr1Tchi+0Oiyltv15
	 2CN5G1pZMAeKmGRIkgENjD+x9uAwJAEipGjwQ94NXduANorB72+ITzQG5oZCc4ju7k0pd
	 NUn5kEEQK6KBrS1+nSVXPbEXGlrrl3VAWTXr46JYQy38juGw6LXDrI0cNH5a1mlUJH5h8
	 Gw/ECoir7W6wCpDs0fcmx4ecQwdreFwj5DiYye3rNbn9Uc8NpPbZohgKe0rnJiBy8/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481255;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UAV4zWRZ8+jqrIFdiMQNmfcqh6KdIUbcQMCCULyNCk8=;
	b=pN7Fb5irshEm59qh1I30ioZbqBrVc1CygpKhZ1ioABp7Vf3N6x7kbZrBuJT1vLMAdn89
	 H6F4kw6AmO7HWzbYAUn+O01f8bCnhRFPVj1zw9Z5pQLWKZaT1m4SBGbJ42z8mdQipa8Ln
	 Pgm8We11SqpExnSKvAC5glsIbQOPBGXGMqD1DEVXi0rFtu40LwRGYlB0vitAbABuUXkWG
	 /VZibqzaxGfVfLdsWlCBjnty37cXGFXj+AaNlaRZU9a1/oJfUe6/qxSNdY+KC5FlcTKME
	 kRfbNNAxN0w+VUGcHs+C+lH2Jj63UdguEI5XirbkYFtoDi701ii/HP1+0z0qJRZsAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNL+6bNG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151F606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNL+6bNG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276FE1F00A05;
	Thu, 12 Nov 2026 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481255;
	bh=UAV4zWRZ8+jqrIFdiMQNmfcqh6KdIUbcQMCCULyNCk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iNL+6bNGsElSbAmoYoDlu0tsBq77UQDans6gcQX+v3ibCg9lFoXQt+0aI1CSmxXiO
	 oRzgyKIp13w4RERzm35WlqjcNvg2+V+5Sxyf3lQChohKUa8BAcNvo3sy/IZiRaKi1S
	 vKn85kdkkQuSOrVwGapt/Yxdr8ZrcSaQ/5rgHq0eR7UXPzZnB1Bg6dS+GfqgJziWJU
	 Afgs98lvar/WRgC5Vt00vdC0FuPGuFx+H4G6N2EZHV0JbVfWMiiMXKHglkXBXIrPLq
	 H35aeiPzFLI3Wf1vRcTxQ2htDtOgVlzcK9/ZFJIbB1UXGDZ5XB09vjvh9E1Pcn8A4Y
	 lf0wmaWIrS2NQ==
Message-ID: <sashiko-outbox-210984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] ASoC: fsl_asrc: Fix runtime PM usage count on init
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112105116.32274-4-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
 <20261112105116.32274-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:00:54 +0000
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
- [Low] ASoC: fsl_asrc: wrong Fixes tag and pm_runtime_get_sync() in
  commit msg
--

commit 503d1e3d04da11b4fe4bd7121c2929541b45d6b1
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: fsl_asrc: Fix runtime PM usage count on init failure
>
> Balance the runtime PM usage count when fsl_asrc_init() fails
> after pm_runtime_get_sync() succeeds.
>
> Fixes: 286d658477a4 ("ASoC: fsl_asrc: register m2m platform device")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
Commit 286d658477a4 ("ASoC: fsl_asrc: register m2m platform device") only
added fsl_asrc_m2m_init() at the end of fsl_asrc_probe() and did not touch
fsl_asrc_init() or its error path.  The unbalanced runtime PM usage count on
fsl_asrc_init() failure was introduced by commit cab04ab5900f ("ASoC:
fsl_asrc: Don't use devm_regmap_init_mmio_clk"), so the Fixes tag should
point to that commit instead.

Also, fsl_asrc_probe() acquires the reference via pm_runtime_resume_and_get=
()
rather than pm_runtime_get_sync() since commit d05040741afe ("ASoC: fsl_asr=
c:
using pm_runtime_resume_and_get to simplify the code").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112105116.3227=
4-1-phucduc.bui@gmail.com?part=3D3
