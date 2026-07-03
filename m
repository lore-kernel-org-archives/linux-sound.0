Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D63242D9;
	Fri,  3 Jul 2026 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106358; cv=none; b=PkmuZN/q1n8DK5hMOINWjnRd7GpKZDL2SAgzMhP+zi8F6QVIkPJqV8q7nsxHHpQqx1Z6RlaskW9pVWEwFaJifq1VtG9CMoP6N+FxByrmmlKKfdZe8ic/UlR5kLMDV+pE3R17ltWdPEahFJ5RpowmRI2Nb7jdaeQtf5Ze5LWDJyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106358; c=relaxed/simple;
	bh=wizO2QcXqseX53RH9rKpue2gVjxakogoUiQZee0Y1iE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S2hUe1UMXH1wqsFcEAi7nkWhb83auMCmhP7sbSAQSCRsXxme4bxX9zKr4pcigE1gQbXfAs/V1/t5msdFZUCHm//uJ+htuUhEx9cB2eeGfdHTpDZdJxjQYSFS7QCxunyyYb62SyDZvPjFhPIy0RFXJgmPjKFr65Lu5H4NyB5qoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YShz6RtY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YShz6RtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D21E1F000E9;
	Fri,  3 Jul 2026 19:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106357;
	bh=r5QBnr4gt+/kEF5udg+GMq3wIzNWGwoayA4JpZSkTCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YShz6RtYZ1LD+pNpd12viN/vGa6+UOekwUUh50yZWdI5qtsEW1JYR0EedbKeOAjla
	 n9A2gA4xPr76kPZnpFUQXQoKtrQ/K1Jkr8LX9M7ycSKvudXzd11nIkKhEJSaSv/62p
	 N531Merb6uinkrvAew+YwxCfNSf74PFELBHIfkAhYYY+QQtMke0l3n8Ny0airwtKXV
	 2RZl0WgcVMtmrlg/KQQq0v1YJ7oDgdSzg9q2Fyze1wbIEbKwpQBgMp1/vWhmIRh2GH
	 UZZMBn6GrAjVnFePgZQmVkPgeddjf2cwkBFOwKsFalvPjohxDpjxFNi6LfsESq1YII
	 nD1qPLqRc4s9w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
 Linus Walleij <linusw@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
 Thorsten Blum <thorsten.blum@linux.dev>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260702072918.85779-1-pengpeng@iscas.ac.cn>
References: <20260702072918.85779-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: max98390: Propagate regcache_sync()
 errors
Message-Id: <178308783942.53103.1959643438017807931.b4-ty@b4>
Date: Fri, 03 Jul 2026 15:10:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wizO2QcXqseX53RH9rKpue2gVjxakogoUiQZee0Y1iE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqSAsy6+JlaGQc5ltoxDPI7wvcZ0N/nKazv13Ql
 6Z6edp08BqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakgLMgAKCRAk1otyXVSH
 0A4rB/wJnhQGSICVWaV1Qp/sy870niDIDc060abONwCnfeUWnRIhg97ETaFeR0OtxVEmCVTfqBW
 y2vvLq16q0oWnw8la7+ugJaqCsRiiogIacw60mjU9vIla0YsBt/eZw532Or0SmnYAHL9rj29m3p
 NCmL2GeB/8QnJmGYWF7xm0vDg66fiKAof9gumDUfDYsxAXpZ69CE6wdnCUgHJpqdyoQA+oAStIA
 LxK34k6JtIeqTAbmJDJ2i1mXH8rDkHPNzV4l51YkDNHb1U6MhQ4ZPCWqpt/kzUM1DMSoJzLGOdh
 v4+IoX31zh5ew9bkLp/qRgrK1mKRxgzXJP+k7P3azlgMCJAW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Jul 2026 15:29:18 +0800, Pengpeng Hou wrote:
> ASoC: codecs: max98390: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: max98390: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/e08d63e63ac0

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

