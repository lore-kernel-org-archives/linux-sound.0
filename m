Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C882330DEB4
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024534; cv=none; b=YAL+qJmvZxGxY40MwpV1tlFpj2Vg5xnQ/whOGtR0/tgZJTJreBqvE5bSPoRlBB0/D2EhtUxBTjRHJNYvH/ERFxWPVtgVr3KwIdadfDUjnlt4yhJbMdgmyvMOpKGRJxLonKuBRlAQ2FtEflYc58gRqY0piTF7l6xvdXHhp6FtSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024534; c=relaxed/simple;
	bh=fgSB2YAW0+UvMEO/j3jLykXkff8pJ93uPjHAxqGlEBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JES7VFcrT7z9rRBSHbu2h5xCU8+R3Yc8vY2L2geQgX61R94hcRVjTKGYJpB8Y19xlDKeT2BH7bTrcQp2koWukVg0eeKRBCjCmVrFqxzeQrS2huasC3AAriam4ZbTW0P+VAaCWpE1AvRxtuz5rAb55QyjEh1k4NLwwEyLZS182Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0A3lBMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0A3lBMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81325C4CEF0;
	Tue, 16 Sep 2025 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758024533;
	bh=fgSB2YAW0+UvMEO/j3jLykXkff8pJ93uPjHAxqGlEBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o0A3lBMcYgDfderCIg3deqBTS/FWnZ2firGEiHMmTjfJOpnsBQPmYbgazesXLv52/
	 GRLG0GtvfD011obzNkpg+khtZtTShEFEtXNBkXf9JHDF6SRYr3lag2y/I/hNFxkOy1
	 Mqqjz3jso5f9AuUeZv9qSko061zXjGjtj6V8c58ThP776N+AXDKeAMrG9vJQg5ywij
	 8/Gao4eTxpFcT5K9Nt0lNk1Ej6zTnIgDR5r5VBAGl4EXCv0NWNeA4+rvKLizrpZiLz
	 Zpj6YAJIAOFD0QAztZO3Fo2s10B/Y6wcSwz3E9FCV6ZrmSMtEaKzK+0zkp5YPFfMbC
	 suT5mNBCGyhjg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20250915025655.1154279-1-yung-chuan.liao@linux.intel.com>
References: <20250915025655.1154279-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: PTL: Add entry for HDMI-In capture
 support to non-I2S codec boards.
Message-Id: <175802453226.111062.18341192807500136103.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 13:08:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Mon, 15 Sep 2025 10:56:54 +0800, Bard Liao wrote:
> Adding HDMI-In capture support for the PTL products which doesn't have
> onboard I2S codec. But need to support HDMI-In capture via I2S and
> audio playback through HDMI/DP monitor.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: PTL: Add entry for HDMI-In capture support to non-I2S codec boards.
      commit: cc648f4dde2ffbb74b9c1626e3eaaac89c6fbe16

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

