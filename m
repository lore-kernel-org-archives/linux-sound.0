Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED286413D6F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684078; cv=none; b=obl0QzilH0zPipJkfgWRlhtrlaKoHHlj5b2dMmNqi2y8Yqfxo7dxMUf35PcObpMq+mHlqRCVBNQ+TrUB5eS7r0lFLX+A3Et7nhuVjGqSfNDyCD0iJV56oHAitVN1bfqR8eu9cbkRXXO6fyfT8wtIawfm1UBdPfbQZrheNJqU9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684078; c=relaxed/simple;
	bh=xq27Ddput8GG78Hs24zz5F1rskZHUWJsRymM/FeoWVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eyTQxmw57Pl7arLj8DSfMdXO/YcsdNT2r1AwzdZhGdI8nBqyQCeigq896L8YFlTFZPYr7Lhfj9pGzMbkV88vjsnbq7ruKicannMWX0BTbSgUzLnnEddu8MY3ghO1ZBJROhH7Kl2OlEN4LNKbBX8/uZxz70cZhXhFoszs6M42+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b233525w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b233525w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7E31F000E9;
	Fri, 10 Jul 2026 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684062;
	bh=tz0yMkkzoQlUik8ZDVONxVJu7lagQESSxFBFlrl1gl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b233525w/r2fUmjZsadE2bCSaF++aVRohfNocpuXP51O8We9CmDd0AcC5N8bgKTw7
	 DFQ/bHtq2kkazfBhUK4jSYrMOyzFCrk83emgygYESZWF0iCfeeYJryFZdXWOWiMNHt
	 JUgwT4/vX+4hI+aXvaEwk4Scp3rQBzErDpCsjpDzisn2kIWkNixVsHTR/7nKQwa34k
	 5Vm3FewiLmm7lDZ6C7jRLUBGm5kQArbgylu2YJ1g2CY7u9yuedbFY+L6fY+W58Zhrh
	 EygcHTB4210pLfAzsbYcXDC2GRScKOjhjEL7KBQqPGzwKuvQOAKj52jbCjs5SxXyM3
	 dqs6wEM5wRJIg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Kirill Marinushkin <k.marinushkin@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/4] ASoC: use .auto_selectable_formats
Message-Id: <178361661832.100558.15607984546158826.b4-ty@b4>
Date: Thu, 09 Jul 2026 18:03:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xq27Ddput8GG78Hs24zz5F1rskZHUWJsRymM/FeoWVs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNvcmTM/IZJKgihmTMbOHi2CRypEwjyJhv5IY
 llHLSNTwiWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb3AAKCRAk1otyXVSH
 0D6ZB/wJpxig+D5r7ddmq7Or5ATPE64n7nCUNWfu6a/rzI3SxikyXryc+RaIcfZdaEXFwCar1Ze
 70onW2efptv1sZehr1ceo0tjP0jHlnDOeIJBvfeM+lrfeTh843CmRwv7HOygNQKIU4y43EcaRoQ
 ZgXUIZgbJGoMKjjEU5Fk3gofWnnHsQMLEdOvnhIwEYLO9k29RdVaB9hRfPuMq++9URoxpue18na
 Hz4HojuFdrxQ4cYApk186HxMl9sdXdItNfdTLLR7xxxmTGXQ1vltmkXTGckGQ3FG490N183jEHl
 PIjoeKe/k3zRlJbnW2wAhiPqQxB7CuA7/s583TX3TpN59+fn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 23 Jun 2026 01:53:27 +0000, Kuninori Morimoto wrote:
> ASoC: use .auto_selectable_formats
> 
> Hi Mark, all
> 
> This is v2 to add .auto_selectable_formats to each drivers.
> I have posted it for all drivers in v1, but is separated into few parts in v2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: amd: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/5f195b1ae6ca
[2/4] ASoC: codecs: pcm*: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/946ddf03d0a2
[3/4] ASoC: meson: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/2b7f2b7a2a36
[4/4] ASoC: spacemit: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/5e6f8ad0008a

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

