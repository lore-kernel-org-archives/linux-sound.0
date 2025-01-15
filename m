Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2A1AAA09;
	Wed, 15 Jan 2025 19:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736969915; cv=none; b=PP4geogH3u5zWqBMrWb5l3W9rq/z+WmirtOnVJwD2JlLhFTPdlJW8ffUn0WKS+Uy0p8Zq35XgDehOOAUP4DllUjftF8Xjl+c6LGdqSLXWxhRwmHsjM89NBcCimFfW0xlKiztPASBbGN1l5aV3YBRMhTYWHZVH/iH/kF5nn5KCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736969915; c=relaxed/simple;
	bh=CJClRZEfy8Pts8aXQUlUF+PP0Z0cuzM2vs65cM1w/6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XSHKuAjBA1sXAjBd4mRjdscSj8HJKh/YTjy/VgDfcbb5AovaF7pjp7bdiGUxz2PaH3PwFOULqIJhtLNxstGgjy/qJQuxUbLyda2vZ5VIHNX/VesRd9NojHuCuZBSZ/MtCaWf2JVkwwLDWZrPkdMb/C3npEJpI4LctfZ+EiHJxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2eqR7b5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2eqR7b5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3389FC4CED1;
	Wed, 15 Jan 2025 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736969914;
	bh=CJClRZEfy8Pts8aXQUlUF+PP0Z0cuzM2vs65cM1w/6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m2eqR7b5oBJJTvdF+UQbMeEOkfD3q1gyOySBM0lc+6Kv6Atuk1ruPNyPPrn8ZXj12
	 0ffnHK4s2eXbFkME527nmS9kmlmv9TTfLharERoPmGr0G+rGUNp58Aq9UTB6i5HWV1
	 V64vYJJ52FUC+KiJT9GJDFwL3ea+Rtj+lCc9DgIb5IK9JZYATqxd+maeiLavMs4liF
	 IN37r06ME6YdgA25cf1MGzUfeqEil1YPWAplC8TsVmXJoYTzNPCbcIJyCX1tUxdKN6
	 vOLKj3y63KXfhN1St3hE+sYDqjM9IvI1+XExFJesmQw4fZHzfFVf1dKSj7YoLmSRWG
	 HggyGlfm/n1lw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: s.nawrocki@samsung.com, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 0/2] ASoC: prepare streams on codec-to-codec links
Message-Id: <173696991294.258685.10820885833141683786.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 19:38:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 14 Jan 2025 22:56:15 +0100, Martin Blumenstingl wrote:
> the DRM subsystem has recently gained a HDMI audio codec framework [0].
> This is already queued for Linux 6.14.
> 
> I want to implement a HDMI controller driver for the Amlogic
> Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
> the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
> callback to be called. This unfortunately is not happening on Amlogic
> Meson8/8b/8m2 platforms [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
      commit: d4e91adfc261de1454538ee6437e6014a2d1fca1
[2/2] ASoC: dapm: add support for preparing streams
      commit: e436d43551764bd6ca22a1ab1e80e98939b8aec7

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

