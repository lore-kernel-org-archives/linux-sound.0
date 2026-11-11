Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364050;
	b=zKiFHp/DmGTHDkxX93udgtwP9kvS9kH1AgrIcuqRfwRh/gimUcERUv4F0CfcY4tgAsBQ
	 EfID3+7FaZH77ls3WNvfJVXIB+94Ci5FWkoPz0c7Jc6Zw0DmLs+Fv3QpxJ4TkWjC5BuUb
	 f4c91YgXNAVwl9YumK2n3vJoLGwWNpdeoxBdSZVhgDjlGGs0L6kg6muG04rvz5AUfO8sr
	 wCKdCt23cSybihCrP8Dw9LRfl5JrYiOfucD+g4sYHwlPh4GSubOqHi3UHyc99LvaTQOFo
	 CAe93farA2a7neQHK95LBPphU6ELgmKv1U/WLg800pCH7np1gKNyjo9Mfvqh/yvsw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xvBb2Cb94yce3XGoVTMXbCEAgyyLVA0Y6LRtSqlGdD4=;
	b=1Izu4hERtesvteqaLxh1fAZyoyPYSzSiYm9cZ7Dlej0T4QmxixhQZZ6dpOIgBbqsDbd7
	 CvgcjrJGQBM04njmiqR3TY6nUSsDlNxTvzUXQpiWzwWp5KWuU1DIzbgGgNjyT/LI0QFXw
	 cKIAxcg7+A4FV6yVo6bjM1y2B3VoKLDZ4E1mN+gnBpz9+pL2mpmfPPzbNKLGLDSpNE5Dh
	 nXell3q5TnQ1unFU/gSDpW1uk/zlu1M6sAZ8ABejcwGlzOaJKDxNvUndZWfgCq41FPrLP
	 Mw9BbC7YkM2Je6qo4PUZz94Utaln7kyw+VAQIROJ4xxFsxStmISAii7bBrtyQTps4Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOSFLDpW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2F606A326
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOSFLDpW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DCE1F0089F;
	Wed, 11 Nov 2026 02:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364050;
	bh=xvBb2Cb94yce3XGoVTMXbCEAgyyLVA0Y6LRtSqlGdD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOSFLDpWLvCB6ZMecrr/tDUVbavJzc2EeCrp9IN/J0oIfQEeYSv9cdiS4KXebf/2w
	 b4+3lc5A1yjYTsSlOhyqkNGy3hy0RZGBHWCL5t0fvB414U7HihaNhw4qNqJRBrKtQp
	 1Uc8pr2AKkbYTo1N/L+y0R6+5FSzWMLZqJ+K+zcmNcSyLmV+rX5fn8up386FmXP32a
	 LKyJmgZes/jGHuxIzn0/qWx3Fii0X+3gBP3GNPWFiCZoNB0qlYsSM5C48C7mgAh0FB
	 +iRpLpxbG6X4zPd3i96XzlXzfYr6+7mTwcbjSpvJoRPixub7TZ6fuWklz9k6qk0FJ2
	 UrIBRbrgi4rWQ==
Message-ID: <sashiko-outbox-208084@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 1/2] ASoC: amd: acp: Add ACP70 ACPI flag override
 for LG gram 16Z95U
Reply-To: sashiko-reviews@lists.linux.dev
To: fixca <jaehoon1744@dankook.ac.kr>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111013953.4011-2-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
 <20261111013953.4011-2-jaehoon1744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:27:29 +0000
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
- [Low] ASoC: amd: acp: non-standard Co-Authored-By trailer for AI
  assistant
--

commit 91210b0f73b2ab770e122848ab0f260ad48765be
Author: Jaehoon Kim <jaehoon1744@dankook.ac.kr>

> ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
>
> The LG gram 16 (16Z95U, AMD Ryzen AI 400 series, ACP rev 0x72) BIOS
> sets "acp-audio-config-flag" to 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC), but
> the machine has no ACP PDM microphone. All audio endpoints are
> SoundWire peripherals declared under the ACP SoundWire controller:
>
>   link 0: RT713 (UAJ + SmartMic functions), _ADR 0x000030025D071301
>   link 1: RT1320 (SmartAmp function),      _ADR 0x000131025D132001
>
> With the flag honoured, snd_pci_ps bails out with -ENODEV, the legacy
> snd_acp_pci driver binds instead and fails with:
>
>   platform acp_asoc_acp70.0: warning: No matching ASoC machine driver fou=
nd
>
> so no sound card is created at all.
>
> Add the machine to acp70_acpi_flag_override_table so that the
> SoundWire path is used.
>
> Tested on LG gram 16Z95U-GS59K (PCI SSID 1854:056c): with this change
> snd_pci_ps binds and both peripherals enumerate
> (sdw:0:0:025d:0713:01, sdw:0:1:025d:1320:01).
>
> Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

[Severity: Low]
Co-Authored-By: is not a recognized kernel signature tag and triggers
scripts/checkpatch.pl warnings.  Kernel co-authorship uses
Co-developed-by: paired with a human co-author's Signed-off-by: certifying
the Developer Certificate of Origin, which an AI tool cannot provide; per
Documentation/process/generated-content.rst, AI assistance can be
disclosed in the changelog or attributed with Assisted-by: instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111013953.4011=
-1-jaehoon1744@gmail.com?part=3D1
