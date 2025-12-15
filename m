Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F7E261393;
	Mon, 15 Dec 2025 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807110; cv=none; b=cyBDBL+oEF33lYJEGfnYHtO9m+ZiTpIvxhi30T9txn/LPh6Rx9voFw20lYiwvfamXioGx1jwsgQLtLNlx9srXis5FbmYOQXuciJEFmHgAxdZvb7651FYKMmNj3wGQtvd+NbU/HODMy7gJrrsdKcPEM+uw5OhS7Ot8DE82cVWh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807110; c=relaxed/simple;
	bh=y/mXUbsQZczu5KAjvgneu3hTFHS1ArVNScyhG4Y42PA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=STOrupXZBUdXVBo/ZMIGs01BLzLhV5ZaX/JIYf8R1cUhBuTUztsGVd8W4tMFopO8Gl5CWx2ZSN5TvX3bFikXTtT284bc6kFNVZjEHZhfySlJERQYvUW12LZdkcYb6HMknr+LQ2NZSQQnxDXE6mdmd22UrdkaS3qeIQ112dOi/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1r47bRh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1r47bRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB09C16AAE;
	Mon, 15 Dec 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807110;
	bh=y/mXUbsQZczu5KAjvgneu3hTFHS1ArVNScyhG4Y42PA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A1r47bRhg6PpYpV+VLgSnSaeONj8SLW3oTgxfoWpE3gnIn6evV7iTMYA9W2U3EX4E
	 MhU7irq6rXsCWwkcTzJruGHsmBHHrXemR3x8wfKfKMvo0hnnP1o4xUOmP23vuU9TBv
	 wOiy0EARnUIJp3Ac9KGHp1VRIEu1d+K42qT+S6+kEtJwxYsnInes3cUt8neIln0ciN
	 8A5MOjJmAd+tMidgPVbOZVEC5O9SNHeu/gN2FOuZroQlHAMmT7Ic6IsQMCS9tj76Cy
	 7wq2mvl5X+qssBQUOVfTHmjn76gEhaD+t2XaosXBKBIaARQkuUJEUrlF4aU2YRJrEN
	 /6ZcpPr+LORCw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251203105542.24765-1-johan@kernel.org>
References: <20251203105542.24765-1-johan@kernel.org>
Subject: Re: (subset) [PATCH 0/2] ASoc: qcom: q6afe: fix bad guard
 conversion
Message-Id: <176580710821.161056.1943838328681871063.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:28 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 03 Dec 2025 11:55:40 +0100, Johan Hovold wrote:
> This series fixes a bad guard conversion in one of the Qualcomm drivers.
> 
> Included is also a related cleanup.
> 
> Johan
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoc: qcom: q6afe: use guards consistently
      commit: dfbbd3c04f0f782e83f8677749e2f02359ffd1b5

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

