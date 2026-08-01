Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F898390C9F
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758965; cv=none; b=DDrpVxPqoossq9/aGTPpaSuH0Xua86RTYGBaU95kOcDc4sfuIFtcRBrX8Li8LFDzl9RFNdVc9StrTdDbSQDdy/OddsVtPz0foMLb8rdAcLlwTuV/oIN5e9PvhQf3l1N6+X4BWr+1d/mlAC4jdvYUWhnNS/diszV3S2A2gncXVpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758965; c=relaxed/simple;
	bh=bnCcU51kXIZC3wQdDZ5ujanaGJrwNvfkFK8Fopctke0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NKlz8+8e3cAuYgV5vj5l9fASm/ACPOBCTbIU0IRnwkqdOsgzWrffu1n8+GISsSOyxlrKosZ9YfIBFYrNQgQBmJkEgEznn30mksQOaBKI8mJs1OrawMrQG+9V7/izgk3zuYG/ms6ac2cufds9bDNppkRn73ub+0TsBAdoeT0nT10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq2bK9SU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq2bK9SU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6309F1F000E9;
	Mon,  3 Aug 2026 12:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785758962;
	bh=KQG97YxbsWMVg2Vxqhd/2yzzo+iPLfhMIq0QcPkdVVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qq2bK9SU/S79tgkkQ/APAHB9LrudJpAEGSAshAbfyJWiVghXL5qVaefQOX7Yxi4J4
	 qnRzavqPVPAlMd2fO5uTbLlSkJHurgkMKVWFrEADMU4w/htj4DQecRDUcXLcUwQPkN
	 XYjf2zbOzPKmFJ3t7N0QEaHYIw/kl/L73PD2yaOSYUkhgN5eCCv6rTvQSaA+DmjEMN
	 e2JS8ct+lZqQ96G0bHLlbR5Z2byFJDcbTrWXnKI8uw1AoiTTogsd46gcfYt5/yvwRL
	 1bj/zYZiPd3QNh7u4858/8PFAiEHWQJEuSIa3Gp8jukviOpsiuOAM51kLFqOYoSntD
	 baUR4XAqika5Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/5] ASoC: use .auto_selectable_formats
Message-Id: <178554844725.1405722.14577552070331979006.b4-ty@b4>
Date: Sat, 01 Aug 2026 02:40:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 21 Jul 2026 00:59:37 +0000, Kuninori Morimoto wrote:
> ASoC: use .auto_selectable_formats
> 
> Hi Mark, all
> 
> This is v3 of "ASoC: use .auto_selectable_formats", but separated into
> small blocks. It is Step1, and it will be Step4 in total.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/5] ASoC: apple: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/1bd470f27f28
[2/5] ASoC: atmel: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/f7726b460010
[3/5] ASoC: au1x: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/d2b8012401ea
[4/5] ASoC: bcm: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/9626075249c5
[5/5] ASoC: cirrus: use .auto_selectable_formats
      https://git.kernel.org/broonie/sound/c/01856b7ac984

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

