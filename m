Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96AE1EC01E
	for <linux-sound@vger.kernel.org>; Tue,  3 Sep 2024 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403829; cv=none; b=WTTugweB+WMAXb9uRZPUoFKN9VZPM3FJ65B8bwPFxi6TgvlEx3bQlMpqPBFOk2kHVqd1pboMEgv1vG10hyBl2jE9aRQ1/inuxEyIBGXILNL3kjx006L3b0+LHOOZc2juncXKB9SXb66PY06N5zOK3pxlAEWpY1Hcthl46M1vqjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403829; c=relaxed/simple;
	bh=E1FRRB8uzuRrr4sETqMVC1vm1Kf3AeEHNfMhc1Zr8to=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W1HY2vcJR5f0Eivo0dhJRLUwjF+eMpJblJDsCYEgG7KHILorBfoU2cHg/UUWwzZlcinm3CGs7QQfyATT3TeqQbDrQcN3+RaP+iY0nLivMPmF1aj/VpZyRtjg+PITzb7wVxj3926lBYtKb+r13BiBb+Sq0gulVu121zYBzGaCbhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d40BttQ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d40BttQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8470C4CEC4;
	Tue,  3 Sep 2024 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725403829;
	bh=E1FRRB8uzuRrr4sETqMVC1vm1Kf3AeEHNfMhc1Zr8to=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d40BttQ+h/ne0efHOaIxsQW/tmEiK8EZU9bZBK+8xIJCo0GlhKXRkhv3BIS/e2Lcu
	 0ZChZZAIa1GHS1w07v2lNvMacENF2uq1KIU8QIMHJA2CvlGplXkRNc6VV3GBkpe9Hg
	 vL0j9BevChl9uDOtuHiMpLtlvgX09lkdycitkJvQTo0zvXiC7knvJcuzMWGe2KdN1w
	 v3BVWa7F4YZspV+qo82WI6UGrg02i9kEvOgAIE4BVDlSZUKG8domtrGQiyXtX1eXMJ
	 w35gDXi3o7/4Essu7Ho3ikY0eB/F/yABaFdfhjCDf9+8DC67P3+4f0s2PgkO1XCAs9
	 5WxscK27UF1pg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>
Cc: Baojun Xu <baojun.xu@ti.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>, 
 kernel@dh-electronics.com, linux-sound@vger.kernel.org
In-Reply-To: <20240830231007.205707-1-marex@denx.de>
References: <20240830231007.205707-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: tlv320aic32x4: Add multi endpoint support
Message-Id: <172540382639.163502.5719294960592347101.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 23:50:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Sat, 31 Aug 2024 01:09:43 +0200, Marek Vasut wrote:
> Support multiple endpoints on TLV320AIC32x4 codec port when
> used in of_graph context.
> 
> This patch allows to share the codec port between two CPU DAIs.
> 
> Example:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic32x4: Add multi endpoint support
      commit: 568dc2fae5d3697033f5e28cf4d6225b3db00461

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

