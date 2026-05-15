Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067AA314B77
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863159; cv=none; b=WYl4ZlHmNJOPSIthsvlfRNtfm9fhm0mbTu82u/rRbf99Oec3+HZCClQyHBVxVOvAxaGKjsj3i+naR0n1jzGyP4RJ7AfWGvd9PypQV38tctYYYjE2E4AzxdHSFCSACd8FJPD+bCAh7ZMNwtCNNsW1zhszpSAakDpCFYcApSLhmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863159; c=relaxed/simple;
	bh=EthHAYd518MVRLMffRUXLDfteismEAsOXMljOjNtAoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZkuyVzCsVK4v+G8MdiQozZCHkoRfDZ4hcYdLxbJRWko8TKgeSTiNR5vnPSdp9RHyyUPEud4v+eZzBwUGYHYGjbE/YhO9oqWuZWBB++D3kRzrWVKzA/HToPX/bPrY+QgYoz9xts2kvCJabiSWpsfYnK8Y8EaWbyejTmXVBx/IofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyegyC7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyegyC7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE183C2BCB0;
	Fri, 15 May 2026 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863158;
	bh=EthHAYd518MVRLMffRUXLDfteismEAsOXMljOjNtAoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VyegyC7ER6zjqGleEA0nvH4eMziX9CaESsEcDAYpRbMN3T/dUaWdXNbT3QPXdDzph
	 v/HzCz/vzn0gv+bVO46lKMIpKAwA4cUTbw6mveB69zK7OzNX1yvSbwb98YU/Y6EfUv
	 MnaJo5OFG4JuOYCnBWO6c3RfiCSnGBtusbhknIm77j+QUEYk3dv8s6F4Lk6F2FerIf
	 xJHhCium3wVIGayPwMZzYiUfA4NdPVuc+sv3V9fo5Bw9ewewFnfoMEndWDVHMhfXDI
	 l2Qfkg3R3mRd6CTDBjW/KDIptd0Eqd81rKjnds8pXgpkmMB+msx5Y+PtNbDFQAXisc
	 AfsiTNMi1XP8w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, linux-sound@vger.kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ckeepax@opensource.cirrus.com, vkoul@kernel.org
In-Reply-To: <20260514075206.3483-1-zhangyi@everest-semi.com>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
Subject: Re: (subset) [PATCH v15 0/6] Add es9356 focused SoundWire CODEC
Message-Id: <177881219097.1136679.1695837753363095111.b4-ty@b4>
Date: Fri, 15 May 2026 11:29:50 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EthHAYd518MVRLMffRUXLDfteismEAsOXMljOjNtAoM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0wztmnzzkSovE42Nc2mq0Qa+7wca68EaSXxX
 g1E0aSCR+mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMMwAKCRAk1otyXVSH
 0P3XB/9lndrJmyEROtBWJ3Z6BYCQncWI8l22iysuCG79L5c2UOQUsgfuumUVrr/7z+cK2LiNTBe
 mGcudO6UukTG/Q4dH9HdofGBdcukrTZd8hyANcVdgOVgFmmla0Yam0ojh3ieuU74ke/uEkRulSd
 jF/sMj5HAQknk/jI2qOFyZeVvn/woTeLfbUCHpVuuMoQVNU/NHRjMdAl8JGrcFuXqeWFAXQQDkT
 kyTF/DC6IDNx4kCRk4YKad+MEI1pSlsAjEIZ0OwPdKQQcSSU8udlOfg7otkW7rP4e8BVtlGdaM9
 kspj9Ln8laCNnYvmvrZIIH3LuMOJYKz7dGsO6B5aO+yTbQWh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 14 May 2026 15:52:00 +0800, Zhang Yi wrote:
> Add es9356 focused SoundWire CODEC
> 
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.
> 
> v15 -> v14:
> 	-Change `es9356_sdw_remove` from `int(*)` to `void(*)`
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
      https://git.kernel.org/broonie/sound/c/5d9cb740cd38
[4/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
      https://git.kernel.org/broonie/sound/c/25b905940832
[5/6] ASoC: Intel: sof_sdw: add es9356 support
      https://git.kernel.org/broonie/sound/c/f1e35606d618

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

