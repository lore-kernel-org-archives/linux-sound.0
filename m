Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304981;
	b=KW6rueKDWPLGRmmSKvmd+72/U9Y2yI0GSvuN90IEyBGSJAFyS3fvRNnyJSEAVb60M6EU
	 nk0JJgmQfbWjZsGlVrUAqz09x6TVHgwrVHxI1BzqCeLCk8P0/ShjEfrv+thRp4elz6cp8
	 mrEe/xCA2xb2x4p7bMitvFYCVND4YtoldEdBywi2hjUJOxrbDl0uDA/5JhmWNkpMNN1W1
	 cvwT8irlWgOxfycPbhA4thhIGpypDK4VX4FC1E/sCMSJrxZQB4eDXjgojznHMcUkmqOVk
	 3DXUwHv0gT2eZmTYzCWCPIpVc90I4JvkqviwYfWwh/olQ/iOKYfQM2SnOBYJ2A1uRcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fEita7AedzyVMi6g2D+675Wv4/CkkrLDqluuh9SYGQQ=;
	b=1xSiujdFVdjrX+VWMLC49y088ip3Cn6tBWUQirXjr1e4I71jXdxrMxQfwIVANaEipn4a
	 Qwe9IGZAeyR4W/2fQw/xfxeyvN26B1WjxzjvhIOlz3bAOBX8o0vQvrz5sbO9t4dGhI3DN
	 ycnmTr/2hJtR9QctYvGAnlAYTA/VZTIEmsw5iNTgLr+uBq7E6OKjX6Fo99JHOviW4pA6Q
	 TSWAM+0SyVa/gjTgrhIEZq2wDckDoq9E+sMEl1xb+0CbCJpVMtymCXnV4RCAUwuaxfbxC
	 4wFLyliQxNhW059cQnWeuOFz9zIUSlZqKzr+8e4MBQO1O9/1oKQhcRc0ULkMfR1Y1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzAGuLWw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC2606A330
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzAGuLWw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757211F0089F;
	Tue, 10 Nov 2026 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304980;
	bh=fEita7AedzyVMi6g2D+675Wv4/CkkrLDqluuh9SYGQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MzAGuLWwaXUc9g81SivD2QBpT4TbO7cLKGZW/pG1eMN4+iAa4C642j2V+mcHGDkdj
	 q+SG6YHLYGgADSjBlpFHuHUu+sJskvANJnIYft3rVnaJkbyJimDwQg+Ioq9zhMiQCG
	 KOAr3sdJF6xMXPAa72pso2SSLQ1OsJuC37R+kN8B73kFza1StHNYr0/PhzJfY2HMKY
	 22ElSHrsI2r+ztzp35PZBzY0vS298R+/+Qxwn1edzlEY/FNFlLgUKrPXZnZF+pvU3b
	 wWa0HFnkJGYaftaqZ2hZRkhsYty1ZNCU1s2n7rdEdhgErYWMDRQIPE9d0n/wonVjaz
	 aTvZqeGnJbRuQ==
Message-ID: <sashiko-outbox-206828@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] ASoC: dwc: Fix DMA fifo_size calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261110095525.504660-5-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
 <20261110095525.504660-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:02:59 +0000
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
- [Low] ASoC: dwc: missing Fixes trailer for dw_configure_dai_by_dt()
  fifo_size bug
--

commit 7aa9b7e8f65aeb4b8c0e3324d72ada2ec12b9b6b
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: dwc: Fix DMA fifo_size calculation
>
> fifo_size should be the FIFO size in bytes (depth * width / 8), but
> the code shifts by 8 instead of 3. For capture the parentheses also
> make it always 0.
>
> Use depth * width / 8 for both directions.
>
> Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
While 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
added the calculation in dw_configure_dai_by_pd(), the broken fifo_size
calculation in dw_configure_dai_by_dt() was introduced earlier. Should
this also include:

  Fixes: 0d274544bfee ("ASoC: dwc: Add devicetree support for Designware I2=
S")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110095525.5046=
60-1-phucduc.bui@gmail.com?part=3D4
