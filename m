Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964F2E06D2;
	Fri,  3 Jul 2026 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106348; cv=none; b=hKa5SZ3KtNY6TI9hrcjzkeV/ZUZ2Qc21NyqYsqKsEA7gyxNiQ61NMpO9+YQXszXGvZ1W1CxnmVzotevlIR/akQJLgBuUS613vBo6nyVyemmsYimS0uZiuc6zaIDKStd8uJoAA/vUEar1WqPZ41Xgk4F/4qj2NnIga+t0z01RI1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106348; c=relaxed/simple;
	bh=+CX2qJ7ecAQtHQrSqLMt1T0ZT+AFvWH8FF1iUDPclSA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UWKun7XHrVmB3aVv0xG+qksC9efQk2fpmTyS1cCV7NYc2XtahwOQx0JbG4Pm7dfXdlEWZIhrnFQF+yOYZyl/DikT+ZTlOnLN9nVT1p7eQZ5EcK9rITy6YtVqe+LpqkqRSvl+DLmWnLn/chxkuKzPu7B3Mx8rIhvWWGv3xcUYBj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEOoJHsr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEOoJHsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84141F000E9;
	Fri,  3 Jul 2026 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106347;
	bh=Gb7E2JfINeBHupRXVf0p/EuM/Zbx/bfWj0cMy4f86gU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lEOoJHsrfE2RwGEKMJbpvn+EeCC/f2MosvrTXWNpkmHnEFAYxoMKWFdBi+y1XO3Z/
	 /3yAzhbzUf/pHD2LFybfmCZ6iLqOaLlO9AwBwjRyxPBuJMNC3btCptgtYj8r4ey0Id
	 x0O6nZfz5KiJGe2dVl9EInLqrmS5pyJuIxLtMOnC9NCdNyoHIkIHl/A5cElATrH0EO
	 T8n7VEL1P3PrbY0LPlUUGoBLGYXKFzHv/4KXM0te3vsyutKRPNm0Pxp30v9UM8JJfb
	 gSLW6Y4z9jW9FFcxLm3ZNqOu5/s6vHNJAFf6E2wlmDbsAAj1OReUld1KqS8g2zMYKv
	 FifL8trkS7HVA==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260701084336.308886-1-phucduc.bui@gmail.com>
References: <20260701084336.308886-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: Use dev_err_probe() for iis clock
 error
Message-Id: <178308312566.53103.5034914007852347468.b4-ty@b4>
Date: Fri, 03 Jul 2026 13:52:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+CX2qJ7ecAQtHQrSqLMt1T0ZT+AFvWH8FF1iUDPclSA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqSAsoYgdD40o4g6bsbPhWa6nfSb/wRiuydmhnS
 zKXC/Fwjv+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakgLKAAKCRAk1otyXVSH
 0ILvB/wIqzhZfUISSp6TbKKMlXWxaZbgjaastgZEO9B88lN47A6ek8cX9yH1IWa7yZCxfQDWYrE
 3imydmWPLoX2wkNqd1LAmPaj5NTIWHs8D1CSR4+D8Sv4Yviy+OhdgHnWqaNgw9kBGdTcNW/bMea
 ErxRnJbivRtT8CGjePDBYkUNWgnPLp3o3Eugdk0tnxP+rXJJylXTwqcTF+XnYYNhi0MZVSHx/zM
 oaDLIxJc34UPuqBp+kp/PVUVWq7vDe/5UOEX1NlEkKF8F2RbN+3btjXrsmDfzySc5l76CWGw/Vn
 8ltxga4Ygyek5Kg0dlUAgsIDaMbZso3yn9itRAQm856i7CN4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Jul 2026 15:43:36 +0700, phucduc.bui@gmail.com wrote:
> ASoC: samsung: i2s: Use dev_err_probe() for iis clock error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: samsung: i2s: Use dev_err_probe() for iis clock error
      https://git.kernel.org/broonie/sound/c/406e181cb325

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

