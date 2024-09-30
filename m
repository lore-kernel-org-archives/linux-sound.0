Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8E81A2C1F
	for <linux-sound@vger.kernel.org>; Mon, 30 Sep 2024 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731592; cv=none; b=KgKAgtUArzXCe9izZgdH/vA45cGTLjiCz/+V4f2mWmgJHNvKn7UEJ5u0wJOnGR6Pe12kR47yAHM/jwbX8oPAojQWAPMtwRn+6Krt80a0WBeuNvOFH6wIOdCL1CuvDzcHjcdVTmsps44v7///8Og68lj3jyIuGga7VOMk6h3ZqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731592; c=relaxed/simple;
	bh=Xp61C7r0mqe/66MjAMdt1iih6QcgjF1Vd60S9xYPAVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aGuvlBvu73pKLuyHwO0heaYkn9xZDmbAStYL/dnOsCdRvTjibHyl80PtxhLXdIkbYOnyILKMrNW528uM4qYP1GjMxDA+HMJVBU/Lgch0TR6lFLh3cadBCYS+cediKjyTZDIs/vjNAkuGYVq7UlKF4zxRGoxjZG1mbUU5xM/KRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBYWT8/D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBYWT8/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2016C4CECD;
	Mon, 30 Sep 2024 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731592;
	bh=Xp61C7r0mqe/66MjAMdt1iih6QcgjF1Vd60S9xYPAVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oBYWT8/D7gCHQpz7AdGj58uskTo0wB4kNOUkPxdwy+qtqdGxWMgxWUSzCh0xVMWKj
	 NPi95iIQExOBZmXEpODgQWBffBf29Bv9c5O1oFJ8GeHyIkcLHtD1TEIhNq+KYOboaQ
	 138y+OTm+oKttkm398wceDFYbIQKy2fR9ZOyJ1eUpCVmYVCy7pz/HX8D5JVmjz+JwU
	 slFxyYr6cPRRP85Byi+7OWGI8zYSO4CKxPpxrsNN+xzv0LGUP/4lNC7CkNZJ8haTu2
	 zhxegnLhOYtpo4IuBH2FMr/TX+IePJpmKaQCws0Mj1Pi1eGVwxmnklNRWQqiwGMtSZ
	 paNdGdfwvgDKg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 oliva@gnu.org
In-Reply-To: <20240914090521.2224276-1-shumingf@realtek.com>
References: <20240914090521.2224276-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1320: reads patch code from firmware file
Message-Id: <172773159070.2197048.15498234088041924022.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Sat, 14 Sep 2024 17:05:21 +0800, shumingf@realtek.com wrote:
> This patch removes many lines of the patch code and
> reads the patch code from firmware files.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: reads patch code from firmware file
      commit: d72498fad93abf1817c4998d172a3d7f98f76bbe

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

