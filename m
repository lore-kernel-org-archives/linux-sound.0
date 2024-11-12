Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3E433C0
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416888; cv=none; b=jm4n5YSk2wdBjwUvXNL00UAsHmsk9MaNn2nB+q3PJnnwzJKe0ys2eOxm+K5UCBd8AWC/JCQgnjRm1PylHfXQMzeMWBmwrqraG76e4J8RWtvfcrc7Hs2MTs1k/ZeIUAWt0hNh4QWMpYmJUuKlH1aEVEvgaXsuWnod+oVfTSWdseE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416888; c=relaxed/simple;
	bh=NQ0K1smV2nTKhEHDCxlSxso12iaJtFYp5LoP0Mrpzts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=teBMRQG7VqxxiS3fnuciFe6SHTYMHKtNP5wsaD/TPfkMlLGIlnAK2kI6IhhlSuHK8CyKVPE9pbvQKDIpY1xU9n/nVunRRcmW0zdkD3bEy1F4q0YZ28rIc1HABklJxL0ZH25gTV7TdNg2ohtOUrEbnZwPfx4ZXutBKWRY8MWJ2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9knpmib; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9knpmib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42EFC4CECD;
	Tue, 12 Nov 2024 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416888;
	bh=NQ0K1smV2nTKhEHDCxlSxso12iaJtFYp5LoP0Mrpzts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S9knpmibLdVJ1jXugO0qLtwT6QJa+E8Pv6c0V5BxRq1epaBMk++1kU327PVXCSl2Q
	 D7zpVwyU/OmoJaKp6Vv1Gcj1J8tJYG8ZwD+LJ2ipeYmEFVgtp2Kf/Nvwo+goevnwtY
	 k+IZlCHTkof5v1FQu/7i7jXDwse1mpZZw9tffbBgNhvXg6FNOZmt9Dxy0UDzA3xDSV
	 835eMKMMeXgSryqoH++H+uAV5Rmp/DB3iVT8502BOdtYl2fdVQ7f7qHnU3BNEj5HZZ
	 0O/1hPhiOSqQzVM5ROlqStA5q9H9JV0EfXRFAOKEcs+CJPWgjmawpr/bROQPVGw7aw
	 n19aWaNsYBlbg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20241111165435.113086-1-marex@denx.de>
References: <20241111165435.113086-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: max98088: Add left/right DAC volume control
Message-Id: <173141688629.388630.2482514845219440364.b4-ty@kernel.org>
Date: Tue, 12 Nov 2024 13:08:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Mon, 11 Nov 2024 17:54:04 +0100, Marek Vasut wrote:
> Add left/right DAC digital volume control knob.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98088: Add left/right DAC volume control
      commit: 14c7f4867b7e4ddbbde58b398452295051c77137

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

