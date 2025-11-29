Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2CA1DB34C;
	Sat, 29 Nov 2025 01:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764380499; cv=none; b=XBa5mh5CGkAi7AisJjEyWX1JBM69VuWgQyZptGxYRSSGXSYBi74gmDO4fAqqSqgd/JMSa1aVRImE+v0jF6WMmFdYZuIhI/2cvxUHQX8nY/fehSDIhU2eXc7N1kkyFJh+lTa/1yZeDgjYdQ2DPOFVYSJGvWEykzim70PERtHgEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764380499; c=relaxed/simple;
	bh=F6ydmhHRnS3CBFKpni1UffTbIjbx91Myrpg0VTYpT2w=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WszUIHHRBrNmPP9I8l/udEUM32q+/tQEWn3SnWsOgWMQF2D+YBp4tIcglQx4JDqTewks/Wq0SX9+CETs5QIrFXCQYK+qRTrbbMHfAuagK2H6Y+vXMUWJ3PG+J7UcunE0/30c/aKDZYXLTPskIiQqL78/r7iG10Q3GFP4mb9qgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2yZyvLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2yZyvLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE115C4CEF1;
	Sat, 29 Nov 2025 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764380498;
	bh=F6ydmhHRnS3CBFKpni1UffTbIjbx91Myrpg0VTYpT2w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=X2yZyvLUofmXzWgkfBYUqrVF95bWbOJi1wLbfL/YJcmme5SjHZxECR6jqViyUFwvn
	 09DL3FvUMN7TLOxu5WKtp7cd5fKYIGdmVwDhgZKRL6EuLwc50vEHkYtStl1dA4JA7b
	 Y/2uKEQO5fiR6eW/fqD8ozjBRnIVkdlR62TWAL+fzBIu7WlY/Lwqsvf5I2laDpGy/6
	 lCQOmjsbVa2rORs6Aba27e/od9u1/rMD6uYJY75l0pV5yhKm+Qykpobe+cm8Px0yLm
	 miyzlavkeIRg/PywLakr0adoOlerkiEnjDXSaKODel/ihHJ1kfvpugoMwZ9EYv/gGv
	 iB91/xAO54qag==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20251127022652.674574-1-chancel.liu@nxp.com>
References: <20251127022652.674574-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: fsl_micfil: Set default quality and
 channel range control
Message-Id: <176438049657.294473.18267302643868268995.b4-ty@kernel.org>
Date: Sat, 29 Nov 2025 01:41:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 27 Nov 2025 11:26:50 +0900, Chancel Liu wrote:
> Add default quality for different platforms.
> Set channel range control.
> 
> changes in v2
> - use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
> 
> Chancel Liu (2):
>   ASoC: fsl_micfil: Add default quality for different platforms
>   ASoC: fsl_micfil: Set channel range control
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add default quality for different platforms
      commit: e04aab96b3776634ab37ddce6d50a431126edec3
[2/2] ASoC: fsl_micfil: Set channel range control
      commit: ef1a7e02fdb7526e8d7c75e744f1f5b2acd7100b

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

