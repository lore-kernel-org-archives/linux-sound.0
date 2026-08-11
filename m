Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FA41DEE1;
	Tue, 11 Aug 2026 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485985; cv=none; b=AooTdF1N37UPeD9D20JBMAVfCHHYLFyCF3VjOXAptngsIav9J78tG2G/6hin3yGIAa6yV70v+7TTSyAo+KnHMMIpcXDWSrx37LdOoJ9EsScLBsskHNUCEDCzgNxhZwD/SGZ+RSJezqy5XZsgITKQm8lP8j8TW6KQPLRiK5apYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485985; c=relaxed/simple;
	bh=lT8oWF0WQdD6XkHgGYHHMI3k15ECm80JYCH5hMFT89s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T8f4UTsynJrwPUNcwjnHVNDaVX9Q/cEGaKfNHnxD6g6Ik2PvsXWxrVfrDHQDT3AFB+XNI3m6vW8Q8b6hNONiYBgYudDpMxV6UxUgFJGSU+tA2DMK9s6ruWdzmD6oOfBLOj+kZlSHpZQcr5Ofc9OLoUSSqXKHNNlcfgKFR8TPHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jgv7Swcu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jgv7Swcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79241F000E9;
	Tue, 11 Aug 2026 22:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485984;
	bh=25oBiwGv8nzA9YaDGLw/4XTszRQryRlb2s9R+g93bCo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jgv7Swcu3OmsU9zLIPMCSbJXwRxAcNT7O990na+51YdJ6E8cZ5jBKIHDFxw+qDkbU
	 KldIy7pQ0gZnQXEYpc3VRlF2U3ZwwdMagsoi+qSbNX62je9X0vypalU9QAfSfQtH/F
	 +0InDfJxfbTYkoSQYvPA1+l3RoZiJaAzYQoRvsFZx6r4oxfM891ngAymCQhDqqh1MR
	 fuBAn4DfkgJWw1E/yVE+DVdKxsE4gygwgrfcVa5GCuoUinzfAgds66PC8qo7GO+7K+
	 ZmilGPMnFdg54JP1+uCZmtqA9YdxbpLf5wpWlRSkxR3owXgYfwAFh8lQWe6pi1EG47
	 xu0JkWojRVgbQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260726211226.94059-1-jorijnvdgraaf@catcrafts.net>
References: <20260726211226.94059-1-jorijnvdgraaf@catcrafts.net>
Subject: Re: [PATCH] ASoC: qcom: q6apm: keep the graph start count in sync
 with the DSP
Message-Id: <178645740459.119683.12452489679317005285.b4-ty@b4>
Date: Tue, 11 Aug 2026 15:10:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lT8oWF0WQdD6XkHgGYHHMI3k15ECm80JYCH5hMFT89s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe5zdUbWF0FqLUSAXFII+c7Roe1nbUTsSqGkgt
 kSdBjV/7v2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanuc3QAKCRAk1otyXVSH
 0IG7B/0RWOtOKWViCtslFUQN1MIEf36qtFCZEgRBRuK3VSKH5+43GSYFa7eAv5p6qGVyF6SHYAU
 UxBh0z6DNg0MBTZ/1funXlbyGQ+rdhGrHnZz1MGTxxMQMoctdPI6fZJbmepN3/sHA7uE5t6Etre
 9H092j4tuW2bfu7Ioj1FdiB39gais5g8SFVBNm0AcCuOw6EO0S0zOZi9ZBahhcFBH6KISxBxf1m
 7d9fj2cRvtbwfEwDktdKjrPGbwYQAW4yXqpTduRgrR0fxE6ILD1QgBrYNyvt9raSDD+CcnTYKsa
 c0j7wT3k9UcrIuUWthvuOcy8Rr2byL5EHNML0snH5mSgF5hF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 26 Jul 2026 23:12:26 +0200, Jorijn van der Graaf wrote:
> ASoC: qcom: q6apm: keep the graph start count in sync with the DSP

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: qcom: q6apm: keep the graph start count in sync with the DSP
      https://git.kernel.org/broonie/sound/c/daa7ffd765ae

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

