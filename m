Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936FE3CAA51
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445291; cv=none; b=fvQmrq4ZInrTtuLVTkCAEZ+1k/UB5YDOlvi2+sJTFcRfPYjOs6HWSzbvADxQ2yL0KOkm7ryGOiEzr85gahvBVWz2illxziM+ZVa2NhWJ5MCeqNqEIw+kXJUvf7Gq0/hDl4Nn1Z8Zlr+RamQrDqhWrM7OsII0H/8ByC4rk90EuTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445291; c=relaxed/simple;
	bh=t36M0m7/mX8Q7cRX/L5e2FrudsgJfqS+bP1Sh8B5ZWI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QjEdnsD89EgK/urYQBUmEb25p6Br/j+N1LSIGBb2dWOqOmKhRmbvbrGEOxpkPm8pae5NDrXZ5iy+uXoDjrgMichsUwUdzJ4ZJzPAgpH35NxogK+tPbHSS+e+8FHvpzFAVTGikn7QLcIWCAwdpROecWzzM8oA9Sqv2rjUxTD0xYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjUeyJfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjUeyJfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88FD1F000E9;
	Fri, 22 May 2026 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445289;
	bh=HX/j0VdJFHvcdq1GnF66YN6iLiIpnq9+7BV8LD3vEN4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=kjUeyJfGKXbqK3I3eWn5ZjOLx4LT2imG/sTFLe+bUinsY5NIsR0D5t2ZNrMQt8gbD
	 H9NHcI0Oy2njDpFVIYUk+Bl+c55u3tN+rjxXgYAv6cRdqxihWI3h+SKrAzvYC68IL0
	 XARzjpYkgIAC/7bO40vg3TYJ5CEatUizAdfPm0VhofzBRC2x/oeI8+Yb94aOPE14HF
	 xfqBfOam6vl1sGLmUBOplTTWy66xyTaFoxmGbLYC5yIFO6NB0x2BvNLgyv4SpYNdXk
	 z/WDXjlRtaAMq7HYdwUi/nqnuh/bgPOe5VGVMAi6CAspiE7OPEEQmX03kwrQRJO8yS
	 A5G1y/n1vDovA==
From: Mark Brown <broonie@kernel.org>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH RFC v3 0/2] ASoC: move card->pop_time to soc-dapm
Message-Id: <177928061709.56665.2501568701025122126.b4-ty@b4>
Date: Wed, 20 May 2026 13:36:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=broonie@kernel.org;
 h=from:subject:message-id; bh=t36M0m7/mX8Q7cRX/L5e2FrudsgJfqS+bP1Sh8B5ZWI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4mmFaVzY+YsRacksk8ZR633Tfr3oigu0/t2
 wi9v6BPd4+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuJgAKCRAk1otyXVSH
 0CQYB/9PX5YkTaXdIji+yaMLb5WWl/MRVoJaAstSFiivQHx2/LPwAR5QfzdNfaFr78PPL5mPzD5
 DhnsMHdW1IWa7UjD6g9/k6Dtwbesa9s8sF1O3Ya1a3Pl6QA/2q3ICuYRblAZta98i+ARKfoj37c
 CdVgjewpzt6nM46WBRw5ktsvk5s2ak1v2TAFbT6bpugX2DIepHxjw9tzrJWQHJgJC/CpDlnoOiz
 c9LlTdY/ttCRwnWXcqo3GVkvyyhlQ4qmabcLajRsKjzmhzvqjSVs8pfilShgoKmlDfmS/vp34P+
 OgPI8SIuMdO5YWosQQ7R7/+SJZZGLq0Jh3vfF0A3jN0UBAYt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 12 May 2026 00:47:22 +0000, Kuninori Morimoto wrote:
> ASoC: move card->pop_time to soc-dapm
> 
> Hi Mark, Janusz, Peter.
> 
> This is v3 to move card->pop_time to soc-dapm.
> card->pop_time is used only on TI, and Janusz posted patch which will stop
> using it. It was posted at 12 Apr 2026, and [1/2] is it as-is.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
      https://git.kernel.org/broonie/sound/c/446c921ecedc
[2/2] ASoC: soc-dapm: move card->pop_time to soc-dapm.c
      https://git.kernel.org/broonie/sound/c/9639a6875ea9

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

