Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8715EFB8
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723153617; cv=none; b=AAfvGWJ/5lvVG37vxEJguTyMfaRTZJVexJ9mAL8bxNDiaDIgffQ2jY95i1WN9elvSSemJG5smuVqmuqxv5bz15hnUPtagwDBRUWSaCNr9fDvfXAF41x1BSQTi4KHxW6vHpzdOqMn0ihUSHRi0Dyo/+q7BY1G0gPPxFjrJGo7988=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723153617; c=relaxed/simple;
	bh=BhVaztnW/S7Im7LbFReUE6Rr/BpMPr9gX9+KMfXFG/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rj+UMumZ0G8FGqPozaguxtjUeaRgyvDK32BHZA7QitKqDIUDE6nKo90mjlge0lYuAfZ7iXWEL5PSi/bSmdb4RylPW+DA8hG2gEcdYbFTa2UosdtQabFT40iCOlTE30sW4G5o6YDOAQp9aKIyjnY6dUNlS5+KH7Frdi7AYBhEZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/EYesnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/EYesnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32AAC32782;
	Thu,  8 Aug 2024 21:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153617;
	bh=BhVaztnW/S7Im7LbFReUE6Rr/BpMPr9gX9+KMfXFG/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W/EYesnvWYZbyJByrE+rK/ivwcQsXH/gkU/QssNSwDxHRxz4GFkP8Npzk5oORiT/m
	 p5pt13U1gwpdCgEnDw7n++jhfQLkCN2Oju1o7jxY5zvaBt7omo/c59zACU5l8Tmpiz
	 +B5h5qM0+3IzKf6ZESQoC79aIderWtl+dHXuZ2ofwJvxUSuhbQrTSBSWLKMMw60MTf
	 1Bl6eUXYdEv1V73/94MQHAyRyn3rkspixTEGXf9FHQ+UFY4q/m8EvMlkF+DatIg+n8
	 9BNSZh85P8k4Bn91zZ/+ujIVTdRF8pdoCL3xvYYsKk5byXSzLgOKOUD+lffxCpkiYM
	 8hu6+4x2PQRCQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240807170249.16490-1-tiwai@suse.de>
References: <20240807170249.16490-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk entry for OMEN by HP Gaming
 Laptop 16-n0xxx
Message-Id: <172315361627.480667.6274977955944517576.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:46:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 07 Aug 2024 19:02:27 +0200, Takashi Iwai wrote:
> Fix the missing mic on OMEN by HP Gaming Laptop 16-n0xxx by adding the
> quirk entry with the board ID 8A44.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk entry for OMEN by HP Gaming Laptop 16-n0xxx
      commit: 6675e76a5c441b52b1b983ebb714122087020ebe

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

