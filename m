Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13853F1647;
	Wed, 22 Apr 2026 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887873; cv=none; b=H36EA+iVPmuch3WxDkLpB9nSWAs58FSUae9hETgG5r43pN2SikkPFWXfzMITO8U8CAz1Xgxwq/oqJVixaXetssi8Uvodfj4aWujujATulZWLtB4nVqGYNSjbcvr7prTKfcRjuBelDzjQieniC+utUj4gw1sUMwILF/LdP19FqfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887873; c=relaxed/simple;
	bh=p4/y6fn8bAiOkuyTdAh7I4xKwXn8sDDrDVyIe02JmtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PTKWjE4XYDkwu1jfGg0s3ycIXftRojWBip9JkUoOxHAA1UhtFFDsCH41dqkfwKzz2GMR6aJnky7eQOIft1U7AB4FnQ/G2hdo8Spi/nwSFfHnF4iQXQW50y0yiAygVOV8/VrggggReoWCi4sTlrMjDfaGtYuOxvX9kKFelu5Ak78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBWFlKpA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBWFlKpA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A127C19425;
	Wed, 22 Apr 2026 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776887873;
	bh=p4/y6fn8bAiOkuyTdAh7I4xKwXn8sDDrDVyIe02JmtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fBWFlKpAqew0XhivZlCvEN1QgTsdxIcKT+woozSoj+XwCbTTP/wSiOfILnC87TBqL
	 v+nQKLgBQ0rIHW8LGe4hUBZqrg7bHDRJA9A8OYAyKprvb8D2YOEHGxqc7oeAyVbThV
	 z/TeXx0ekIylIFCjqKp23PD6Dcb0S7+pFWvnSr03Cn0UegIrhDaiesv4TzevphSzdF
	 8xcy4SVQTSafEvSKE73XNICJ7+ZZ8lqpwKwvKUOMQp77qHJIAXSbU9qf3ag7Z1of7I
	 r7RQznP/yufRL7ljZqiANrD7F9EGXtSlOURqjjrWp0svP5koBDnCD+FXfRC7D8xFmw
	 +Bi/oxez8MKzg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Aaron Ma <aaron.ma@canonical.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260420114823.194226-1-mstrozek@opensource.cirrus.com>
References: <20260420114823.194226-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v2 RESEND] ASoC: sdw_utils: cs42l43: allow spk
 component names to be combined
Message-Id: <177687003362.36226.1621071517135092569.b4-ty@b4>
Date: Wed, 22 Apr 2026 16:00:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p4/y6fn8bAiOkuyTdAh7I4xKwXn8sDDrDVyIe02JmtA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6Sg/57bFIEzEACgpd+3xNEifQDfa525i3GhJR
 myaSwF5Kk6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaekoPwAKCRAk1otyXVSH
 0LS/B/9xPd5F5Ri6hdF/736r//jPt4XTuRNc5DsInzgpexmGQAhTHgx62oeKEMbjhtgq8mgOp9p
 6BslaqFcW2qUNycyG2r/UF/9Z2qZellWI2c39MV9+XW8gHeG31ZTAWSOo1upX9L4LcXuqwAEfgT
 IT3sOfAc5DPjGINh3eC0AvNriKpLdHeASSO/MkzNNQtepnHIZ9bEK1f8jpwZkbFfwy6mDyfvB9Y
 i8Itg2vjJ6YNjnfByrf+RWKICncAiNIp2OaDfoSVNYqM5MsRS3aMpmsThRL+K0AH7fsor4QP2cc
 szTqg0kfyNKcF+Egv9JZhCDBT5NuxyGGA4O9oMi7gQLwpfgm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Apr 2026 12:48:17 +0100, Maciej Strozek wrote:
> ASoC: sdw_utils: cs42l43: allow spk component names to be combined

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: sdw_utils: cs42l43: allow spk component names to be combined
      https://git.kernel.org/broonie/sound/c/87a3f5c8ac20

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

