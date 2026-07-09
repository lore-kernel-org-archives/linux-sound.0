Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DDB41B374;
	Fri, 10 Jul 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684109; cv=none; b=O8bkxGQCRIyZUZ48NznAQT17zGKr4ss/KJU0DDePeuTeOknLcaxdqwyZyvPUppZ5YnVq03IrxnpR7pYrn1oe3klQDeyCgtdRL17Ge5A1sWiHc0vBQYIUaK+zaNhz3xodEWbXrlxISuoD6XySbzC4iml+nyr+EtPD5VPAo5mluJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684109; c=relaxed/simple;
	bh=Nd8zM56EtEhLIZvN7s7Qw/V9vUxZdS/4PDE0PBp08as=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vGX6SnGErWC1INcsL+k6d73+YppDpDcmcOJUjrsPsBxVlkZl+YixPbmI8jcRfom/gopCe8g03WskwBtlpwuEsYihifUIhTdGG+pB/jjkdUnwlrXRt1hNaq6kqFoyYF7BjAy/15cIt6UNzyn6dJMPGui2K47GsBv0mRDOVDl+S2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kD+pVKR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kD+pVKR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB5E1F00A3A;
	Fri, 10 Jul 2026 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684091;
	bh=/rfzlevA1IKI2OTtHUSVT+9J/yxaymBjsdxfPYckIjs=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=kD+pVKR44xSQvGrAT2VgfyZqGZGkKPbvO+zJdAqzX8hJCVSOVs1CwVk6+JbZOgksD
	 jmaly2S1myelnVrZMijNhAJrJF8WPKMHSdiVWzh5rDZmGuyDG3wPmXUw6n/MTnADOy
	 NfjSAaPLm1IHu/jZxxURdwunK9xYmd/zkNqlocLGuVi5dS2T8KlCSV6Omlhze6dtSk
	 1XFYaaG0Yn7VQv4A6a2l19oYms4Bcpgx/lfjtv3BMAGcQnx+iXqFdt25uy/mAl0Jj8
	 t8y5AItX/y2UYEkAw8fPCNpv2stlZdi0OewCa4d6XexvujXlAe60SVN8MKDpm9KHsY
	 whbbhKXxOL8sw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072031.60768-1-pengpeng@iscas.ac.cn>
References: <20260704072031.60768-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt5645: Propagate regcache_sync() errors
Message-Id: <178361250310.100558.6131491928425615767.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:55:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Nd8zM56EtEhLIZvN7s7Qw/V9vUxZdS/4PDE0PBp08as=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNv57iaCGpLCEOs9y/1T5fDwhy8RWaDXFCYdH
 A1Gb7wheh6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb+QAKCRAk1otyXVSH
 0O8vB/9PUy7MaOCCApuVoM7vPMnxuxWusL/yCP+xJNNUqFhdOEWfnSjyGoUZtNmvTujvTM1NrkA
 mMukm2JMleQZN459vsf3iHY274mBIDdqm3TVjJjvxvzDdNONNN9gLrMR6U03QowW+E4Y4nfSaG6
 QbM17BoZpxXAu2RjvwWpnw68YHk2mzqr2PcWa3IB8o66xAomFBgQXx3bX0IL7fNBNLEHwT6PucS
 KLxUgWUBj7rQqGM7PUYVN7y0Hzf5Z52nlcKMGA2vu1sJsXxaAQ/lGzWXAasBhWt23OHKSuZp66b
 kgoxHp1ExIlC7qkZxmv7RFu5nC3mbkICTmKq36tO1oxLUxO0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:20:31 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt5645: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt5645: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/ca571406c521

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

