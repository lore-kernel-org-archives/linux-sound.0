Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396B84D3F
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405678; cv=none; b=YrK+W9AlgmzrkcyDVFnDcpR+O2YumgJnpdQELczm/OcUAy/SjKQxyGik5+q9snHswSOEmB27QsKDl4acBvsAiQgu7sH5Dr57un1ePgsUNp3nVTt8yY0KCRXD44i+V7M5Fwsb4IW6btehbF7ppL+umYFUQlVVE9jqR/fdibnas4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405678; c=relaxed/simple;
	bh=dFfSv7BpTgThxxH4GFyhos2VvJmDBg/kk3RC0X3NgNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M0Wm+QrA1dGLr+2mOGBxGjzbGfmYrbnA/KuvR6FF6hrtaB1zNDCV0alQUVSav3Yu/B5PAoEswE2EX3vYmanb6QA6/fw3JKrHPAGTdeX5BQtpd99Il2HlqpccApUcgmLglzLrbwVscSLpKTTjRu5e+20mClKgS7sJX9d62fe3pEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdDHgOvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdDHgOvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFEDC433F1;
	Mon, 25 Mar 2024 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711405678;
	bh=dFfSv7BpTgThxxH4GFyhos2VvJmDBg/kk3RC0X3NgNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BdDHgOvdcgdJmrTMrDG0hTc6/RLXlIddCX8ZVN4PcU9FnUZNEuOszTi98rVklzNst
	 XM5Gm9fuFPkBV3H8MSIYeLIdahzyotH/83HhjZo1w1fSa9v82soI48bv+zjLI/y0qR
	 YwKGbeT78ZO7ZWhj9OcRoGdxILuN2PregEmBuJhI+70phZpd/h2RaYYm2j4jfjNkUc
	 plZ4riM6uqaolznvjOIwIeY34W0AuuvKSLLwjo9igVtwuOzokzr2wWI0qiQxOWJqtf
	 HxFuSt0nh+aYp71EtoozylkTDZPXXS/CfuhHvV+iGGPLood5zehbz3GxGWwGr2w1RN
	 Brph12RfFLhBQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 liam.r.girdwood@intel.com
In-Reply-To: <20240322112504.4192-1-peter.ujfalusi@linux.intel.com>
References: <20240322112504.4192-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [RESEND] ASoC: SOF: Intel: hda-dsp: Skip IMR boot on ACE
 platforms in case of S3 suspend
Message-Id: <171140567636.375229.13834081404668775529.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 22:27:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 22 Mar 2024 13:25:04 +0200, Peter Ujfalusi wrote:
> SoCs with ACE architecture are tailored to use s2idle instead deep (S3)
> suspend state and the IMR content is lost when the system is forced to
> enter even to S3.
> When waking up from S3 state the IMR boot will fail as the content is lost.
> Set the skip_imr_boot flag to make sure that we don't try IMR in this case.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-dsp: Skip IMR boot on ACE platforms in case of S3 suspend
      commit: c61115b37ff964d63191dbf4a058f481daabdf57

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

