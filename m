Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833634A3D9
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072741; cv=none; b=LQScw1B2clO//oJgqs6uqmPzpUX1G7ozScwY0UKnECrO968lpHtI28m79SyL1TySWpncfMj1k5p3qjpyUzcOgvgAgj30oNoYd8u6H17wWV9TbyWy8nDbcl0AE7K6Oj/klt4avIR19RYIqkYN/fQvk4ajAElafcGugNG4kk3yUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072741; c=relaxed/simple;
	bh=xOnTb2HtWJBukNjpMV4Pxvou2fc8+2/iiTHNKwSvLmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Quw5wHrQUdF2V/rI9uMAVwkkUGVPH7ba22Lxm11EPrDUg7KhfznYZl5/vjCThQH05T7ExfjZm3Fb5Cu9eFvwoneEGrGWctfqQqYBBpUuUw0x4SCwWNfZ/GPHux6sj3GrSAetm6Pd6y7NJ8/RgKDqIDdEYdy3WiWU0OUXrF0t/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEFyhXcL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEFyhXcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED21C4CEF1;
	Tue, 21 Oct 2025 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072741;
	bh=xOnTb2HtWJBukNjpMV4Pxvou2fc8+2/iiTHNKwSvLmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YEFyhXcLPtbpnjeIJ5izdzo31xkDyK8+9EZ20PCPmBfCamEfXh9Lwolm4i/O8nCr6
	 JVipjKusMuiNofyv1IpOdqtyR0QbB4o7dqE6l/yiS33ZFJwSxcmGhAOp+f7VQuc+PD
	 32tpsp1j0QYEMi1pa+s+9zGz4CbrzS1Kv/Y3yTAajCeYTcWU0e3f4u/1PBetBFV4w6
	 mygGljmpaOr31JDkHDcX5x6ear1vFvqmFFdDFL2Qd9Z3hYjJYLpOvUnT1bEx43MKZw
	 WSOsQmjoRdGihxSRa2vCSyGU7DknmvonTrwSqBXhY+F4IX+MY0Vmmv6NNPO0VpF6ey
	 FNp65V0Op+jug==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20251021065700.130810-1-yung-chuan.liao@linux.intel.com>
References: <20251021065700.130810-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: add hyphen between name and index to
 amp name_prefix
Message-Id: <176107273998.196841.1402911891887643938.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 19:52:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Tue, 21 Oct 2025 14:57:00 +0800, Bard Liao wrote:
> For those amps that use their name as name prefix the amp id should be
> added after a hyphen symbol. Like "rt1320-1".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: add hyphen between name and index to amp name_prefix
      commit: 5cd5f8fc29fa1b6d7c0a8f2b0a95b896ecadfa42

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

