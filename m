Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643793CF045;
	Fri,  3 Jul 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079870; cv=none; b=l3/syAMJkP84bLexcOEUXIyoa/CQX8jEAZ1NICpzeJ3YY2DXMWF+cnfsWMz4PlRE8n0j/tIqxRS9FfJ/iDWfMA7bn4P9HAVE1V8fJSfZcveYrtNMhgqmhw+3lHPOIfGlnbK8UiMp4hRgMP8c7gl1mndZZWMG8mEtzhoauVH+Mls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079870; c=relaxed/simple;
	bh=bckwhSkxzr085hpd/6xu5/ypNDnaoNr/S0sDjyrITk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RJcas8EthBfRvxyydVw8E+WjD3xzSgpavkcul3DWg4SBQjEGEb/WQ/1BkaDEm3JX0cgj/ZnqSgs3FQ+qEsTLr09Boyj214euDQelH1AOjpGuywbQ1sEC8ZcihokYChPkM/WIyYEsdYeZMFRvwxWPFshnwMTUpuMbi/VmhVktydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7+Z056y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7+Z056y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E5E1F000E9;
	Fri,  3 Jul 2026 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079869;
	bh=p6b6Y+DSak3+JdzZWJWsijLGnrpm8jXr+o4TDfzkWck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D7+Z056y4PtrzxrR1iNdPQ1RbgEmlPcc+XaToXTXQ+mWNhZiI/ymi/+43Qa+/Uo4/
	 NuupDl30UndZnptXnUInEEZIyi3lPEWaQprK2Pp0bGSoPQxZSQHBgbzU9vdJMgbEqD
	 uJevFthw3NGyWMr8VOSna06f/pdU7WKpCYFKMamCldOi4aTJt5dECIUqdX0JYh9lT8
	 hPF6wKakZ7QYOu1C7PCLrrguOZzELdHVaalP5Gua7ru67o01ZOxfW6YoxiWEsC1y5P
	 G8A55GvIEUIcBePrUV/NRABdagJrQyZ5L/zUXvW3Sn/6ynymA4dqoATxbs0uO6xSqg
	 /KYpdcLH/QT2Q==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260701080517.298294-1-phucduc.bui@gmail.com>
References: <20260701080517.298294-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: spdif: Preserve the original clock
 acquisition error
Message-Id: <178301887364.189993.1312844450126342698.b4-ty@b4>
Date: Thu, 02 Jul 2026 20:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bckwhSkxzr085hpd/6xu5/ypNDnaoNr/S0sDjyrITk0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6O6hqVegcsEkLJ5TX6jA+EMBWiscQj2Lovrg
 DN967TWeHKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejugAKCRAk1otyXVSH
 0MofB/0Wj37zG1uZERgDFyIAdHiQtcIjVRGHDjfwAQlh8aStPLkxfUfDcM33czVNl/HONzXIPoe
 CTCI7vrcUO4lpQaZHlw8avUxGmwmlxdyPEuG4EWwYhSoFj9QHT4TR80dYzSDlO8qlULwxpRp3vV
 S9qhGAwkUBh0oo+kSliSCbrTcsBtp8zpO0XF9Kgl6ZqQAb+v1arOX2GqW2+G0/2zd0D33plIDER
 6rNja/ImenrUQjOcI0dA3k638Vj6hyeRqTaUP4QD1jNiHM7UTP/TPsl+1OZLdx+2+lFrdFeDUvn
 1St/Jc2EqI5SOiw25JXKPhrpwYe9KWoWhAqZcVz6U2jqsj7m
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 15:05:17 +0700, phucduc.bui@gmail.com wrote:
> ASoC: samsung: spdif: Preserve the original clock acquisition error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: samsung: spdif: Preserve the original clock acquisition error
      https://git.kernel.org/broonie/sound/c/bb7c62fdbfec

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

