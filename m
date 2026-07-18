Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21103283C82;
	Sat, 18 Jul 2026 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411804; cv=none; b=nRdS12A5w2nakTsSOkNk8mYsY2fBJNt3KdOtDeMlBLJ4okP2vqeJcO/SMpJ5KbPWhfrjWTUQ5aUI9nENfpP3UG2bIa6YOjGLtYOkXNWVoyL/Uc6uuA8ufO2Z51g81TMDQJOojS01mSJVObQyhmEFdRnioEAfSAMKmVIotkMQT9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411804; c=relaxed/simple;
	bh=mPHm8Q2Vgmz/I1ZJxFAxKg8vWOTyEvnReMtWu/vu+j0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e+OTi9qN01mIZ1FfOip33h1Z1WQtl8up6T3f7teOlArR5LoUMMaQHDtQqZXdFfiyv1HsLRizRrTzEWd/tO5zSrgy6I7/+Lf5/M3tdIkr5ZER2BmKC/FV3bi7WUXFs1vyKQPdYEvIhLuFy0IpIPdYfJ6D1aSfubDlueUaCfFqjtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUNZnkzY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUNZnkzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB1E1F000E9;
	Sat, 18 Jul 2026 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784411802;
	bh=kqDtBI6omrb4B+2/zAJlnPnLXvXuzlqfjpVcwZ2x0fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DUNZnkzYqHt6lJFdaobZDXYtgNaxGEPpctTMnevR7hSLH1sG9EhTosQSLaHRObWiU
	 CMDwg+fiDIEQ2+s7jXiJlj6YI5GJTkX8HvqDsgGc2UKXxjDAGs4iidE6IekwSy051p
	 51Mhm2Bo2tocT21w9b9tPBQ3Soy2i4QgB12BMmVfXnKyXoILuELlYCD07ED5z9RbIh
	 gqCO5MWiect4p8Q/WCFX0fzFU+gDFxl00pteZXSy+RnQqm/l4EPo9U3gpvRryCSzBQ
	 Y1BHoNkAx2DtU8WcnKzm5FilhGaxw7yJlUdqkygPsa6rf1592KdekJR6FFBnD6DeYw
	 FUde9A6AtCnkA==
From: Mark Brown <broonie@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260710110249.31830-1-phucduc.bui@gmail.com>
References: <20260710110249.31830-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: uniphier: Drop redundant error messages in probe
Message-Id: <178437738447.5332.9602281327457316152.b4-ty@b4>
Date: Sat, 18 Jul 2026 13:23:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mPHm8Q2Vgmz/I1ZJxFAxKg8vWOTyEvnReMtWu/vu+j0=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGpb9pehlMHAL++fmF335l0tX/GRozhra9KKg0H8SFXNLXOsZ
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqW/aXAAoJECTWi3JdVIfQQeYH/2W3
 4jN13RoUVe8uAmths6tGOYKhS4mlNJX2EgLr9nlMVom4pMr4N57uIrkIpb6lVu1IVhDcwj6d4ds
 cgUtXt34IFuumHJMCMJ4sVjd1n9tEfwtCN0+W/SQrQVsjF5WSEaT8i4+jwThpxYTCHETTQ4RKZ/
 k0EXJYNOHr+j87OyS+32lP/AqVKW1ksrAXZF9XyTm4aBJbLnZwsVvg63TszJYkq62nqbDYgtzOy
 HFVV0m0RBB1IJz5hfUjYHhR5JalOG4eOWkN/pzWmYCe5xJT/5JYzN6uhU4TnRL9Ou9gkkhFkSmu
 iEFzPnNhBxu5LF4cSw+GbOjaIW6YUDT1LoKB+NM=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Jul 2026 18:02:49 +0700, phucduc.bui@gmail.com wrote:
> ASoC: uniphier: Drop redundant error messages in probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: uniphier: Drop redundant error messages in probe
      https://git.kernel.org/broonie/sound/c/c89b22faa9ba

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

