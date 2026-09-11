Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD603246ED
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168157; cv=none; b=XUeRWANgai5Rvzoz58rUWwSi1BrLVeJf6HDzdpeosEfxmvtzdhbIoX5JXwN0L+9kPqeF0zzkxeaz3Sb/CW+r9Wuzj3aPzoU7wNT5w40XdRyMMUA49SoLwFlV6X/jHuLRvwkdkDy5jHRziIdwyBichXyR0JnWc/05uWHa2l4tbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168157; c=relaxed/simple;
	bh=W8rrGD8SZk/IHVzibABIBtSai3+DYUqMBzDZ92MkceA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IyJXPiPijdNWrdGlstsrDuH84wwp3T02GlMUXnIvkxgluMiQPIy8Cl33NgB6YVJVahNPg07ydcl4DOb7R7pn9rVMk3nAQ+0ppVR4pdmkgXN0/QdT7TYZjED0J1Et8By/DtgQUjGVtqzqJIiiWHQIF1vS5kTB5OgIFf4j20LvtTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl0eJ9+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl0eJ9+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE0F1F00898;
	Fri, 11 Sep 2026 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789168156;
	bh=mVpqNj1BdbydULZDaO5ZgtBgP+CZz3VMjwaXhWge1qI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Cl0eJ9+Ma0BPJfj9LB6esCfDsRplFU/wS4c6TRlmiIKtoHgDF67Mc+vd4DgB5pMB9
	 /F0AV+t5N+vnpGczaQ9MUq9jIGVWF5O62yUbOQEnoXV2g83VngshN4Mn2MZwE06sKl
	 sWiKKN9RgQDhjIqItUTKBAPEdF/bj+AUGchRA1K87zt6IFaTV/gvfHT8/WiZ3basM6
	 Zkp0890w2KuFB47PnBSHD6pYy9hlbQYGDeHFYPdMDhcG05Ml1iCbfqw7OL8h9W067L
	 ktVuXdm+kkGd5AUSaFp2d0ZNXC92vBtailskK6ii19s57A4PdO9iMespjtPLp2qbpw
	 OdGT1FtpPI9sw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 00/21] ASoC: use .auto_selectable_formats
Message-Id: <178915754153.835873.14190326311831846715.b4-ty@b4>
Date: Fri, 11 Sep 2026 21:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Thu, 03 Sep 2026 01:13:16 +0000, Kuninori Morimoto wrote:
> ASoC: use .auto_selectable_formats
> 
> Hi Mark, all
> 
> I'm now posting "use .auto_selectable_formats" for Codecs.
> This is "use .auto_selectable_formats" for each vendor.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/21] ASoC: dwc: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/04d17816c81e
[03/21] ASoC: hisilicon: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/732bac6bd644
[04/21] ASoC: img: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/b18ce5ae42ac
[05/21] ASoC: jz4740: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/2bc2523c253d
[06/21] ASoC: kirkwood: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/0dab4c4fe6c8
[07/21] ASoC: loongson: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/47afd963102b
[09/21] ASoC: mxs: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/d83c51012372
[10/21] ASoC: pxa: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/1eae5ea3637d
[11/21] ASoC: renesas: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/0d0f03f34a4d
[12/21] ASoC: rockchip: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/d39bf59dbb6a
[14/21] ASoC: sti: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/da4d9d64d6cb
[15/21] ASoC: stm: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/419884c9f124
[16/21] ASoC: sunxi: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/e64e684cf206
[17/21] ASoC: tegra: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/17e25fe32974
[18/21] ASoC: ti: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/768d917175b2
[19/21] ASoC: uniphier: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/ebf365cf2623
[20/21] ASoC: ux500: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/7bbcb8bac273
[21/21] ASoC: xtensa: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/514d0b41854c

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

