Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1D03F5BFA;
	Tue, 19 May 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182723; cv=none; b=XcVZk3b8VB2jJyIL7uKY2MI9j0P01+YhIg2kb3m+TEtPk17d+LXYpZeZWf7aoaX7cAzDz+Odx5520AUdP+7hkwWV+piEbFJ3PRRv8Wtijc6slolS29vUGaUjykPkSSSiS1KycQtSOqJVd0K1g0Qx16UUbodmvhVrzCIX2khz4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182723; c=relaxed/simple;
	bh=iFOBQrSNZ2nMXqB6+u+Z7u9D0GpUYhiWHSHlDRAvya8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oc/K/3e2UufERehfebSpUwYmFQ46QjtQtZ0txCN6ibrce0m2kFDwt30l7Wd0DVJLw2BuBpUYMIlwbQrcHxCJqCZtkZwR2A9uLhbiOilO/a8dl7ABz7vTNFLTr8otj/tczLuVvKS8LSWL07eVaxdgCm3GxX+gTYy/RYbi0thtx8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtiU1HzI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtiU1HzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE13C2BCB3;
	Tue, 19 May 2026 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182722;
	bh=iFOBQrSNZ2nMXqB6+u+Z7u9D0GpUYhiWHSHlDRAvya8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PtiU1HzIPX56xJHRFwwtmKL97cZVTvmXImLcoWFP1yBckScaevop25n4pTqesy64/
	 selgm52QCcN2EPKHzP0lwO88Qt8LnFsFXU8lGMg5x6JERsETeVLAv5Dp1hkNiWRvys
	 5k0LIHV7dNyu+D1DQbOQXchnm87Zl5hVrOr9tjGU/vUfYNVR7c4LjkkU1BkjL4Fx4b
	 3GC3ysia3+L86UjsM2P/2qB5L6PfeNdUQegN1VkzjbJHPZ1bStPgytyrOscaGgGqHh
	 NVebStCNg4LOcsqGPFdhEA5/YlyXEi0fdtlQIvtRD/17yrJrSTFCgTg9V1UWb+3GLE
	 FFSoCc7bWG+Lg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260517-asoc-mt8196-probe-cleanup-v1-1-a5d26949d7fe@gmail.com>
References: <20260517-asoc-mt8196-probe-cleanup-v1-1-a5d26949d7fe@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8196: Fix probe resource cleanup
Message-Id: <177912152253.31945.3862884738428622527.b4-ty@b4>
Date: Mon, 18 May 2026 17:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iFOBQrSNZ2nMXqB6+u+Z7u9D0GpUYhiWHSHlDRAvya8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqDCx/ax2u9yF4K5DNV8lZ1HlfFlyY1FliDAHiO
 N41z+FGNIuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagwsfwAKCRAk1otyXVSH
 0No3B/sErmVf4EA1gqpVz6orSuSFtNRKz5nrNCdol8y9MjDvM/dQIllkshc0W9DuTaCeCm3ptFS
 +Tx3dsy9M3kZgWOBQldAzsDWDSh0exUzGFKPj7HDH30wiLbmPLwK0KCJBOc5HFA90DnmULlg14l
 ch7m8+I3P/ixjqtc2H2C6pVtA3Zas2X0G04pCRxFWrppBnVNTOpFUyTEBJ/bwHF55AlwkAKdDFU
 dpq+NZ5yHXJUOkpPBQpFIkBkuH6IG9xkJITNGoUwNKPhD6UaelcdcCe3miccB+X/CI+i0hgtbwg
 1h0C8mrtqJ8T/QNG3oAghlSORygv/mXS9BUy5tGeLRaTaEA7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 17 May 2026 23:41:07 -0300, Cássio Gabriel wrote:
> ASoC: mediatek: mt8196: Fix probe resource cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt8196: Fix probe resource cleanup
      https://git.kernel.org/broonie/sound/c/e38353138a09

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

