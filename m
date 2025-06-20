Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5828467B
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414996; cv=none; b=UQxGCizg4c8+SUypfrgyb1DBqVOOJaMpRwyC1NAATSFwCdY+oeiN1QRSuZO/fx+tE6h3QeZUEXxMsQhPw4XbXNhqluv3fTC+V73hva0Y8qgt31H1rpM4k7WUH/AicL67HjnW18RlTaTdCyd3Y08Ql1d53pmc6D6xxUsOkfxhAlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414996; c=relaxed/simple;
	bh=U47ixaOQmPNs/ighnvFgyMyf05BaZFq41OU2HHuETeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Td7LvrNzk5YXNuFjeGpXdy48s5xaXojg0DWuJCSdwDLH0ebIfIo1KyRfFeHwL8qKSrEN1NEYMUayACaey8qlpScYHKXRT+Eh2NHzCG63yQRGqBOXmjGGWlvRJ1mkyIjNkfWXx/O3p/PqVG4MpctkFgX5LJDTTGEYCik2qdjOaLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6qJ7ysq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6qJ7ysq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1851C4CEE3;
	Fri, 20 Jun 2025 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414996;
	bh=U47ixaOQmPNs/ighnvFgyMyf05BaZFq41OU2HHuETeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I6qJ7ysqVe9l1L06ENhgLuyDnIJqRevdn651hJLRoINCKIXyUNyTIUiAz5PI82ZwG
	 PZBYFKk5RfjWgh/6AisT0GE0m/ieK58RoStnapl9g7aSBphjiijVpmF17XiTRop0kj
	 wAW5qerH4nEh5YzzWpn+ewvchwUtagitRVsBRat+Rk7+v5eDnYf2wP6FNs7cVfQHi7
	 MXpkHCvNKblsARSoHMZKQkxGUdDQgUeEaTFCCdHrh8UKhh1zdjX8b6VPFNMcp57U5Q
	 2qF+Q6TgpfT7kSR1MA7hyq99kgAKIGa3lVgYLtcjO2gaLrolNITBIhffdTMuQ83di1
	 urv/60PlS1eDA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, seppo.ingalsuo@linux.intel.com
In-Reply-To: <20250619104735.26161-1-peter.ujfalusi@linux.intel.com>
References: <20250619104735.26161-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add load of ASRC component
Message-Id: <175041499466.23264.9340852482741883502.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:47:35 +0300, Peter Ujfalusi wrote:
> This patch adds to IPC4 topology parsing the support for the
> asynchronous sample rate converter (ASRC) SOF component. It
> is applied for the DAPM widget type SND_SOC_TPLG_DAPM_ASRC.
> 
> The parsed SOF tokens for ASRC are SOF_TKN_ASRC_RATE_OUT and
> SOF_TKN_ASRC_OPERATION_MODE.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Add load of ASRC component
      commit: f9c7c093797fc00c7ce3042387994cf9d6c6d4ce

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

