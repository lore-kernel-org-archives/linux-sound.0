Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7D92D77E6
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339852; cv=none; b=cp11NjsYV9n+uvVpzKffvIbv7b3BEVyBi47QojHRNSWuoJ3fQ/AJfW+NBYsdXPaNKYIqOOIAK1KD7XriN2J6UGQ8/t0IEpzm30nsJAF0q0Uc0oIxONjuUP/WYHFaWpX0lJsChNBehN4cORxwyfwPaC38aovWFTejVdd+hTSmtKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339852; c=relaxed/simple;
	bh=l7gAYnuAzw0PSmHXXN9H7c4MMT00McDsmxMQ+khoXwk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tUbh+spjbfJQsCLtyNW8bMbXGpQt2Y8du9J5LrdSX+oU2uo1XKx1NhLsToVI/O1+iYK4T8dlP6MHlmA+aEUv1KBPyvEPVNpCXSG+tjlNbTCyZypDWAg+QGj5gGja9kOB6VfgjeZVTwQMhvE/tbFPslS25dmpX2Oqhg+TWYLGYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N05ZC323; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N05ZC323"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E5A1F000E9;
	Mon,  6 Jul 2026 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339850;
	bh=mFb56cascQSVgIOW5OTQb+pMQffjyIopcN296kuGANQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=N05ZC323Kyk9zb/JXAvQ2joCmL6hIbs/UwOFc2Y8C2HYMIEHo7m4ulwWS4EdWyX/v
	 UOeh/Vp0IMXJpYLdpraXdVsLWr+AmA8OlTck4NY595gn8Nuxk+2uRpgrXHwsCyahQk
	 xyYzn8IEL2oogkldvf8s3dqNtPIKfhCpVn2C1IKSRzSstvBehOCtz7pr3ydwl81P7X
	 fwOueMqICu3JIL9JtAs72Qi/X4KZCurNlgc6fj47p1NpeYUNeKWREXPvhZs1Y6adoq
	 E+a2bRHzcvxk11pJKQV2AddQSHqs8g09RBZr6NrEaDu6ynB+WKPGfv3oq6JSP4aYtk
	 XW3LTUvE4HTZw==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/2] ASoC: sof: nocodec: tidyup
 sof_nocodec_xxx_setup()
Message-Id: <178333980225.57168.15275910660869454883.b4-ty@b4>
Date: Mon, 06 Jul 2026 13:10:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l7gAYnuAzw0PSmHXXN9H7c4MMT00McDsmxMQ+khoXwk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS5tH1e2pV7dyhPcE7+mPzjJmPx/f+7ZJSmUap
 Fln8J3bk/eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakubRwAKCRAk1otyXVSH
 0K+2B/9ZZgdHB+8TceCSR1H/zxAOOudLaeZ8OwK2UBidVDR6DB5uzWAizHbcpz7q4nzuNUboX1E
 pZtcoVdm22l/zrl3l+r8Rq8Ctx+6VwC+PJSBxTZxftwt/pvJfhfX4kBux8qMxQ+seGXR/7GUSUn
 5HssIsXy6yAteFJNzXqmHmK8foFEQn6fFhXgXGxOHV35SMSHs//5hsoOdCao8A/8JHbik5/gPp7
 copGDHApLpIMADaNVBRFmpbvHjtuH3vsEqRCDZmi1e23af+hC3+0+ZP4y7yh2nq4eVXsVgiAAAG
 WWcTTe6gcdJZLaKhJxr891QVxaEN5Amlb3fZ6guzVWresgMK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 02:36:04 +0000, Kuninori Morimoto wrote:
> ASoC: sof: nocodec: tidyup sof_nocodec_xxx_setup()
> 
> Hi
> 
> This is v2 patch-set
> 
> I will post DAI/Component/Card capsuling patch, but
> current code makes old style / new style conversion difficult.
> To make future conversions easier to understand, this patch clean up the
> code a little. but no functional change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
      https://git.kernel.org/broonie/sound/c/380d6b549d5a
[2/2] ASoC: sof: nocodec: tidyup sof_nocodec_setup()
      https://git.kernel.org/broonie/sound/c/39222ca2ff2b

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

