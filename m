Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5112F49EB;
	Wed, 18 Feb 2026 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771457688; cv=none; b=ngL9Py1G+LABEM3pVCEdqUkLSKde3NuPAFLCHGvnzmYXTGjJPsXicFxIeX6sL7IwcYPUckQYctrKXF18QGM/sJpV2LKIDZtOz9UeFzHmDJitkwZe4qBg99DbkZf+PzW0v1ph6d0D9Dl/rbKKB0S8I9z1uh9iCZYVO439AFHcHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771457688; c=relaxed/simple;
	bh=tZ80juMdw/uefTvy0uIX6JFC/KOlaT93tA+XqCxCHs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UXQcsgP6AGbRKTz7oDgerG0j5j74rlR8FvjXzb2nZf4DV5aDuKZT3v1y3e4AIdyVeOz6gMy79TZpepTUFReiOdo2iexK/PcRNGjWUuHfVgNucNdPCoRIy1NSOPzRnEhYbZWxkMXOggbGUxRuM4gjybBGgnZOnaZf4+psHES1Yns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIg/lp5a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIg/lp5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C5AC116D0;
	Wed, 18 Feb 2026 23:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771457687;
	bh=tZ80juMdw/uefTvy0uIX6JFC/KOlaT93tA+XqCxCHs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SIg/lp5aQ4Dvg2IbkEJXh29eoTYow4mH7XVbX9PQTmPcCaQfbzNNCKKmZDSjrUDbw
	 ybOl5MGTumOtd6XJM2E7qicRJSL0Sgrh/ql8z1ueSQMGtHeuwkvAjp24nXM+mNP+ai
	 s+giWf3hRQ4XAq9Z9ywUVeW4EBkQTGH2SZ9t6x73yhIJ8+bGuVO3CsT83itA7yXszv
	 4S8LwLAAegm7G+geeAjrZ4SQ3i4brZroTFJ/+tgm52GkGLxfige0QzBu2OjZk+avUi
	 0St9CE6BfGjBq/MhSjZnw3xYo30I9dUorPjBw5KDsRX7Hub5sNDwao9KwXdPQ+MhFt
	 /j13fI48Xwmgw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
References: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] ASoC: amd: add ACPI mach entries and quirk
Message-Id: <177145768554.2257280.17103760824582405342.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 23:34:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 18 Feb 2026 16:15:32 +0530, Vijendar Mukunda wrote:
> Add ACPI mach entries for ACP7.0 platform for RT1320 + RT722 combination
> and include machine driver quirk for Lenovo laptops.
> 
> Vijendar Mukunda (2):
>   ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
>   ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
      commit: 7869f1c1123cfc0fb22a9de96cc6eb75072a3971
[2/2] ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
      commit: 3acf517e1ae05ef66561b7a2782690387ce46e21

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

