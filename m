Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067829;
	b=BE459dk2ZGuXXe1/+z4Mrq394qUyYipYqOHMquV9gkg7vbx2MEavsXayvWwK7tTIiiBD
	 zsw5aNoyKKx0i535GhT3AQqewmFkb0iLMQMipjbzy9naO5ooT4W2K8JD+B4190DFur9Xx
	 RcWkqNwfSb1w4TAmGaYn1PoFnPua0148aDNVWPr+lxL7lv6++l8uG76AmRlAX4tJfjf7E
	 s3xs/hCuWC6dXSkDOSzt0LbawoumXtgqgbmJ9Noo0oBNC4J2SLlPqv3gS8ei0w1X+0EZS
	 xgQu6bc5MTaLDVeZssHH2t3hljCB8YBWlu2HFnyGf4i6EZKrz9t8Mi3d6JwbKN0F1PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067829;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fzc6Ib98TEJrvRwXyQGWkeyhsxojI+S6zYflX/yJABg=;
	b=a+Pi5uK48cZBcvXJKKsQd2vhLgxTPPRWPzI3Rm9NTlVNdhQEsrQpAkHwPAHumXu9mYhZ
	 Y1iLhN4qsmlLFPcEUQ3gtoinHJMiOgW3ruN4qQEqLi+R78YQr7yLTT2gLPIQTYsZvBPcB
	 r88DngA1VgERcPYPb16f8YQ3v1m6TwjiBuZ7XVRG88DmzYtuWjm8QjLBew03ks06uNlVG
	 n6LX2Aj5nx5q8RwYegO9ePg2dLo9ifx2p4HiNttokFGtyP4BTrplz/9K943U6wyOpO9OI
	 frSgkG+4LBqMeC2BGqhKwoLMqlSnUBQwSHutFlIjUFv6d/IIJEpsxrIG+6x1i02/Mug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpwg5xiE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46810606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpwg5xiE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58BE1F0089F;
	Sat,  7 Nov 2026 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067828;
	bh=fzc6Ib98TEJrvRwXyQGWkeyhsxojI+S6zYflX/yJABg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpwg5xiEVLKXkvChto+k/VQJBh/mtAaWgrJ4N+gxlyZ8visaYDZN/8J/egJ7qHPIZ
	 3pk2tfM8A0bQcY50TPKAq05yvia5AMUgsszE5qozAq0LYlWX72mz5fdYe6qAgyYRh9
	 v0XrRa2BtyAG8EdZKhGjGhpc9TQcQp2VcV15GMAZqgcmLMDmvxmCkva+40+2JdW0HM
	 IZVifefiE0mS27/n+3HMNXg28bYSqRYA0RuGgSe1p+UZpkM5So7hLbfl602jYElwCK
	 rUIaXpABq6czPKKHqRckovneUVV/1qBSEt+QrhB1sz49DDOzMXSzj1Omc5BsUFD+cj
	 OCLOeLon+x5jQ==
Message-ID: <sashiko-outbox-203025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 16/25] soundwire: amd: pm_runtime guard in remove
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-17-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-17-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:10:28 +0000
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
- [Low] soundwire: amd: inaccurate Fixes tag in commit message for
  pm_runtime guard
--

commit 258769b3a1bdd79fbca74cfbf250109e984888bf
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: amd: pm_runtime guard in remove path
>
> Guard pm_runtime_disable() so it is only called when runtime PM
> was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
> only at the very end, after several fallible hardware init steps. If
> sdw_amd_startup() fails mid-loop (one manager started, the next fails
> before pm_runtime_enable()), sdw_amd_exit() triggers
> platform_device_unregister() for all managers. Calling
> pm_runtime_disable() on the partially-started manager finds
> disable_depth already at its initial value of 1, silently increments it
> to 2 and returns without a warning, so a later pm_runtime_enable() would
> only bring it back to 1 and leave runtime PM disabled. Use
> pm_runtime_enabled() to skip the call when it was never paired with an
> enable.
>
> Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handlin=
g workqueue during remove sequence")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
Is the Fixes tag pointing to the right commit?

Commit f93b697ed98e ("soundwire: amd: cancel pending slave status handling
workqueue during remove sequence") only added cancel_work_sync() to
amd_sdw_manager_remove().  The unconditional pm_runtime_disable() in
amd_sdw_manager_remove() was introduced in 81ff58ff71ad ("soundwire: amd: a=
dd
runtime pm ops for AMD SoundWire manager driver"), and the synchronous
sdw_amd_startup() / amd_sdw_manager_start() sequence described here was add=
ed
in ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node
creation").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D16
