Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D31E7C0A
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497003; cv=none; b=oTeTKhDU16s+bOKHq2cNZBp7OdoOA11TD0Q8lZn8BmfEeoGfUVAcMVTq8UgbnRdCXJPGiShom0O11shtX9nRYLzjse8uzIY3gntVHi38N/5tJ3jo8Pbtb4ZoJlNBaIzzWp18wWmMP5BCnuEvW/zYrNTlzAEyAS5mzssm+B6XBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497003; c=relaxed/simple;
	bh=yAqYMURxU2aIQLmh+/lwJb8z4L5qtQa5uXjJKP9FgMM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e6X/ytgc4ORjAsKOyxugcqFgvuAggIQNFSJo+zWH+7h0fDJLaCZxVES4fh46WUAIN42bycL37FySzcByObdvrv5av/jZz1pd2GmNzj73O+clBv0K/Y6nkxFxijJqTjVXuWYmslvjIJj6ZWKu15GBaCquhlkEe8vPHN2VfzV9oII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUE73nsn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUE73nsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF399C4CEE6;
	Tue, 25 Feb 2025 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740497003;
	bh=yAqYMURxU2aIQLmh+/lwJb8z4L5qtQa5uXjJKP9FgMM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eUE73nsnwuxAMWC6m3m+3UJhQQurHoOjsPoFzikEoFjj1UUA9sfdJZc04mmoHz2Tu
	 SkAI10SfhFYKwFtSWBZsjkFlN4bOofKBY2UIEnIYSi5p65MRi4iKojgeWm/KWKxmZx
	 WuEaNO1qgZvVvSF9qN4wCGDGgGXW3MTr2RGkGSHiLvgWw50QD96v2RxduXgbJ2W00x
	 aGf9WalL2VV84Q2J7no3gyuUCDx5xuIstoKKTIbEfSa4FexPtHJlZVwyTU5QRl6VZ4
	 +AudYeYPNY55ZBriT6xZFmRn2C//knHRfwqWYbOZDLfOAUDl7hWQxwcoA+GOeopw0T
	 OHzArCsuJFXZg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h64qvihz.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
 <87h64qvihz.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC] ASoC: sh: migor: use inclusive language for
 SND_SOC_DAIFMT_CBx_CFx
Message-Id: <174049700243.77394.17605013115750313267.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 15:23:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 19 Feb 2025 01:19:21 +0000, Kuninori Morimoto wrote:
> In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: migor: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
      commit: a5a3de8990f47f4c54ca5daeeea8ff7daa42f9de

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

