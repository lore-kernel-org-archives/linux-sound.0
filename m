Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33F435ABA;
	Mon,  6 Jul 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360508; cv=none; b=HwPh4zxs+JuZy3PFk8xAw9zd2t3wVUvKHYXXfT6LQqi2ke9+UcUTEUuJpAK0AF/v1k2iNInOSg88Iuk8RGFdm4K73sTXkdPYjWMajMH4N2Bs9SesAx9uXuRrqnTGOVDqaS8Luw0tdCGjtux0bawoNoVSwiQsvOUBVntPJSyENQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360508; c=relaxed/simple;
	bh=PICRQJGRrzQNsBfzm2fgWXdd2PuF0nOiT69EGfnqVn0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dAFgxDbIaMSAYzTdYJnxtQaI0IAljll7U8uHn7U1FUJjqPHXPnfz1WhzzBJ1cOMDDQjgi0QSjgzbYW22vf8whc1QO0p9SgEnX+zt9dcwKNZP8j/Wp9W3BYR0SKI/5wkSJWFq2ot9htQzndoK1GBaY/nHHlho3cdHCt7zVxXmolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8AP5/lE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8AP5/lE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4471F0155A;
	Mon,  6 Jul 2026 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360507;
	bh=B8sBgJKnIQQRJAiZ7uc97qzVNS8K8qCGW+K2v2dYugw=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=V8AP5/lEq9gweAdrgs50FyUS0j4i3JWO7HV3k8Ei6cV6y3EYDZgCSoXrqnEV0JCjn
	 mMsxnsB5HY89PcjYc5ceyae1C4GocWcBZbm1hE+bBMbUKp+3rGBy4i9LSvoGJXICk9
	 pNjVkK7Qy4jMsKxb3DQ4jlX0QzHWJIm1QPJLTaMdbEsstumCGF4BBJi3XXW6F97kB1
	 c8SbwFrmLTajljxN87CHVHK2lhSwNS6hd6jKASazrR5m5s99aAF3+XHlrgthAfx5a7
	 MGrulHG7NglaaZtnEjztt+8qiqHKChcB248B8wbH8yatqG4AiilpAu4R3DzcSEy85V
	 Tbcc/HpKEuc/g==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072712.91035-1-pengpeng@iscas.ac.cn>
References: <20260704072712.91035-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: cs42l42-sdw: Propagate regcache_sync()
 errors
Message-Id: <178334300484.57168.13487976770634742833.b4-ty@b4>
Date: Mon, 06 Jul 2026 14:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PICRQJGRrzQNsBfzm2fgWXdd2PuF0nOiT69EGfnqVn0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS+v4TtF+lYluoA2jegp3mmRK2VDVLC5Bgx4Cy
 3569TXStzqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakvr+AAKCRAk1otyXVSH
 0CrjB/9k/0JXvAlYxZ15adJDSzOuhIkt8BjbmY12G658m8g7KwnWDerGLNlPKtJUxsRY5rGS8t8
 founoR99OD45ggIBngYD5P0GhsEAOWJS5X1w79MbfQry1cMWEaVe0Ha+9DENxKEWFQIhhvOomN/
 OVlOTvHtF8SSW6m8R+le6CzvoUfGNKIkN7mIYlXJQjwoO935C4jUhI08yUizjkZqLae55NGLxxw
 Ng+Q6O6v4hdWa/7KkayFePTRzBOboNy4ea/2VYbInZdxUuXgC9VrgE44m0xw4AapOTKZnAy+kSc
 j/1UqKTppxgGhCUo6aF6bOTYnCP5HiJA3m4hukdwRYc2MNwn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:27:12 +0800, Pengpeng Hou wrote:
> ASoC: codecs: cs42l42-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: cs42l42-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/a118fea777a2

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

