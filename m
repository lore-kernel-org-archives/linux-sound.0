Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A373F9F20;
	Thu, 12 Mar 2026 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336885; cv=none; b=QRcrpL5jkhKPTjFavhPKWSvkDMrLA9YCy0q0y+jdKcBSplc+eXJzJeb5tgVhN/MnymSynKBU7wjrI2pbL7cCNuhX7twuUh6p32AXZ/jieqK755wOeCOOz5XAY73wEDmDZ5UgFlFjVQ+b1ZUj70U2qM7DE/tAhqgAozgW3Q6vqUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336885; c=relaxed/simple;
	bh=MUa7DRBVFoO81wEfsHpcvITgOYtf8fWifxP9N3J/Fz8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hM3IZXdCTNEJoYbZnDg5pARkfT87mqq9tiOMo/S0/Icc4hr8dFTFuMuutmfO8AlXgFBUqkmpCJWb2LWL73luNGbJOqQipS2+qfZiTo1d1SF7aFSUlNpXXwkl57Bs8+8ktNjb3n8McavUSp1qhC2R9WcfE2AgozP/fjxtB9uwDKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObhSNXY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObhSNXY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22EAC116C6;
	Thu, 12 Mar 2026 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336884;
	bh=MUa7DRBVFoO81wEfsHpcvITgOYtf8fWifxP9N3J/Fz8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ObhSNXY8ZVDNmsPYN0pGf8KKgIgZPobeEzg5JVcu0+cUhAeCiDtHv9RhUfktm0MRK
	 zETgf42oZUi/dB7EDm7wavQr1rxs0kw0mNjzd0Qy+K0IezrhNQV4pyXmBpfgYFym1b
	 N6TB5M4xx+fOYXocsr+/n59LYfyqkwhYvsyglXfPWFVpKH5E2Z81gtX85sCylbtSK9
	 9S2U0XkLkL+Y0356qx+JUC/mRm102YiikBJbkmFYWpEs+bevexkP/wI8PMVzvLwvYu
	 HzXLvjwNKGy5HfNcXCGwan5gU9Q/XkGgqxRFX9MKPBIti3P5iwMN0yZKn12QyNQd/q
	 OOO/Hb/UBiHIg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 0/3] ASoC: fsl: add bitcount and timestamp controls
Message-Id: <177333688260.302961.12179311060278151580.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Mon, 09 Mar 2026 16:35:27 +0800, Shengjiu Wang wrote:
> The SAI and XCVR have the timestamp counters and bit counters, which can
> be used by software to track the progress of the transmitter and receiver.
> They can also be used to calculate the relative frequency of the bit clock
> against the bus interface clock.
> 
> changes in v5:
> - use EXPORT_SYMBOL_GPL to replace EXPORT_SYMBOL in patch 1/3
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
      commit: 819cf1dc01ce66b6906d403a6925c4bd754a7a1d
[2/3] ASoC: fsl_sai: add bitcount and timestamp controls
      commit: 8e27987a208029c39da7a787bd9f1217d42011a5
[3/3] ASoC: fsl_xcvr: add bitcount and timestamp controls
      commit: 7b3f8db159f710d432c4edc024fcefa9e62e8b4b

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

