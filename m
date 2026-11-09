Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270855;
	b=UnGzZMJ34hjbthISj35gOUfwzJ+qcmyZcShkz9RBTaYhBcpJ4ExdU5uThuB6THvyXTb8
	 lGdiwz2woPAldS5OmvbhUcqXsq9BKMefO06swYfIr29D8fJz/NwIBbk6H+RR5G8ZpX800
	 ETOWEXcnt8U9heecR98gdxdqGr9/Y04kcHmZg9UEmpDu05IGPnvmD+4DK3GahMK0nk7FY
	 ws3hCvR4eAkoL+IwRL696WoP3j2zdDjwA9e+SGOso4WDuS8vgvs4gxxCXbC8cNxeAvsuJ
	 JkLbzwNBND2JSGoD+p/WgvFbIiR+VGR1znyFlB1+C76atTlyPdH+mJdqE3lolLeHtug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270855;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tnIzvfCqFHwzNQKka03nDrEZbMwnoOvVTPeawrZs+1Y=;
	b=5FLlxCUmPLMFy9xKppXcF8m7bM+oYLy1yX/fZBW1SAbwKX8ldjvT5KTgXzRcGikUy0Im
	 RgghGSc1MEx0fCChec04MRf1th3/QfMLB/V2t2dgr4QGkrIFjMO+ws955yXEylXFumnf7
	 DSSka9SPznIRE+Hyu8EskuMt5I9mq/RKepuUbdabHEjLrhNemulsphJeDAWOmSkCDAGF6
	 gBdpZRu2mLpt6Bm2KgHB9ji4IITdes+lOsWEnv+qnXDhvLOts+wvQcB+hIDAIulzOWszd
	 2ajmnbYHmRXsu7LUSBHGzdeIFn2Vi2jiymy7mIqU6DSkj46lYePHiwINNrb2DLp4l9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5m6RYaM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08696606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 00:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5m6RYaM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BA11F008A1;
	Tue, 10 Nov 2026 00:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270854;
	bh=tnIzvfCqFHwzNQKka03nDrEZbMwnoOvVTPeawrZs+1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b5m6RYaMrBv/CjMgZdiwM+FVjiQAFCIWv3xElBdgvArvxtRYThbigz8ndk/bE3Zjt
	 F9JnCz/8Xlc2j7BTOn4F6cyMUrezPefB0q0JteczgH0NKvBpTlOGslaUtZAHCJ40OH
	 +GFAnoDzxo1cGf0EG6yNtt4tdenCcfCVmFYCEhbXX9IdsAfCE/w+AeH3IgHaWgMucj
	 Q0bTMrGt0PgzNKyQPa5sXLq23i0eGGyFy5mBJ/XGarKCZnuPVTrWUUdjgHNOdMpHq5
	 joAMV1nBqIgW/ahwz0Lq10m9yNqKwmDaLzZrKfJCPCBn2tZzn/zSF2fzqf03HMQ1d/
	 MqUnTPXaLExQA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id EDC1C30AC5AB;
	Tue, 10 Nov 2026 00:34:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024050.1508686-1-vulab@iscas.ac.cn>
References: <20261104024050.1508686-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: samsung: i2s: unregister the secondary device
 when attach fails
Message-Id: <179426364472.3711751.11426592031213468538.b4-ty@b4>
Date: Mon, 09 Nov 2026 22:34:04 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MZ2saOPgMfv9z/2seiSVI21xk3cY83Xw4Un9xVzUyM8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+pdU72q3OP3Rq9o7mXHehYJN9cmclVMNW7cmxY9aY1
 KJ6JnJNRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYS/puR4Rjb3Xi5mOd9T8qW
 NpZ7KbpcFGiyUPnoVLHAXPLRL7Z8I0aGS8KtZlW1TpFqKUJ3nuglvFpk0XRlrYtfnsT+o3Pz/Ph
 ZAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:50 +0000, Wentao Liang wrote:
> ASoC: samsung: i2s: unregister the secondary device when attach fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: samsung: i2s: unregister the secondary device when attach fails
      https://git.kernel.org/broonie/sound/c/4a2fbfc9acc2

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

