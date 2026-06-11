Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BB34403D;
	Fri, 12 Jun 2026 22:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302690; cv=none; b=J5NCkr/5MtaLxgMot2kbQkD2JMQQ3ppxx7cJ+c9NzrOiC6eTOUt2nVeeezaJfYiNzx2YRqnAZbUp64uZfMxT2frmzW7wka1uQY6efyInf8ahLKgwO7BoWjj+eCATKFbhPHYa94qjw5+tAyVdF5Q6HZMZ6NRRE/1AVcI+AgNLGY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302690; c=relaxed/simple;
	bh=iMQsDNw1BUKEAloi9QCs18dEc4d7MwRODIFEsQKs+TM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LEcASt0ghmof8O6e7eKHUutMPvOCnUSZv2zHE6OPOabmdDJW+x0OvdsJVaGslKxZNuXVpz3jLx5YXKzj3orl0ym6qnJLATMO94tMKEMGDvcFFwz5K8A9PK/Fe884jaAUf6uR+Y3e1HrSb8ipl6DEphIcabgPr4FO57NyYHP6KPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcXg4nVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcXg4nVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670D71F000E9;
	Fri, 12 Jun 2026 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302689;
	bh=W0yPm8952lH14kogup7Uo6TjIczd/TW/mJFvsZkfNtI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jcXg4nVd9JlTvC242kc70o8iUkHKfAn0KC2uOkI/twKqs4QErL8aS4kWsHPbyF/0R
	 0VJcfdTLfQPr6juQ+fk9cDYhoSrFhv5e+YdemF4tdAtHFrvEoLywA5HIv+j/XFRfne
	 vliu9mYKEfqSrvCGzfDIoK4qz/pXY/mCi8PRHb1ePdodLlOstoYyL0DbOFp13hs80U
	 GaS6nNa1+evaUYMwODxsvPXHwUIcbQ67OL+/xy0lmUzAcBPjhRXIFX6nQ47jllcM1s
	 Oqy3/1/9Ww9yT8Cv9Ebc/tLKluTdv6v0vQkG3LnwI4upGoyNbNTvOzXLJva8+Ax96q
	 BzyrwxlkLqvXw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260611110856.1088110-1-rf@opensource.cirrus.com>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure
 correct suspend order
Message-Id: <178120672426.467928.4198249826821953523.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:38:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iMQsDNw1BUKEAloi9QCs18dEc4d7MwRODIFEsQKs+TM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIWessYmHNRSSmrNfaIV6CnKSJ+UKigcWq1uK
 UPW7cjhHbuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFngAKCRAk1otyXVSH
 0MpgB/0XOjke4wxfcP9gxz3ZRbtTMsDclAVkNVW91EWg/JC7Opo7a37u+az/hXMkoYe/Jy1vMza
 7tfqwNDwVV4f+C0u898Rs4DfeIf496ReLqkJ3Z0l4tIrIaXK3zXObQp0GHHVhxzxSuwcLFsyb/X
 BtL63X3FwEUTufLxSCFY9c6f1HGjgP96lSHbLjNUuIVydR8/VwIeuTORlOVA2U3AcRglR6ZLcYU
 U4F9PPFaeWde0Nh2OqB3i6lfdJ/FmKFKsTXAk4+sYWBi2PoIlUNGLxQq3Sg9qRl+N+xo/qTR35w
 08XtxFVFUOVYBCnGGzkdwykLE0CEnlaChJ3X3kcCicH7OAHA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 12:08:56 +0100, Richard Fitzgerald wrote:
> ASoC: soc-core: Create device_link to ensure correct suspend order

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: soc-core: Create device_link to ensure correct suspend order
      https://git.kernel.org/broonie/sound/c/0f54ce994b23

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

