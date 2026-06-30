Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E846AEE2
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834560; cv=none; b=t4fUqocPm+LY1UWYILejyGc8zUNNMnCOSJJAN+/1RxhecdGulT71iPaSKqgCS1fInQQTKcHrI5ZEuFUg9Hrzw7g0JPlQDSqKTA9N74fwTEm2hlwrMyvigjR7v2NwO3H7KeRQSPOAn0icRmZ/Xqch3JZpQmBSSv2eI1ZRxRgBB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834560; c=relaxed/simple;
	bh=J2Ubpj6UDQ8dhXJs1/efR1cIg4QETMCXdOrqc0h7Q9w=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qt3C+1LW2u7AfCbv6JI/oqaiFIF0q86vsuJp5tO63Yk14OZuBKbIqEPug9Xo7jhmFvg36yNOe6ZM+WdAxUNTh8BSKbv0YezXrDWgnPgPrW2UmNUMqygY3nNrEubCbcknSITvXj3SN+dur4VvFa9YXOeldtZ0pIRS8RcefF+Suj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8FHbz0E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8FHbz0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680C91F000E9;
	Tue, 30 Jun 2026 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834559;
	bh=Dc57ihpUVF0a7ZxSKY0jk347wjuQpNBYp55lag1yZzg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=V8FHbz0E2ACHTvuz+e/OpewwcRSrPKOqymGoL2LcQfCKS89FDXYuEMq3GVlC7YyTV
	 XEi0hbkMPpCJopKhnAK6ZDMzVoCLGoNBzGq6IBABJcWGhCHK1jsXJ3q6V4MI0YtxhL
	 hlkLYjGPhBOLnScKDyhX6JzdiV5JdtSkCrutJk7T9A+P1zUVs/8Rw8os+ISBRDGR4e
	 JOm6Qwt1FUfr7HTyj9y8pF/7HeXTdp1cNiHqWudHzb5IHfFdedCmNthqm8UG3xtstC
	 mDymQjg6v/AxfhdSCitR2SlzqG1wqPwCbTmfUmhLVw32G6xDUaS27CoItiJXdohnX9
	 rohDoAsX66fSA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: sdw_utils: tidyup functions
Message-Id: <178282590914.79320.1305270680066783962.b4-ty@b4>
Date: Tue, 30 Jun 2026 14:25:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J2Ubpj6UDQ8dhXJs1/efR1cIg4QETMCXdOrqc0h7Q9w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+V8RF4WdZ1dV+yC8bAN/XQYizA/+8SxIXNeJ
 z9R0wnaMYuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlfAAKCRAk1otyXVSH
 0A/GB/4uieVBxkUGHyxuR6M6McwKKtktHVbGlnWgGBGFOQIkkod8DYHLJ9/WZaQGSG4tE1XABuu
 4OsrOBSKcynn9a6oV6vwTdvJzwTHgMQkLmGH0OwXa7NLXqWEngdqTx/x0IMAAmV3MPGDKKcwe+y
 zGaYT8KcCbI/gCwXTVK6j5cc2YKDn/aLhCMtTodI+PklkesBscYHAu90ANVkPCxEGcDixx9nUtt
 3rJ1xVIwb1kGV6kJiNw2R5/iOmtpahVi26jihZQ4RATVOvQWyCzOJen70+iTbwWGMjnYE8fN15d
 yc2LjOXVEdPMP8W1EmrtW46X8GZN2b6pEQwEVwljnxTMZfy7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 05:44:46 +0000, Kuninori Morimoto wrote:
> ASoC: sdw_utils: tidyup functions
> 
> Hi
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

[1/2] ASoC: sdw_utils: tidyup .count_sidecar
      https://git.kernel.org/broonie/sound/c/c97f0bf5f705
[2/2] ASoC: sdw_utils: tidyup asoc_sdw_parse_sdw_endpoints()
      https://git.kernel.org/broonie/sound/c/a1332be2a070

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

