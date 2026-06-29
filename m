Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2673FD946;
	Tue, 30 Jun 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818220; cv=none; b=cnJjFR9UsOhQzM5hqLeVZY4SVg7EDDkofcdVSCvIc1RBA5BtmSxyVcxNb8ANbExpLT85+e8hOSE0ZK/xT6oerXMCQdWORbuU+R/RJoNyOH1KjmugfLBlX2ENmOYSrQ79/6lj6gs5XzdXwNXaQ11z4GNJvQZXg4N7thoOAa2RDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818220; c=relaxed/simple;
	bh=R/gaHRpux3ocEeIL/tK2fTUR8/efhlo02ik0wV9Cyvk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nrnl46Pxqt/+LQ/qjZEW70vpAcUIfpTX2CT4xQ8K8UbNT/+j6Ok5/Y2tgU8bWqL5kI8oLqAquhSkJDu9ORJq98APX/7gC5f/uZEul0KkDK8oMoqWkAU31FR8nD5v9VBEQp0TS3AfEyAJSdP12aR011YWM1M4W7A5pFxqxnUOa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeXdT9qf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeXdT9qf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D574D1F000E9;
	Tue, 30 Jun 2026 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818219;
	bh=2gNUKMsp7nAKawenF5um9BvXPef6PiJDUNcpai3Kn0Q=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=JeXdT9qfhWj3FLrMhrSDOVIRe/84Cg5hC8UE7qIhREhWJQpNa+2ebXu+VnTOanejy
	 8VsjHvp75JZoqsbydcps5CJqHsK6dn3/Y02RJ9Ghy4RriiqUId6d6cJ1JhS24HF3AR
	 7mXwN58X5EMYeQYvCxEi8njeum68r/bMVW+R+rqQ/zv6W93O8XDVn5Tf+lo1V1sMb3
	 KG3+LVevvpepvZZCQSnJVtY5WPhw+esYc1ULfsCzjZEivNUDudj0DwdKhR6sSiVYfv
	 r6Et7ZH+kiWFJ0Nw9S7QalBiBCdRlcH3P7AKvCM98y2H6xo1CtSCIPNCbqyMkeFbfE
	 XhbNqycMULrzg==
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615064456.28615-1-pengpeng@iscas.ac.cn>
References: <20260615064456.28615-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sma1303: remove fault-check sysfs group on
 remove
Message-Id: <178275413880.47562.7056035464746462287.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:28:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R/gaHRpux3ocEeIL/tK2fTUR8/efhlo02ik0wV9Cyvk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6Woft2VQG1iQ37p1UplX6qZX3F1c7oNNDH1+
 E3cu9iKkvKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlqAAKCRAk1otyXVSH
 0N8BB/9QoVaeZAZM0tFEkf6O3XAVY4AHbEPwfTeToVTTWh9OtNxwICmG33T8dEQb+beij4NQs3J
 GuEJ4YJqU8Z/jZLHCtreGUmYpWgQ6GbVMrE6bvlZoQZnag1O2zp/r+9soNOVawBH7wzZmDGDurD
 Bx9VkKcYD8YP06Egwm9ZqJN0Ghl3l/uF8qg+PVwRbgQwls30aOTWhapMftcDfBq80MtL+fe6VTb
 lCuvVVKtAEFQId4OUiGY5Add13SdWCSLPKFQDTAo3gm08Av1Z2O8Lhum7azDhmLRjTGNUR11YId
 UUtqj7+WA5WJLV+sCX+ofP32WuMGHaIwhs69ICljZwGSBMhO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 15 Jun 2026 14:44:56 +0800, Pengpeng Hou wrote:
> ASoC: sma1303: remove fault-check sysfs group on remove

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: sma1303: remove fault-check sysfs group on remove
      https://git.kernel.org/broonie/sound/c/ce3733792d38

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

