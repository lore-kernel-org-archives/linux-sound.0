Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90527182;
	Wed, 25 Dec 2024 01:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735089841; cv=none; b=V06RvXKltqviEiKqkCISy55s9DoysG25KSExS+ogR61QwdG9BLJhj46kbYr/1fISITVg1wAvkNlrWz3WOlyCNF4aoMckWbjZkpXlKEvGAWHtR7dQ8Zh22DfpM5LHQmrF0kZHg5jsnxBgs97SuK43fGwDD9ktH2CDsLkOxWzaTxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735089841; c=relaxed/simple;
	bh=e83tqN5huJo0FnC0VrtmBPXzLM9DIYyh5iJdX4rCQ+A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MIwVkjMTXNBOXWLTDG/k++GgS4NEXB8EGBep7pkZ8xtGFcmrdsGycJegi7lgJziUBBqSqgV3mDyDgIhhCD3tpyr+lkqhQtXgzVQJJP4/e6Avpv5BruiIYqzJHva+q4aYHGt3D2cnMdOtZobocquFAG3enKLTjxHgjKLUc0p9hVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQe49WaN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQe49WaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593EFC4CED0;
	Wed, 25 Dec 2024 01:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735089841;
	bh=e83tqN5huJo0FnC0VrtmBPXzLM9DIYyh5iJdX4rCQ+A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FQe49WaNZEca0ANfqUbzNwF75mBrNOzez/hx4cyZ6YA4CvBFKdIFY28/OBLIwjrLK
	 uGOaYvUFBqwhRyXTUlSOwoZk7tz2tV62EmuS9MyRaA0whzndVZfsvsGZbYHFR6GnGu
	 us90opcPVJuXR9sSVKZJ8YAJF3zsy7VnhEHz2SVMHuGpPg27zhyWbOdG34bse6DlbW
	 9KPqKgkTfQYsv4wIMV7OQo8GmYse1ZVuVQ1V3o/H/oDHV0vYW4i/BPdUYi8BH1AhLC
	 lQgU81IiSAuS+Ko8g1hFynG/xrDdlY0ObmQHbP2P79q42ov7cOb1YaugNv+mS4U4Hp
	 6i1XSlBiAO9Jw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
References: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/5] ASoC: SDCA: Add missing header includes
Message-Id: <173508983900.596917.320979208067796021.b4-ty@kernel.org>
Date: Wed, 25 Dec 2024 01:23:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Fri, 20 Dec 2024 17:35:12 +0000, Charles Keepax wrote:
> Several of the SDCA files don't include all the headers they use
> locally. These are included by the point of use through other
> headers, so it is not currently causing any issues. However, files
> should directly include things they directly use, so add the
> missing header includes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SDCA: Add missing header includes
      commit: deb015208f7be9a62cb68dd8337d075b1829ee1d
[2/5] ASoC: SDCA: Clean up error messages
      commit: 935cd06bfad4b715195befaf527a2d4fd36361d9
[3/5] ASoC: SDCA: Add bounds check for function address
      commit: c36297b1bd6e52a75a8ed75eb5dbf35c50402398
[4/5] ASoC: SDCA: Add missing function type names
      commit: c1ed5eb13f39b0058670bc2b1e251a040c306868
[5/5] ASoC: SDCA: Split function type patching and function naming
      commit: 69dcf023f1f13ca9c2e9e8f30b9ec52ac0486c0a

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

