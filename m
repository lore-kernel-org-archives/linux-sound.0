Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5E2FFF82;
	Mon, 26 Jan 2026 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465408; cv=none; b=Q75dCu1RmewwEA5yJ+TxeFSemIvBlBFcDl31md6svXk921ralA7Bul8NLGBstV8rfuuOOB6+o3rCVAEDK4xEdpG4o1BOsBBkb2BZtwYe1ixOXYUp7CUqZsI3h0+DzW0UkC9uBR/RVJzS4Nvw4ahSfDOIYeps7Qy+AKIvh8tTj1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465408; c=relaxed/simple;
	bh=qnvggHq1uTjpdaECseoeehPvBz7KdXXMNasncpKCanw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ol0FLtJSdig3cJtScYHYHtRbJG4LtJ5DiEZ5H/SWSe/TiZj0s2ev0TW3ei15RbFSwB7n8FmiU/m3b1XF7dD4DSNWEYeah2n3enbrPVqT0IvdGNr2Cn5jjk+i/hQKytIL0F0qv1eykjKUiLUZiger/5JhQO2f77saCHffSGYATyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V46R0lxr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V46R0lxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943E5C116C6;
	Mon, 26 Jan 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465408;
	bh=qnvggHq1uTjpdaECseoeehPvBz7KdXXMNasncpKCanw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V46R0lxrdhAKYOwhJvuBvCx9eWMRFyHaqPTY8uXKeBfDXxfFqUJ2tfPF+Bvt8876w
	 vGDLAZOIziyOZWB3x0fq68V6mAxT2j1cvT/Va+dhzauykUz8LWeZT7mMygIC11f6W5
	 lsxQ98/WUcbFFEzmsASRA/NIOpb2ZdSd6vrn6ZK7rCrZud9TEaiLum5bB22xpWQ169
	 4x41VjpwSav71HJ6nXLTJfdkrJ4CiqijBbk9hBSs/JTaP+83euGv/KTwhXf7ek7YbE
	 ddURzqqZ6D4leOnqJMQVlK7WPzj6iPswEAwNfyWFwfCK3FPFdJCTHOjl3OBtm3fTTQ
	 wUZitrXNdaf/w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Zhang Heng <zhangheng@kylinos.cn>
Cc: alex.andries.aa@gmail.com, syed.sabakareem@amd.com, keenplify@gmail.com, 
 santesegabriel@gmail.com, talhah.peerbhai@gmail.com, 
 elantsew.andrew@gmail.com, queler@gmail.com, ravenblack@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260126014952.3674450-1-zhangheng@kylinos.cn>
References: <20260126014952.3674450-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer TravelMate
 P216-41-TCO
Message-Id: <176946540533.976880.6607426181042008067.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 22:10:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 26 Jan 2026 09:49:52 +0800, Zhang Heng wrote:
> Add a DMI quirk for the Acer TravelMate P216-41-TCO fixing the
> issue where the internal microphone was not detected.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO
      commit: 9502b7df5a3c7e174f74f20324ac1fe781fc5c2d

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

