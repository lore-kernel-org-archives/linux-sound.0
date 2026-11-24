Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539692;
	b=FBAX6KLp4NIZQqdlXFBpmzeKXyF6N4FXuT6j8Ggzmq0OgLPn0o5bMPBai6FCxL4t/HpU
	 vB5Jw/TqcbRoAx7Nmwi2QBSFl20brWmUpTKjfr9AQFCxoccBs4I5cP3UmbdHPIxRD4Pxs
	 2yVc/UlBqviUq2B8+1EovHK5iFzvT/6MEsVGBuq/wOGI423txQU8v3Yi8rPV2KC0zSiN5
	 L636vHocQtDzZ53d31UjFAMyN/dNFyow+BwqmysVSswCbcOY/U6GTLg2WkJ+I8aw6UHmd
	 uXBO0F89wGVRDc6XTYi1a2Liu4AOgYpd9qVy9onY/y6PqIkUH5qWnSt0MhYfQ20SXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539692;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=azlOkdFXepgocaL3C6iTHZtW2T8WACubyNNLMtTAchk=;
	b=EFtPX7ltQqB4xsMUO7wCYmTryLF2SDyMPQZUCUXdVM4iLTom2vzYAwXNciw82oR9bHV6
	 ZyVeFbvGn3axeWkOueXX5B3ziko0YU2Oe4M/VtI9zLfK6rbmVXexHHhoKBFxxhgn1KcCH
	 14r1DG3eDxXI1jH1r2wXiTLtzFCXvIYiw2lUHo3Rdsr4EzdbdLxsnQsbzjnhLqPxSmgAG
	 6WyOmLKpatW34SkXoc6xurRLdNsggCK7KTYH1RfsG4KCdYDvvpLYsAEuEwtWZpclVOFet
	 6RG38VmJA9qIz1HqcbHBaSciQq/hNwpmjvcmxrb2UeDFOzKPY/OQ/n4egcgxD+V7QLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1O0iaaM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B67606A31E;
	Tue, 24 Nov 2026 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1O0iaaM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE5C1F000D0;
	Tue, 24 Nov 2026 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539692;
	bh=azlOkdFXepgocaL3C6iTHZtW2T8WACubyNNLMtTAchk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m1O0iaaMHjDBhIUHMgoy70FQu2sejXgJ8bnmWEjVLoa1uvEk1mVTNdjndF4etXLwA
	 rBiHZCFVQfbvfSHYs7F1uCVAnS+BbvkCNugeWDSxmH3Ect7ga9P8zAEyFkABa3WqAI
	 /7bggdB3Zi7sTAzV4A93c66VzMMNvsuDfFpHcaDhzGcG4n6pyUBr4UAmOYHT++VanM
	 1z5Wso0KtavHm/xdgRjigsKgzHweXUQL9whV570Me6nXuw1NzEkWH7Nc4H1dQ/aX3o
	 66h+g171WxTnHrQ1iXUuYTn6vYvhyAdL2+uggrm5JKPqs5ktg3xyCb1AEfZ7GUiQId
	 81n5t+bDlV+VA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Chen Liu <2508871010@qq.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_4D458B8B4F511E5B0F06C5C858627990C306@qq.com>
References: <tencent_4D458B8B4F511E5B0F06C5C858627990C306@qq.com>
Subject: Re: [PATCH v2] ASoC: wcd937x: bound the DT channel mapping to the
 channel tables
Message-Id: <179552842099.264265.14882655118397090525.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:53:40 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2VkXjhsuHtc518/r4rctTqOgFBo3plOdxFfAeVIEsT8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZD724HBUntEFm0qm/sfwWV27fPVWtyxv3gvv3PZGJO
 7KstZcu6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBETC0ZGS5ttZ2YuMeOR+bd
 wYNiR34s4a1SMtlV3X385aOTQRoPuD8w/OHTUZRyUb8+46Pi1WYB7Yla0ieuJf4vXZJ+5jxnzZP
 /VawA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 16:10:52 +0800, Chen Liu wrote:
> ASoC: wcd937x: bound the DT channel mapping to the channel tables

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: wcd937x: bound the DT channel mapping to the channel tables
      https://git.kernel.org/broonie/sound/c/533adbe092ca

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

