Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6B301460;
	Mon, 25 May 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723502; cv=none; b=RJ+LTm1DDor+jrV0NtSBgk8XDUWct/zXl6gNh1m+6eDs264ciV355YrfORyPThTf1/okQYROS+iPSqBN5FUiEuufaQHb03hA+rXWzRLsx7+L+3iI1l9xKTtAT5lsWjmooJ3nCplSCX0aPQuPEPORenF61E+n8+kB5i2hpPIgae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723502; c=relaxed/simple;
	bh=HDoLE08+LMsF0VGAE+rCwJWmLkQjgVi2YjS7YWE60Ec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e+4SVL3UIGYmly6zkUIuBGGZUEtQqufLtha0qVNURpLfphq2nHDbVCjgTV/H+snuOxQMyhlAkOzBAm4pUwGEoA4Vc+1NvMs2+kalLpU+3r6hUPAeiS9R4DsAgYVfub3DMfhASMZDjqrKXpsLgOneudxMMT/Z16rcA0Z+NloMnZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6Xy8kwW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6Xy8kwW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5BD1F000E9;
	Mon, 25 May 2026 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723501;
	bh=KxLlu3bGboBpssH3q4i9X/9Rcpz/kEUO07K0hG3KAGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n6Xy8kwWaYqgCrONmhPK9deWc7MFPgyoEIXJHiHbivJ3CBfIdnS4wmIXfRaxhpUEY
	 095UE7eFqlIQUTHJSDEmWV9MCk1BKfRDDHoywaIPdqiNNG9ryVvdSCniUkcmpEs8mj
	 SpycPQUynwe6BvMcq0J4LDxTBmngK+OYW0fb7Ju6VoEfzjqNTyqFv9hIbrXif9sNtY
	 sKRpTXHOR5TFnE2LxlxoD7/1sq1egsHgf8XEN5L+ViQO8x9XSvCwUspiZZvsFqRpWt
	 c8z+Jxkjshb+If2tzIhIJLvIKlICI+27MWZfODJ7aWzxTfCapfmOTMRAc0be/6l5f2
	 reE1To22jUBAw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com, 
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: max98090: switch to standard
 set_jack callback
Message-Id: <177971278332.58460.18153221856136100187.b4-ty@b4>
Date: Mon, 25 May 2026 13:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HDoLE08+LMsF0VGAE+rCwJWmLkQjgVi2YjS7YWE60Ec=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoUbOqhlLg1wPvZIojtWu3FEb0H1NR9/G08wMPrqySzWZfFW
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqFGzqAAoJECTWi3JdVIfQtSoH/jB1
 B6iErPaE6qYmHbeZUyEALSiPuMZgnX0FbCVNAgZrLEdEVZ6vcy636TPlifiLyVSNPx4OJZ5VjhH
 xwwBDX6NA9U4DJCGD0yRdthITi+97INDChToqvKh/k0o29J44L/UTJAuEDDxqc2JHnuIZONlTA8
 sm+sG8Dx10c60ub2qTsRemJs9JrP+dy2iGY6qbZldrENKwtyhT6yURKI/CQtCcczclW+k9hzKWK
 RLMH71WJGF2Giyoi0oYWUY1iksvajGDsm8fWF+qP3LU9yp90a27CP4be1Ahk+UP58HELw3kqt3d
 dZQqYZfD5npusPHiTSDfATHu66Scp1v7Gc0TUCM=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 15:50:00 +0000, Srinivas Kandagatla wrote:
> ASoC: codecs: max98090: switch to standard set_jack callback
> 
> The MAX98090 codec driver currently exposes a custom
> max98090_mic_detect() helper for machine drivers to register a headset
> jack.
> 
> This series converts the driver to use the standard component
> .set_jack callback and updates the mt8173-max98090 machine driver to use
> snd_soc_component_set_jack() instead of the codec-specific helper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: mt8173-max98090: use standard callback to set jack
      https://git.kernel.org/broonie/sound/c/bad83abb5c29
[2/2] ASoC: codecs: max98090: use component set_jack callback
      https://git.kernel.org/broonie/sound/c/e2c428c3832e

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

