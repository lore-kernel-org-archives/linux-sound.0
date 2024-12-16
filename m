Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD42066E4
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 17:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371624; cv=none; b=RbO1UI90cmlZcwKTWIvu14BO8i0kyWeeqxZb0XtlVcp4XhGcROq/KdvJqC+Ro9tu4XvZuZqJD4lvkzNbzH4kBPCYABOdDjak5Px1TvFsLEdeI9jMvG31AqrsG8Q9ZlNBhwdcoUGoVJTy+YA2Dw8wi83E7lL9zP5wDRpML77uMZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371624; c=relaxed/simple;
	bh=/vjojoBNUV2Ou2xVGLzIXB3+WSPW45HyvKbh36856yI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h1+wejGHlnlzPGzwd+AGNh0B5cqmYR51Z1aLz77qYZ539VVRcsziVenWFkrHOEE0WsxkNYh6oc9XYg55QUegOWaQxXi+e6dp9AglldBbtmtVXQqpypPGYtrbozQ+2e+1+6LjKs8r01O65cH05Xakx7obGxFcb9YtcM49EZsk1ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlnKwaCq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlnKwaCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0049C4CED0;
	Mon, 16 Dec 2024 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734371623;
	bh=/vjojoBNUV2Ou2xVGLzIXB3+WSPW45HyvKbh36856yI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JlnKwaCq+YtbYnW74gnjUmSW2VdwKwXX4XTQ5gBAxiDWXQIGH198r0KxY/ZCoclkd
	 zcvimUHZnUu8XUMvQoyVUM/8UsN1G7ZK2+SEhtf7GA0fMgs2sxoUMeNyZ2AwLLwQio
	 oPZOHtPMaJnYVA8vCwqmwCT+Lbn/b93Gfgi5/bFzRiY/wlrhHefS5oIei3X6anP+Vr
	 DLoxYbAX6gw7vJWdIaF7dVZXFN5pQK3DGh9+E/6GZdgqfADa36aCpTNOZz7wcofK+Q
	 6DjKsJUaGVHDuyOWOmEH2LbmChcpYfLKfwLJaJ29el2GJiO1Wx2viQ+T7i58aLpUSr
	 fDEyo8jZWFCEw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
References: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: sof_sdw: Update DMI matches for
 Lenovo models with SSIDs 233b, 233c
Message-Id: <173437162251.168779.8702680518750808801.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 17:53:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 16 Dec 2024 11:31:57 +0800, Bard Liao wrote:
> The DMI match information for these models has changed so the match
> entries need updates.
> 
> Richard Fitzgerald (2):
>   ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
>   ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
      commit: 7c449ef0fdce540bfb235a2d93e7184864c3388b
[2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
      commit: ba7d47a54bf23a7201bdd2978e16b04fc1cb1f6e

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

