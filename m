Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11609199947
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414991; cv=none; b=J8wzXAKFAf8NwFSzetYucpbdK5oVXQ5UBiaR7Mq2hzT3xMvEzxIyo8EQB275etkBcHNp3UbpBxehitYFfZEdlzYt0H1SmETdWwVMjOw1Ey3Inza1ft8s6nT8AYq3jp9CLO/f5LWJUmodbTDdBgWYFaEQIX5R1mu3jlWFSYdLgQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414991; c=relaxed/simple;
	bh=f7N6ccDqkzbFe9raHmFFpX2+QQlr/OA4/qEQmXYksDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tBmVnRvpG+e/MIvHbUWqsUVDisOPlDeWT5O4jIg6LXggz2bSqlrHS15skpAAEVC7SIhJNNewPOxOtoCtQ4aVTsAVM4J8SRgNFq7Tz+AqV49Pgq8DcEP5RjdGhS5w34WbT2Rhk8dLGwPpZJRPWNJ+7gzMtssJOFgShDfMupNmKXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkXrlzT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkXrlzT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA64C4CEE3;
	Fri, 20 Jun 2025 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414990;
	bh=f7N6ccDqkzbFe9raHmFFpX2+QQlr/OA4/qEQmXYksDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TkXrlzT12sKg4xj/r3BYErHoZUNTSscspivpWCi4yCR1AGU4l3KehdWHllFgUCZle
	 IbJUeb+CJMrmZhO3nr2BEvYazhG+QRIGgze/DAXb1/mZPLZwJ5OTNWnMtFIG+ijPvx
	 tx+4CRlnsP3dVD/bd5bgliqxc6rcgiDv09fKx9pKKEV0iQcKL8bUsMz7CryVD2+EFI
	 6QjtBzug05cS3GjT98HcdEmjsBkt2hy4FYFQ4v+yVHL37UBRFVd35K7VuAtA+cEm4N
	 +rav4H4D99EENTrZ9u4hx6HTh6hg42aJfpF2H3yfFZUUPFMhoO+zjmd2cQ4agcNz4M
	 Ix4dY0JZWaPFQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20250619102848.12389-1-peter.ujfalusi@linux.intel.com>
References: <20250619102848.12389-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-pcm: Enable delay reporting for
 ChainDMA streams
Message-Id: <175041498912.23264.17461188851568756851.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:28:48 +0300, Peter Ujfalusi wrote:
> All streams (currently) which is configured to use ChainDMA can only work
> on Link/host DMA pairs where the link side position can be access via host
> registers (like HDA on CAVS 2.5 platforms).
> 
> Since the firmware does not provide time_info for ChainDMA, unlike for HDA
> stream, the kernel should calculate the start and end offsets that is
> needed for the delay calculation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-pcm: Enable delay reporting for ChainDMA streams
      commit: a1d203d390e04798ccc1c3c06019cd4411885d6d

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

