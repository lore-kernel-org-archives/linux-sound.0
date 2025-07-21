Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B421ABCB
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753120856; cv=none; b=G4QnXPAA9g4f2oA5gaqNBYmGM3/TGiLLcdF3DE9Aluxan5t9IGhzjeTcanu5RRQNWABmfJWIKR52GPXO3cVXy1BQgdTLPM4pL+ZijecKKg5N69T54QsG0vKpx2vBW/ek83FgRVuZK9exMtxQtLGRB7pVs4+3iMP6OfqngYuPe+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753120856; c=relaxed/simple;
	bh=wDClKaGNuh0eMLMVd3DB+O98+BbduOANtfzQpRU9MVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kx082pxN0MJcG5iVjYx9JpuMkaCd+TJXjdmTruuMccwaWWSYRSHUX6YQ/0swb8aVc8SevAgNa7+hBRzEVfzBgnLIqpoKPplRoJ8zYzOg/MXlqoc8kTeVfYOsxzoxnhizJD+yBVeOKpDXzpHCpfT5Z1a+2EfaNmNwT2cwFiUVfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Whdbs2pe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Whdbs2pe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF3CC4CEED;
	Mon, 21 Jul 2025 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753120856;
	bh=wDClKaGNuh0eMLMVd3DB+O98+BbduOANtfzQpRU9MVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Whdbs2peU3n23sFQnJK7vyrHRrPnCC4Wh+fonT3tYxD6RfzNX3gjRWC8hE0M+joVy
	 To2oa3QQEsV7Zi8h+S5luy0f4EepM7uYdggxU69JCkcLuP6/K5PfgYZoWPjgUtZIj/
	 DXyJo99t2yFuCzW+8RJEGnj8VYNNm64APwtEyhmOmXH//XCBbUV5BDdJNU6zxItAgp
	 v28BJrU8o7LbX7Nvx4zMsV2Dqj2jN5qOf2biqHZyg/L+pmhH5hXqHXy7qHNoB0AhGg
	 pKlPEsV46Omp0EVM4AfifhityMWz2zQTZb5ImttN/jtXUJ35dV5blXp9kU5G42hD9i
	 WAiWwtsKA3maw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20250721112346.388542-1-shumingf@realtek.com>
References: <20250721112346.388542-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: SDCA: add route by the number of input pins
 in MU entity
Message-Id: <175312085403.695072.1687658357667703466.b4-ty@kernel.org>
Date: Mon, 21 Jul 2025 19:00:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 21 Jul 2025 19:23:46 +0800, shumingf@realtek.com wrote:
> This patch removed the code where num_sources should be the same as cn_list.
> For better resilience, it would be preferable to explicitly add the route
> mapping the input pins to this MU entity.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: SDCA: add route by the number of input pins in MU entity
      commit: 17882721dcb49323eaa9728d7eaa2ae826c876f7

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

