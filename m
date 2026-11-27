Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796369;
	b=JrEkRI7dBIW8hr3obS8ESXEgqSe/W1f0NJpHn5hsMaPyxJPYK6s0NJpWKsRTsWjrbQ+K
	 bc1SgcjGP4DAS81HDbX1QBX6StTtvbN6RgH/jw0tn1N9LvUSuGUGLxYBbozWcJVwhx3Q4
	 qAaXmwBiXexVlrqUGCF7KVgG+oCDgAd4KEus/EDMzenE+3QDzmV1de5j5aYXcBR7RBjEW
	 oIUckGWipMghNr8wZTnDsMbgz3wDl9WyVXB16MWpgnz8XVywrZFf93AFv9wKXUlWT6JlJ
	 y5wZxIFbZ4Yi+LJJfkQNz/ifE5KN45z7dsZDDXXXC+YR9ZG0VyVMfi/mz925cwn2OEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796369;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZhAdBr4eVeyR1uUc5erg64Zui9aCY3dokPGCUAwmYzI=;
	b=2Lz6gEHU5J8yQioLGTo3d+061XIggV1xTvWNm9LhX3C3XRB/QU7nNNT5tLrHHTA/aSLd
	 ZtL/G4u/ByhGe9OGZmDD0cdARM19OsnMeicvSVyDG+nUMbs9xnxfFIX0Gon9KXfTHDsED
	 bRBbeGKPAF4VpeRJWqgTiLaqegRrVD1rnNpkiBmqyuWr/pADfolGq9Q3GMYY/quLwyNXs
	 3lTuefA5pMqRDBJCMA2CjGbbIpaCIaqY6hDjRmy9iHg/7NQAbIMxUdlMm1WiZrCkd51Lt
	 1OWQa3ntyNgXeTodd1VQ1gIEvCr/ETAe7iOmPu8NttnISd/zTAzNLfRLHCIxuCEm7eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6fwI4S5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3183C606A31C;
	Fri, 27 Nov 2026 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6fwI4S5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA441F0089B;
	Fri, 27 Nov 2026 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796368;
	bh=ZhAdBr4eVeyR1uUc5erg64Zui9aCY3dokPGCUAwmYzI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O6fwI4S57tnyDAlF2E26/bFmoteZ6IGKWuI3ynDi/g2p5Ir8Nc/vrd4fbstbrdoZh
	 0wv1wIY1xc9+06RaYaiVE8gslMSGWbsTp35GSVdZCfCLWkF+OPamLrBR6RvDly+tzM
	 cSPoqUZEJPrP7meYxglZbWe9keFqaXstDf2w/aSiIrXEpWbYs7EeJ+YrODqEO4bwQp
	 538XBiNH//MIEQZRofha3OPqvF7YVkhaguBPdu55lNhnSK9Ffa4q61Do/L2rNVGmwi
	 0QbxOELGqQg7CcOLzdnrKGoRRTQjb2cFexyQ9Fif7cjRik1HohZYV4f5k+y6ARPcNk
	 odnCnKkxf6oXA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261127094617.1932934-1-rf@opensource.cirrus.com>
References: <20261127094617.1932934-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Volume/Mute/Posture controls don't need
 to wait for dsp_work
Message-Id: <179579271405.838304.8365070984179886880.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:18:34 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vZey22rggcpM5y9QG/7KyRSPl53JfaqCYiVSPZF11o0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI51/YezWzY0T57qtqhKzW7mcPXVU9lyvK5rdr8t9b+a
 nLm6+IjHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI+4mMDC17dt0R/HF8d8A+
 h0ums6J0Ew/znVlcJtF8akWXWq4+/zaG/x7rivW8/h5fc8J304n9lTFWm+YyKi9VeLG2nuXvrAc
 b1zECAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Nov 2026 09:46:17 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Volume/Mute/Posture controls don't need to wait for dsp_work

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: cs35l56: Volume/Mute/Posture controls don't need to wait for dsp_work
      https://git.kernel.org/broonie/sound/c/fbf1f115ba41

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

