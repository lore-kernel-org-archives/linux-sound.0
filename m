Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D629B766;
	Mon, 24 Nov 2025 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002296; cv=none; b=OJ59UW6Pv/JRv+a8VrOhe75RbwbMY06B07O9Z95jKqD/y0WnmJs8gASxSDX6hmYn5WJwuEMjCdQ5MGuvs+GguQq3V4rvfvzAkaKPZ2SQT+BVFWDdY7K+rkQURxylwZaclf4xSkUBkuQWVNUJse7iScD+8ZU431h4DkdMoB0+8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002296; c=relaxed/simple;
	bh=sx6ZS+uXGa0YXKexZPrQNvi2wnVAH2o/Ce/wCiyZeI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=inK4evcSOOPN4GUrtFFmhVe0xY+GGsC2VRGsuWfl2r+UI0EjjMEHiXbKHXCGaJQZPSVhnUydkAx9EB0iaScLy+Bkaou5kzFgTQtojsrUIevbfBXo8arl8K960gWzZp9we4iJM86ScHZ4MuCgtdvUgyDce+C7xyrKpas8b8mdQOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxPJaltz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxPJaltz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CC6C116D0;
	Mon, 24 Nov 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764002295;
	bh=sx6ZS+uXGa0YXKexZPrQNvi2wnVAH2o/Ce/wCiyZeI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BxPJaltzKsrxvnjL+m6DnEgb/Ib4Su2+Xv4CVLxyP2enIGyZYDHA4NHghT0WLgNX5
	 eRrWo5M+O1RO3+b3ayJ9Z6J+B+e+FnLYFgXfqYmPQack0FN0cmUWp2MFh2hxlHhr+1
	 mcFXGXpYitmLehU82ljjjqM6BWQC4Z9IP+ozm+6KmatZsXYtgQCqyJL8HiL5OSLpUF
	 xi/IfKlEN0eSwe7fmxE3UQ5MwfMe6ecvhoaZCWRsWeRnxuitq9V3O0mCxSVZRAz81P
	 Ne0aXv9rVUhvT7UQ+CWtT/DWYh2MgWPyXD3Q7xA9iHfqlPIkF0OwoUFCGDdfFFiyz2
	 BzMPzoAbMtTWw==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, will-wang@ti.com
In-Reply-To: <20251124031542.2793-1-baojun.xu@ti.com>
References: <20251124031542.2793-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Correct the wrong chip ID for reset
 variable check
Message-Id: <176400229349.72424.1392117575410206186.b4-ty@kernel.org>
Date: Mon, 24 Nov 2025 16:38:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 24 Nov 2025 11:15:42 +0800, Baojun Xu wrote:
> The new variable of reset was added for TAS58XX on TAS5825 first.
> And TAS5802/5815... was added later, so this reset variable check
> should be changed to lowest chip of TAS58XX.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Correct the wrong chip ID for reset variable check
      commit: 34b78ddd78428e66a7f08f71763258723eae2306

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

