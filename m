Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618EF19E7F7
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827689; cv=none; b=WtJwUtKVepE+k7k+EDwNRWuA80F4VojrupsuCu0YfM3+AyqwNiRVE28JzSU8RoPuDZJfjgJsPOKau/IezmYt/K88pHsQhDSQ1zNOvQ36J8SOZgeK/oDYwbeg/lkGFTrQPihJ+qcVA6x1oQ78W94fW8Upw+RVV4KE6lkl4RTghY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827689; c=relaxed/simple;
	bh=kDB7somchZbPxWYbdhYvzLjlheKddYclnvYxzFEKFzI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fO8OnouiGVHYltv/twa7cffDo0AVC+h0M9SN2gA+vIRfup09rvGpEsO6g1hwJeBGluvfx3Wrpdsybr8ACiJ71gUzPi+YVb1f+/JhbrykieaI56Ar38kl8VZaifS7LxxnB7PDdR9xTt7P8U8l2sla17Y9eWtrl7L7C2AH3gAHgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsKxaTLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsKxaTLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5CEC4CEF1;
	Thu, 30 Oct 2025 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761827689;
	bh=kDB7somchZbPxWYbdhYvzLjlheKddYclnvYxzFEKFzI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IsKxaTLOBNO3WY+2FDl4ENv1o/DFefAoocPVtPwNlTUKcR2rzonIufpGDIKZ+Fh8u
	 H/fHRIUVpIr/XxcY5sc0TLAwKl8SqV16+wvI/C+M/if7wfCe/lfhyKZToYxmP66VmG
	 iJKKj8kVPfyUTK0vL3auium1Mgw1Rm93bwpJy9XMf1NIYvq2w32gphKVuF++j/ANxY
	 ShhT27QODXfZRi2AIJi4VCO4kaxJ9JD3BTStHB8fctNALomHMKx6O4R14+2+MxL7RU
	 IpvojI+nPxs6tVUDYFx7w6jHQvYlkfbUZkLJEWlzJW8k/UQ+s58gbCzmF2H3zmK8a8
	 7bCvcBqnvhWIg==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251029164134.4123618-1-sharq0406@gmail.com>
References: <20251029164134.4123618-1-sharq0406@gmail.com>
Subject: Re: [PATCH 1/1] ASoC: max98090/91: fixing the stream index
Message-Id: <176182768807.38616.12436935956497313906.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 12:34:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 29 Oct 2025 17:41:34 +0100, Sharique Mohammad wrote:
> The function SND_SOC_DAPM_AIF_OUT has its third parameter
> as stream index. The stream index is numbered from 0 to 3 for
> every output interface widget but with same stream name
> "HiFi Capture". So, if the stream name is same, the stream
> index cannot be different. Also for capture, there is only one
> stream "HiFi Capture", so only one stream index. Therefore,
> with this patch changed the stream index to 0 for all the output
> interface widgets with stream name "HiFi Capture".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98090/91: fixing the stream index
      commit: f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce

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

