Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953722882D3
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678053; cv=none; b=soNb0gyyCvF5YPslsOEccgFXLHZtGr2wgPo7yNlTdvJq1Z3EYhI9p7ADbXi1AzeCfE1DeG6NWoCvzmWUJBBIzC7I6aP08a/A8Fmzq6JNB7WATA9Jfimrh/zjcXb9HOFr4PBppFe0IUH6HhqeUCZGqHScdwU1sausBiyc2oCFNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678053; c=relaxed/simple;
	bh=hiwwV+3Fhuto6WV4E/w5sXnIFtrQhTuT/lbo3jnQSlw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nvUfuti1Viof4RsI4p3M6i7EHPoqxNZ6DKdpxhm8nutBhQPoGp+qPvh3CosvzQNPwzwRjZnwvTsBAjDMIyaln2dgsg4kb3B8RLJr10TIJ0+VL9uj1O3p+J0y+hGgd1YNuPRB6PVRs/Ec2G2UZL6kz/OZVDoR2qAngffeBMRK+yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHGSOh94; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHGSOh94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC71C4CEFA;
	Wed, 16 Jul 2025 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752678053;
	bh=hiwwV+3Fhuto6WV4E/w5sXnIFtrQhTuT/lbo3jnQSlw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jHGSOh94JIYtQljr1QWZPNch63LPKEVVG1SyDfQg+Kwx3VQbyYQ6juN5wSWXzetqZ
	 KTbY3WTgJZZeQKTin7eiCVFvgDJ88EYmzULanWjN91t1xJmmy4laKAOi+radDSJ1Sx
	 jB5NlkXl4o8kWdTAlyQM13LwPIEogYpYKh2VlIx0vpGrgps5+VX5XVMcuIUaFPT9dx
	 /4vyfVjQAzbn5BWlr7SpxYKIn476epg8krjwpsT9r7z8Do+FTw/4EVXlkqVrtDzXvH
	 Qfjzu+91Qg58L9tHHanUT/KFbcfvuJBKW2I1oNkmslK0KYKXlyY09RZKUFRXLirRJZ
	 4spD0w35nRsrQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20250716082233.1810334-1-yung-chuan.liao@linux.intel.com>
References: <20250716082233.1810334-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: add support for HP Omen14 ARL
Message-Id: <175267805207.649282.14916187009373145461.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 16:00:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 16 Jul 2025 16:22:33 +0800, Bard Liao wrote:
> This platform has an RT711-sdca on link0 and RT1316 on link3.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: add support for HP Omen14 ARL
      commit: ec5b9c847bb8ac0f458d2b2a3fa23ee84dd99c40

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

