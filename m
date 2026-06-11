Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75A37D10C;
	Fri, 12 Jun 2026 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302705; cv=none; b=WreEuYC20rfI+OXCjn2jIdpfTkmptKk+zXbOYOO9J1mZlADvZvkBC5T8gAd8mTWGvCQXyAqwQuvbLVbvxlbQeZ9QPyhjLm/cFGDDX32nS/6ptOeWe5tH/XXfEgl73+2mjmyJVFPatdMXAyUNQaLaEWvFyCZzCJlHBfGqkpZuvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302705; c=relaxed/simple;
	bh=GL+rVpbXxDx9TQnqiNqY6e8kDWvoz3tdmaVs1g/i2ME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O0gJTUxj5tPFaW7A4QIzJlTChLz6rDmrFyZerLFO8UESKhC9IF8I1oYOyDtAT4iAdJdb3n2BYe3Q7HIO9PzTJEzjSDx8nIwm7mzm4X4/pqetfcnCZ9T9b+ozMq2QOpQIzgSXF776zUwmG8ebjfPh7CQxn130Yywot9TTKFy6GuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7YDX860; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7YDX860"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E2C1F00A3A;
	Fri, 12 Jun 2026 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302704;
	bh=bUuLuCNwVMVotc/UaW34G+DbGMicTkMAs5MVRAwrjXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m7YDX860HM66HOBfY8RfDxUceGnrxeZELI1mAlO+Peen1fVJFmZ31KFYE9TNhF+dz
	 NHdKm4nY9/dsIDMwSJuLYFId7fH9GKl8yM8NDvcq8bQJbtUyHmUcx9KjGcPRSPOTJF
	 v1+VMEcybP95Dl+NbhPrFehGPDpbSqW5WnhSA+OgLh3HnRJ7Dkki10sYUEuOSiVpZ4
	 C29Z1FwYi8d/ivReaqRV2gb42DYcEAv3DaUokzPu2SvWmDKcBDGsu2fzVfnsscsE4f
	 i4Ur4NyI8Vy6DJajrP78DmgUevtaj0lQbjXkUl85FmcmUmHOuGbglmeY09CRbm6ov4
	 TYtOMPNJ7DQog==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Mengdong Lin <mengdong.lin@linux.intel.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org
In-Reply-To: <20260604-asoc-topology-check-pcm-dai-names-v1-1-e1b0f6f7c2ce@gmail.com>
References: <20260604-asoc-topology-check-pcm-dai-names-v1-1-e1b0f6f7c2ce@gmail.com>
Subject: Re: [PATCH] ASoC: topology: Check PCM and DAI name strings before
 use
Message-Id: <178120726777.484538.12510907202195244148.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GL+rVpbXxDx9TQnqiNqY6e8kDWvoz3tdmaVs1g/i2ME=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIWsHH6ILYZ784D0E+VmUHEBZmdK4D2zn70s+
 aN89a4Q53eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFrAAKCRAk1otyXVSH
 0PcQB/9SSvivs+j6S+90TPNoAGKrHpOGgDqfDS+PsE8i1bgfv9TNieP/f12yJ7rbVAdx7L06R7R
 8oeknz4uTlPLUe5s0mHdzD+6c9C76g5niNItchFU7Xv9GwkugEtBTHWQ4r3hY7odxql3uNYNzt/
 FVwhJziga0+sQ5lGOt0uFZM7kr2SdNHYZCwnRtrY7gjWkQlncfZYUVQ6VvTsAJGtFaewjKs3IFd
 kZWpy7LEGmwl47V6lJOfgt2GCg6AJNtSvVfYUeUaVngtycPWfnGJuuaPbF6GEISj9obMTqNBmpt
 geBaWMX+PZefFbLwswc5/jT1A4biMPcwLq4l+YkQ+cVhnAAX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 04 Jun 2026 00:10:58 -0300, Cássio Gabriel wrote:
> ASoC: topology: Check PCM and DAI name strings before use

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: topology: Check PCM and DAI name strings before use
      https://git.kernel.org/broonie/sound/c/b7e44d1986d6

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

