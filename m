Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C4D17F378
	for <linux-sound@vger.kernel.org>; Tue, 14 May 2024 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715707770; cv=none; b=M0rbx50dtlsSuZm3ohWVzijy7ugBSMauv/136Z56vkzbSfuoHm99v7vwf1unQNK1PeVe1zFNUpNjxqD4EvGLTDC03KKZdbSNM4d9YAh4qzMRxAntme1Souk/pJgdIEWl3NWTlqJpSE5xz2RORhRb85uye7nzU8ZxfFFKDtIoF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715707770; c=relaxed/simple;
	bh=GvFhYvIWP+G1UGCl/obovQznBTsjWbbhj4ob9UDYe2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bgjqEZ/JbaB4xWGLRsZrJyBC1+uOxstbonVLAqq7yagXKI/XAMxDCsgMI3cj4jEKHTw4QmahB+OZHSyoNWVaWqxj4WmeIOoI3T27xdEU9ImGLRmqDpI/aHdLevE6ZxczdGAZGwV3kjH5ApxIAOCBMQ77TZfiokujfU5c7T9UTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdPIRx9A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdPIRx9A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD87EC2BD10;
	Tue, 14 May 2024 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715707770;
	bh=GvFhYvIWP+G1UGCl/obovQznBTsjWbbhj4ob9UDYe2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sdPIRx9A/cVIEgRMhuBYbH/zujuDd4r3KMNxgshbkt7FkKuREHrL7Stpvpvldpu6r
	 lEj7IhViqx83cFI+Q5XQkha7WwvxHkgLts/g2trcRGzrM5ULQ2zcCtEgS4QClhPQIe
	 8Fqq8TrbgSDZGzVZ8yIE1vajObcP37s0lEBfGHJId8xJvom3pgkmlsbSYaGeD9vHON
	 mlO+ZQI1KYwP69jNoQ1kdwciAvRmNNaJdvR24kwlbcf0BFppKvbnEaAimR0l5yPVgm
	 El3og1Z2LQeqPe5tQlTM+2EUgQ3q/JyLHYraWZbSj2YvpTpbuzdj6bzCwMvFvNFeid
	 KlEz8J6gbtanA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240513140730.27048-1-peter.ujfalusi@linux.intel.com>
References: <20240513140730.27048-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw_rt_sdca_jack_common: Use
 name_prefix for `-sdca` detection
Message-Id: <171570776849.50952.10380038018451346776.b4-ty@kernel.org>
Date: Tue, 14 May 2024 18:29:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Mon, 13 May 2024 17:07:30 +0300, Peter Ujfalusi wrote:
> Match against the correct string to decide to add the '-sdca' postfix:
> instead of codec_dai->name the correct one is component->name_prefix.
> 
> The component->name_prefix is added previously to the card->components as
> hs.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw_rt_sdca_jack_common: Use name_prefix for `-sdca` detection
      commit: 04b5e2f9a75a3f33f29dec780c1363367642fd73

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

