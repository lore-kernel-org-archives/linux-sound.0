Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F44CB8C4;
	Fri,  4 Sep 2026 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552651; cv=none; b=cvFZ2yv1cPirAQ9S9OqtYcwZevxCiweBLszd/XAB9wGFy5w9iOfnVCqE3yZbTwQwg+i1IstuNOkbqZXb3Yo8GRWkD5ZVsTWC/1MFIZJhogYMhL6YDJ0uKDYh6attPKsjpCjZsdggIxI7AkSAiuCU+03d0vts/xf0POwbR0LP5IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552651; c=relaxed/simple;
	bh=KouETztfN/mGp7RZFdrBAOhN3ydprk2sioBxfEDIYD4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dP6g/5nLsK4OVcAO/xOGAI3uzU7k0M0457B3SiWQtbuUkCOzdzYzYkXApMiqF7BsTl3Pt8kLNNTnW9Ti9y+8kxx0aqk7FEwr7MxXOpdvf9zy1JZ+wTLMHo9P4+5SHgiuDpBPwaM16t3kwILhKi6/ilmkGkfhbTeA+a1Rb7/llkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lr/LjaDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lr/LjaDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B9E1F00A3E;
	Fri,  4 Sep 2026 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552639;
	bh=I0S92nhD9viTVQZ6laHD4KPftAfxERiYP7FmJsp8UL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lr/LjaDW9N6Bpe/6cdL6479zwR2fKj4TLug/1eyCWqUfcclqevAIZ5kcqowSt8oYJ
	 urSBoNxg9ySbEw9hwAwbFlQaIXAMYJDynQlWi2xaj4nfZXcGREngec1iHofhr0BUWe
	 Se3ta08NFhjQeR/sy7fhFB26Di5nepT1+xMI4+cTf5o7CP0LRe7NfgyUSRuxW7BkAI
	 9Q4KoP7lCs8G0B07bnNXQvt4SrH+sJdc357G21AR6we+oVcbm5rI2kZxe0uUWISBUa
	 fydK9xzQoG04RxqsebCNSmPdr+OtPAZj9aqcVCuv9hrEFpIo8MklgoLGpQNJWmyQDJ
	 iYHvHzc6JoKOQ==
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com, 
 sjlin0@nuvoton.com
In-Reply-To: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
References: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
Subject: Re: (subset) [PATCH v2 0/2] ASoC: codecs: nau8360: Add DSP
 fallback and PEQ band initialization
Message-Id: <178854413324.632048.16181974298837410103.b4-ty@b4>
Date: Fri, 04 Sep 2026 18:48:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KouETztfN/mGp7RZFdrBAOhN3ydprk2sioBxfEDIYD4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmyW5CHmZIsfH0bYXLbLvUKZjoXrYrgwByweJm
 PS0zWEb0ymJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapsluQAKCRAk1otyXVSH
 0LraB/99GK8X9AY197m83eozpYp3bH/07Zj1zJ7HutcI6x/+jfzHZIuooo7nbVcm7CFXKd6YazL
 z5OY4DOdb7pOTMXii25qnQF1XsGcpJ/BZUicm6UxBdy8EUaPutIdjJRejCcT52JyhpjXvcWNVea
 +scGexE52CDAnzbNTXEZl5zeFaC4AnMnNBrFkaQOvgyqpUvDDCSOoxmikar6f/pMQ1/KuDIH+Iy
 5OABQDCOrHv03OUQooTcSjhahGkIKObxM/TXB7oDZXjO6SYClLzMxHGMFESuADMy4zgc9Omkd+E
 sKMZGVviwi5VayKcULvv8ieFV0ecGzD+Qj4HL9HH/NgXUppi
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 14:00:33 +0800, Neo Chang wrote:
> ASoC: codecs: nau8360: Add DSP fallback and PEQ band initialization
> 
> This patch series adds a fallback mechanism for the NAU8360 DSP during
> firmware load failure and ensures proper initialization for PEQ bands.
> 
> It includes the following changes:
> - Fallback to bypass mode automatically when DSP firmware fails to load,
>   ensuring basic audio playback remains functional.
> - Set a default PEQ band number during DSP initialization to prevent
>   invalid state or uninitialized parameters before user configuration
>   is applied.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[2/2] ASoC: codecs: nau8360: Add default PEQ band number for DSP init
      https://git.kernel.org/broonie/sound/c/366e4d4f0ca8

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

