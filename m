Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3E1D0175
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705863; cv=none; b=cqT7Mb+50KNFsVg4BGtausM/z9UYNIkwxyPljGmtQK9PZKKUTrlWlT6fLr6+Zavw11EFQcd95kXNR9HASP8nP+KGe3jU7vCzFocXyc0nyfkvwgd8qLoXlyo3Aa0GebZ1V8zqh9Mc8DpExMzPANI3ww8XNxipb1pLyBWqX7XW120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705863; c=relaxed/simple;
	bh=c2WzyIX4sWl7qX+/hZrSf2EBXAGnkp4nmO/PSorBmmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dy7SILd9k9IPQvSQSXzN1sqJG5a0aPVV3ZD4NeHqWkHxTjXdGPR/oCgk1IUF+kWP68k/ckb6SOp8wReirmolIarVUnpfejHBHPQ6QTmIxoOulbLJbZJFI9/BKhiadxpC1d104Y2Txgfv28amEEgvx8HrIQ+hvO3w1TLd4re4/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMiEhyoa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMiEhyoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FD0C4CEE5;
	Wed, 23 Oct 2024 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729705862;
	bh=c2WzyIX4sWl7qX+/hZrSf2EBXAGnkp4nmO/PSorBmmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BMiEhyoalBDieptxTjgZHygfWwFWBMyu/c7izbVbM2cs12sQdgAmja3j4YJWBmORS
	 BWqn3o2MEZ3XFLd0+t042Z77lgMSJM2emoTyd0liHN2Ro70HVuZWQtSR2eTCJ1T2xA
	 LEWdQ2lTIXbq0lc235E9OBsU41Ji/VtpYA0cytMjmoJCSUmyFVcNil1PuS3q80elLc
	 TQNm4WaQgmdhIBNqRWUtLtCnp0IglpVPvyNFf+wsuYglztNYXn5ZAQ5FvJ5ksqPSIT
	 bBuO2WjVZ3yGF85TwJDhg0hhCQDWIiWOI/fu3q2fZZAVa0pSje6Fp6lIZPLu4ddJVi
	 XjHus071rqQ1g==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 00/13] ASoC: remove dpcm_xxx flags
Message-Id: <172970586171.110994.6170499612142580470.b4-ty@kernel.org>
Date: Wed, 23 Oct 2024 18:51:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 15 Oct 2024 00:55:44 +0000, Kuninori Morimoto wrote:
> 2 weeks past. This is v4 patch-set
> 
> Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
> and thus we can use playback/capture_only flags instead too for DPCM,
> which is same as non-DPCM.
> 
> Let's remove dpcm_playback/capture flags, and use playback/capture_only flags
> instead.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: amd: remove dpcm_xxx flags
        commit: 12c61265e5b687b155d08e052c2b6d78eaee4849
[02/13] ASoC: fsl: remove dpcm_xxx flags
        commit: efa527f984a110944d9640b81ff94d0a5401b3fb
[03/13] ASoC: sof: remove dpcm_xxx flags
        commit: 90bbbf612f9e5e4548b27b213b1866b4feb670bd
[04/13] ASoC: intel: remove dpcm_xxx flags
        commit: d26aed5eba16bf5a4aa86bc717edf0b5ed192b93
[05/13] ASoC: samsung: remove dpcm_xxx flags
        commit: fa9c4b46fb76e2cb36bd8f94a096e61ebdb8b7f9
[06/13] ASoC: mediatek: remove dpcm_xxx flags
        commit: ec15e5043d0bedcb93a2653725fb50d5b358b06b
[07/13] ASoC: soc-core: remove dpcm_xxx flags
        commit: b6b8caf6470b9793ae4b66a95c742a1c97ece748
[08/13] ASoC: soc-compress: remove dpcm_xxx flags
        commit: 0f77c88f0e3a3945c328bbb9a9e3c4b5826e8fe0
[09/13] ASoC: soc-topology: remove dpcm_xxx flags
        commit: 44b6f24018317f6096007d9d397e6f3dfb0131ae
[10/13] ASoC: intel: boards: remove dpcm_xxx flags
        commit: ae0967da4bbfadc7156ba1deeb16fb31495ea359
[11/13] ASoC: soc-pcm: remove dpcm_xxx flags
        commit: c7ae6551533e7c7bf903a2d259044778f4b103ce
[12/13] ASoC: doc: remove dpcm_xxx flags
        commit: 0e3dc8e4bd4a739401ada1541452fe1499254680
[13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation check
        commit: a6ff8572fd3fafe3f0f39e94ad8d4b6c88de7e03

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

