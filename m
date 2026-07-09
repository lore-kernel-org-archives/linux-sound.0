Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40186421F07;
	Fri, 10 Jul 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684113; cv=none; b=mckJakmIvTxlbYtbqbAqdGV14SR0Zj3RCTWxwvzdhmmnYbXMDuHNPtKkk3IJB9pmOjcgO311qfYYSSF5e60+l//az83pJQvQsYAXrEjVzcBoePb4rpsta1H8gfnk4VRpqT2dfc5retRIlB42dJXZYnqRbZRkqLBGvrRDdwWd0yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684113; c=relaxed/simple;
	bh=Oi3kBcdA7vBxUaztFWNWkUs4DUz+EjPQ3gb59evsaX0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G/yGcBsEx55nq4XrERtpDqE2w4fTbC4znn/uA9cwS8GZfM5ikTEJyx02D6dLkQl/KqNwRdqFvF03Ye3MaCx6qFo7Bz5/0I8lqJbBgUESk9M57cw7UzWAZhNDFwjq6Ey7xbN9a5I/27NpTrU0D5a5FT9k6OC5TLG3u/hvZqoX99M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9ywmmhg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9ywmmhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85CB1F000E9;
	Fri, 10 Jul 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684100;
	bh=dTYxCbLnQV8Q/W4HeeakSMN9q5soSErVu4t5hx5VGdA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=f9ywmmhgGaNJY06NY1AmwU6X25Qhk313ClFdh+E8mhiQ1w7BDbSpl2LXKRt7++ucb
	 NbKf8ZmE5kSwlu0wZWRnLwyyJsiGKCqj6WnRi0MDoohWNqEgAQE9dcgZ6cyKDTj1+4
	 vW1QsxgnF4syYjF6HZkEZLiLQHxm27sNAIgjc0SNU8V7bKlhL4BMC33RjNMMWcAeh0
	 /UytYHkur4iwYpLL7JjTgpjZNo7p110Aj3WFt6676REJ2IgJQB93nJVCTSgoedYrox
	 LxoOcXoIFF+frP7JQpq0Pee7suONU+BfCg/v/WUFXFqBnDQU3Lm40ttFeIhLpY38e1
	 TdF7BUdzs5U/g==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074350.53023-1-pengpeng@iscas.ac.cn>
References: <20260704074350.53023-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt722-sdca-sdw: Propagate
 regcache_sync() errors
Message-Id: <178361335206.100558.655241026811586193.b4-ty@b4>
Date: Thu, 09 Jul 2026 17:09:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Oi3kBcdA7vBxUaztFWNWkUs4DUz+EjPQ3gb59evsaX0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwBqWCGvc4Nx6344YHpzpMyWlSO/rObZNMzp
 VQksCPXqqGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcAQAKCRAk1otyXVSH
 0M26B/4nYHEdFJE7z8JZBZfvLaYkPr0ZRSlFnZaiz86QjsTyY4p+81RyxIKTCOL2JnIgGAvNZd+
 OuXyaXY3+wdGoiNWIYYvLB3YE9XiKAqmOJMcTOx1/5LQ68HBU5d63n0A+NV6mhDEpUUmucKyeX+
 xeryIkwAXh7y2KvzgtNyXWkelKYBNmjYklzLwH2cB1enL1kqyvLhHMotHZm3+qBvg/z5dZpD3Ti
 sLNADnpFsAOjeMCqhyokGtRzYKP43I6P1Emwy+gr48V2z9wJ7f64WlenETsV+tgi9O5k1X1Gzmo
 wtzeJWH+eJt6HyX7IsPpLYqddWiT3MqSzVL6NhKOsQ1UV5JZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:43:50 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt722-sdca-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt722-sdca-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/f047e6a0f93a

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

