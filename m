Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72C1D0153
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705864; cv=none; b=cNQSjx0fneP3B2lujSHoY+clLYYtBxL/r3xXf5pEShTX5GFpxqlAR5noZdIORmDmW2ppMLM/10bbK6wwiUIGG2j8jvhU/eI+ruqLS1j+LX8iM3ZV6Y3dUSlMC60Fle7EV4ipfOUCDWqB95yqLcBoehfX4ax0PskXHOntaCYsZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705864; c=relaxed/simple;
	bh=8r/O1HmDTz+nPdfGKkbI7nNeijD5lk5Okl3fAADNg7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TfBeJdrfA2UpsSOZNXGEACYbAyRBHdSYutpV4maHuhjgBRjsmnvEjvYxbrJjmc4m8UJqv9NtcWkQ8GA82Bko4TwiADHvwiBZGC83QyHI6zvXZXd/bMyE7ubcPBKIlNfrSi9Bh8MZUxeC7/9TdTg1aNcrDLldgE1uZQCaaLrxTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPDMKBDT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPDMKBDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A8BC4CEC7;
	Wed, 23 Oct 2024 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729705863;
	bh=8r/O1HmDTz+nPdfGKkbI7nNeijD5lk5Okl3fAADNg7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UPDMKBDTmTZyrAzga12Q8QXzpN6C1a4nYr8ZdYN7kqarC86rMbRIg/CBvqQBp7Zqg
	 5O+gQ/vB2IkthkfkNigQ1e6lrMM+gmztyW9odzVxp3Nacifcsmb6/6oBowypp+OXPH
	 FoTvmJD8kR6X3QICFfwnWcMDP7fabn/2ln+PG4R+6OVdJebnnaC3peV5vzQiJnaKQN
	 ZnX33WYHIJlL+bxNHxsFye5+my8JUMqsiOSyDwUlFT3VDG6GKbYCwti91UgC13u3X+
	 F24pEObNggXSdpcww/fLDmmMn4KjxN2Y7gfoTZNjE8BbzphV34wZkezKW/QS4ZG+rp
	 PyUYBBrBlPxyg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 00/13] ASoC: remove dpcm_xxx flags
Message-Id: <172970586286.110994.11698115661977770053.b4-ty@kernel.org>
Date: Wed, 23 Oct 2024 18:51:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Sun, 20 Oct 2024 23:58:13 +0000, Kuninori Morimoto wrote:
> I got kernel-test report that v4 had compile warning.
> This is v5 patch-set
> 
> Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
> and thus we can use playback/capture_only flags instead too for DPCM,
> which is same as non-DPCM.
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

