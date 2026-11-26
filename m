Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692530;
	b=SnpY02kTmyhMOlVbTGI7HHzr3MNgnxpSlw7MNPKIE94PPtY03crPU4DDPkF1szL6HCKH
	 RLRfSsW+FgX44GVpotwIbF/Mcr5uuDn86DvcMTED8mN/xPCt+47VrH8pMtoPQTZFPyqXz
	 nuAoJODT2X9YgYvJCmcOTqU/xA65lLOgybSoCzFvztL0IKCf467nP3MTt5Egzvz7CTkLP
	 SQIlUTONC4SeHMkmTZu/xRgh0AATCwcUZlJe4O3IPS/NSHMozo5gV+Is09XZQS7IPCQ2J
	 4fXS3TihUdKV6gVdsM2U9yS68qx5ml1lLz1P5/rX2uml3oPoOiKEUrvXBvHDOOfRe5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EKacod9QPt7FR+P6Irxelqw8n5SZr2bKCjqqv7Ri9yw=;
	b=BhmeYgAVH4N4lTyghvkXrXzzWqCQr5XSzcsEtEHyZGnyFx6pBND9uTW6tbnI3sj1xRls
	 /QXJKAXI0EVoOaGzmoSLaOemuR2JcBFRrh+JLXeKR+nilIBnjhEaP8u/4G6I90Rnb5GDj
	 Lh9pxilIEc9jULNx+DViT+hoEqOv87b0Ged14mRIloHfMzAJ78sj1IiTlHj7KgDuKkDpk
	 qLp8F0688iueAU0+LLoY+F7Av2dJdFR8eP2QJBf8Yh7i64MgHI/DJEVdm+1FcgZq8P4zg
	 WOzKutDKcRRC3YosMuee2owNwGJQpiRd8xgWH4czl4oZ/FyHd1vCxPKjRrZzyZqsyZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bINyciQ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B9606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bINyciQ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36ED1F000CF;
	Thu, 26 Nov 2026 11:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692529;
	bh=EKacod9QPt7FR+P6Irxelqw8n5SZr2bKCjqqv7Ri9yw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bINyciQ4p4pp4EVf8yATyN4z8aR66jtCjK9hKBveUHnzlNuCqB1WUvVpyUlbD29LN
	 k/2HBjxBStImtNjSN8yYYAPqPupJF1xi8NTDOHL2Q6p085RumaKNEA6I2lTaqGrQ6Q
	 I3lZO4jlkXrDumIDSpRIlgNjbZD/XSAphJ1yuZ86DcjjK/YiY+AYuERDadjJwkpAcj
	 LpOEL19mlJ0iLCxAeQFOMXHk198MDGl6cTULthIcN18XZQeI6LH0yt21CwrL0btFzx
	 c0Ft9YKvypxU+lbxIXg9Fv5tNfoa6y2CLVUMBJrVOOG8gDwMi35R5OKqAi1c3ROACU
	 lmd6175tZ+PgQ==
Message-ID: <sashiko-outbox-235376@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: tac5xx2-sdw: correct default volume
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niranjan H Y" <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261126112023.29054-3-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
 <20261126112023.29054-3-niranjan.hy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:28:49 +0000
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
- [Low] ASoC: tac5xx2-sdw: missing Fixes trailer for volume reg_default
  fix
--

commit ddc6ab01eca5092c2a9cba76fe32f9d666b7219b
Author: Niranjan H Y <niranjan.hy@ti.com>

> ASoC: tac5xx2-sdw: correct default volume registers
>
>   The volume doesn't get correctly updated when the
> volume in the mixer controls are updated to their default
> values as the regmap cache will not do HW write leading
> to unexpected behaviour. So correct them with the hardware
> defaults.
>
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

[Severity: Low]
This fixes the tac_reg_default volume entries from cf82dd2183cb ("ASoC:
tac5xx2-sdw: update default regmap registers").  Should this include:

  Fixes: cf82dd2183cb ("ASoC: tac5xx2-sdw: update default regmap registers")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126112023.2905=
4-1-niranjan.hy@ti.com?part=3D3
