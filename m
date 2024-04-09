Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DEE158A28
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 23:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705651; cv=none; b=mT1zkLA5eV/W9iHz5/DOmLSbHP88lTlDaa98Ek3ZviaSAViezJ2bgSNqXBl5KNaQzmkrxBuMlvqRK44scbq4Gefh7eFhrW5mba2UGmlcQmf/Id5Ngmg1YpyP/2Ict8E9Aqhduueim+Th2VE7N7BuraJOUTS8HjjFz8FtEY6iviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705651; c=relaxed/simple;
	bh=bwhva80xBES8MQgIEVfQ5wdS3dodWnBtOjZWDuGv3Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ScrBTAhsUYjiKl0XwjWuxQLXrV5vOBpnXwyIMNddpl7KO9scRGUQkJADWcTVCMVv6GDsmkNh4fOUOyL9fvOF95EWuR2IqkGROAjI8SKoEPQ65O0AyQysQsZjIlh2h+HP9iiKgI27hYQxbUNzlql/s9tlqSklmDvW783t+/k/EqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XW1DaTKc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XW1DaTKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B027C433F1;
	Tue,  9 Apr 2024 23:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705651;
	bh=bwhva80xBES8MQgIEVfQ5wdS3dodWnBtOjZWDuGv3Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XW1DaTKcNUzViRiAAvxYTCzJsgBr6wilHWSS0jqIeyOMDa2cYvwXEJp+zSiH4mckv
	 1EbqH3U2D4+WmP9HPnlPMyr/GzpJz9hjAGDifJ/IKXGI/WPW1QSl61la9nVl93QDSK
	 RJJQZE+bf1cdIhhzby064WxpIcJVABUIdd6S/pPt9i896TKQdRJHuoohDJhZJKxKya
	 xTefKr02DOJbmV0FDt54LFfUMjcDJQOu0S1K2DZsM8l8Q5Ga9EIzuZNlp1F3ucZcyU
	 zO1KyNKNxgLuexwK+LgwMOm02FkWJdbbuP5yyzgeN33ZrSCGDx/uPPgKRKhd/f5y8R
	 D3vNgItcWco+Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
References: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: misc fixes
Message-Id: <171270565002.199334.309648974862019777.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 00:34:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Mon, 08 Apr 2024 14:41:44 -0500, Pierre-Louis Bossart wrote:
> We somehow missed the default path for DSP libraries for LNL, and need
> to restrict support for D0i3 w/ IPC4. Also add debugfs support for
> firmware profile information so that sof-test scripts can show what is
> being tested.
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: Intel: add default firmware library path for LNL
>   ASoC: SOF: debug: show firmware/topology prefix/names
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: add default firmware library path for LNL
      commit: 305539a25a1c9929b058381aac6104bd939c0fee
[2/3] ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3
      commit: 90a2353080eedec855d63f6aadfda14104ee9b06
[3/3] ASoC: SOF: debug: show firmware/topology prefix/names
      commit: 17f4041244e66a417c646c8a90bc6747d5f1de1e

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

