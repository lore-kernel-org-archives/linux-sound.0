Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945B30100D;
	Mon, 11 May 2026 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500954; cv=none; b=QAko4OF8fsXdbwZ3Rot+NewDNh3EtBI9uP4vq/ITjpYHm7CbUv7E9Xx1MTw0nNGd7Q8mdDZaotxHfHDDOm3QnMlkz198JO7J20Garr2QwA3+fwA2CLQsXskweBsbytNoE4jA8xp+w+La7wIMaibXU7T2cqK5v2QwIBiFwE7fjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500954; c=relaxed/simple;
	bh=pZJkZbNMWuYB15AGPaBjM3k6a1sz9Bd5UejwtZhb6ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DgrNbkXn0hbxcuZ7TqLpYmTnE598s16g6ODVWygj+kqwIC5FZbvKpSRGXo+x0JU97UjIWi27NnT5xfUz3BNAe6GG092sL+l5GvgQUVYdbWPXuXaj9ImkxfDugcHy7IhSJSnHf3fc/sCbBWbNnOwam4FtGRPhVGV+b8BqyB3aiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEwReGmh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEwReGmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5470C2BCC9;
	Mon, 11 May 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500954;
	bh=pZJkZbNMWuYB15AGPaBjM3k6a1sz9Bd5UejwtZhb6ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JEwReGmhxpqf6HDQRgFFNB5nq9yOJCVYhGlkmSDcEYS+OMs+T/6815hNcFTruppbm
	 Vg7zhaBqwNBIhIj+WmRy1AY/cucWaLpvSd5M/1G6y3gT3bKtLGZxpE14+PMvzH4Ex7
	 sIruH+bHOmbhSAfHoPw2YOthRUTc7+tYLfii7FdHfR/3tH0t5Fn0/oeTbNq9uWouhi
	 XhwrqPbu1nB5cGg2EhFY0V+KcBfyXVhQFhAh+IUkEFb3R6OmTGijw6o/51qJ6OsRE7
	 1oh4eh+CUPdnYxFk+FErqpwMWHw2tNo8y11FSf15DYvdwRjEB4cvcrbLJIlTn8xvh3
	 5yHVAv9vKuqDA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Koro Chen <koro.chen@mediatek.com>, 
 Khushal Chitturi <khushalchitturi@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260508182438.1757394-1-robh@kernel.org>
References: <20260508182438.1757394-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix
 mediatek,audio-codec constraints
Message-Id: <177845931313.986162.9763116539859860272.b4-ty@b4>
Date: Mon, 11 May 2026 09:28:33 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pZJkZbNMWuYB15AGPaBjM3k6a1sz9Bd5UejwtZhb6ew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVWJI8vRFzFPLcZrIWWYdMOiEminb0Csii3j
 XUrPgL/QpSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFVgAKCRAk1otyXVSH
 0Id2B/9kPH6WFHX0ONVLwiRtWJrub0jsomL+jc1hu1AhMnPLLzpNzW7b3sujof0AACRgmYYnJxU
 Qpt+6KfOODojZgJzPZ3LAdYA9oVSmnyOFbrkgV55zhDDOzH/39//f8HJkGovJLA2WEP1AcCLQ72
 hN6puascRiRwbXkaps3Szpr1T/Rj0UBH6YI0gmPqBZCGjcnOz4P83Egm4g+vt2e0vdjMKWvzStv
 huP0JdoA30zP7GNqujWmDw0ubKCgRwPdQNzfx+obEKC7u0v5uCI99T/0m0s7cm6VmTxE/apCERp
 nBVspPnZxzvJdx8qIZqELYKTfG/+/Rqh++hADPECM7S4H1bQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 08 May 2026 13:24:37 -0500, Rob Herring (Arm) wrote:
> ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints
      https://git.kernel.org/broonie/sound/c/cb196d50a78d

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

