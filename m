Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398D199947
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414989; cv=none; b=t1QLCj22kQeKZZlhKhng/vtGBPYBLS/k8Hu4LEtdG8+pP0t939ekd2S7MO0hwwVG39zpXj6ry40W0/lMEBicsfPAc/mCNIt3aXK6E6n+f2zY+rwfyKFc9saw+zx9sybqopaj/Yg+3sSSatQQnncl+xMm84BAN0ctTD5WoieBVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414989; c=relaxed/simple;
	bh=+Ha0vjStNVogAMjwrPeaQqiwYeY0G2bAKV7FdDn07W4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E/W/c3JccCgggcg+lLShvRcFFXCXmAL4I6I9AWP20AWl8HrrymNFrlKvLp4WEaCBxFYO0cgUK3YsvUlfdELSAcZUO8prsY3lV0j+g5YKHQ8NZ7s0HOqA/E5g1LxQLIQqCcsV2+KBOBl7vTWo8DGK8ndAPhNPmSv3CV7hWuK20zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOcSJlbg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOcSJlbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91698C4CEE3;
	Fri, 20 Jun 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414988;
	bh=+Ha0vjStNVogAMjwrPeaQqiwYeY0G2bAKV7FdDn07W4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WOcSJlbg5x1z4stz7TMU/DFtz+vHkjflKwEn4LqHJtdz3jR2ODDB+YZ12aZ/mRXgq
	 grb4nrMwc+pnkV5y68NCX2TVWfxnVBq7NHWN7i4SlPKqeV026St1TbvMbW9iIRjJtQ
	 3CZUcvWmVkwjMwb5Ky8PIu3ghCj+//BF5qIpIddMREjTrscosWRQeNAv56KDcapgpm
	 oGvK3FeJR61qWch+Uy11iwDmbWWCryOTisi8O0hd2hX9xQNhPmtzRfHp5dEi6a1IUb
	 kP7D9OgxDa+F8iVBtMUciqWwp027+HgLnEpvL3v5OQNN08b/9f2W39g7sWg12k1tyB
	 +sooctGkSdAyg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250619102657.12109-1-peter.ujfalusi@linux.intel.com>
References: <20250619102657.12109-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-pcm: Look for best matching hw_config
 for SSP
Message-Id: <175041498733.23264.3101453444161600026.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:26:57 +0300, Peter Ujfalusi wrote:
> Instead of just looking for a hw_config with matching rate only it sounds
> better to try to find the best matching configuration.
> 
> If we have multiple hw_configurations with the same rate, but each with
> different format for example then we have been picking the first config
> with the matching rate, which can be a problem and it wil depend on how
> the configs are ordered.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-pcm: Look for best matching hw_config for SSP
      commit: 8a07944a77e962b625c582696497964c393a3489

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

