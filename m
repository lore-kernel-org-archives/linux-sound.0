Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E043EB0E6;
	Tue,  9 Jun 2026 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046367; cv=none; b=cSGE/4bT8UFotwSx2/O8bFhxVlHanG3dWg7adJ8oWnpgEqyvENsqehf4I0K2EqsjK7OUI6y3E2Ogyk8uyV2pRTK3ezBsJ4PqIOCDUQIk8+wHy1LZ7sVtoFOzUFntNvnKqcxYGAKPZR/XXBdzqACTfEHAjeMUwu0jUOSBPL/6gX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046367; c=relaxed/simple;
	bh=k5t7aVM8QYNUoNadvs+3MSDNcEi0SoFgD+88APBIQLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vb4MCwM8SfBpw4yr+xvQgUXYfgxkUbbALFCP8xC4bNyAgXGTZ3njmzez6G+fpGoeFmNXmCNE1kfHXPeV1z+gFxxIgmzM3AmUOC0aubvu4wKGlPywy1jPYxmr0e+2WVuCNV8fQme+4Rx2zWCv/UxbM+eaRsBblsEVRBmsrXDAznU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImdYzAD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImdYzAD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACC81F00893;
	Tue,  9 Jun 2026 23:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046366;
	bh=aNsIRvR/phnQOsYCPUenL8Mnhm7ycJtUB5dZQ7dgL8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ImdYzAD5eCVzPO248h8ighAOiXw01OTC19KP9vg2wGFxVbzFXipDbvJQ9Shog7wJH
	 tPhTmsKMvtYe4joKyT82YiMKyNqA5PKVC/0rKrbrcsQox+iYGeJbxSkVqrqYdmzbLV
	 chp2D3dqduBzmOJ+lt7zvbDeL/nd2VGpAH1R3Klkr9AK1CafYKNq8L/VfRhfLTgo1O
	 kpV/yTeaqnbfNr7ZScj6MSQHLmTcZQ2Bd9A2eIKt0BJUiycHsVRlB3NdWCL9ZaI+Wx
	 g6YLZ9exwGGw87SDrvrf1vfX6u6emsxgGYABfbCYA9uQya7l7UqKKp05c+rOOxpLhf
	 Z7Zdf69cxhZ5Q==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 Basavaraj.Hiregoudar@amd.com, mario.limonciello@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 uajain@igalia.com, sound-open-firmware@alsa-project.org
In-Reply-To: <20260609160938.3717513-1-Vijendar.Mukunda@amd.com>
References: <20260609160938.3717513-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: fix for ipc flags check
Message-Id: <178102626029.34323.7256614430915240162.b4-ty@b4>
Date: Tue, 09 Jun 2026 18:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k5t7aVM8QYNUoNadvs+3MSDNcEi0SoFgD+88APBIQLY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJxXfpM1D3Ar36rwSOwoyXMV+gs8mWEnHEAfU
 cDxZ7K/cDiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicVwAKCRAk1otyXVSH
 0FdlB/9PF71r0mTwJKKIawGI5IrmlIZfKekoqdqYluKd6im5+cBUZx/k1UfqZoOVGQUh4RcLvOd
 n6uxfHSzV0gE3kNfkbSk9ThNPp2IN/ss1nksV8vA9xtmICTaYMVDnvZuIKhDFu1zCl9M+fgBD4z
 i8/jt5soZzpFuzv6Kuv01BqPCDu5QldnXdsldKhDFMOROHTXXQXX+5n3KLU2iQyL97XQfuG24Am
 qBibAUkFePphs96JcF7hKFOsajArpZkGt4n/ZB36QfubivDVqn7Yp0HCKS9YRYOyMe9cI72VF41
 UTbrx4werx05dUWFLSg6STKMxbRLdy8L966K1YKlXNq0yO65
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 21:38:44 +0530, Vijendar Mukunda wrote:
> ASoC: SOF: amd: fix for ipc flags check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: SOF: amd: fix for ipc flags check
      https://git.kernel.org/broonie/sound/c/6042c91df60e
[2/2] ASoC: SOF: amd: set ipc flags to zero
      https://git.kernel.org/broonie/sound/c/25b17c06040f

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

