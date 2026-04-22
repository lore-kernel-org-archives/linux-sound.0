Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A03F210A;
	Wed, 22 Apr 2026 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887895; cv=none; b=MHAJbLTWaNmqqXAjxCr0m15MCbeubvQ/VcjXZWvH/Eas9txhdbXNOt6+O3mjkzKAuaU7XpGfjrOhkOkdoLbd7CVF61KvA9Abwr0Cf9qqN7fG/x1WmGdjkbBoDI0gifdCnzVIQlC8GOlYEoMtLDYiI05fksFqZPRjyf21Jb3N8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887895; c=relaxed/simple;
	bh=LYvVyC78e037bReXvjd2uyLs7TRcgWQ1/dWq77r4RAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gVfOKM8URDEe0mXjiPC9sDRFXlYlgVd1CM5xdy2KoXRvuatFbJLjeTmNf4swyRWJ1wAAwPsNnLRHXCO4FzpYOu3/fLue/xUav4YvbjMhNpBnvtu4RSc0t8+iMPqmhfmeBu6Qx1kMRCpBsaqW7OV+2KSYuRAc+AZ/EmqpeP3cju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8cYEcyD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8cYEcyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC0BC2BCB4;
	Wed, 22 Apr 2026 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776887895;
	bh=LYvVyC78e037bReXvjd2uyLs7TRcgWQ1/dWq77r4RAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g8cYEcyDw3XK9v/hkWE5fkFprDngOjqLKILR7aBJsntj8be+BpBCgfp+wDdw1gGw/
	 ZzzpgpHDhZzVxGteBe5te6d2+N0CoowdIvyNX0l4g8VruJZ3Ol6cdfXTWqvs0pa0yU
	 CqDkCKTzrbj86XhCDsivAelw+IbzC9EVoAeZ7p85j2loZuNhyyXHPq6HAJTgwOmIFU
	 V/9rh0Zi0iBhXZ12mfrYy+kWHoHPxLrhz3SDe4KM+5LEEgVRJVkMzOXIkYn00Ekj05
	 X2N76q52T0sxO1Jyh6yDqfdS4GEgywFNFyCY5OfLH4IEQHyFjCNlhzyX2NskHpJiAi
	 7B31EzfpNWNDw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Tobias Heider <tobias.heider@canonical.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
In-Reply-To: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
References: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
Subject: Re: [PATCH v2] ASoC: qcom: x1e80100: limit speaker volumes
Message-Id: <177686906300.36226.17703920373519139645.b4-ty@b4>
Date: Wed, 22 Apr 2026 15:44:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LYvVyC78e037bReXvjd2uyLs7TRcgWQ1/dWq77r4RAo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6ShUWhI1AJ83zS9iBN4pHlmu+JdKtsuaG9pHI
 tTcKr9OnbuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaekoVAAKCRAk1otyXVSH
 0OroB/4+Q3Vw7LVxInAw6tWH+HL4hvWbHD6S6ULRbm5T6R1Nkbbj1BNxLJToCaqTVVAjkzU7zV7
 FOpjSLk/Bhpf+nRd4ZgLC2xf2VeGnikvlmpJw4wPF8P3IoEXY7iERGN1xWZjNV8hTLDobqJssA8
 7hFm2G1Eyncs/JZvWaVnEGyqFhG//zq1yWfZkfNUlRqew7TZjgST57Cza9+dxYevKG/6Eh5tLr6
 oti2Z/U7vM0lKx6/IzZi9y70BFrt34+B31zw5B2Te4VRlcAweYWWEmubLVIC5NfjCLwBSVGYz8l
 c9S3gOlgy6V8wfSKWw/7HOEfjHZCWkQ8TxDQZaH97g8zbE3T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 22 Apr 2026 15:30:59 +0200, Tobias Heider wrote:
> ASoC: qcom: x1e80100: limit speaker volumes

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: qcom: x1e80100: limit speaker volumes
      https://git.kernel.org/broonie/sound/c/0a5ee0e520ef

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

