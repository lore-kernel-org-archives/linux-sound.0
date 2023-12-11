Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE3524B2
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5zI46uJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40035C433C8;
	Mon, 11 Dec 2023 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702321430;
	bh=jPZOpPfRIO33FjSw4TAO0bYOtHviQ2FfdXPtOMPoOE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h5zI46uJjeCyx4H2ZEq5X5havzSjmZ2VhYKme/jQj9aF2bEPvMOa+4hUWcxLl48qp
	 HRsBlclkh9NOaF4LHT7pu+xeFDRRN1s4DHQofxmlSfFaHPVR3Kji4BniHWClrATwZj
	 HSgW/0G9xs+8aSk79lVbPxGhlhzzWD1cX6mdBA+grG/sQz4kvZnmRTr4rmmlBJznUZ
	 QilldgQZ3F7WZx7Tn0/pL4U8FVsNi0S8cYvS5+9yK4deBVClVySLrbmlVKW0PUCkJC
	 31dPb5cgn3hq6wF5t8ExzvRm73oxbg4IPEivbXXsAgTymORNz//BJgs2fjXSxOzs9p
	 YBH8xjVzS8OqA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
References: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: cs42l43: Don't enable bias sense
 during type detect
Message-Id: <170232142897.117554.4237555442844549737.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 19:03:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 11 Dec 2023 16:00:18 +0000, Charles Keepax wrote:
> Alas on some headsets the bias sense can cause problems with the
> type detection. It can occasionally be falsely triggered by the type
> detect itself and as the clamp is applied when this happens, it will
> cause a headset to be incorrectly identified as headphones. As
> such it should be disabled whilst running type detect. This does
> mean a jack removal during type detect will cause a larger click
> but that is unfortunately unavoidable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs42l43: Don't enable bias sense during type detect
      commit: dc96528b176fa6e55a3dc01060fe9d97be450ce9
[2/2] ASoC: cs42l43: Allow HP amp to cool off after current limit
      commit: bbbc18d8c27cc9d40cc9a3b03b61e4df85311146

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

