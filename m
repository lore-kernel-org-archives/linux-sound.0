Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ECB3E51EC;
	Wed,  5 Aug 2026 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966206; cv=none; b=KZn/iZyiJ+HsblgB4QNkJcZgtjE+UkeH74mZ3tEqf4emaZxFBJdDFAEo0UTSm3gaBCJn7/6tkYXjym0KTI/D43vg9qSXmROCytdBfmRt5CRHYG1EL/zdwgMWnaSowx8rClOkyKuOWSscyowDFZJMoMS/VqZ93PfWSTcxLQK0iYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966206; c=relaxed/simple;
	bh=DOt/yphkL+2hSAbQiP8E+aOrGJ1u72dE2UKTQptUAws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iIcjGOIGAluAECaNkV0HtIXr1DJeR97aOCemiGbqGAey2/7ycrc68ZXpdaBUmBIJleZAIucAB0udEf+WDGpI6xt30ZQmdSaSchQeALT9koiMR5164LSvUQz448oxZZIVujRylOB5RD7/iRz0sFPvufibbgl4Up/IhYjGgJNxSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRdNvGf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRdNvGf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82581F000E9;
	Wed,  5 Aug 2026 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785966205;
	bh=xtkKiL+ZpbKjcPqyh84h1R8GCZODBAg+Zr8ZuttHXCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RRdNvGf1Uhze7kI9OImhYFWkQh0G38UeXiO0terDUGHPD+E8JKJ3SnWlgYdUPIA1H
	 ZYOaPdVAJPr+ZS4ywh45iIm0b+Rej7537xTvaaoBZoMPUQ63YsWa+QVWua/CC0XbUp
	 /zkDwN62FWu9db0bCzq97GiFMYg08aa7h9Jp+HARtTa9v20giaQHgUigEL7j1UEnPw
	 4vcCZTYURO/qPgCPQkkx+FczV88PXndNEl9INhrcLOqekcXQbV1VbM/noHkoG4cnwR
	 NhxvNpVb6lKZ9qJ9NnvCH8TZR5hOX6l1EZDZTYoz6BWUtfrGeRKWOuvswRFXitpLfL
	 4IUvLZ+x+CliQ==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260805091600.318018-1-zhangheng@kylinos.cn>
References: <20260805091600.318018-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH 1/2] ASoC: amd: yc: Add DMI quirk for Xiaomi RedmiBook
 16 2025
Message-Id: <178593089049.199927.13547420569186764328.b4-ty@b4>
Date: Wed, 05 Aug 2026 12:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DOt/yphkL+2hSAbQiP8E+aOrGJ1u72dE2UKTQptUAws=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqc654nJyKILkFLPYmImEO1M1eeGE7K38ELKIzd
 Xg3c9FXUyyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanOueAAKCRAk1otyXVSH
 0O2uB/9zG9btsOcdvfNIyVCH/QTrZMhmacyi47VcH/ZEKxakNBl00PoD9adjjJwK9Bc8xOrfrAN
 3Va+xPu8U54MemRLsQ2Sf+iqQ0V30dVcwm5nQGO5GLKu33lxMP6ycVdraPga5pF0gbwidl3rqrC
 b8QhJ9hC69hWlsATW2vnWArpyri3bBoax9x047+ilTiFXhEYHgJnKTEOPUZ/E0QD0F8NARYdprj
 RNV4pFagjX4r7+vbdYL8/vM80ZSTX9xOG2PQtWYRgd61KMD27GtC+f6JSRSYHJ+3c7js89mL7U+
 /yTygcBr0D+PQQN2YZKra3YsrMDaf5wGELbSWVM++HNL+2b9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 17:15:59 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for Xiaomi RedmiBook 16 2025

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: amd: yc: Add DMI quirk for Xiaomi RedmiBook 16 2025
      https://git.kernel.org/broonie/sound/c/bc734d167ac5
[2/2] ASoC: amd: yc: Add DMI quirk for MSI Raider A18 HX A7VHG
      https://git.kernel.org/broonie/sound/c/1b0e5c7a4d90

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

