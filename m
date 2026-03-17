Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BED1922F5;
	Tue, 17 Mar 2026 19:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774970; cv=none; b=gC3JY/OEp2ey3v5LWNntBKwD6sKmFCb/xkBcylOohNMVTeEC0ajCj9vXifkFVYGFBu12+nl+rshl6yBT/CK8cWmOCb2eFfqf8aqSZg8v3iAhYnM+XzTJVGadfwyKRosKmSggCjfqYdKJsumv8GSt/o2mkWT7S6YBP80KcRsMTjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774970; c=relaxed/simple;
	bh=g9tRQs8NKL9NkiNpRsTrO9WowcucP61qc0yxGjf2Vag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=szrssbf0SW7H+DEtpCP5eCzZQbRfFbOsRE8TlX6JqcaqvN+BMLy09WCCMiWWAaLRJ2bp1X8n5mL4ak7l/6GwKwSsZqIEtEQ1AXv+4dPEJedmIjvm1qu8kRCiv29LQCAyOESz/XP5hLABvTvYjnZUjccKG0dvQBAwXt5rVdw4WjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bILrgKv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bILrgKv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A173C4CEF7;
	Tue, 17 Mar 2026 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773774970;
	bh=g9tRQs8NKL9NkiNpRsTrO9WowcucP61qc0yxGjf2Vag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bILrgKv5uHdXEpBdW7W9blq34+mH1eS/f3uXF1oUY8l8QZV8gxVdgO2IQJI2Gx/b2
	 W5bmK5UI15wH+YowNiOdbMdmjhZyfAW2WtcK+4g6hKSsvVF9b7n1ofIXnXPQXTZsYB
	 SvkA/wQmkPNXsWD7nUtMEiCYIFnFsTDu5KvsWD93Bjar7G6kj0rVtvjratRalC4Yhn
	 nWuX2Lbtk5wvZnQ61ngnUk0BuodkdzY/8xEm2YVIb77veinDwhdu+syFnfG41y0oaH
	 XRShqzTvqfaeylQk3+VUcGBR/+uT175GYzlQUxmO6LU9ADmdZ5cxCGI/mmDyhY9oXn
	 sVy8DGHJqM4mA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Zhang Heng <zhangheng@kylinos.cn>
Cc: talhah.peerbhai@gmail.com, guspatagonico@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316080218.2931304-1-zhangheng@kylinos.cn>
References: <20260316080218.2931304-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
Message-Id: <177377496816.749414.4162423951106109192.b4-ty@b4>
Date: Tue, 17 Mar 2026 19:16:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b

On Mon, 16 Mar 2026 16:02:18 +0800, Zhang Heng wrote:
> Add a DMI quirk for the Thin A15 B7VF fixing the issue where
> the internal microphone was not detected.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
      https://git.kernel.org/broonie/misc/c/1f182ec9d708

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

