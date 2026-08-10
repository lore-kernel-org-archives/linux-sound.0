Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7DD3B6367;
	Mon, 10 Aug 2026 22:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401812; cv=none; b=bZIWpgSIrVUvvgOT4vldbCRgctF1TRzRA90PWgh6VTUv2zm+8iBryTB0rsZiJ0b2ILVmcWwATZR85tShwsJo2R7d/jVNcAMMOMJ5Ex/Xbh4wrgYen9G2pQdZu2bub25idxfZb9Yexkm0T6mtgsWg4gM3BTsoIWC5ioJ+8XfKnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401812; c=relaxed/simple;
	bh=5APZpbtHMWWrkxi/7cg5fDv/ij8MIaT+W+jFKoZ21LE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OVFjaUYO/RaIuREEDcwSQ2epEp3lNNZ49V+5Q6K2Q4MX25wkBukEdxUdreFTrtC4zArzvRYkCsbt+gD0Doa46AfOUDzLoV5tdZzN1Ee0WezLajDS7U9URBYu8XjmAL0+xlYXn154yd154YKE1Y7vz7CCjZoEfPaB8+VZZdTM29Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJCbTjoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJCbTjoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD541F000E9;
	Mon, 10 Aug 2026 22:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401810;
	bh=RKVgoSDWcfiAEEIYuiz2X/nQkWUp2RdensK08zonZuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dJCbTjoI/goj3Omb3mRLM4PBHWBZdIoDSrOmqecjOC+H8AfKD3rhP9g5+LJFDJNGP
	 pdAfeCxr0KqcZ0H6rLHNsMBE/mJcmYDVkYRReiG6PmI558HVss6xAJ/vvsqaDVS6WO
	 nS/mJPb9EIgpSrqmyzvu9nZZ5DB7bD2PdmgY5nKlC75hmJlAvm0PLHBcWj/dImolqq
	 +CWIlGsBI31sr1sDiWrUwae1RCKBuuhXLIKm1PoPmB4PxPAUzoMgdt6ME5dh7UK73K
	 czeE1rl8759tWwyVL3LqDheQ0EeK+nMLYXfoep13n5rfCTuwOAIOTEbsnvrgO+K7vB
	 MoqosADXHOquA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Tim Bird <tim.bird@sony.com>, 
 phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260806061046.25323-1-phucduc.bui@gmail.com>
References: <20260806061046.25323-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup
Message-Id: <178637275393.155010.2105849256239425367.b4-ty@b4>
Date: Mon, 10 Aug 2026 15:39:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5APZpbtHMWWrkxi/7cg5fDv/ij8MIaT+W+jFKoZ21LE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqelQQyocAjK9KV1Wz6hakP6tyqkkBIqo4YjEeX
 D3FojTdcBSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanpUEAAKCRAk1otyXVSH
 0Bn7B/0fEj0/sKbHAGulgu3l30II6eVWDg3dbUsFLGejrnXCAelAYMflFAx9P8OIsNEA4QYOoH+
 rE1031BOThTM5AHOqQB6aIIXhrhSJQFINY1Pbkb6+NQrO2dFH089ssvSBIJIUyGvK4EIiFrYpyX
 ZrLkaqYCLUf8h314Abasn4z2Btlhrkim0uXLdPwoBALpy5lG5biN3Tos5RMvjXHpAbNP3WFUFi9
 5H1766TB0QaY3aOtcYsfi2ik4zKpgHMs0FIKMkI1ftwZq/1aC/DWi3wjQbmB18jzMV25kvapF1W
 1fsDrSuCmVxAzHu2aD/l+kSYKAlUXt7tQa4qapP8Knxm445a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 13:10:45 +0700, phucduc.bui@gmail.com wrote:
> ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup
      https://git.kernel.org/broonie/sound/c/564db8b8da8d

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

