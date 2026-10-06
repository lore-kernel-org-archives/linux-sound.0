Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBA46A604
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368559; cv=none; b=c9l99u56frYFjBJl15dqL99t6UIv9OO9zO64XfriP2jTAW29OIayteki2yN6DfA7ds9jcyVCoqkfdnw8uYmES7/VbjpUjB0VFbwGf49ahe4CfJ/39LidY6NpKJzIXar29ascDTldZe8JhPZqyXd2w1uNFSMSq+UWxs5/U1alcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368559; c=relaxed/simple;
	bh=33sM7f6aAIE0p9vbZJEVhMypadhu9bgrD53f+49PAAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VUr28TZ1T/fMz1UFR7aZdR/L6wWgIP0ew2hNRsFzdp0LMfhYRMfXl0djgUk8EfQRVgyK9+DSkYiJIH4owdUU64UxuFTWCAcD5Hd166KZIgK/PV7Raci2X2QFnfWFXA5GXu8RCeEH0UZMADLhu6UanaKVt5IK6ic3zGeWu9DoODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbbUr4Cc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbbUr4Cc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DD11F0089B;
	Wed,  7 Oct 2026 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368551;
	bh=JAD5HchoYkq/xNq5+Xhh+wfn65dElg5AxJ0bZIMya9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WbbUr4CcgsiQ9CVI/gst2AVB88ZjCe7uapSIWqgCauNaph1aLOQEN5GbrmnW0sPTN
	 PWL+hVPmTRQUolo7shNCd+0GWY5Uy/vkFUJzCTaUklq8zVfuIPDp12iulBECjeb9kz
	 1HA2LPemipBSaRwnnhGURCvQUA9J676I2+lmYx7me6J4asWOCCET5GXVp3MIE/t6by
	 +h/B3+oYUrGfTEr0J8snp4bq7HZou1gi/w6xYI05/Mmo7HTR7B+wO1FTESQKDjEHdE
	 FMXTrVPW/8y4+26GUq5y/3qMsCVhovzuvwhClqmS0wAuDuvpuSunZqDxPHO6AT/43V
	 G7GwtrK6fg1Ig==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzicel11.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzicel11.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: cpcap: tidyup cpcap_soc_probe()
Message-Id: <179130045340.150114.16993877534433037341.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:27:33 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=33sM7f6aAIE0p9vbZJEVhMypadhu9bgrD53f+49PAAg=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGrGHWLImbX+S2W+xwXBHV8qO6IYbGx/LFep40X2zHfQsYB17
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqxh1iAAoJECTWi3JdVIfQJ/UH/0To
 4ZIbD1yVtpg/GtUT/jUtTuszUWlmGmQZDgaZMi2eAHj+fJVCMOkubeaPJcCiRm9K05AcNa1u292
 rKYD/5mzwdsssLj8way6oMrWHA07pL1snBC0iyfTdtzFT1WpjFX0mLqZIoycnPrDSJcLV2qtIDu
 vKeM9HBJ/Jq4JDVWkUR3kZn0uaB3BmrNkQ2eHGUmpiwZeySyM9N8bByK8XX60sn8tVIWhtSPyBN
 MHfqjlvleLkXkyLQmP56JZfm3ibKrUm/wI+USAzrX2RD/0ClwDjeraku7JWteHiWHhpzKyRlnUd
 k2GDlfsR2i78OnQSJ3XN6OprKvgG/5DmffWiZos=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 29 Sep 2026 04:31:06 +0000, Kuninori Morimoto wrote:
> ASoC: codecs: cpcap: tidyup cpcap_soc_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: cpcap: tidyup cpcap_soc_probe()
      https://git.kernel.org/broonie/sound/c/8afbacbcaebc

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

