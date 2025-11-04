Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9DD322DD1
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262703; cv=none; b=CFt0R9RcmQJZScbjFwLSO2GBTj1wIo+/pMsigLTsye+MozBsD7HwBsq8gxE1IPFnS7+toFF/n6B+9givE7XYxIQQOPJTuos8HaI0kQFvv6dVDzVOJppq/Sxuy5NvA2RIqy0UgQHupHM6XeCUSwkFEhvoFPRu0zPDrRZ2A3xQQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262703; c=relaxed/simple;
	bh=yy62Yvv42g5uh0hNShHY0xLc2vNiEZ9Uwf7Om84UujU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cNcP/26Ihb2hFOMa1BcIGu+A7b7N/R8cLGrq0OIPOLTTfP7xopSX64iGL/kGMXq2FZ2ZG/QJOhLsT7oUAZYIXBTHV0b3rIR238E7ZT6U2QXbdrjWlJXzNOFt+VkRWVgleQDSNz4AJ5q0PXn1LE5KnCkHUFpuYQiw+YTYdxRVlAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVkWuotR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVkWuotR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A8BC16AAE;
	Tue,  4 Nov 2025 13:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762262703;
	bh=yy62Yvv42g5uh0hNShHY0xLc2vNiEZ9Uwf7Om84UujU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qVkWuotRBFIxOYNNipID68IfZnxVXxwxUE4uCuIVMd4Q4wNdb34CLbYVv23IB8alW
	 qgBhC6R9XMcuA2vOlPy6AYFt9E7ZcSASWz+eHSpJTZhkVhxCNaGTvXJXlWgb8eiwjz
	 geBPLT5sejZ73zmzVYWhfdh3frh6jvEMB/70nxs+oPxSp1jE/SruO5xE9sSSqQ+Qrr
	 FCnssBNTfk6I+x1vsNInHQ6wJVS9WQAf1ottF2jf4tRn+9CCCO+wCP8S5HiHEIpx+f
	 Fs43JtN++HkPizC1rXhZQ7T6L5Nh5PPyRDODuP5V/lT+XINXh26bbf4bKGtP1EnTeQ
	 wwxaJ6iHPFIhQ==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251103091648.771947-1-sharq0406@gmail.com>
References: <20251103091648.771947-1-sharq0406@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: max98090/91: adding the two virtual Mux
 widgets in the routes
Message-Id: <176226270172.2215600.10223697187359498687.b4-ty@kernel.org>
Date: Tue, 04 Nov 2025 13:25:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Mon, 03 Nov 2025 10:16:48 +0100, Sharique Mohammad wrote:
> The two virtual multiplexers are now part of the alsa routing.
> The "DMIC M1 Mux" now sits between the primary digital mics
> "DMICL"/"DMICR" and the virtual multiplexer "DMIC Mux". And
> "DMIC M2 Mux" sits between the secondary digital mics
> "DMIC2L"/"DMIC2R" and the audio out interfaces
> "AIFOUT2L"/"AIFOUT2R". This patch makes sure that the M1 and
> M2 mics can be switched On/Off independently, by default both
> will be enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: max98090/91: adding the two virtual Mux widgets in the routes
      commit: f47e782c45f8f0c3d7b84edd7e94bfce9eb00b64

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

