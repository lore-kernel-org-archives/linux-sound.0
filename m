Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC833D7D6B
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 23:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168153; cv=none; b=LbxLsJ3NsUk+bxnfDVjLcXymO9ZZY4VHNsVHD2++Cmiw9ZbCLH+iOnlg+at8KCv3dzWV2AKJww0beeciTgLUefFF4iLEVmNBu7DmfNDr3dOHDwaX/fvTduyUOAyrdcdfeb2A9+sGZbOc3Dr3PYKckch0pfd0Q3WHLUG+srVRQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168153; c=relaxed/simple;
	bh=t1JflMcZ4986qhdcHbHnqpZHSYA/TroEJJlYYLJFS70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RjN0qbUa/DggfvLTHga8OlZvHjasX7rAaFpSw2apk9Qj/3iHXtzHCy3LA40qgDLsobTOWwa4i5vLvqe8kP3qce2KLT3Y9Y4a5ICPkVC9rSYp5SpHKddYDmxxHSAbdAnb82p1m9nFD72fpLwknlfS9alp/V16aD/dLOrdt8HOCDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtPtmyb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtPtmyb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619711F000FF;
	Fri, 11 Sep 2026 23:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789168151;
	bh=snXytIQy16UDYeshoM1MXJ2OQmiczNP5Q+xREXV6mA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UtPtmyb2Kum8SAMrBnVu4MNNvttij8L+ASMjCE8d4MBSbpF2dREhoR6qwVhxCW/wt
	 uqC7Av3IT1OYrI5Y+uJIgO2K7Az5KfFURK+y71QKWrjNMijhFHsy5K6TLrkPiFbNSh
	 1VXyezMvTFHbp3FgOk38zmJZkbmTDNNB2ygeshlUSskG5CTNr8Elq43q+bvh1gDnMF
	 sDDKFmgU87a+jgAR0eLbK7bWX3lEKQ1GAQCSVO8+2VCk0vDFyZcoifLNUZs4ure9fY
	 Pd4uN632AzNWQvwYgAX3czfz3I7ApPYmCPwb+A8V9g8VFNWw2VpLKBpYOblPkOq9+Q
	 n6UVgCp7LdEHw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/39] ASoC: codec: use .auto_selectable_formats
Message-Id: <178915610302.835873.6759882804048768763.b4-ty@b4>
Date: Fri, 11 Sep 2026 20:48:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Mon, 31 Aug 2026 05:06:34 +0000, Kuninori Morimoto wrote:
> ASoC: codec: use .auto_selectable_formats
> 
> Hi Mark, all
> 
> This is v3 of Step2 of "use .auto_selectable_formats" patch-set
> 
> o: done
> x: this patch-set
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/39] ASoC: codecs: 88pm860x: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/527d09d74d90
[02/39] ASoC: codecs: ab8500: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/d39367addf93
[03/39] ASoC: codecs: adau*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/efc0eb0908df
[04/39] ASoC: codecs: ak4*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/9e99d539694b
[05/39] ASoC: codecs: ak5*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/dab547442de4
[06/39] ASoC: codecs: alc56*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/ccb78092f0c9
[07/39] ASoC: codecs: arizona: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/1a33b369a9ba
[08/39] ASoC: codecs: cpcap: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/feb853ce5190
[09/39] ASoC: codecs: cs35l*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/d4d1619ebd55
[10/39] ASoC: codecs: cs42*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/27192e1876ba
[11/39] ASoC: codecs: cs5*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/b1d8fda689d3
[12/39] ASoC: codecs: cx2072x: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/956fe07e1782
[13/39] ASoC: codecs: da*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/1e3cc1d36a1c
[14/39] ASoC: codecs: es*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/1427806905e4
[15/39] ASoC: codecs: inno_rk3036: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/f7ee5cdfbd08
[16/39] ASoC: codecs: isabelle: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/43a8fe22f7de
[17/39] ASoC: codecs: lm49453: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/4f3d20ac26eb
[18/39] ASoC: codecs: max*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/2e4e627eda15
[19/39] ASoC: codecs: mc13783: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/0363504f2a1b
[20/39] ASoC: codecs: ml26124: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/c9cea75cf3b3
[21/39] ASoC: codecs: nau*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/9ed1ee45e100
[22/39] ASoC: codecs: ntp8*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/b66dcb7112d0
[23/39] ASoC: codecs: rk33*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/0c55552b5f5e
[24/39] ASoC: codecs: rtq912*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/b1b8e119c486
[25/39] ASoC: codecs: rt*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/84bf0c2e5e7a
[26/39] ASoC: codecs: sgtl5000: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/f710416f4d8b
[27/39] ASoC: codecs: si476x: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/9d6aa5e50a8b
[28/39] ASoC: codecs: sma130*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/793b720dbf4f
[29/39] ASoC: codecs: src4xxx: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/dd711abc3750
[30/39] ASoC: codecs: ssm*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/dec1b4abfbd3
[31/39] ASoC: codecs: sta*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/9f349fafa769
[32/39] ASoC: codecs: tas*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/122b339a5a0b
[33/39] ASoC: codecs: tfa9879: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/5759273b853c
[34/39] ASoC: codecs: tlv320*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/cb125dde4b5d
[35/39] ASoC: codecs: tscs454: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/41058e1bddb3
[36/39] ASoC: codecs: twl4030: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/688b914d2789
[37/39] ASoC: codecs: uda13*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/7673fc209176
[38/39] ASoC: codecs: wm*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/fe72aace0a5a
[39/39] ASoC: codecs: zl38060: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/93a0091f9745

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

