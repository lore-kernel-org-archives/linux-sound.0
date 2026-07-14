Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DBE448D0A;
	Wed, 15 Jul 2026 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115344; cv=none; b=PuNHsVdTqgu5yN0f2NVaNbC732W+cKMMwRdz6A81Wm+yHGJ8ZWQYuyULvrevESi0rK70AkWUJpy61hlqEh0Yg4XQ6xF4GnsNo1qxfR/3OPYHddA5OEmnJRUoDOgbVqWUbBGyUtnF83qQu3GzDg9HHI9wiABS8S8odKBobxj5Hds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115344; c=relaxed/simple;
	bh=M4+NxqNZfbQTBeyvKalURYiuzMPloSTztizm9El8yuY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s7O9l3EI3yhwL13y4ial+2RD/vl71RJmmJSW54OpwtxYwWuOhF7INTaxMyfsnP698qWHaGCMlRa9AqvywTvWWZ2f6VzneyemtlKh7iTiJw+vOUMnPT1gecVVNdhUsfuJsm74iykTLkbfuJnz9HJXbVQsOSF0FnrRM1fOkk9/XMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFfJOz1T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFfJOz1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC2C1F00A3D;
	Wed, 15 Jul 2026 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115341;
	bh=T3D8ifGYFEo4NmjtYHRiQFnGgbf6q1ZbaZ0G4hLZcIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TFfJOz1TAluqaYd4FLqanNq60dkkqE99kwKFzsaY6Lj2q7Y56uPhQr38N2VjAu2j0
	 3TJWVKwJBEIWJFW5hrMOYossNZPqplL6uMdim8ULKdeKPU8CqGeSpoxHIGoD5hqYEm
	 v3Iver6BMVA8ca3l43ujwcvlBxS9TvZ+2NsnLCNLkY68Nx/fmAelM18cg1JWmvB7yo
	 Nak+FsLS+YLFN6jj2UOrVU0VDkk/bow3oHlc5nyFZcfyrVyNeCJqHNDooiuJ0uvqcX
	 kdOzOhxPmdPe65pO1zUJtMDQfV7gRLKjqy8DJGSM3dcK1W1VkKfQK/csj2qaRNfNF+
	 /8l9nmqOnGTxw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, lgirdwood@gmail.com, 
 Antonio Ignacio Campos Ruiz <acamposruiz@gmail.com>
Cc: venkataprasad.potturu@amd.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260713165709.19489-1-acamposruiz@gmail.com>
References: <20260713165709.19489-1-acamposruiz@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Vector A16 HX
 A8WIG
Message-Id: <178406443523.7661.13454665592348447601.b4-ty@b4>
Date: Tue, 14 Jul 2026 22:27:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M4+NxqNZfbQTBeyvKalURYiuzMPloSTztizm9El8yuY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV3CKrqtxJH/lplZecIKPFGgM35MflTq3Vme9H
 jo6aAU1vBKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaldwigAKCRAk1otyXVSH
 0A8kB/0TdXgqY541gNm2t3XGR2slkF/GZ9+TSq9lYe8VcH4rBYFa9G9XlwYHeCoAaeuqxtF4S10
 aLk5iPseDmzfILWiZUtietaJvPVZ123TecDo0Tu/ofqczJjYsB4hf+nb/EZdbtxv9uWVTB8azfU
 owgzk5C8GEjQFIsLAnUDtRv7GDjZX4cJcHvwpyM+7EpNij+72Lj5tlHHr+8JuRp0oct01QEuxe1
 J7hNjbvupqut/k0QhmtKap05qwfetptfExuPoKXS4QrYjP552xN5v3GA/+NIwDGpIBcQpiM8v77
 nkITtmEf48LwNaS6zmIT4sfsp/ujLj8MX+tifAyE94t3IpEe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 18:57:09 +0200, Antonio Ignacio Campos Ruiz wrote:
> ASoC: amd: yc: Add DMI quirk for MSI Vector A16 HX A8WIG

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for MSI Vector A16 HX A8WIG
      https://git.kernel.org/broonie/sound/c/d39e4e27962a

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

