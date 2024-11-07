Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABAA218958
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731006276; cv=none; b=mxdV+23wuf5+M+oekq+phnX97swqziFnuDkZaQSSIP5D8O9E9057LwQglZiBFvQGOow+gpL67srPOUjPotgxTejjEDuCJMaGm1X9emAEYSPlfoa0XrVzc5Gl6WqgsOl6L1+Q6RVB3rcFAnVr+XMVmp5Pk3BBo4ps0O0fPaSwkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731006276; c=relaxed/simple;
	bh=xolRxecU9+XOx04b95W5OfXwWoOX4U7+0to3v391nUo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VRe1forQ77/3psmX3Qpvme+ZCLNBhsJtahj5idwPfnMuTguj/epMjuuHAEVZRwCAxZKhzErvQxmxvRIVdKLWLbi/Si15x6aizE3F0FdPmJF5G3N8X6DJf6GBZPv8BhoUhl90puZRyqi97oaoCV0FEflqgEYOT8foN4OnIsqoJBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8PN7Cm0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8PN7Cm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725B3C4CED6;
	Thu,  7 Nov 2024 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731006276;
	bh=xolRxecU9+XOx04b95W5OfXwWoOX4U7+0to3v391nUo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t8PN7Cm0CCYx8e9Ke7++ANSAG00EERhvkj8HD7dUMuIKw7TW7D/SNPT9P4sHpPczW
	 Lt7Y4fmFkzmb2wFgNkfJ5RBl5ZGxLl3qM5Ld5K+YE+knp7XyO4VHHVBc5UKU1xeHOQ
	 DIwf10VxXPLBDvXlIYXUz7Fm8bKiSAe7M4e9p6Zz4gC2GNfJZfIdrdlNDihMFSSADN
	 LTrG5wzA1uoTU1wKTQAYi7DMMQcmO4KSkVFIXTeERPcUHXnMy35D/yISJ0P66xoaI7
	 3YJVZHdBdFhXVhhAJsV2gnPZf0R1YdVBOLXzAzSV2NEQttV+A8LpXhLICH6r7UzYZc
	 C2/YmfJ2NiiSA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com, 
 jyri.sarha@linux.intel.com
In-Reply-To: <20241107132840.17386-1-peter.ujfalusi@linux.intel.com>
References: <20241107132840.17386-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-client-probes-ipc4: Set param_size
 extension bits
Message-Id: <173100627415.245860.15926857446324902011.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 19:04:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 15:28:40 +0200, Peter Ujfalusi wrote:
> Write the size of the optional payload of SOF_IPC4_MOD_INIT_INSTANCE
> message to extension param_size-bits.
> 
> The previous IPC4 version does not set these bits that should indicate
> the size of the optional payload (struct sof_ipc4_probe_cfg). The old
> firmware side component code works well without these bits, but when
> the probes are converted to use the generic module API, this does not
> work anymore.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits
      commit: 48b86532c10128cf50c854a90c2d5b1410f4012d

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

