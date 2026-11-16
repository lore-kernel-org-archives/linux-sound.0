Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803128;
	b=nIvy13rAF/fuJRqMM2t+2j7Wv+4fpxfflVzFv8+nx2cPkOawR8zUIVBZD7fV+i3OWe+j
	 R768MiX0eaqKYMfOqrMuSaP/GQoDL8wdl5NgO8K3/0vkVyDiSWIMqwkO8z5SWR/qOwzvM
	 54iqmQDTeBEPeB9wp1/F9Jom/rrWWka8zIjp/2jWRkyJHW+6l1+iuRPiiCcZzxpK7OsRe
	 pkDKDgnj4vrCA3V02tEMIqNOaXOn5OAwDIqcB+7/Nh8xOlqNNFsSPOe9L+7wr6N+mVG9A
	 sbs+95K0WxOiua7/n2PQQPJ/owxiIG7qOoHxtvZUxm2x16CWr2qgXAxnrQRLb04XHmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803128;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ILrVNCmCvUAViNl+QaVjT/Dl1x2fyR1ieh4ytVl2tnM=;
	b=0CgdM5y87bIfNQt22PKqY5XWusVSgxNe839VoyU7Tw3FreXJ1ISUgk44BF4Kk/DJq8lE
	 bPwTR+HYZ+AZFmZMOCN0+GHYeyH0VtIb31qmlpAxZJSkmbbu67e6hGadv4BCoqJ1CyjTd
	 +D3KYoQAyKeYelb41497/uM8cCqef+7l/g+s8unNfnmTbfCA20YQnCK56JZSncKTgILT5
	 VgX/5wHhFQ92y/3L1Fhz5mZ133wvqOhrx5Ha+dUqschH5OlrT84LZ17lnmoBUejAGRfZw
	 pq46Sbk1kSuIaoNm2iC9N7nsT1iPtEsQVysbACIRjWixgDugCWqvlJeTAlv6vj0D4Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Iy/StB4x";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CAD606A31F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iy/StB4x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD2D1F000C4;
	Mon, 16 Nov 2026 04:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794803127;
	bh=ILrVNCmCvUAViNl+QaVjT/Dl1x2fyR1ieh4ytVl2tnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iy/StB4xfG/HEdqMxYlqOUfl7bwGUIQSlOQAKtOSGPBJZBq+9R95H2Oaxicyhh1HX
	 GrJn6/v1W73Ch1rC0MzzGsWTyc3J73fP1VmmSbXD40aA1DIgbjbIzAOEORqD7OznmQ
	 1l2xGAJJ6CjwFcGIujrovGmnhNXrPpbmdguQFjEI6tQusiq0u+oepC+sZm7aHmChl1
	 ajdI92NZjRwdlNij3rkaA7bSucqYx3i8B4shqj9lsEjdGJNSHXP02c15BcNPq33hCA
	 vcsPeZTHVYuLHy+gGczR59SU8QhyXTxm8tKxZ/bgRa1rUBn9pjkvBZK9QXyA5GFmH7
	 moCTPpBU1w8qQ==
Message-ID: <sashiko-outbox-216179@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4] ALSA: pci: add analog support for ESI MAYA44e
Reply-To: sashiko-reviews@lists.linux.dev
To: Nordschamane <nordschamane1@proton.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116-codex-alsa-maya44e-v4-1-381358afc43a@proton.me>
References: <20261116-codex-alsa-maya44e-v4-1-381358afc43a@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 04:25:27 +0000
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
- [High] ALSA: maya44e: single-word handle used in Signed-off-by and
  MODULE_AUTHOR
--

commit cdb85b2813a3b897c6265642a04fc30216441982
Author: Nordschamane <nordschamane1@proton.me>

> ALSA: pci: add analog support for ESI MAYA44e
>
> Add four-channel analog playback and capture for the ESI MAYA44e PCIe
> card (19fe:7000, subsystem 0e51:0001). Playback and capture share the
> sample clock and can use independent period sizes. Expose analog source,
> gain, direct monitoring, DAC and crossmix controls.
>
> The playback DMA rings and ALSA staging buffer are cleared during the
> reset that completes prepare. This keeps clearing and pointer rebasing
> under the same PCM stream lock, including for linked streams.
> Both streams use the locked reset path. A linked PREPARE holds the
> peer's buffer mutex but does not block its ALSA read or write copies.
> Take a driver buffer-access gate before touching either stream's
> buffers, and keep it until the reset callback. The stream lock then
> covers the remaining pointer rebase. Return -EBUSY if a copy is active.
> Explicit RESET takes its own gate when no prepare is in progress.
>
> Treat unavailable MMIO as an error during DMA setup, start and
> position tracking. A failed read must not be interpreted as a running
> engine or a completed capture period. After confirmed loss of access,
> skip BAR operations and use PCI configuration space for best-effort
> shutdown.
>
> Publish capture samples and the copied position under the same lock.
> Use the DMA position and elapsed time to detect missed capture periods.
> Skip early or repeated interrupts and report a capture XRUN when the
> ring may have wrapped without the driver copying the preceding half.
>
> The ES7010L register sequence comes from observed PCI transactions and
> analysis of the ESI Windows driver. The existing ALSA PCI MAYA44 driver
> was a reference for the WM8776 command format.
>
> OpenAI Codex assisted with PCI trace analysis, driver implementation,
> test tooling and the changelog. The requests covered analog playback,
> capture, mixer controls and suspend/resume.
>
> Signed-off-by: Nordschamane <nordschamane1@proton.me>

[Severity: High]
Could a real full name be used instead of the single-word handle
Nordschamane in the commit Author header, Signed-off-by trailer, and
MODULE_AUTHOR("Nordschamane") in sound/pci/maya44e.c? Under
Documentation/process/submitting-patches.rst, Developer Certificate of
Origin sign-offs and module authorship require a known real name rather
than a handle or nickname.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-codex-alsa=
-maya44e-v4-1-381358afc43a@proton.me?part=3D1
