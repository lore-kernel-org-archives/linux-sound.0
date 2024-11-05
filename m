Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131E1D5AB9
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730830518; cv=none; b=hpv4Xte6caSx+gpSSeC33wCcmnn6bk8AmM3fjiz1/o8CjLAaEoopSVKWhKEH1M+mjls4/3ZSafwbcxHqqeuRgV911Eji06Vz7BPZUKrPsmZ7V9OjnVLLn/k9KTvv7/En1zUAFnZANWM7TJUVAivcluaN1Rudq18kx+6/cPQ9Y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730830518; c=relaxed/simple;
	bh=grEi+i3IVOuMk28z/8feWMuuv3yuMPXT4DGNRt/tf3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GCJDNMwrVpz6qy8TSoETQY7KZDT/aArkY+FdAN/F5DBFlTqIRhWFdSvwVxuSub5cV/g6pYFnh8aLHU1oeuj0+FKCWybRYpzxLY8Wm5+QyPDK3fpyV1OCqWMSb0l8NoYtAcsXc1O46OEDuQp29wdinb14iOJHBBVmBd2r54DckFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPtvXS93; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPtvXS93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01268C4CED1;
	Tue,  5 Nov 2024 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830518;
	bh=grEi+i3IVOuMk28z/8feWMuuv3yuMPXT4DGNRt/tf3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QPtvXS93705d0b8Ib0f3uXTzG2gOa2Q8Jp4kx+D02pqJ35xgiPf2+VQFEFTVSdIDx
	 dqc24g9ZcXVi7DxYyS9Fp3o9qUUFdjVcL5ZWleGlGWreGwiCkzNyIlQC8k/SwUJT+D
	 Ik7hLb6hjmP4O04V2jzI1t3/u+HNS3rmKL4DYrZFvmG0LpnhJ1o7sOplI353fBLcdx
	 OFKOP591YKT4iAIcRYDShFrB1yRlJrye/tbwX6SgsTduN5fJpHQgX5wceY5vHxvKXM
	 ZUrbSEcKxRQno312Fx4vnqRzvPVhH73auAynWTRdLzgZHgcu0RKF/0Ti+KWp1snXqe
	 mz/a/gYxDJTJw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 Vijendar.Mukunda@amd.com
In-Reply-To: <20241105100557.1987917-1-shumingf@realtek.com>
References: <20241105100557.1987917-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: change the interrupt mask for jack type
 detection
Message-Id: <173083051565.94172.2123619464199228337.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 18:15:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 05 Nov 2024 18:05:57 +0800, shumingf@realtek.com wrote:
> This patch changed the interrupt mask from XU to GE.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722: change the interrupt mask for jack type detection
      commit: 93b763a5ab13509e9a2bcbcac3002607736e601b

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

