Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3DE3C942D
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063979; cv=none; b=SvlK1W8Cwf/1vsYZI2f6zHAD14OYKB6QObA1dEVJYPrtBrTxnlo2Ad1LIDZnE7Trq+l37iqPyU8O/LYaPdFpR1LrNQKgm7CzLzOUvqtoX9LAgnSKkNfrjwgdYu06PGctnkMuUjTgjSd3d5N4HjRsx5X/f1W7N/0Y9uF4mDc0Ba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063979; c=relaxed/simple;
	bh=T+crXYISuBvVl3CNk2+FtPaBx7Z3ksqb5OAPkwZy2PU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iVsCG1ZwQPTf48CiUSj4bNz57b3lasKE+MoLJQK5suyhFPujOdRyaJxvzZN9EFomNv36aLtH6pG81CsLgkqktbV84zFIKvu6pAi66bLpTL9kj/kVYwszH28OOB2FzkvkWQ1OgVI02Yn4v6Awg3x08NRIH09MXqOJuOJV+iPGaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7xqz8lW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7xqz8lW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519D0C2BCAF;
	Wed,  1 Apr 2026 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063979;
	bh=T+crXYISuBvVl3CNk2+FtPaBx7Z3ksqb5OAPkwZy2PU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=u7xqz8lWK8ImMlLzKPbr687M+wUl3b7+RHbYxWF53RjWk6SpnLggKT78nuF6vQ1Pa
	 ulztac9M5K1/jtoE5ePLVNj0JEWPz0m2aFJdIg3cV8yaPD6J/vVS868I9mEix83wJz
	 aFjSQScT/NAQB2mxtrgueBt77O8o/vrJdSEVtWVBY3xVKkVwvG3le+QSOg9uSR9Pct
	 kevuwyRFh0Q3AzAivzHJIPTZfx6FL977BJfop++Nwn7TpnDIDWxVgm7bmNNTSRhOLQ
	 i040get+RQtkkMYv70AL3oS4py//T1eRq8hV7D4qdhGwe18uSC+aoy7z1EBuo9Ka0I
	 u4YP0PLJTXQbA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bqrttvp.wl-kuninori.morimoto.gx@renesas.com>
References: <877bqrttvp.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc.h: remove snd_soc_of_parse_audio_prefix()
Message-Id: <177504482039.145704.3638460844958401080.b4-ty@b4>
Date: Wed, 01 Apr 2026 13:00:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=T+crXYISuBvVl3CNk2+FtPaBx7Z3ksqb5OAPkwZy2PU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOpbmbcLx/R0XDQy/2mABCs+Zsjq0Y6raLWW
 e+MyQ2uf/iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1TqQAKCRAk1otyXVSH
 0MtRB/9Gl+OtpG2H0XMMOhx09qQvR02lDUNO7DjPa6XF3sdyJM48YG01osaZmoKWiXVDMqQYXQ/
 jq5TKTmeLDUx4UPqv8xdGXpx+OM7e5sv8WBeWgWnDTqzQH+L6+HVEpaYAySjCPIRKyAdGf/sE4p
 P4y6w4BR4soQAB4pkjemkG6GYna8dXfwtdSP+SA/o3BNU0MvBPtprrnZaQ2h+/xInTFkLqRcPzO
 NR3ey/Vcpi/MSd3+r604ETsHVUVdmdEsgtvXlYbLMz6NOXxUef/HJJ0Syt5S/ZVtxlpdvI3/1/y
 XKnDHwIxLh5ueqAZ2s40Z05tRWfL6eZvrUe/4aIRHYZk9i7/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Apr 2026 00:19:06 +0000, Kuninori Morimoto wrote:
> ASoC: soc.h: remove snd_soc_of_parse_audio_prefix()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc.h: remove snd_soc_of_parse_audio_prefix()
      https://git.kernel.org/broonie/sound/c/5a77906982df

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

