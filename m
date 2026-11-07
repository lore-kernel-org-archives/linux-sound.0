Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067452;
	b=yYvZHFcZw6SbnzppfcgbXHebjqxf5fWPCEmruCECJrExZDfxuZVaQyhjAFZasdmppBwS
	 le2cwKALd3x7kh/1mQ5oaXdjXaNFmujAAyHVy6w0KShH1lqLwRc3qOCFFBAZeh9YBqp2j
	 be5frlWFUiPFYlQr57JD/ydWwaTX7DRUFl2pNEhs0FD5g2r4YAnUZY+jMzXYm6TLmfW18
	 06OY3omgOw8CutU37rSHBIQpu+rQso+ksWhgNRMvX3BX2rZfcPuoFuc4KbioWq1l9olHR
	 MZh44JaAgJfP4RGrNM75wlqraOWed7/ONgPKD77kcWWEs+BZ2Khtm5oUeSO97s9wsjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067452;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rwT/SxpZQ/ksO+w4mBkFBMOBrd0F2a/cxvdenFFPGMk=;
	b=Cke1YmxHA86gjz91iOYnVFoMm49/HHMmgDaBnzO/UeZsylteCCHt5+x3izy49GBonBaD
	 o0nydv+RxgWQzlniAg/OG39Amyn76cr7AoiIAi9RQfoSwQdGXE3ScAR+xbYyJ+mYezhVn
	 XJQPLBSx7yr70sw/yxgq3OHKsVMLJwd+fL5kUS9fi26ouZl7dJ2/z1BQtBYl+2vyfD6sy
	 SpdfLn1eKVYdN/HAQlb/qemvJ2JPrU26KQeRfmgMCC+6kbPE1du4TP0jTQcIX/4EF0DHB
	 ND+lLrhOChOtw937/qi3Or0BtzE1BF4/6zS4IoLm9Z++HtcltwLakWWJObQkbKhcUFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4F1LAzQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69D2606A32E
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4F1LAzQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941E31F0089F;
	Sat,  7 Nov 2026 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067451;
	bh=rwT/SxpZQ/ksO+w4mBkFBMOBrd0F2a/cxvdenFFPGMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C4F1LAzQENaPzwYaZLFeJUCAXYnnQyLwBbQQuzPYxXMZ/nBI9LCswG8hoDqpfIQPy
	 ZS/EIxaWscNFhv37DHZaqETN32Xzi4mJm0Vg7rpnn+X7gZvMh7uMf/8bshc7m8sQ1z
	 H0RUnu39PGJTVCiONHkbh+K8XUR+8nkuyFkswLV40wXedlU6uYpyS0UbUMcpVxaJaE
	 68p+7Tikb3pQ0CsrBM339MMIlgjpGM7L05NcmGTd9Apa78I6NmfmH8sV3VEIEbabAm
	 llC77xmu6kfRDchYqMkeoM/7SUDSMSduFaJFzAo17fQFL+YGBmA3kbqfY98PkhxQKp
	 HtdAOrKyGdcXQ==
Message-ID: <sashiko-outbox-203013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/25] soundwire: amd: fix missing wake interrupt and
 group wake-arming calls in runtime suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-6-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:04:11 +0000
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
- [Low] soundwire: amd: wrong Fixes trailer in amd_suspend_runtime()
  wake fix
--

commit 969fd0aabc344fd522f022214936cf6f2b366440
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: amd: fix missing wake interrupt and group wake-arming calls in=
 runtime suspend
>
> In amd_suspend_runtime() POWER_OFF_MODE, amd_sdw_wake_enable() was called
> before amd_deinit_sdw_manager(), causing the wake IRQ mask to be silently
> overwritten.
>
> amd_deinit_sdw_manager() calls amd_disable_sdw_interrupts() which writes
> 0x00 to ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, wiping
> AMD_SDW_WAKE_INTR_MASK (BIT(16)) set by amd_sdw_wake_enable(). Move
> amd_sdw_wake_enable() to after amd_deinit_sdw_manager() so the wake mask
> is armed after the interrupt-disable sequence and cannot be clobbered.
>
> Move amd_sdw_host_wake_enable() after amd_deinit_sdw_manager() as well,
> grouping both wake-arming calls together after the interrupt-disable
> sequence.
>
> Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after=
 link is down")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is
down") only added cancel_work_sync() calls to amd_suspend() and did not
touch amd_suspend_runtime() or wake interrupt masking.

The amd_sdw_wake_enable() call in the AMD_SDW_POWER_OFF_MODE branch of
amd_suspend_runtime() was placed before amd_deinit_sdw_manager() by
dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/disable
sequence").  Should the Fixes: tag point to that commit instead:

  Fixes: dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/di=
sable sequence")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D5
