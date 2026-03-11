Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719673E0249;
	Wed, 11 Mar 2026 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255421; cv=none; b=ned6V+p8c8eBZz/YofWAf8BZ7YOLiVtoY3gcODEU09S9Jq7Z6gP7Pu7RMKPPks3UHfRqha0c+utNcbJj+oTTSKhgbUvOr25KY1eVZm8c0Hcg5pnBXq2eoashEDqC+Rncp+XZsc+ovmRYNTMufFzWzFnqQII2v7X7K7w5vB996w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255421; c=relaxed/simple;
	bh=n92XdqbkIH2kWDoYBCbBYfG/L6hE35pVoYTwAlH0asQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QeTpBB66J9Jg56Em+vCm8a0bozjstLYboHIePz+dhJ27fqK1wEL4V+6gHPXeiafuPJf72cH4O3c/hDvxz9eUkEOj4U3IK3kyCglSCw3+cLneBLDRf8PfF8yTkiPxOZUubE1yOhiaPYqUxcsvudr83wCk2bIHL6t0zpaGKZNynQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBJc9csG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBJc9csG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08F9C2BC86;
	Wed, 11 Mar 2026 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773255420;
	bh=n92XdqbkIH2kWDoYBCbBYfG/L6hE35pVoYTwAlH0asQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LBJc9csGrsLLZHyYqdFsFcnZ0UX18xsTK1BgY7ZILWeDs5Vt0m2fliP1iZmyh4UNQ
	 XEIIh3oxBBPutX6iyN5PTLVYj4D5Y1FYoAOGEl+3Zd6NIGAOxlxfU/825AnWhDrgQV
	 PS2TFtR4ZAl5IqPF12GN19YSsfyWBJMpmrfHKBL/XwBhrgyo1EF0M1RgTgva4gIuyi
	 5w5uWu23kW6UA9hmSBGKL+TG/FCVzbU9l4ezSm2Nc3SZtajwivZs0/UZHmvvIln2G3
	 N5XqIPfnEQFp0urvs0F+aHxaiMdJJPY4Sx6bHJsKuEQCZbeeUtronPgeNZQQXQG/o9
	 RthCnFQX8jxSw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260311142153.2201761-1-rf@opensource.cirrus.com>
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
Message-Id: <177325541965.227645.3283429879588032608.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 18:56:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Wed, 11 Mar 2026 14:21:53 +0000, Richard Fitzgerald wrote:
> Report the ability to support SoundWire clock-stop mode 1 if this is
> enabled in ACPI. Mode 1 allows the device to lose state, so it can
> reduce power consumption in clock-stop. Also add the necessary
> handling to wait for re-enumeration on resume.
> 
> This does not use sdw_slave_read_prop(), because that also fills in
> other properties from ACPI that were not previously set by the driver
> and this has been observed to break some systems. Instead, the
> "mipi-sdw-clock-stop-mode1-supported" property is checked directly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Support clock stop mode 1 if enabled in ACPI
      commit: 48863104d2e1ea70a68cbd8d87c0d75270f3c6e5

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

