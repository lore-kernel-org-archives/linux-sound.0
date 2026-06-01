Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9A3D3D06
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402079; cv=none; b=c12okYuCJsg/je7LkYZsUwzswsbFXCoDp/H4a+88cy/jOp6+o7+9VFws3M4vJeUiPq3RuIJ+vw5zA9WqjIIEClMRgyvi9MP1qY6UzYNx4wpgOQJ0yEnlWEuL05R/7L6Y++n59DaaWGBUJRRicLlCS7IpkDMu8crqavI68F8C8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402079; c=relaxed/simple;
	bh=NqhPjva4plXrBGv1+P3BU1wj4ibyGN5tmsGjjoYnrZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rme/n/ZDEsj7fuDrDbcZqMJ/Eq4d0zpRXYJVTxGpSI4MRzhohQTJJRKL/ItIjIp+NzdWRQbQAwm/0bX9FlZ709P7hYDmQ9ca6yubzQeqg4JHT4zKxivJp0j3+qrzoAWULNtEMs0aSXpFndL6v5CkIETnfZR2++FNowX2rFFq3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+ThXPpw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+ThXPpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB1F1F00893;
	Tue,  2 Jun 2026 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402078;
	bh=P0lFbFU0XWdzpU4GbFxl6xiHqPxwRpsjqXICjIpUkwM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O+ThXPpwfekc7vXd6ULUMTll/x/DeanBofLBBPNZltrzXdJZALjbAbfXvMZvfbzV2
	 D2hhRIW1OCgHdyrADW0OpyxLUwwFU4X4UVatqp28dbwRAo8SiafX9NNtbdySxLdvP4
	 juKPRhB0V2NnpwI4YwGbP8IYOuVrVe9M3luSdDrf0qkcF7pYlAHID1B2Z7Zz1z/ir3
	 qiE5oX1M3AgkOHjqfNCLyB+eIHjHDuaaJ4R3BFz9IOnFtBJe9LZ+0GQYc1UVY62GFB
	 GvdZhSbMI7136v1A1rMbXMwD0fl9yHZDBnTevumsPOyvwH+0Gd0+Rnpar8B8c0PZTY
	 LXs8a3WQGpmFA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, 
 =?utf-8?q?Jo=C3=A3o_Miguel?= <jmiguel.ghp@gmail.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20260523213548.5219-1-jmiguel.ghp@gmail.com>
References: <20260523213548.5219-1-jmiguel.ghp@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17
 C7VF
Message-Id: <178033080073.44654.3969618499083899102.b4-ty@b4>
Date: Mon, 01 Jun 2026 17:20:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NqhPjva4plXrBGv1+P3BU1wj4ibyGN5tmsGjjoYnrZE=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqHsec//r0EDhDdW64XuWwUZvWeaF6OYM7O2UOh
 Nzl1XpzhICJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HnAAKCRAk1otyXVSH
 0NjoB/i9G60w3RyedNYzhegFAEy/BanEEaVrWY+HuVMF8uPrOZZGgdfDK4LkOXu6lDhaFcaWyjj
 w8zVwYkqV7ICTLj70MJ7iPF2VgzX8CA2xqXsNvsBH/1j0yrIkRFa+Ll3LiW9ncNCxpxjFtoxZBf
 DlcsQZ1Kr1EkPbLAAChCsSsMgMHsafPAShHjBMhi/MFgxm5wmoel1G61gIFMgyaDOSE5JQCGXY0
 X2enOLZmNRBG9N2a330HYU77rt78D1i1jkfZvFDbLO4IeTNWvnelJY5GiBMKC9bBRe8pB+mW7ug
 u0oOq0BOC3h451tgrKPYMywXPD1jb7NKIFua9g7iue3FVjY=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 23 May 2026 22:35:48 +0100, João Miguel wrote:
> ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
      https://git.kernel.org/broonie/sound/c/c9c64820a48d

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

