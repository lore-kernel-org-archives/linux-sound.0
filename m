Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22301DDC35
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857958; cv=none; b=tdwjjczez4/BaHnkXI9x5N6IpNpRj6UOJ6LqFp8P9+s8JWDU23TPN7n4WVmtcWUVlRrNdD+oiuzYqk1rsUcuPDax/HmJe4AFZ5KojoN0wuU8mRCbLjS8+L+GAcLWq8jZ+n1aOKBzcL9uJkozGBOa4LKc4Hfz/SQSNa3VZHxBZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857958; c=relaxed/simple;
	bh=q41JP/jRfBOr3sGSHX95OpPZ3aCOroih5BnM2kttudg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eXQP+dTkX0jfYa/ZH9RcW0pb9O3NFTUDmucB6wY0tifZ3BZoPfbmgmGDkZh2VWgFdBHaPvDHkU2dVvtcEDyi1YIqFW5JGb5J2uNTo+tYj/sdvTbXY0pqjJhpJxw8SYEmcCPosE7+mShAJghlh3FbAu9i2161WZQjRUJ46pY2YVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHELVBVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHELVBVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC533C116D0;
	Mon, 23 Feb 2026 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857958;
	bh=q41JP/jRfBOr3sGSHX95OpPZ3aCOroih5BnM2kttudg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dHELVBVveQRvjOXYhGlxfi8YWi8W77B5jkg5QOKH4nNicmCtBsZTb7GgiXpVDU8Bk
	 hykX4LGkKwWhX+nnL9su7B3+JA2Bt4Hny4A06YWH9kpTyC6aUcOrrLqDLt4UewgXFz
	 YmoUPZO/JjuKH7ZmVT4ng6btISMEdeY0Sxl+IkuLBet3zH5y/gqhDFTWyfVW/1vlCj
	 8yJULTSaUIl+Kf/D8vG+SC+GamkkcczGF+1175o28Bkb03P/cYIcLf2/ilAdJXX+df
	 EIUbhrYoBz+D8ha02E1DveOm77nqmA0vXFRObG8vrdYjEUxgwmGVwlEiwJQSrmDdHg
	 SNnqdflPaUZLA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260223093616.3800350-1-ckeepax@opensource.cirrus.com>
References: <20260223093616.3800350-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Report insert for exotic peripherals
Message-Id: <177185795751.228935.7923308753275816154.b4-ty@kernel.org>
Date: Mon, 23 Feb 2026 14:45:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 23 Feb 2026 09:36:16 +0000, Charles Keepax wrote:
> For some exotic peripherals the type detect can return a reserved value
> of 0x4. This will currently return an error and not report anything to
> user-space, update this to report the insert normally.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Report insert for exotic peripherals
      commit: 6510e1324bcdc8caf21f6d17efe27604c48f0d64

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

