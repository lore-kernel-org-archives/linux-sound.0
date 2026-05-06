Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B22309B2;
	Wed,  6 May 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778033898; cv=none; b=gYYrjzrE+oChUBlIe0jJnArpaCgtNzv5uwEIBdtTOM5IaS/B2rO1aZIVh8TfsMdtMPxZoe/Cvv+sD2vUMUlc4eeR3iJup4m+1dY3JjppXZph/ZlorKH4j4IegnW7PTOininw/JiKUlQ8Dw3aa3nnTcjW7iUO726uhZxfm8wy4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778033898; c=relaxed/simple;
	bh=/BUeKby9HrSvnC/DI73fBv/e97Hh8vv7v1odygQmeP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ALrKeNmzj6/Htev+k2q+W0BgerZyixdJN8FpDoxfXbAyNyNYlteex+Ha+3FWSda2smAS9BpeZEf2ro4q4XFgBnRR1tIC3D7OUe7nMetYHhgV9ZRc2s3L1FyvgV2uy8QUU0O9TJi4WGN8GsVorWPe6zrm1K3nxRGP1q99hb5F9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGVmOFE/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGVmOFE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AC2C2BCB4;
	Wed,  6 May 2026 02:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778033897;
	bh=/BUeKby9HrSvnC/DI73fBv/e97Hh8vv7v1odygQmeP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MGVmOFE/T0fF0JU6CFnaem6tgwBF9KnDv0wo2Agoo/U1/CfuFVs5eyN4Ks//hwFlM
	 NmjkdPkaGuo3hN6TYmPlueJHywcS8WB3Y8WgcltqMUIdCpEG3m7rGtewESHA/709uR
	 kFQGzVSIqG6iSe6tAvJ7yL1dLUI8610rZ2Q4eaawJacSrDDaalKfZo6WHC60zzO653
	 IpnsaxH5np7RHHrTYIowgBgSfZ0bKk11KqJjSMrTtq2vHOjuoKmDo+JdH5VfFdyROp
	 2ftolMn4005mneMpXFAgg1QUd7GQuh/nITeezN84ZJ/866LT8GFSV/ri6kuDCP84nJ
	 iXZy1vG1bqfjA==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20260505202426.3605262-1-arnd@kernel.org>
References: <20260505202426.3605262-1-arnd@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: arm: pxa2xx: remove platform_data
 processing
Message-Id: <177803009191.624351.5653730061827031618.b4-ty@b4>
Date: Wed, 06 May 2026 10:14:51 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/BUeKby9HrSvnC/DI73fBv/e97Hh8vv7v1odygQmeP0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+qTmflKyAsubsN/r34pV30CXazF6lWmCjlHfE
 IowXLYjs+OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafqk5gAKCRAk1otyXVSH
 0MFoB/4z65jLhEKYlogMEf8pR57loHH9Qz0yebDm/8IxYKZUUcgOI4pqSoP1doQ9M5STENh68w4
 Ir7Q1QaYHBW64ch/g6jy+S/x/GCeHLLaxEOvpleM2KmhxFTgXcT8GWTSuAildRZnh/Y4vRkjSeu
 Hcan+5vA22Fym2NcqqAlRvABAIE6CyuiVX5XGMI1HegZ+wAMtje3Im+60sfV5M9wsGEtVLFE6+m
 LgtR/L4d9WWzCYe+j7g3yn4ffUMGZUMh3ZjJPj0unsBOOm0ncd+NjuKbFtBBY6sTaTTc/CjRBgo
 rXVIh9TTbYTaBQrR0TCgufHE/+9HG7s0gBh0ktClsWUatlno
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 22:24:24 +0200, Arnd Bergmann wrote:
> ASoC: arm: pxa2xx: remove platform_data processing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: arm: pxa2xx: remove platform_data processing
      https://git.kernel.org/broonie/sound/c/087623676248
[2/3] ASoC: pxa2xx: push gpio usage into arch code
      https://git.kernel.org/broonie/sound/c/a11fbb793ab4
[3/3] ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
      https://git.kernel.org/broonie/sound/c/42f67e1d1cba

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

