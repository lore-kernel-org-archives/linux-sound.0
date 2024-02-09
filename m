Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4FE76905
	for <linux-sound@vger.kernel.org>; Fri,  9 Feb 2024 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497923; cv=none; b=CwsZ0tsvPany40Y8sElj6OMahdniD/5swaB7s/1xphSOekrYkEbow0M0/R7sEGwM6ZY3cjFKqHDmz3lrwsUqRW1ykVpY2m//zrXuii6NkfIg49yPuo2Wr08UbLZ8R6PRxJK41+cpPQ53Msgd0aLAp5N/x/ZywsLBTQJs5j1y+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497923; c=relaxed/simple;
	bh=AvLOrQ/5l7Q/EehgFGFRv7j1W45bMn/crSWljIS41LA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iUCE5FM/MkipgNrDD9XzUr/8WcoGjNNYmQOyPV+U88KOF9X+MukN6FjHFGoLSnUJPsNrfCIwarjnysLQGyf0Js79Q/j/2HvjvR46B/DxB/Sy/w8am0gW7ZJkV6rD1Hn52Bkt9SoN0sOZASez+s+vL+gG55kYWJx0SyKdrRdpXPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvGxiXpb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvGxiXpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB6AC433C7;
	Fri,  9 Feb 2024 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707497922;
	bh=AvLOrQ/5l7Q/EehgFGFRv7j1W45bMn/crSWljIS41LA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NvGxiXpbBO0SuGlfg6DyIAXKdE0FbMi16XvqW0x6EUqEdOpn2YOzYx3JUN+qFS1q0
	 1Bo+kpqkHK5WEj1/7tjBCdcGQTT4o79eepoxB/Bz+hRK2wJQgMNw26SZ1mb5lPai3Q
	 Md/WIZlv9ibQU1sQ05N9wIPayS7B7dQiKpee+rzkusp08x6kvcNKdc8jAnBeFbYKab
	 iZkvAEc87nA9MV3B3DTTjSNTFAdsbedWehzqekwQw3A7/rn7qR3WRxbFOfCXNa3hvh
	 N2adG2QNeahT/eF3B4gq/q8vkV1Rj5Lb1p2HcAPXKCXXs08SJoTgNnQh1taSZgwV7H
	 vdxg+HMMr7gVw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20240209085256.121261-1-amadeuszx.slawinski@linux.intel.com>
References: <20240209085256.121261-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Expose FW version with sysfs
Message-Id: <170749791992.2378624.10999271693422387943.b4-ty@kernel.org>
Date: Fri, 09 Feb 2024 16:58:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 09 Feb 2024 09:52:56 +0100, Amadeusz Sławiński wrote:
> Add functionality to read version of loaded FW from sysfs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Expose FW version with sysfs
      commit: f7fc624be3dbfb78047a1cab795b93c7235fbf1c

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

