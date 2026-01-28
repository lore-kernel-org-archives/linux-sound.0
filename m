Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE351D5CC9;
	Wed, 28 Jan 2026 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769627990; cv=none; b=K3i4ky1I1fgrGaHLYUi9Hs8IIXjAABVlGvwMcnNK9W8FiNJpqcYg2TyHShAx+r/hsLSpuh4dzu1A5lQzAvj7VymuaVooWUa4jIYwA6NPygPYpTTFQQg3RmE/L3Qtzb4WhfF95+VCP6fDwKZdW0kBbcz6HocAIQ70CQY6ViC6mjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769627990; c=relaxed/simple;
	bh=Jx5M02ssO0PeyyfzaKCjZMnsgnT+l4KvvJU2shPLduM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zoco4F/Ox9bwX6UjUAmlLoxeh+HwwDtx8mqlSNeeXs9TFWJCzObtWiMQUcFQnp2P5lZSVe8jruhbS9LuisYqVeMZTpueV8879AmZm8CGOaHap/RFz44wDKdlxHWO1jpz6F3CqMBfMoWrxKm3hRRRfsRpKPv1Ee9aVOcpsk/lXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9bEuUgz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9bEuUgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BA2C4CEF1;
	Wed, 28 Jan 2026 19:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769627990;
	bh=Jx5M02ssO0PeyyfzaKCjZMnsgnT+l4KvvJU2shPLduM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d9bEuUgziws+C+kMh1BpRWxU+qfcf2K3wRwgcCshtIYPJJ52gCMunD1JpjEiV0oEv
	 pUkIW9BcX0lZvpnUp/HTxKMKBVoyUye7GqrSP6UygqwNJRGDu1gmDglZogIjZcpMpC
	 anhpWWH1S6S7rlikCEgoxQ0n6433Z03c4kWengT+PnDZIQu7Tm0aH1hiTq9jJe7/xz
	 2abw9XmPwzCQzb8bZCTVpyVBaXgd1zSsvrE81y3qDSmRvOvvv8pU9Ru0oC3A2JH7FI
	 ps8TKb/N0iUGyukV+d2fDORHTeT5qI+YKNR8kT08fXv6OR8TUCHQjPN1EwFWCEiRlD
	 qp6270oLF5JlA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260128092410.1540583-1-mstrozek@opensource.cirrus.com>
References: <20260128092410.1540583-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: sof_sdw: Add a quirk for Lenovo laptop using
 sidecar amps with cs42l43
Message-Id: <176962798768.3150276.8077584571829669236.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 19:19:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 28 Jan 2026 09:24:05 +0000, Maciej Strozek wrote:
> Add a quirk for a Lenovo laptop (SSID: 0x17aa3821) to allow using sidecar
> CS35L57 amps with CS42L43 codec.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43
      commit: 681ca5c6fadaa268e2fa3cff8609c4c348377be1

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

