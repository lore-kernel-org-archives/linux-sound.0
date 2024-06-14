Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12718C33A
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357091; cv=none; b=gGVfQqcYgvgypICeeCn9MGGr8kRX3onNltZ8fxQeKCni50Tji9k1h6wVk5GiIsTef8AfDIEwneRktVBGglXyLvNGZCUMk44Fxo2b4CFCN/Fp4sWXTDYJD12PvgBJu5ECfwEfK4LcBwGT5GTQ5BSnVTpMnMGlNaXdRlM5f4oFwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357091; c=relaxed/simple;
	bh=2tVQbTkd4UUy56SjjbpsW9cV+eBjwXncj+hCcFOXx6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FVA0oyzIslB1UKAZM/pgd0Rbk1MoYqtORdOJJlLDV5NeLWbaRfAzUEgtL88WkcYxbiz8wyFJRF4huMJaeEu1PhzlsNOm5xz3Y7JTHqQbRDb8ULmHEkx/z6avPjs5WgSnBzxPgBpt4Btb12B+1MteeXY2Sju+sAdVFYsUapDsqW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy3zBBSo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy3zBBSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B764C2BD10;
	Fri, 14 Jun 2024 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718357091;
	bh=2tVQbTkd4UUy56SjjbpsW9cV+eBjwXncj+hCcFOXx6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Sy3zBBSogsB/mbOpHKWvOxPqqgnPLeSZ9bTeo+Q59Zfue6bHCmY4JqWv1TZ6rFAMz
	 YpvXAsXql4SBuWwY3sYPd3G306fdTxMxBJXNn5KbKZpkJP5LyhOg9GDgWu53nj7YVJ
	 vCfwzUQrsS5kUkWalMPK6mjpSeZCYnxBKTuJEgMdYGi4wv7bj2zl0JrXCYZLqNjL9g
	 ustfKupCSMvBq6iUJWvTnmEAfbdEL/bX8R5b3kjpQqd5iyhv78kd0v5JgE1pm7t80l
	 noZ9fUnN5+7XHuskFew+7+AAWbZ/0lW0BufpZSLC96lcPBk8yQx8++hKRI9Lle7M5B
	 ZmAxXh3Pht8Vg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
Message-Id: <171835708812.262234.14840448418677880913.b4-ty@kernel.org>
Date: Fri, 14 Jun 2024 10:24:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-0bd45

On Thu, 13 Jun 2024 11:01:26 +0200, Amadeusz Sławiński wrote:
> It was reported that recent fix for memory corruption during topology
> load, causes corruption in other cases. Instead of being overeager with
> checking topology, assume that it is properly formatted and just
> duplicate strings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix route memory corruption
      commit: b9dd212b14d27a53b63fc6621c452c0b3a01f61d

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

