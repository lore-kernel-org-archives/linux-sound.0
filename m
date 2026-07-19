Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB541A905;
	Mon, 20 Jul 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553599; cv=none; b=S6nG5OFIOaSIn35VD9vpN6mG70D1gZC2P3qLUBbp+4XSxTkQsUZUNw3Trq6l8lW+0W6yTvTjhMyEneXYssbp+VcNVwpfYzZ4FrjmibngQ5+EUNc1USdxcgm1gnC8iLmbPIYtDuAWeMmr9UPvEYiIrhbLsk04uBl+EhzVYEwZn8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553599; c=relaxed/simple;
	bh=oQe+beuZjmzwnLK52btt31QnTUNpwWyqi/eN8PscjeM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VZuV6T/YjJWdEW/rT/EFxNiPR0XWq1o+gfC1g8ghQdQvLnoOJTB/ZNTMuqNnBB/z+MKcXqQzuiKyhCZX9zuy7FcnYBZQ+R+JI83tMl5iO2OWtn6X23WcrXTPPWK+ZOhRlkEg0ISP6aCtSo6D5Z/W8giPFh0NMmSWf3SGfiyDYH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxwwIgUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxwwIgUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF811F000E9;
	Mon, 20 Jul 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553597;
	bh=2t+YL248Mr9Z837045als8fjyHNXIgMDrmnmORlfQTg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=jxwwIgURoVT8Vrae3qlAaW7LcR5o7PVIobD/XdPOTz4CM2tSwtqXPABMRe+UVdqwF
	 pUcqxT/2nNlONdKdhaqDKlMHnjuhLvA3FqvL5rl6a5+RHxBQqR3rAYKeYcDsBUhZdE
	 MpLGg9V4n/9UYbomqmqO3jZAhtrDPW504pFmhRD+MCd9auQImkYuo7OPCh7lgaqc8n
	 fL+QCVDIibhy4AT+jLR+ZRqiqB4n4NG6kyqmVtRROS62Ww042ITn063b82W4q4B0qX
	 Po1+UBiL8RUYm54XxyNx4ZI1KEjY++8jnWNW1j3Tg6yJMoHiR5C6gNEh1WnIt+030e
	 7D2osucdgf0ZQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@oss.nxp.com
In-Reply-To: <20260715024758.1252801-1-shengjiu.wang@oss.nxp.com>
References: <20260715024758.1252801-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: fix m2m_init error path cleanup in
 fsl_asrc and fsl_easrc
Message-Id: <178449635293.33801.10581976168356848104.b4-ty@b4>
Date: Sun, 19 Jul 2026 22:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oQe+beuZjmzwnLK52btt31QnTUNpwWyqi/eN8PscjeM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiB6pTfeH6LNKoV/iC6ikxYYZkr8eFjIcm1vW
 jimlyAMHGWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4gegAKCRAk1otyXVSH
 0MLBB/9JAkDcAmUamcu/Wge21/eVrvdIpnQ8tAwrM5i7U+Ds2xqzyaqDTKGglD3VbmNdFBtKvtz
 0q7rFGmqGV+BTz50CTgQf+j3Id4WNYRs89CdXnygWTDOYMI8ntCcAuhmWbPu1Y7dz2th727DbLl
 +xYI7lXEmcctUKCYNLUp6xkHR3YACxgX7DKAR3n2NBXkRZEQI9itk2EsJ0euZg6z6eH8Sok2GHt
 O8Q1QgBXtEb5PoYPsYhMagymhcFVavxAZtVQGV/6Tu6MN1jIrtHLkMReXAG65Ojn9YJYFCpqO0B
 yQKtLhAePAL/Qmls3zhQn3psd0+sBuB5ay5VDLGgF30/u2JX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 10:47:56 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl: fix m2m_init error path cleanup in fsl_asrc and fsl_easrc
> 
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Both fsl_asrc_probe() and fsl_easrc_probe() call fsl_asrc_m2m_init()
> near the end of their probe functions. On failure, the original code
> did a bare return ret, bypassing the existing error labels that call
> pm_runtime_disable(). This leaves runtime PM enabled and the device
> in an inconsistent state after a failed probe.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: fsl_asrc: fix m2m_init error path to use goto instead of bare return
      https://git.kernel.org/broonie/sound/c/890b4253134f
[2/2] ASoC: fsl_easrc: fix m2m_init error path to use goto instead of bare return
      https://git.kernel.org/broonie/sound/c/a54bc0eef90e

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

