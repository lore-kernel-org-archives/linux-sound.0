Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691704;
	b=FW0vrTgmpprPhPIebHLG/53c6ghxtRVVZSeWZJsw6Wxnlor+pL0iTbXSpGlCyXYMvYFW
	 cXDuPscNZvsov1P4sTf/8VlTz2HCPxr+N4G3sgbsqj+wdG7TGGIUfojFkzhN8Z5a9mHVn
	 G2OJ+wwun9aopSSu/lMBrkAjx4rG9AG8REoec82X5ZQkgxzE7yjPGHOmvndMNHan4SiA+
	 y3yW4htfVKMiZcsr+T8O/tQocSmj8vZVG2vcdsa42X+nPLeduQ9H6mNMEucBQsyl/8sBG
	 pJLHe5l11V8HSpi39/FD+/KUFctVT7VcYM+SCRAcFeP18iHopow1INYh16RlkWUBD9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691704;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=3xyN48t0ziV0SQvXLQIuJo/vPyyMbfqR1L2W1ddgfIY=;
	b=fGhNMCCHLqAIcj2Uq7HJX6XENbmwJFmeLPSNjy/FtTXD+dK3Q3HAlzuoqlnoTeNLeBR/
	 Yfx6l37uGD1vQk9hGMJLR10ipyTKY0+dxLNCiAHCo8dh2xsSNQZtuiKzk5M1oN9lbdvxQ
	 Q0LQ7CvBzDrkVXMIR8a5Qj9JcFXnhB5suZdrVbQgFfcAPF6Ap0NmIMA/M0+jXRydy7DDj
	 FtrZ1lD7X7VZxQnf0VrSe4xfdFDJKCGjY29kbDMb//JE6s5tBgSTvTVMXTwa8LM0eYoth
	 J8t9EA6BgZ//CQ2Wjfj1ju9QBLBaqYMVtrJIMxFi8hW2p4GHpUIlJD/U/gMG30HM9lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndPDXylQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD64606A33D
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndPDXylQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA6D1F01566;
	Thu, 26 Nov 2026 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691704;
	bh=3xyN48t0ziV0SQvXLQIuJo/vPyyMbfqR1L2W1ddgfIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ndPDXylQrl0r7xBSVjJ2H+5svwSWDeRUAq0HZpVB9zMzrpmPPJCFzKSW9bmMsG2pj
	 B252qooH3C/ysZopACOuK/D2VvLSOX9sDCuFTtH8lSVn68KchVMSuaUOr/QDCkVg8y
	 28rVp0BSP6ngKIwnF3vFoY+ejV3v5WqPuHq/bs/HuAPFiG5q/Zt9Ct0M/ve4ctbxcn
	 rSBTp+c5tqoDehn+W8+gF/tbBWufJ9rIDli9JX96sYy9dSuYEEs6dBrmsB/1zwICG+
	 iNbxVK9npocInEBIo+3dqzub5mOgc4yf2XnYUqPGckSw4amKbc2o/QGm569W78huFS
	 AKQWAJDbfN6gg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
References: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: add HDMI-In DAI link support to
 skl_hda_dsp_generic
Message-Id: <179562937762.358726.14915090334390662782.b4-ty@b4>
Date: Wed, 25 Nov 2026 17:56:17 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Sun, 22 Nov 2026 17:39:42 +0800, Bard Liao wrote:
> ASoC: Intel: add HDMI-In DAI link support to skl_hda_dsp_generic
> 
> This series adds HDMI-In capture DAI link support to the
> skl_hda_dsp_generic machine driver, and prepares skl_hda_dsp_generic
> and sof_sdw for HDMI-In links.
> 
> Patch 1 adds HDMI_IN to SOF_LINK_ORDER. The HDMI-In DAI links are then
> created when SSP_MASK_HDMI_CAPTURE is set in board_quirk.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: Intel: skl_hda_dsp_generic: add HDMI IN DAI link support
      https://git.kernel.org/broonie/sound/c/37149fc6e150
[2/3] ASoC: Intel: skl_hda_dsp_generic: Limit HDMI ignore to playback FE
      https://git.kernel.org/broonie/sound/c/d6e074890461
[3/3] ASoC: Intel: sof_sdw: Limit HDMI ignore to playback FE
      https://git.kernel.org/broonie/sound/c/7f3bfbf471d7

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

