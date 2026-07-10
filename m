Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDAA3BBFAA;
	Fri, 10 Jul 2026 11:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684228; cv=none; b=qZv4zDZgyLKJZc6nkwcY54ZlRjUWlE8AQnkpfU7hLx9l3XRcVZtQ/6djQ4OPGDDr5blPIKsTrHGZ/J+pryDcQ2iHNOkpR1nkt/vtbehMkKdNlaAqJTBMtQ20vjDQJb6mBbU1ZwGct2M/eUmvG3U2P87eE3Ap3fncIFkD1EaWbWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684228; c=relaxed/simple;
	bh=oE26t6SzHPBm3v+GBffzKuiaIcAifEfqkVgsJ8OIymY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aQUFV96lNTfVZuTQKV4W9sfjuDg57g9vjDnnqpRRD+5e1ZFsgiH2WvrphYJwHFsrC4CEk1WgTpiZGp/qfw0hOE2WtmS4T3F9jMJoYyBNNab1ZXtzN5ZQTA1D2OtaU6fMkJJiioZuRYi8+PCurjRbzYVZQ/NyLw82QckZiDO/yxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1WkH0ts; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1WkH0ts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9091F00A3A;
	Fri, 10 Jul 2026 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684212;
	bh=bsJlxo79tUs6ukjieeUKn/ZKbkYedrpGz+lA2seyqJs=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Y1WkH0tsBn4kVebdmlT/+kyTbJu5saKU8kpMqUvr8oR4Uof5GE3D5XViFN9lbUGtL
	 IawpYGVfPbyhUyoI/QKO42UCEqrTH816H9C3TssPb49wVC8iQSG4xe9sp78504adiH
	 JzyvDgOQ/U6HnUW1dxJ69d13oomS94C2l887BAWF2ce59VJW69EDrLz0AxhaWvU52P
	 G4CQzCvm6u5IEOsBSqQUDWs4zps74X+gSnR5LConV0fBUXtjivd+Ig3A35V/3IGRdO
	 oLk7KUShiNOZGI0AAZgTziqkdltOYK+SpTFWd5wOHcYiDFvuhGhL9httW+pd3BYUcj
	 haVmsCs73ecgA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704073524.27201-1-pengpeng@iscas.ac.cn>
References: <20260704073524.27201-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt712-sdca-dmic: Propagate
 regcache_sync() errors
Message-Id: <178368418504.82617.2614473322286244896.b4-ty@b4>
Date: Fri, 10 Jul 2026 12:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oE26t6SzHPBm3v+GBffzKuiaIcAifEfqkVgsJ8OIymY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqyAO0WzUlT7znvxizO7zVT/dFu8ytelfv8pEVvVjTfKp
 OIdjwZ0MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATkbvB/ld42qELT/Zornyw
 SNCuhVvR1+hzompRyxmb5MbQIPar3lOZFSyz3vlv+2/z/H+MCXtvr8Lh1EO3jzOfi4vyymhcUux
 +f13W5k+bVqfNc1bKNo9KXv/4aLFioS5PxN2Ze4Ucn7Fo8Va1MhktLO1ePVdtQ+j5XOM9Yvfs3s
 u8afHom1zgvuVHdH7+qpuCu+VrTRg+8MsfejI56u6hq9bGIaliL9edvJqQxFwZEKX3aMH+Kamf3
 A8uMeDgW+xonLi53rXB4K3DTjnlnp75vx1LAqSSTF6HJ6tkVtrZ3bsWceXGjyuKPa+e7tvCZmYx
 XditljvA+WZNY2ngOtfFG3lm8Rh/ulyaoPOdMXaSQEIUAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:35:24 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt712-sdca-dmic: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt712-sdca-dmic: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/f814f9dfdc61

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

