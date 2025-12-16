Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D905319603
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903582; cv=none; b=ctVdJuAIFWAgepkfwup3KqN/QM1pYtNtP0HIEUZJEVOAOzPF0bCrca6qk6zd3PIqmb9qYdDmMoCVOHsUGl1xdL91T7ARSEYvBAO6UIalC4c1IEdwhix1iO+Yqj8STDi56K1X5gEgy5n3XNq6wv+0CyfdM7imN1ALlVS6QHOXNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903582; c=relaxed/simple;
	bh=5etvbCEWYU5Tja5CRZn/LqcqgHhpp29+i2SDawd2RQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V16HjjjsJOCFUxZHKSkDM8QLqB8gGOrYEufw2g81wZJ/dEBHl6JWKNkXWNwxgxBe9fnQl17DEETdtgtFlGeEvuOIlz9fT8oZUh5iQ2MXg9iCF7CvvURWyINKnnvMTWUnPPXWX9b0DycKTtHtqqZAI3tBoKR2ILE9big9zYVZjf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTkipWtB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTkipWtB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EACDC4CEF1;
	Tue, 16 Dec 2025 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903582;
	bh=5etvbCEWYU5Tja5CRZn/LqcqgHhpp29+i2SDawd2RQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gTkipWtB9XMw69Di2/Ienw7XP1FkNJrl4h8h9wdA8fcXjlf6JPkhaDDpsfs1B8UxN
	 T4uDrrrgw5NVg9MFFGl74LXnTvcrKgnt2dgvVvXaf2HJE2xmJmeH7W6NvJxe8jKWVI
	 WGh2hy7BeDa/wm2RZN+NAdQvkiVzmvMDhSXDuGSPPa4zPNdGx5dPo1apF8Nxolh/jx
	 OaHrJ6evTAkk08lZTlAAJG3jhX2s/eNQa9NFZioDgRZAIOcvqIC3sDxlVN7GpfsB5b
	 +GYAuey9CdVEE8Gz4yTz2JikNneb42nSkzgustTT3YZfOvW63CEsKtCT7cOnL+smhV
	 bB0Yg8tPY+wcQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20251215130723.31081-1-peter.ujfalusi@linux.intel.com>
References: <20251215130723.31081-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: set playback channel mask
Message-Id: <176590357929.182908.3067426984878766179.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 16:46:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 15:07:23 +0200, Peter Ujfalusi wrote:
> Currently, we send all channels to all amps and copy the channel_mask
> to all ALH DMAs in playback. However, the amp may not have the
> capability to run any process and SOF may need to split the channels
> and send specific data channel to each amp. In that case, we need
> to split the channel_mask in ALH DMA.
> Copy the channel mask only if the widget channel count is the same
> the FE channels for playback, otherwise, split the channels among the
> aggregated DAIs. Like what we did in capture.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: set playback channel mask
      commit: da230e232352750a80c8fc883eac1c87c8849027

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

