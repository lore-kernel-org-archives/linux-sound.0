Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2851933AD93;
	Mon, 12 Jan 2026 20:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249905; cv=none; b=Pq6sBYUDeZuQCzNYjvC4FnvhvDGMP0m4kpYAAlmZAbLRWkMp8XDO0TaY669wywo4euxRVxvn9p9e4SLvvn5CuzqFhkLTNZqJvmaZ8kE33xexUEUU5Yyb5H/rWikQ4MC9w0oUlTOz2MhnUgyIFED3b/rDeaOxKeTD2IGdrm1Biv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249905; c=relaxed/simple;
	bh=5t/PHkzuAtB5kyna98ozuNlQ3IUj+2w0FHLqCEXojQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BkT0jd8oWvQgTgm+IzOZFC316UFQVNFHZHt22O7x3R6llwCzMihgENY3Tn2YhJVYhLk9PoKVDAcCMb7fvd4Mn7DuMdvnsUoHclc96ySBl95VanLJn8rT5dM/JtuR31Y2/WUrRuHuP/Ko7LXiG/1kJB7tgtSImq30uqLpjRy4jCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWSuwxEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWSuwxEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCF0C19422;
	Mon, 12 Jan 2026 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768249904;
	bh=5t/PHkzuAtB5kyna98ozuNlQ3IUj+2w0FHLqCEXojQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EWSuwxEPI1SGu8lLAipl1qZ/PppmS2lxkqk5zx9Z7XyDrMxi5kBnA+KoGW3YFsrwY
	 n5w78DAQzKzodvxAj6lym6+N7Tc9usfIcSOgIPWdVs7JJCzK/z1neNO4ZKZ/psjpx6
	 3ihEz6Nam7SmaXbDgd9HHqQ9qt/3laar7dxQP2M2ANS4VYMxg/eHXtJL05A4qJbRT4
	 u2FHiGz3OFBOwhelgrRU/ylzb+L2jPI9mbe9uZILjdXiW0hbM2oG9HpMhs9fLStBaL
	 naPgBrkckrLzN59uDgKo+eVihc/zWKh6LYI95nne2gnBhThmQ3dUL1zMAz0vIk26n7
	 JoeEQ6ke1CcwA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260108224938.1320809-1-robh@kernel.org>
References: <20260108224938.1320809-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
Message-Id: <176824990272.213661.5100930797551016319.b4-ty@kernel.org>
Date: Mon, 12 Jan 2026 20:31:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 08 Jan 2026 16:49:36 -0600, Rob Herring (Arm) wrote:
> Add a "port" node entry for Rockchip S/PDIF binding. It's already in use
> and a common property for DAIs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
      commit: 70d95c5d2081faca7e849fa9c6665c9e0dae3923

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

