Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1C37E5F7
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135047; cv=none; b=ezVh/FMPrM49gefxYgC2RhYu1O/NaSLmYvHFJr1j/5lzfe/xDIweWNJ3lA7vpV7Eeu0b9gJpg3vKoAI+3NiCss5jqb6CtdoClO0CHYGWK/a5XC3MuKlHs90fe3rUgRLoBdLjH8naQ3V3s0TjLh3+KCZFUweF/RivIaqIxsPkHcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135047; c=relaxed/simple;
	bh=JcqQY1XzHxLN08jaiKyfF/gOQdEnScIie51Ddr505JA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JsygGrOi/Iy3hmQdSbpeUqEVDyjyBVL+IlWjHqrAzV8Itah9pUsKIQhfH7Z81ZsA84JaKxoj4zhaptEhLpN+rQNAmjaVmRpkKBzpSPsoStLwUbESzJlPRV4tenFFXMZYiSCxusMu+uKTVVn1SKCgrf2mipRHP+XCS6MLjwk2oP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgJ6Ke0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgJ6Ke0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C54B1F000E9;
	Wed, 19 Aug 2026 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787135046;
	bh=Y3gmWa8GBZW1pkMmsWKPg832SJp0xKlbiV+UVMZTMC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MgJ6Ke0Cm3n6WPgc1Dxt0FBxZ6LEqc54WSNhdJHILcXPJbNisoyspjFFrtkj8bnxX
	 czJvIVd4Kp1b+9j05OrbQH500g1VxrOFXb65UB4DsHX5r6Ndj1cnGqgXzSVWhqxmNz
	 ebqrkifd9VfKslowiqQuCm0KLGJmYBMLAeEcjKWlealzyHRv4KQ4Uauu07Q6gXZzFo
	 OLDXyfaeHPUfvgtjkdrat9iW8dCGA0gqAoiSFQQiWp0f7XRAzu3Sip/6wV3zr4d4g8
	 0QVv8qoPK+ehKEVFN9li+2uCgs2NgjZhaCt596Fc/zVJXd5EDHwv8Ca0NAj2s7wnXJ
	 ms8R2si0Mh+3Q==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
References: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
Subject: Re: [PATCH] ASoC: loongson: Fix naming of machine event and DAPM
 widgets
Message-Id: <178707903077.154835.1766392254603983852.b4-ty@b4>
Date: Tue, 18 Aug 2026 19:50:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Tue, 18 Aug 2026 17:20:52 +0800, Binbin Zhou wrote:
> ASoC: loongson: Fix naming of machine event and DAPM widgets

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: loongson: Fix naming of machine event and DAPM widgets
      https://git.kernel.org/broonie/sound/c/523ee23d4957

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

