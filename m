Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B30364EA6;
	Fri, 12 Jun 2026 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302745; cv=none; b=HI933cBwgDHIz1B7gaWcVOpoVq1g80IoRXzQx2yAPaia8Cc5an08WvYpygWZjqGgJmCqagCzhEQ7jzaS0+p6tnrOW03Zc/zSKJ3q5FomeFuGrBSwI0s1c7BMKKZ5I3FMpdSFfiMCpo6v1o7tZ4n+9oT/L1eycolVcryVbva6zC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302745; c=relaxed/simple;
	bh=HkzaKjHHhI50U4Olee80YQlwTOGL8ivZjmOZw/1RJtY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vEwDdDPKCV7NAnwh8E1UQJsz6qBgr20aDpYa2UN13Ms+w6LmgKhxn9Y7bR17l5bWM7GoGy9WyZLH8H4jra9iUggMH8jCu29983mW9otQpEv3QfnZt6MCR6avgzU05QHCv8EkFay1DxuW+vR/3+mB7q4pSZz9B2PKAWtDYxOrqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gotzKFzX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gotzKFzX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FAE1F000E9;
	Fri, 12 Jun 2026 22:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302744;
	bh=v4XcWNJx6mQ0iF74vc9oPyekaA8Fizwfn1DwRR1DEZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gotzKFzXVwAhuLmUsDGCeleQO0dE6HtHlpgWekka+H3i3cNqvR0p/3vGlhb8GoQJv
	 0HpyAvRPt63J7EtFOMKYYEBMy1Auxmi39V4A4OYuQleR35F71j2uDTUj2afZSgR5Mq
	 UIjEO05QJ/LWXRz8RPaeOroMa/CZtdAMXGqDjFEZCU/2Wiyk53MpxBfqHZzoozSanC
	 PfaCVN8jXea2DgIVp8el+q+KGLL0/PB7n8LkHojC80Z3KhsJv2j337Qssc4YKxBMb6
	 tMXYeX0DNmVId1J3feR5+LVzfJAb5afQe/UgbphS9Zn2T5msZnGX2KF/3i52uDL5yq
	 EisPUMD2RdizQ==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260610104524.87166-1-phucduc.bui@gmail.com>
References: <20260610104524.87166-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: img: Use guard() for spin locks
Message-Id: <178120701771.484538.11663035610156728966.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:43:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HkzaKjHHhI50U4Olee80YQlwTOGL8ivZjmOZw/1RJtY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXT8RG3ByBJtqkCXi/Jm0+NH7xN2inmd4n3t
 b4N67xlCqaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF0wAKCRAk1otyXVSH
 0CMPB/4njFyVttgN+Xcg5Avy38cyk834QnD7jst2mooUg5C2KSR71urMcsT7rbQ4hfyruvMnLty
 pjQBahIcWDdsQSxAp616mMjP4sLJTNqbWJEaf7Wc5DudxUxsTMt9MPWZ1WYBj21bRXonsBh/K14
 Iaj4nOKsiVYhKar9Fpf5V6RRSLu3ThHrLDv3jQTgUnxrg4hGNoNlgMzG6JuJydEnXKws2B5Dxhs
 EYSU9PzNzXyZVeJCzvC4V1IDexBxv/EljvFRu6cy84OFHIDRbEsjR3XDTlHemUqOVU/KMGIrQcc
 yd+LqbzgZcbZk5ZcmBVndD1JTzXPw+Rq8JoUoFTTqfxYepd3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 17:45:22 +0700, phucduc.bui@gmail.com wrote:
> ASoC: img: Use guard() for spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts spinlock handling in several IMG ASoC drivers
> to use guard() helpers.
> All patches are straightforward cleanups with no functional change
> intended.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: img: img-spdif-in: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/131e13f35f16
[2/2] ASoC: img: img-spdif-out: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/4fbf9d7a1c4f

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

