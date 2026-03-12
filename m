Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4E3FE346;
	Thu, 12 Mar 2026 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336882; cv=none; b=fsTXKYlcQwXPALfYGeKJA1SYl2EhdVkG5TIyIcQ+PhH6mXP8hgMbJ5+P3cxx79XGpYS5PF+SUNe1p+iRVsYUJmG9f8RJXeUF1DLzhepxA5pxjGwBM2N/DMEKeDbm5MasFFd/BZFfkwSoDYv6HvvLos79G6MAIODzr8whrqmbm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336882; c=relaxed/simple;
	bh=zw3cr2qq6lr+v/dNp9FkVhjLNPzy9fxCO/01+wJ2BN0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wm9Mb/YUD5qrgvDt8Co70OR/tqZ2xicXz6KCFDq1KMFe4hWK/F653GEQIEWK+Ki1WtgrczJpkM3Hr9JBzpgMj4YS5jbyuqY6QfEqvQEvrNGN/nCldNIIupYdvgULBQ23T0maRnvnwPg5Ggt7apen5sGCauoWJ5lZxdWaTtht5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBqmO1JV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBqmO1JV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C54C2BC86;
	Thu, 12 Mar 2026 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336882;
	bh=zw3cr2qq6lr+v/dNp9FkVhjLNPzy9fxCO/01+wJ2BN0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JBqmO1JVA8JLh9PSlomi9mqjECeo1WXNyxh5CeQOyXTW+OuQIhaaKH1QZzEcRFXDM
	 fOyNaOZRjz7f85yKASxIp97RuHQpGXCV6jZYGyXpVctt+cBuexoaF4ylI40uJCq4K2
	 2IbWLtMpRLJ00GW2RfuRhkkgg4qW+I2CsXSwVbD7uYZErjIxEO7sE5HMFW5uzj1xcw
	 wKUHoDQ45H/SZcaL8eMnSJmL9uvvqM2Un20stylDSbtyy5Fsq9lwHTH49Vkal31ZD1
	 d4uZxU2O7HvaiLaO2PchWA4Dw9gHrRbOJYgPDO5ZifinnFYQOuX2lPD0iaK3iXe/bM
	 K44hjdE226UPA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/3] ASoC: fsl: add bitcount and timestamp controls
Message-Id: <177333688010.302961.9163999310224372779.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Thu, 05 Mar 2026 11:10:28 +0800, Shengjiu Wang wrote:
> The SAI and XCVR have the timestamp counters and bit counters, which can
> be used by software to track the progress of the transmitter and receiver.
> They can also be used to calculate the relative frequency of the bit clock
> against the bus interface clock.
> 
> changes in v3:
> - define own functions which check the pm status before accessing the
>   registers to avoid -EBUSY error reported by mixer-test.
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

