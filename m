Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4690D1BC4E
	for <linux-sound@vger.kernel.org>; Tue, 16 Jan 2024 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1DX3ufT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B54C433C7;
	Tue, 16 Jan 2024 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705412038;
	bh=7P7l/huaPR1scOfxs8MtAm3JV0HjlbDwX546UGsM0ZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B1DX3ufTQ+XSPmXev9K3VHGgxw1m/xdXY7EwdxghHUXaHCqwct81C3Dbe3ZK+1hyz
	 Au/x9wyrX25CxyWYAZdN8FWD1vG5efyHl9gcQmh5x2phnZ7kOU8wNnY+x7AG866u/N
	 qTyEOjAE953lqQU6zYEZGvDyL+yal14h0EoUwZ36l3lJWg9OryhNmRoUi0CRNphHvU
	 lfSyKgm+fsZWiFhI9qAh404DSGLYbIJxlsNPYFdzYhmBr3le9My9KkyOLisiHI2Nvj
	 ZeMnjm6+Qc7A5WiRla1vrHea55YzONwQ2FjBDBEVIKddNzBEKw6REfFN/y7U7/eY6p
	 KlF3LSmxKIy1w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 rander.wang@intel.com
In-Reply-To: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
References: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4: Kernel log noise reduction for
 6.8
Message-Id: <170541203713.30176.2666994837709698317.b4-ty@kernel.org>
Date: Tue, 16 Jan 2024 13:33:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 15 Jan 2024 11:22:07 +0200, Peter Ujfalusi wrote:
> two patches to remove too intrusive prints:
> no llp found, fall back to default HDA path
> No CPC match in the firmware file's manifest (ibs/obs: 384/384)
> 
> The llp print is printed for all HDA endpoints which is not supported by llp.
> 
> The CPC info print turned out to be too noisy and it is not bringing any benefit
> to users and developers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-pcm: remove log message for LLP
      commit: 848c8f563dadfdf01358b001ef7c9afe2a6ece8f
[2/2] ASoC: SOF: ipc4-loader: remove the CPC check warnings
      commit: ab09fb9c629ed3aaea6a82467f08595dbc549726

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

