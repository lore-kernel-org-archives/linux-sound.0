Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4BD3D9699
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792186005; cv=none; b=SdI9xPctDrY16FjvO2NEEl0UpfG96bEeL4/Ldk1ga1U8HC5jJj2L9s3EOFqhbY7cVJy8VY2zwsSLsKQtro9jpUrdNtp4KcKRaC3iuoBl7HfyvD/rUugOYTpOc+tjpUp7pPKUi1wSAJ4eAfoJp7aDrV4yNOw8ea5CVX7dWULOdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792186005; c=relaxed/simple;
	bh=LrBdPhDavb+tJeAeIWChP0aolTPb9ldz+gFRPc7byYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MsnfcX7NFi0MewZiwPS8QKT6mGc3rGyuqJGq4+QKs9negRQ6MSMxp470v8XneYwbwkcbQy4ZciwvUk+Ehj7P9F1QmJl5ItfQNEZAzv6PYNjEIcwB46HePU4REjpote65fZmcDVmoXxLzz7qkdmCmXET92GyP0UKoiL3pGTIW700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+IdUbSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+IdUbSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BF41F000C9;
	Fri, 16 Oct 2026 21:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792186003;
	bh=qP/ID3pgeyVDOwxaYgqJOHV/b0l4+bEq/hSZcT1Xgb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y+IdUbStrFjZDbB6ruWOv7v0Z2QYJ6hurRVvTUE+ajCfMyoaV+IWEMrl9RNwABigC
	 3H/fbAnG7g5H2jAaPqkQw2RGGPHnSOPDbETWjOzsjD39UcMBqfm5UALg9FXxBFFha2
	 dQ7NtIsLc94oz+m8XwX7+vg+1rGCejCTIoY5XGVCrS91ZGujmca/NiGUdYHy9RCV0Z
	 2aWhCIpiMzt7qd5xy5iCBiMQ0X0omcAgd/HzFWMaa9euSO/CoAS/1OcYH/LykJw2Zy
	 1AwXVgI8MCB5y/AB+cNnVSyu464vVkYDq7sattBC3HbEIgT8/lA+1LJDf9yjqjq23q
	 t359+BU8YnMgA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20261009052942.17346-1-peter.ujfalusi@linux.intel.com>
References: <20261009052942.17346-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: Make sure that link and host DMA
 is coupled after use
Message-Id: <179157505703.2423942.15433376604663540139.b4-ty@b4>
Date: Fri, 09 Oct 2026 21:44:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LrBdPhDavb+tJeAeIWChP0aolTPb9ldz+gFRPc7byYs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIuTWv9yrJfpmu5zuYNXQunqTEs/BXW8PzZKcOXe6UyO
 oTy9eXtOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARO02G/26dBvZHIpUtbrcb
 1XwvL5v5+sa2o8evX798w9u5zO+c2TJGhuf/C1oMRbofPvn8jX2Gv7ejg+Elp8NvEsOLXsdZX/x
 xmBsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 09 Oct 2026 08:29:42 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use
      https://git.kernel.org/broonie/sound/c/0688699b3612

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

