Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4B348C65;
	Mon, 24 Aug 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567624; cv=none; b=kaAtkZVQTb4WRyhJeWEX5M13JCk+z+8lLKJkHM65IyOTDtAjXeYYtISq/nvrkAP7P2KsYZIqEIl8OTamJDlf3QlsLwCYOJ0eNayyRiMgM+1QBRHykjB5V73D831n/vm5+33hmuXosYiXDEQ9uZy0OoKwPBjfjHfYGHsyU6rjd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567624; c=relaxed/simple;
	bh=bo/TvVGAt1GBT5Evo2c1DqvBo6Xp+PYJypDFrhCAM/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sR025ATaDgv8RvTf+QmEd2ud4cOStKaWPpU8Az+43rmyGUK8M94cCCQLtGIiwb7VfolVJKrKGHrLraN/f1LD7HoyCPBPo0ygFWkUWHXfMovPQSCKQ3HWnKxOnvPU+vg5VkTS6iDOnGi694h/3c3pBD2e3fE+jn52Ecvpec3N/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxyEysay; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxyEysay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C59F1F000E9;
	Mon, 24 Aug 2026 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787567623;
	bh=cBqEd0VHegJaMleVKrh/elGUKBgeJpNkaIYIJ751hJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HxyEysayVpIazxsAR4SV25ZAmuyQockT1gnJM58cL+jlYf6W3lLj4A3MNflf+DVVC
	 VxNVYgf1I1hcMJbB4+3GWs8B7lFH21JnM5evheD+N107MFzLT1LwSoZGfy7cXqbDVu
	 tcqFJprjHJl+xOfxjiJc/peotC/kBb7qqUggHl175tyC+u96L5Cl8nDnW7NZnyDus6
	 YwJvr0fLKt1mvNbZiUns1H22MPJBRoEkkXW4mkR7GdYCMtqqPVTURXy/xzxEzBESu2
	 a5lAM9psDQT+fjl6/NGQYUvQu1EcOfLvrPfQu/lJ8kplitttXl5nRfXk4WHaYgESB/
	 zRaCsLmInmbQg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Julian Braha <julianbraha@gmail.com>
Cc: arnd@arndb.de, rosenp@gmail.com, chancel.liu@nxp.com, 
 jonsmirl@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260821175410.179631-1-julianbraha@gmail.com>
References: <20260821175410.179631-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] ASoC: fix unmet dependencies on PPC_BESTCOMM and
 SND_SOC_AC97_BUS
Message-Id: <178734979058.89326.11467147747571208450.b4-ty@b4>
Date: Fri, 21 Aug 2026 23:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Fri, 21 Aug 2026 18:54:10 +0100, Julian Braha wrote:
> ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
      https://git.kernel.org/broonie/sound/c/72cc574aa379

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

