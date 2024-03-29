Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5B216E880
	for <linux-sound@vger.kernel.org>; Fri, 29 Mar 2024 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715650; cv=none; b=bNGGSZFPmm+dNZR/g6dIdLpBJkQTeFw7+Cds8dX1j/GSbTfiZAYhBuAMP+2rt6lJ9ticDTVI2g5VjxaOdCT+xC3Yv2/tA3fxYeOGce59iV/xHdYPLPIcO8ART1LwYZtwRAuQ0KVnTU5igIGZv6ZNouscKvD9+9kGUhHs4/Z2a4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715650; c=relaxed/simple;
	bh=RohNcsAhkui5AAi6xno0D/2X6go3eTFnCBjnGqNXUIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QLy8/8V3u8KCQiKEdbCUcctenhbge9GWo4mb7SzPwaROsBdPcA1qnCqZbNcZddrQIGoQYJjo4cQmn24xR/iqo3e2dt01Pa/dgDjxJXcq8fQsHG1zaaftT6vLl37YadyUWeSmY0T5zBBZrsf2FHGK9d7zPgyXiYgKhLMPeWmDFSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPWNlPf4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPWNlPf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEEFC433C7;
	Fri, 29 Mar 2024 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715650;
	bh=RohNcsAhkui5AAi6xno0D/2X6go3eTFnCBjnGqNXUIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KPWNlPf4DD+7KgZIoXPUG64PoVVaagbuPiFPkn9ZMepVV5t1NXaOqDOYfcpNyIvMl
	 5IdJ6TYrcYLYZLi2Vh3ESyojBpb6pGkrQtrW4gkki1oht+H48OBZD7o/bLGZJw6GKr
	 P2/hMWe7pirGqtDrBxgWEu6jW/2zGzAFd32y3KxcBvSwJnPwCBnjAiL4ZmIpc/DRY+
	 R/5FizujxuidhpXkVebK8JporWrria0GxF7omins3hLuNefkSf2Gl9janBDrCuA1o0
	 ETpmBpd4sF+pXz7mf0LC0Pn23PnpRT9LJdbCat8vJx5vcwVn+dPR6XLMRZVCYZM2fv
	 +m7evwHqhj3zQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: rt-sdw: fix locking and improve error logs
Message-Id: <171171564910.7557.17157942559028240962.b4-ty@kernel.org>
Date: Fri, 29 Mar 2024 12:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Mon, 25 Mar 2024 17:18:11 -0500, Pierre-Louis Bossart wrote:
> Fix a set of problematic locking sequences and update error messages,
> tested on SOF/SoundWire platforms.
> 
> Pierre-Louis Bossart (6):
>   ASoC: rt5682-sdw: fix locking sequence
>   ASoC: rt711-sdca: fix locking sequence
>   ASoC: rt711-sdw: fix locking sequence
>   ASoC: rt712-sdca-sdw: fix locking sequence
>   ASoC: rt722-sdca-sdw: fix locking sequence
>   ASoC: rt-sdw*: add __func__ to all error logs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: rt5682-sdw: fix locking sequence
      commit: 310a5caa4e861616a27a83c3e8bda17d65026fa8
[2/6] ASoC: rt711-sdca: fix locking sequence
      commit: ee287771644394d071e6a331951ee8079b64f9a7
[3/6] ASoC: rt711-sdw: fix locking sequence
      commit: aae86cfd8790bcc7693a5a0894df58de5cb5128c
[4/6] ASoC: rt712-sdca-sdw: fix locking sequence
      commit: c8b2e5c1b959d100990e4f0cbad38e7d047bb97c
[5/6] ASoC: rt722-sdca-sdw: fix locking sequence
      commit: adb354bbc231b23d3a05163ce35c1d598512ff64
[6/6] ASoC: rt-sdw*: add __func__ to all error logs
      commit: f892e66fcabc6161cd38c0fc86e769208174b840

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

