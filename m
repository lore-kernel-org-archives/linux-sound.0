Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6202676E2
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104281; cv=none; b=tyggpd6GXV7zflTnd/8VbL31hvrMGOlH0muPF7p82+lHGRR9KfuQFx+WRbUg+WG8PFrmpUrw/q+GOnZG/P0HjVpYvJHpwClpiH89eu/vKB730AgZvUWZQnoGTi31YlDQzK43sIfn78v9JA7tIBnRG4gqjOkhC5o/UKyn19Jco5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104281; c=relaxed/simple;
	bh=75WZBBYE7KtUGdqPqLm/Xn5S1WpRfYFtFsxyF3Qeb0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OqaFkTAusUoPj6MoXWiSWHn6jnIDDItd0cu+jZvVZBLvO5QZOOh6En/z4c/3SJaEsJ55103vqkLaQYCQdkiedqRXQc+R1fZxZ5CyOpoES6bJ0H4eMepMEr5HK65LvIRdfVUjJixa2qEmx35Gdz+EkcMNQVmfQTS6jNET72ZSy44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFQs0Ilj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFQs0Ilj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8EDC4CEE5;
	Tue,  8 Apr 2025 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104281;
	bh=75WZBBYE7KtUGdqPqLm/Xn5S1WpRfYFtFsxyF3Qeb0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fFQs0IljTG2w/Rq+wM8Do0Tob9ZnrhpDaUlUtTe/7eRwZOxxNM6FlKcBr4zjT7nOl
	 ntZhOBka4Du+fdx8ZJtqa4kmdfI47pID50KQuuDBbarb35fG9iHOu2Rf1dz5UeeMB+
	 vqkwsuBeWtbP3UAgBneOx0OAx5RveoXSt5HgI/F6tgmhhSLcUa1xiEvw1bUdJIECyy
	 g69zBSdb5u9UNMT0duLN/lXHmcwcg/OIx4sWo1yXKNuxOq+6tslEZWPqE50Ol1EMnK
	 9rEjStxV7UmGVckXeGHPMBX6QaIJgao8Z8qHsTEHvUerrziSSBmp4YHOJAB3EkgnRy
	 gpAj4X4tkPhYw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250407130851.1726800-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407130851.1726800-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Constrain path based on BE
 capabilities
Message-Id: <174410428004.1933566.10359393820973678434.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 15:08:51 +0200, Amadeusz Sławiński wrote:
> For i2s and DMIC copiers constraint stream capabilities based on
> available NHLT configuration. This allows topology to provide generic
> configuration that handles more hardware, while filtering unavailable
> ones at runtime.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Constrain path based on BE capabilities
      commit: f2f847461fb7620e299be873cdd9437ddecd2266

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

