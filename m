Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9285348CF2
	for <linux-sound@vger.kernel.org>; Mon, 22 Apr 2024 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773363; cv=none; b=PRCRKojl/soOvz0IddPa7U5OywmWfBxWkEh1zG2SnygmLMiTZ8RNPqjiN+rVSgx2Fbal1rbowAtMdfhG5u5oWDxjQ+Friwu3O5ZpgbVl2pKMtevtWtiqlCN4thEWCupBf5zLxcgrnJkUXFP19qFt9eKrm0L+gxWD4OGV/Kv6H78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773363; c=relaxed/simple;
	bh=tiunuwwIr+bT8wSKpR0JU0OLDOp21MSUyCfID33k7mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m7itFCGesjWin3nEtT4CAkjmRFxg1xcPeAC35RMwwPeJNPZ1jICop4bROWeJGmy/55yH1ZRM5AAptE8a7FNFUEAIE1YGOQD7z9dOZ7oZFt9E9D6gEa2nnOaVqpuFk/9TGNE0vT0INnSiVvQqwhKP1sF5b5SqGbkXEukj08nI27I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naI0badn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naI0badn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CDAC3277B;
	Mon, 22 Apr 2024 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713773363;
	bh=tiunuwwIr+bT8wSKpR0JU0OLDOp21MSUyCfID33k7mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=naI0badn9M+zP1N20U8ONn8PYfBYNNNF3mY0EQMaidlznFfldtdbTsKqYImW9zkBZ
	 bCom4HawD65gcwUR3a4P0xMVu1TwizouXYGDnON+Jhxb/AOfxv/s4pJQ0nNUE5FLN1
	 /8fPzzxUAw8TDFk0jRb9grhSDEeqMSomK693ElBoGrnoh1uvmlj+d3lf0l/+OeDxBy
	 0I7kYBd8w4K6lWDBEJH0IQHgiqNrhW4rGUh+43bxJ9AAaUwTCv36/uaa9WRQyvU4nK
	 edYoF291g4S9xuoqx4RxG3z6WPptn841qCqUSI0clSlDga8+Y8l1BElMzyP7hLVV8S
	 YiVJaMvvFHhBQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, 
 rafael@kernel.org
In-Reply-To: <20240419084307.2718881-1-cezary.rojewski@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: Intel: avs: Switch to acpi-nhlt
Message-Id: <171377336060.1755143.11859734715680324302.b4-ty@kernel.org>
Date: Mon, 22 Apr 2024 17:09:20 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 19 Apr 2024 10:43:05 +0200, Cezary Rojewski wrote:
> The change is based on rafael/acpi-nhlt [1] immutable branch which
> Rafael kindly prepared for me. Without the topmost changes to ACPI/NHLT,
> the patches present will fail to compile.
> 
> Recent changes for the ACPI tree [2] refactored interfaces of the NHLT
> table. Currently we have two implementations - one found in acpi
> subsystem (unused) and one in sound/hda/. As NHLT is part of ACPI, idea
> is to make the former useful and then switch all users of existing
> sound/hda/intel-nhlt.c to this new interface over time and remove the
> duplicate afterward.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: Intel: avs: Switch to ACPI NHLT
      commit: f5d20b253d1a51aadb8881d899caaaa989217e89

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

