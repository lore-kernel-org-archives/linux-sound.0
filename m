Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3B1C3317
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558846; cv=none; b=C96zUz5W6VZ72mIC3gTjt+GJjvYy+rAbn0uWlj9SKSOQ9xS/Jd3ANnem7GJHZp0ZVfS6hw0yh6MhHriheBkFHTjeNXnqBDs307b7NloVDW0Eop+JKzni7EyB6mw+Sxa2fan1zaXsAIsYvyhtNhZCqDFDgt689oFYOtn4cp/ki6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558846; c=relaxed/simple;
	bh=hdd8Yrt2Yla4IqylQ4uThkenccLeKIeliICXQ0cL6Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gb1QVK8aMGpULJBsb4Tj6k11y4TpmkVTj4mCggG4iZpemC8B/0j9T4geQo8wCkvb/XkvHXl3qCr5EDh6tXc7g/ZRkVe6j9xb+FGrBxehqPoEPbNPaw2DbBg9KziUvsfTLkNYYx4GdnYQVXJh5VInmrtRcOcARsUtC5FLvBfGDpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azVbQp4m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azVbQp4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0219C4CEC5;
	Thu, 10 Oct 2024 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728558846;
	bh=hdd8Yrt2Yla4IqylQ4uThkenccLeKIeliICXQ0cL6Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=azVbQp4mYE9pkWOx3rC5yN+p8wIVZxZ76APGriCQ49UKzmd8s1TcjRI93gU2hA0ff
	 LM/11HSwyjOPG7JoUSz6//GlPddeiBCDnrog3Q8Lw3Cn/dbt5B9HnEb7ivw/DvpqrA
	 ltfyoCY/BwJTTtgbn5neIe4bCzMwNpWt0aiR7pvkhpGzcRogSohscCrr+tWSNNYE14
	 YNwDNqXaSBtMtTWWm+SwwQl7JxUS6pA4zvn103x05/R0Z/w/QiPV7rSepSx9Yv/s8S
	 iqUzE6vMWtOtlEIJ7Px1J04dNctS0TWjMad192q3lQiIFjXAXxCgrg+1dAnEBeETRe
	 MoGccFBscdKeg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
References: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: ipc4-topology: Rework the module audio
 format prints
Message-Id: <172855884449.3258793.17576862449523015955.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 12:14:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 08 Oct 2024 14:09:28 +0300, Peter Ujfalusi wrote:
> When the audio started we print out here and there the Input and Output or only
> the Input audio format for the module that is in path of the stream.
> This is mostly OK but provides inconsistent an - in my opinion - hard to grasp
> information.
> 
> The series reworks how the input/output format is selected and tries to improve
> the consistency of the prints by applying universal rules:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: ipc4-topology: Drop the 'index' from 'Pin index' of format print
      commit: 76733db0f5560efa0c6514329620b9cbc8b1ca42
[2/8] ASoC: SOF: ipc4-topology: Use local variables in sof_ipc4_init_input_audio_fmt()
      commit: 3b54c1cd69d04bbdafc5542d11c6cab685fc13bd
[3/8] ASoC: SOF: ipc4-topology: Remove redundant check in sof_ipc4_init_input_audio_fmt()
      commit: 2d9635b57b1bbbece2a8d30103fcd1ebfbbe0178
[4/8] ASoC: SOF: ipc4-topology: Simplify match format print in sof_ipc4_init_input_audio_fmt()
      commit: 0126a659fd517103e8ce4d432fbe9b06f0a20510
[5/8] ASoC: SOF: ipc4-topology: Use local variables in sof_ipc4_init_output_audio_fmt()
      commit: 7a4c41e4778342b0ceda2e16127fefa808de3c57
[6/8] ASoC: SOF: ipc4-topology: Simplify code to deal with process modules without output
      commit: fdaf2291524c6a220bb051ad1a8d3c99b177b6f1
[7/8] ASoC: SOF: ipc4-topology: Concentrate prints inside of sof_ipc4_init_output_audio_fmt()
      commit: 22408b8f625d85b5453fde8627aa6dd49f87c281
[8/8] ASoC: SOF: ipc4-topology: Add helper function to print the module's in/out audio format
      commit: 47701a85af0c0d655e06dd23f6b8761848147450

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

