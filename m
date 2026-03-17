Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A9B357A4A;
	Tue, 17 Mar 2026 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767310; cv=none; b=qZ1l5eJ6ZSuHzsU9+gDlmk7iV6VI9WlT6lwZIl/2reB3BkyXk+MAjQxS0TIFGmvqlRDsutsrEIXBGFKzAKp6kjYnie6WmTx9aHJkGDW0PD1FIUe7Y+BF+SrxreFcuIbyXor8v/6ItWpY+W6G28pjAQ0965I20uMYew1Vw9mzhUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767310; c=relaxed/simple;
	bh=L1/GbGaZ0qQ3vxvzXuqjrwA4Xki8Lwf7XK1tN6ey8EU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RN3jKw2+BE6u9Xy716vwXYD+kziKPgXqtb8hW3bD8hBi15aFScO/vGLmf/gh89kc/q8kWMEEBmkxnaRhtBNp3dYwl3tKd6xACTn7uutXItBXOBhfIV9/apU3+jIX254PnpPCSTHlKRl2GKmMPegIifoBCkEbCJVmes3+MqEh/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNvx+INu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNvx+INu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E24DC2BC86;
	Tue, 17 Mar 2026 17:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773767310;
	bh=L1/GbGaZ0qQ3vxvzXuqjrwA4Xki8Lwf7XK1tN6ey8EU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CNvx+INufuxO5e+0g7Tq5Gfko3tW7JcIm8nyd0Xe8fBsYNjA2IExnIT3+drow3ej9
	 KDDh8x3kOqIdQ1ergXf3IoSBvoUpB+AkIjtdJ89dWDeajKZcNj22k1CQEpUqfi8KyR
	 a73yH2iFh4RLn1i6FCP0k7D4xJd2OL0ohkqZ3Wx6GTuXv+5OncTby0Q/JYycGkK+UX
	 K+MiBOzSrS0auKZIUlzdrClfVcDD1EPQ07NY1Sb3JeZQxZrfxmH+BTFgL0Ml4SVaV+
	 bmkYMbULDhFJn9pvXHbREtHFvfpDTziOLeqb14uIKCS9SjTcA5nbs1i7MLL9e2ywsO
	 t3qnjv7d/Ig6A==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, lgirdwood@gmail.com, 
 Vee Satayamas <vsatayamas@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 zhangheng@kylinos.cn
In-Reply-To: <20260315142511.66029-2-vsatayamas@gmail.com>
References: <20260315142511.66029-2-vsatayamas@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK
 BM1403CDA
Message-Id: <177375788428.93799.15531467600304219801.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 14:31:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=L1/GbGaZ0qQ3vxvzXuqjrwA4Xki8Lwf7XK1tN6ey8EU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuYqMOHxtV/wXmNMav9N652l2oWhvJLEHoIih3
 EP2YY+cgVWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabmKjAAKCRAk1otyXVSH
 0KspB/9FPxRFgmG8PNnIsFGJsoQ9ZDnQz5/AQ0d4jFa4FnI2Fkl9V8/orSrxedlpdXIfEv4JMYb
 UB7kBDLfEXurAeLFWbQwOa+NvhBapeEBIX/9Fd9iQssKMCYUgbcIN31dxPs1Q9hYQaSrdaNTBTT
 HgQkJGYfbaBjah68YRiOy0yT7Jk5SpYgwl4P5Nzx2Y4GLk4ZYbKu5zSpbV94Fuvv2iKmUMI8TPS
 orqhJra47Fu3FmEtrgnjybE4qHa/QDsLXPNWzBbd3/HoBpq+ytnjJ52XF/qSP9GFZnkXrgRIU5f
 E/wg5aAR019HehsBkivapfcywpJ0/PmL+ig8z8LZ1NhGMmHD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 15 Mar 2026 21:25:12 +0700, Vee Satayamas wrote:
> ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA
      https://git.kernel.org/broonie/sound/c/f200b2f9a810

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

