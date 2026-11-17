Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884538;
	b=0w6ia2MDb70zz1nExnUryw3xzggTKQFQwS5Puu889DKCzkeiZnlhI5aQBCOqPisPF166
	 9NHW6CDX8XbNVCoodgojFMDWHf3cuuCWpH1JdSOjRoGtNtwW6LoYVGRmFOoj/BDeXQ8Xb
	 C9lT1Gi2zZx+W/iekF1ikcHOZqBhUGUl2qvR/GyaxWe16KdZkSVkoRw8f1ClSlV2hj4wT
	 RisxBeIIO0Mv9jB8Fp1UeszmQMK46ntfwC0hACG0czP1E6uNh6Cj/EFb/NgwCh0ANjn87
	 xZMDcWq+a8EdHZWoHQoXli4CYibCbDgFYjNnxRi0b4q7CRgNHUxbh8JqvMUDNwSxIYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884538;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VkeCBxN2gR5dX9pl5o42NfpWtCzzEAX3xGnI/n+SPtE=;
	b=tkyjhUOSpDz4xYIzFdIYp3fsATlnDWV6ZIdOJft/T9c/ZPJSnvXKY/xH1Mehz5oZS2+v
	 /NvK0aA592CkVwOM50Fv/HpHReU8jswPl4GQRBkU3eYSHkuy7dPy2nQqqiSoFCL7DBfAP
	 XNImAilJs9cFsxln8WC78W6Uxm9CEDvW84XWZ5d2xYfkGmOtg4172LGMrbj2aCr2wSIiI
	 ADZjvtqaRkMEFPqg6U9lhSh4fpE5CsVUfgqCiFEzIgY8LLip6/22pD65EG9Rpt9b+ffrq
	 Ildm/wAU53sxScyfBxYOEC+//E7L6+GGpj28kh9FbDuWiduLLMjOEOr8iTf71Q5r4JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C3WlSg3a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78814606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C3WlSg3a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369081F000C4;
	Tue, 17 Nov 2026 03:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884538;
	bh=VkeCBxN2gR5dX9pl5o42NfpWtCzzEAX3xGnI/n+SPtE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=C3WlSg3aSN2+LREZaTGLAtWODZ1z6ydPO2ttHqZP7HuqKeXFJdnntiwelhtw7pP5w
	 aLrCX4qM2eC60ILiEMKZEVGblsSR5TKKEw7WoK/OntF8wPWdDuvmYf0jRmt9PHMitE
	 OspC52zFsdgUCWx3iPLUVaAR9Dmg309YZyrDanXDIewti2FEEqh4LyyK5Mtc/CBPPb
	 8EBSljTZ7mQ5i6emLuuz/r9VHSdRDbr3fe9iTqD9NlwzzduUF6Jqw0T2vDPET5Epym
	 d/kD9hJNqVBi4h4ctFPymGI0huVFG0e9rfvlX1DQEBYpJI8lVABOJ0x74TBj84+8Gi
	 5ETw6eTbi9RlQ==
Message-ID: <sashiko-outbox-218111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC
 function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianghua Wang" <qianghua.wang@senarytech.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261117024623.2122935-1-qianghua.wang@senarytech.com>
References: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
 <20261117024623.2122935-1-qianghua.wang@senarytech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:02:17 +0000
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
- [Low] ASoC: sn624x: missing commit subject in Fixes trailer
--

commit 64d42df811f50125a7da965ef29c56e2c45716e7
Author: Qianghua Wang <qianghua.wang@senarytech.com>

> ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC function
>
> Some OEM platforms, such as certain Samsung designs, use Senary SN624x
> for headset jack and speaker playback only: ACPI _DSD DisCo describes
> jack and speaker amp SDCA functions but omits the MIC array function
> because no on-board DMIC is routed to the codec. The driver still
> advertised the DMIC capture port and ran DMIC function init against
> registers that DisCo does not expose, which breaks bring-up on these
> machines.
>
> Probe the parsed DisCo function list before exposing the DMIC port and
> before running DMIC init. Apply AMP function init from the ACPI init
> tables when an amp function is present, using the same pattern as the
> existing jack and DMIC paths.
>
> Only omit DMIC when DisCo is present but lists no MIC function, so
> platforms without DisCo still use the OEM DMIC fallback. Do not fail amp
> init when there is no ACPI init table. Re-apply amp init tables after
> re-attach when FUN STATUS is idle but DisCo still supplies a table.
>
> Fixes: 12d9c9f8679c
> Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>

[Severity: Low]
The Fixes: trailer is missing the quoted commit subject. Should it be:

  Fixes: 12d9c9f8679c ("ASoC: codecs: add SN624x SDCA SoundWire driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117024623.2122=
935-1-qianghua.wang@senarytech.com?part=3D1
