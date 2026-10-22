Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650187;
	b=cGmfiZHkwwYmaakGw37PeGKOt5jR9QMpfr59QmbWPw+1pYgT2LOa4E4QGUQyfPASAqWH
	 jOMlsZgfU0e6SiHEZ30VpZVW5aasyKalbQWKjZvD5JGLITXVna8p54WBaenGdareY0Y0a
	 UAvoWR83gCMdb5OhvjggwCMVQ8gA1E5Xboo3Gat4AocfHrR/WCW1tUPX0KCKn2x2TYXsD
	 Iyp3rBByWEKb3w8NYRy6nQmt/2dYe53m6qZen3oUJKKZrQAefGOJAMacmGcxhLS6R8utv
	 eKQBtJNMy2R6JsY4Uzt39n01Ey/44Y3NczrOTCkwLNenRVUJhBZYFJqw+W1x/JA5yrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PnK31syXY07VpqwqgyfeATwr6opSRTShaFn6qav7h4U=;
	b=UCO3E7EqF6v1elF3q7Af44jAIbmp6mPy9wpjur1F+xBHsb0jaluzwJ2eNtiHbUjUnw9t
	 5Rx0Y1K+iQfOnrsxW7WZihRGnqpmoSlifvPNX7kFGRbn8sWJAc7JF29FKAdruIxlRcIdM
	 LpmUvAzU5lXTPa5KfbXHPMQsTfTbiapRBQiGJmDzgmvF8VDLkCIa3PDzDEM4tB8B8p5qi
	 JJ91h7t77C0cZbcksYv9/O9iNxBvbmIDQmoyeFPqtVIUCr8b4ZUJhsweCWquxukiS7w/2
	 ztVWI3TbOT9M1lvin0APW3xvt93vPMLbVcSe1pt/QQBsFcGbbh2DHmmTkjy/zah9CIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mCdiby/C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739C606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCdiby/C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBE21F000C1;
	Thu, 22 Oct 2026 06:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792650186;
	bh=PnK31syXY07VpqwqgyfeATwr6opSRTShaFn6qav7h4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCdiby/CnwdObHIy0btNq4/E/Bnlqglw5Np/ciTh4jAgV56/1zg8LIwlB5u/ILKAT
	 hifcta+G10nEy1FWFFgluJb/ijjfjtDLMR9vWQaMIm88zjBvUCQgOvmVQafTJ84140
	 eGpFpHjavszGmwdBdxf02Tf9PQ8XfRnBE7UCId6k5r+DzaCf3A2U7jYSnkxYbsbcf6
	 RPGx8EaGkkkLpcY2yk8hXR+ZHYenvnxtrD9ad8o882RdtLCyREaASzhjnY6fDupOTR
	 0LugRVs5mLD1hkagu4UL4t0F0yWCzFOdkm0/RmQjBeFxf7PrTmylvgvQ2Pg0q7AUHV
	 6bVzgv54baP/A==
Message-ID: <sashiko-outbox-181091@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 03/13] ASoC: amd: acp: fix PDM1 quirk and PDM
 controller selection for ACP7.B/7.F
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261022060724.1814741-4-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
 <20261022060724.1814741-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:23:05 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: amd: acp: commit message describes fixup instead of new PDM s=
upport
--

commit 1cff813ba92933eeaa9d776d31dbcd42c0513207
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

ASoC: amd: acp: fix PDM1 quirk and PDM controller selection for ACP7.B/7.F

This commit adds ASOC_SDW_ACP_DMIC1 and pdm_sel support in
sound/soc/amd/acp/acp-sdw-sof-mach.c to select between the "acp-sof-dmic0"
and "acp-sof-dmic1" CPU DAIs on ACP7.B and ACP7.F platforms.

>     ASoC: amd: acp: fix PDM1 quirk and PDM controller selection for ACP7.=
B/7.F
>    =20
>     The ASOC_SDW_ACP_DMIC1 quirk was evaluated before dmi_check_system()
>     and quirk_override were applied, so the pdm_sel fallback always saw
>     the compile-time default and was effectively dead code. Move it to
>     after the quirk is fully resolved and restrict it to ACP7B/7F revisio=
ns
>     where PDM controller selection is meaningful.
>    =20
>     Since ACP7.B/7.F exposes exactly one active PDM controller, use
>     else if for the DMIC0 fallback: check ASOC_SDW_ACP_DMIC1 first; only
>     fall back to ASOC_SDW_ACP_DMIC (DMIC0) when DMIC1 is not set.
>    =20
>     Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
This isn't a bug in the code, but the commit subject and message describe
moving an existing ASOC_SDW_ACP_DMIC1 check and fixing a pre-existing
pdm_sel fallback.

Looking at the patch, ASOC_SDW_ACP_DMIC1 and pdm_sel in struct amd_mc_ctx
(in sound/soc/amd/acp/soc_amd_sdw_common.h), the mach->pdata extraction and
quirk fallback in mc_probe() (in sound/soc/amd/acp/acp-sdw-sof-mach.c), and
the ACP7B_PCI_REV / ACP7F_PCI_REV CPU DAI selection in
create_dmic_dailinks() (in sound/soc/amd/acp/acp-sdw-sof-mach.c) are all
newly introduced by this commit rather than moved from an earlier location.

Was a fixup commit message retained when squashing an earlier revision, and
should the commit subject and changelog be updated to describe adding new
PDM controller selection support for ACP7.B/7.F?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022060724.1814=
741-1-Vijendar.Mukunda@amd.com?part=3D3
