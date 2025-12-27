Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C719B5B1
	for <linux-sound@vger.kernel.org>; Sat, 27 Dec 2025 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766874913; cv=none; b=eWW99r/8stcGy4UEwdLixZubxPEfFohCYgpV3akOSERXtjduddfqCNNY9fVucndlosoZZo8JQFX4AeoEuGvcaBm83s+7a2HNoZoQkklxYKr147p4PUW1A4PFjVxzdPWAflmp9TbH00R9e6XR/XxDCNDk/pHf9Il8hDINelahSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766874913; c=relaxed/simple;
	bh=ahd6U+8oMHt4P+wiClARnrDITy5YpwdgKXLteAGv1FM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BEavSqtIyqHGoiNHei7EH9kCicQdKbId3/byBcLm+FJ0dhhKo+vJGJAolVKnn0QBkYyI3z7T6Cb6ZrPvkGbosh5ayIcW5SiqRUQjRSdfalCghqF7tBd99qGsTO+4WqtGdKjLrqIfLA/NI9cRHRgQyKltQrRtVsIe827nJPMTT70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NceuRvyo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NceuRvyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF92C4CEFB;
	Sat, 27 Dec 2025 22:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766874912;
	bh=ahd6U+8oMHt4P+wiClARnrDITy5YpwdgKXLteAGv1FM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NceuRvyo70x9Lq6vfPx7U9jrvNm0OTEs1sIVFO+WMhVuD/baVZeiIOZGA13uoBseT
	 VHvwleGaVCOwzQIJu5r+/3f6LKtkiotYfo9wNR3BZWTeAFHPbMhripHgd2YlqESsG9
	 Bzt64e8BwgJjz1S67Yg3qkHt+GUN3Sxs2LD9pYZN8iE1Lnl0rHNnX79HZWz8dQTlwb
	 D/MR9R+ZQs1PRMOd0PiRiPdXv6F6AOZDwR+Mqtg9BiS0BP/gopk09hkup719YB2OZa
	 lOAZA32xMlPX/snwF1a1ZOF5rrOxPgmzERQW4IydPMRJuJNeIpWN/IqA6StRR/u2F/
	 HtXrKeH1phzPA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 arnd@arndb.de
In-Reply-To: <20251226064255.993735-1-shumingf@realtek.com>
References: <20251226064255.993735-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix the remainder calculation of r0
 value
Message-Id: <176687490497.464554.752605836599082624.b4-ty@kernel.org>
Date: Sat, 27 Dec 2025 22:35:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 26 Dec 2025 14:42:55 +0800, shumingf@realtek.com wrote:
> This patch fixes the remainder calculation of r0 value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix the remainder calculation of r0 value
      commit: 25abdc151a448a17d500ea9468ce32582c479faa

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

