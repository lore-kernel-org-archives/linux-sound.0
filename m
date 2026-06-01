Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD413D301B;
	Tue,  2 Jun 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402042; cv=none; b=MkN6aqjv7yVMYZQXtMYeZjR027m5RbDL9jby6XU3LQjUQr8MOu3LPuNYEmi2zcfpmeQEpHFwnXob+CrUdGHPoTTWxYHBeG4B4QOYOGWP09Y2vPdZXz+NCqDimAdCsnv/ySj2uW2uVaPWLRE9cT/GPphOX/1zm6QC29VZ7kmIAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402042; c=relaxed/simple;
	bh=hLZrVWdpgEiigLLE1L+kDHlZRBGb2UU6XAcUIO8GOa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dhWPacJCrYVyoEmXx34LPMi4rzC8TnIZnnyjtD0TAouEPga662gl4ICFXqz67XAMjROY/hvHRgNIQiemVVe1Yu3YklEMBwUySLdrCmt97fMwBy2a8iI/h5rYOWXXvrptULIlRxKB/PIFJUsxx1cSV3zT6PrYGMsHUQlp2U+uu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UuZgpxr4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuZgpxr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1D71F00893;
	Tue,  2 Jun 2026 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402040;
	bh=pEBanZXD28yLbzyFMoCw8vpjCe8PBdySKqmDHHVxhBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UuZgpxr4Bz6wK4Y/umHh3809GRuLo2prrzI8tybC7jqf0MyNIYnVdCKjEJJX9Fbxf
	 Dot6L7mXi22VU0qRQB9/uMScKzhYulT9pEzNEH6+LUoJNit2YWc6qs79tJupg4fAq5
	 Zd66Nfp9I6aCs/D/vjLvbvR7On48YV+2X/vMH4i9/6+m5duLzdL+9k/CHc1jm3QW/i
	 Z5MPGZ+KxfWHpBtxnV9P5Yka0g8FDMitu+twjlnNXjnW0r1tRjuSwY+RTjkGF4JJ9f
	 rELLAHdUk/jGWBjgpoLxfUqgGjyxAypRDN4nVhC7+lcKHi81iL7SuJ7D8EYcjsAatO
	 ggcI8/TURz6ow==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
References: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
Subject: Re: [PATCH v3 0/2] ASoC: spacemit: add K3 SoC support
Message-Id: <178032605224.44654.17377992015065063925.b4-ty@b4>
Date: Mon, 01 Jun 2026 16:00:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hLZrVWdpgEiigLLE1L+kDHlZRBGb2UU6XAcUIO8GOa0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHsd0rI4ckJ7Hm165gVtJqeWD+VGtD9cXsVPN3
 dejlbxrFqaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HdAAKCRAk1otyXVSH
 0Ie+B/9kXwOMyqDW7DQB2QR+IlYPuicwCYo7eHYZsh0vcs7GVf49egNza5+h7CGQ3u7VPy2vVyl
 IPesk2nJs0c3CYCeZSBG7amhiSp2cAPlx2yjVW0z4AOXGaQY5KglIZRuDoJl5h4h9ACEY29QcjQ
 9Lnu9yCyqWbzM/Jaw9Cthe7oU7XRAgwuFWaOtW51mYmma+uO1TaR9Hs/LZ3bTwiLxO9nf53Z7yB
 IMNLLH60ifiy7cpsx/6NZR8/szyte7mITd8zaRF4AgytSbkXeGWr/z17Cgytn40A3uFD73ONTvm
 YRyhrUq/i6uSawoa8P9dEZYNQFi20YgYD2wqQl9BtIKYFIOM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 22 May 2026 21:12:13 +0800, Troy Mitchell wrote:
> ASoC: spacemit: add K3 SoC support
> 
> This series adds K3 SoC support for the SpacemiT I2S controller driver.
> 
> Patch 1 adds the dt-bindings for the spacemit,k3-i2s compatible. The K3
> SoC uses the same I2S IP as K1 but requires additional clocks
> (sysclk_div, c_sysclk, c_bclk) that are shared across multiple I2S
> controllers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      https://git.kernel.org/broonie/sound/c/6bc6b28c0314
[2/2] ASoC: spacemit: add K3 SoC support with additional clocks
      https://git.kernel.org/broonie/sound/c/1c6ca2ca5c1b

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

