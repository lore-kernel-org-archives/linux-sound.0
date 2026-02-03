Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE01318EF8
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120319; cv=none; b=WvCYl5aZJqMfrr6UVRHCtHt4rqpUtCAbDHy6ZuiGjEr/K7zDPkAfmdXhku+htLc1HUfB4veeMY7XF+0jk0LJn9oVFQAgw5roHLpvPXsDoJKLstiOOJI+VThLunyynQa76UdkbhEtNPSVWSbaGHfyv/MULUrE47T7djC2WXa6a2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120319; c=relaxed/simple;
	bh=z4VoDNERRYtuMQVBvKyaiqZlIvxxrIGue8gdozMPVdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=McaR/60YTHmR9xd6ySPH1EepPaReD3RKgMmdb5TVgr4SSkZ3TTJePCFaHT5nL1EQrBgwTTQrrh8Rht9YbBK0LdxDImo/Lkn/mzD2cWJvboSWORaPMaBObSfJCgO/ooSGTiqpVc7aZQ4FbaoKM6pnBlyJ023/2S9NPPTL9SLGDgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbGpJIXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbGpJIXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D31EC116D0;
	Tue,  3 Feb 2026 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770120319;
	bh=z4VoDNERRYtuMQVBvKyaiqZlIvxxrIGue8gdozMPVdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YbGpJIXz42movnB2GmnGrR2Sg6uka0W9CZYFnWGEiJeqI57Zlwy+fshS3reLTB9Dr
	 pk2XEcWJOoV/BlAQvylOXGBQwo49LKRZUGiQ5gNhl40ZZedlXPboQGeY2yN/QreY4F
	 md7lRDoN7ogeeZinYrjZuQsqschuyC2Tx+MP/Co5duUE+EIggDvsYcbYItGiMrmB2h
	 /8LPeCVvnoTkDLI2rVu+EWdjuXOlc1zLm1lx93TVq431MBCaLVzlIqc+c6n/jqemXh
	 Q2P47UUcNZgPsCZbX+73fHFYxsYK3orN1Izoey8WMp2IblAio6tiEHzhBe0Hi/nzd1
	 8Eaa7uyK/R8iQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260130150927.2964664-1-ckeepax@opensource.cirrus.com>
References: <20260130150927.2964664-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Correct handling of 3-pole jack load
 detection
Message-Id: <177012031805.85387.3712053723095864911.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 12:05:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 30 Jan 2026 15:09:27 +0000, Charles Keepax wrote:
> The load detection process for 3-pole jacks requires slightly
> updated reference values to ensure an accurate result. Update
> the code to apply different tunings for the 3-pole and 4-pole
> cases. This also updates the thresholds overall so update the
> relevant comments to match.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Correct handling of 3-pole jack load detection
      commit: e77a4081d7e324dfa876a9560b2a78969446ba82

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

