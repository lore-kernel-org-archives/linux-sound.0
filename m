Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662C282E1;
	Tue,  2 Jul 2024 20:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719951700; cv=none; b=u2vO9KDfTMMwxlg9fq0QP/EZoNIpFJx9o7kEukr5+3ZR4RngBGbaxmN1cn7ge6ysPMhQKAM2rCHdegsPTx0IDF7VLprrqi1+ZWfrbe7u3Vavr4zbgXANizKBHn8aQjotqkXO33cF87Q+NuCQhpZlZ/YFLzoJeKDZJVpS8nqUKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719951700; c=relaxed/simple;
	bh=kWqtMEy8NiJo/fu7ZdT4UQqXiPF3djtgdRsFAOR4Afw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fUb14UNnlOE0KlBB5TMFzISTMl575eHDz3+QNpfVOR/H4S2j+GvaxFmqA7Qdxz+jzs5MS7Kxr9UgAth1BYWGE6DLYvNfOQBUGlrKSO3VKtjrrto0xEdjity1f4mVaWawMP0nh7aoqnUMvJgo2ZrVE+s3r8woa0PJC7mrQ+fy+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxJ3aaQY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxJ3aaQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3729DC116B1;
	Tue,  2 Jul 2024 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719951699;
	bh=kWqtMEy8NiJo/fu7ZdT4UQqXiPF3djtgdRsFAOR4Afw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WxJ3aaQYCW2CjCLULVLN3y/0y1IH09ffW3+est+9t4CZRMV+EfMZvWc8wlYtz4JuV
	 hYh4NgAXuQ1U42MSr1yLcMSp30HZjb3Bn/UAR0o0Tx8CBWLNRRYB5cKisCgg4o0T1q
	 nM1lbb3XXo/6e0nEc9kS/6fxg/gHGaD78D/VFuwiQD6xSlfb50nd/KdprE9PGBXPyl
	 pXr0LmLwyTENAGWhF7KdLOoIaLyIOD6AbXne7aNsqGEybvFWwxiwCXv+lv3CH1r5cg
	 1rP9nZBkevXAHt/yZTanoskdLWZkfi8+bdLYizda6kG+Gaeky1C227ERqEv9YIAENp
	 H5xof790cPFtg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, John Hsu <KCHSU0@nuvoton.com>, 
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org
In-Reply-To: <20240701211631.92384-1-fido_max@inbox.ru>
References: <20240701211631.92384-1-fido_max@inbox.ru>
Subject: Re: [PATCH v3 0/2] Add master clock handling for nau8824
Message-Id: <171995169693.1021506.3631768688604058732.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 21:21:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 02 Jul 2024 00:16:20 +0300, Maxim Kochetkov wrote:
> nau8824 has external MCLK pin. So add enable/disable external clock
> management.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: nau8824: Add master clock handling
      commit: fcad7177eb7854ce244ce863c82583d8a6ce5952
[2/2] ASoC: codecs: nau8824: Add master clock handling
      commit: 1d3724c92dc20584f76033347384b8c1536480af

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

