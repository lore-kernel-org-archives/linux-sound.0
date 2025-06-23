Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF09296156
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694423; cv=none; b=bMKuDHWn93WBmPnCjb6Ke8ekKXAHGwq0+r+CoikYwPphPl+cpxZnT+NAdgmSpSapvEe5S26YGOBav4iJXBd4LfRg1h0TJYig0VjnrWIWcaP5W1ZXq4+EgwKnFQZ4uEuVU2/8ua33OTQn8awVgRdD3mcYV+g3EQwQtKmxpyuaECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694423; c=relaxed/simple;
	bh=nTi8VJDw0jrZ8myLasXwmBe2U0xCxcxyPOdqISLfoeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ij5CUMWaURyl88683Y6RjlXw9VX8l3Dj1vEfbEZTz30phpM906aERYjG7CpOVk0nMB/ymBqdAVY/gRv/udVt0/brKBzgMxnr9ktHMkb1T+UeDiRTIXrFdL71yCa1BucN/tjAiUO44ueZHMDoc5OLaX8dZ51grd3qILdqEQxwH5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESO/KByz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESO/KByz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA607C4CEF0;
	Mon, 23 Jun 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694421;
	bh=nTi8VJDw0jrZ8myLasXwmBe2U0xCxcxyPOdqISLfoeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ESO/KByzF5Hcqf8FWCkoLYrZ4HVUHiEQuQldbeY4ui1XmkZXYUVcaIJiDm45XO7pW
	 DbkV/eTLsYStYyuH36Tkqw4d8Z172IY1mG+DhP9dSr2lHg4edhnkUo20pfuxOoS8Tz
	 F3RaT16iUzWIRLp52U1W0wY8GhslvS1yTf6u2ffkOJWSYuKye7tMfJsIxzWgMSMqsG
	 hyc65J0pAm+ymg3BoC5JKnkyKUXrPmG75vhOsv518EfNUCJzRDm6gvPFKz0bDKL2QC
	 tI/z9SyitcD9YBukPdO1Jly6n0xjtdXa69fKnjNqozZ/V1rV1+vJMrNSeGGmyyWUcP
	 Lp98leU0+Id0A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com, bard.liao@intel.com
In-Reply-To: <20250616114820.855401-1-shumingf@realtek.com>
References: <20250616114820.855401-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 1/3] ASoC: SDCA: add support for HIDE entity
 properties and HID descriptor/report
Message-Id: <175069441950.140181.1910746496877159434.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 19:48:20 +0800, shumingf@realtek.com wrote:
> Add support for parsing the HIDE entity descriptor and HID descriptor/report
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SDCA: add support for HIDE entity properties and HID descriptor/report
      commit: 13ef21dffe7691a32c83a83d697d119c045536eb

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

