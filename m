Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59F5FDA7;
	Fri, 18 Sep 2026 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765453; cv=none; b=NQz1FnlD5TfO7b8tM2HUPdFNGwRz6Vbj3TdTP2fwhNnBEyR8yLvrck3YKsxhEMGtbLDuosK4K2AiWdG9Ti/eBqmufGt1ourkJMfxhUG1hN20D9vNLohNEvlekML/mszCnEp/MOUatOs+d5LtTw5yRqfxW/sKwRfcyHzWdlKw5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765453; c=relaxed/simple;
	bh=2IgMWOiPnBsAsq7j410yrhnNiL6EjnhpUaSVjEfrMlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BJNnGk1Fp6RJAtJaR1X06f/pMnsT2fVwxHAUR6XKNJEOQtf/sUk/BRhMyI+E7Fc4BNh9R4TVPldy2uoAoo2SYKEZ27W5YvvOawTacYLol/eP5+5i+wDW3wQ1SPn2160Ge/pBln2RRDBW7bZ+NDX29hwYVhmK0xbCoKJdQvgEwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2Nd0eUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2Nd0eUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1121F000FF;
	Fri, 18 Sep 2026 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765452;
	bh=P0f6hKykIWu5AgC08cLFx1yh7J46Gywf1CQqqaow/LA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f2Nd0eUBM+w2wCWZG/qkVfhDbBEkqz8xjbHzUHgUB5xw5gPC9kN0wTxYHR8cT2x6Q
	 XauhBC5qrGbETvjTl166TRPxAFE0DgskI97vdCX+pXDIZDkq37TNevvatJsX9TnXKY
	 vUppwrCnDWadlTKE9JQEEQ48hxYSutES4Z35AAMvqEnQzRQ2EBmMvXq5FuxD1c1BM/
	 UJ4ix0UdNkZtjChXQ2rYCg8R2bS8TDNDwmMKlRSSgDZOEl4JpsH5onEopIveX7GeCH
	 s+CiMnzVTbKfprME8nFFm3aYj8gnmEErPBfXF9FJePsmQ3qC7VV2b7ysKJkDOfxMqV
	 fQA0SMy4eK9fA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
Subject: Re: (subset) [PATCH v2 0/9] ASoC: ux500: Migrate HREF and Samsung
 audio to audio-graph-card2
Message-Id: <178975186398.1812520.14399975775525322676.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:17:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2IgMWOiPnBsAsq7j410yrhnNiL6EjnhpUaSVjEfrMlk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqradEN1W3/YrztXr+VZQe0dxlFCLzeQ9RN8OU/
 45CLWYBYOmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq2nRAAKCRAk1otyXVSH
 0MCHB/kBfxeWjME/6BZ+Edid3En2dX0Yj0pK1qZNDExppS4/tOM5rsnFe7GZv7GhcCSVc2kVhKj
 IJjdNRDkb0SETFIYFv40yvX9wmufAyeGF/OyIXXvae9HKLGhRjbi8/oz4ucGgzR2vGnm0KSId91
 /GRdyg2Ld+fcJXqsFMOqloxYgCKeqvJedvrHCx2DQPZm4/uor71NujCHPjN1XnMi0tsVIp/dYDE
 Vh8tthRQQ8bJcOG8bsHvYZXDBu7ddkncMLz1q1lArmYUdFCrH4b/sW/3MklXqntXotljIcoy6re
 awOkfnHQEsl7dFLGaM+5SYdhoIlmWpZHROEZTIkaCdfZjdi6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 18 Sep 2026 00:50:58 +0200, Linus Walleij wrote:
> ASoC: ux500: Migrate HREF and Samsung audio to audio-graph-card2
> 
> The Ux500 HREF500 and HREF520 audio support still relies on a
> MOP500-specific machine driver and ad-hoc text bindings.
> 
> Convert the MSP binding to DT schema and make the MSP and AB8500 codec
> nodes proper sound DAI providers with audio graph ports. Document the
> sparse TDM slot masks already parsed from audio graph endpoints.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/9] ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
      https://git.kernel.org/broonie/sound/c/cc47a544d4f7
[3/9] ASoC: dt-bindings: ux500: Remove MOP500 sound card binding
      https://git.kernel.org/broonie/sound/c/661b5aa81093
[4/9] ASoC: ab8500: Skip digital microphone support on AB8505
      https://git.kernel.org/broonie/sound/c/0d46182a1be7
[5/9] ASoC: ux500: Remove the MOP500 machine driver
      https://git.kernel.org/broonie/sound/c/f25d142baa23

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

