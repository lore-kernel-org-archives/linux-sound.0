Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D130E841
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419153; cv=none; b=ZmphKC+xwNxGNeN1MO7wDsBhH+MSe0eIbfiN/hILm4/+iXV4glJr+kNqUjh4Ay9lQvwfJnaVzOzdh1K0Pgqk0tkuhGXlI9yVwYKEuzXM8Hcu/JVhMBp7BYVSqsFwqqx8djP0lS/8bA0gdoRu8xxnelUvbbgNkoLMIN3BNsO+DQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419153; c=relaxed/simple;
	bh=jPP8tJnZyy166mCTwQvEOSIUKJVzQCmAZyTdNS8pcoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=boPbmqNSEspFTNIUFRq8ngA5gRlKlhVizI5eENW9iwK5QeFaFhfdoR8bFM2At/NgRCOYQyCL1eQ7RoNAEnny1qc9F/qA9Fi8zQ6QSNAMlBoL7BhrAmmCwKp7gsGQkOYcZAwn11+Zdxv+jq9uV/2sKJsWISknjsPPImUa3sBL1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgfH8VMT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgfH8VMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BD6C4CEE3;
	Fri, 20 Jun 2025 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750419152;
	bh=jPP8tJnZyy166mCTwQvEOSIUKJVzQCmAZyTdNS8pcoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WgfH8VMTewfzO2vs1QBmGhVM6eTmoOwRD5xlLgi7hbHg7t6AloHfvRWIAFZKPrs0G
	 OjaM+8OuexmzuU8m7hjcPzWbqb4wL9S6Ay+mCMnm3reZFRb4QDb7DJaZg4JqG5y+h0
	 znLhTNIqD89tcaB4IINX21yDUfq1TVqww5iDS8T2d0mkOOQiw4PPnGRA3ayxmPpetk
	 RTNMfWslqIC99qYCVdbr93TIhwZm2Mt/ATzNZKAQBTZEVHyEUEZ2t0S75ifGBhWjek
	 ++IqI4TtwooZ4N6GfcJjg2WpBT/Neo81Tm/6PRESD9sYrRiGjS9d3bXUhLirESCx7y
	 N3hygGWrvRW/w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
References: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: core/topology/Intel:
Message-Id: <175041915107.41098.4640029593567280349.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 12:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 11:42:18 +0300, Peter Ujfalusi wrote:
> There are devices where the iDisp HDA codec for HDMI is disconnected
> and it is not present on the HDA bus.
> This usually happens on systems with dGPU, but not limited to them.
> 
> How SOF tried to deal with this is to drop in a dummy codec in place of
> the iDisp to allow the topology to be loaded, but these PCM devices are
> unusable, they fail when user tries to use them.
> PA/PW is probing the PCM devices on probe and that causes the kernel log
> to fill up with errors, which is harmless but disturbing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: topology: Do not call snd_soc_remove_pcm_runtime() for ignored links
      commit: cbf4e0fac347b78f1bcd29350b78184665ad487d
[2/4] ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
      commit: 2d91cb261cac6d885954b8f5da28b5c176c18131
[3/4] ASoC: Intel: skl_hda_dsp_generic: Implement add_dai_link to filter HDMI PCMs
      commit: 86591907527effbfd99c038ffc06ca30bb4f6b64
[4/4] ASoC: Intel: sof_sdw: Implement add_dai_link to filter HDMI PCMs
      commit: bb48117b79ebc39485f7306d09dc602981fe540f

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

