Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD5330652;
	Fri, 31 Jul 2026 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785527653; cv=none; b=NuN8mJsTg0jKnJHNnrt9DdCHa6960aQL/Q6SHmSpbYnYlcGsdWAkyKQyvxnRYeNna6DJCRBW/tNdu2Y+XRYcEqJkJAtGS3L3xWB3f9oUoyOjQnGZwmYyGkAxjfLWtQBZyNqFbOm2TPOFn4SbZ/XGvCdBkOyiEnpotBkODJ7x/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785527653; c=relaxed/simple;
	bh=+6mXQ90sHWJAT8AFb7gXuaK8s+KWSQCIahwXQLzC0HU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IJLgiAqpdv4KaUNL49sWcWWBByDBvd1lQyJMrSPa0oqRu3TxJLJ6Eds7h8RuM9z6uD/M4ZLDP6SN3LXAUzZuK+TLxrg2hbL2rBiJlEFHWA5zMeeBS/duvX9yaU23Q9llxZlmHeLIjU26kQWLIdUD8ZufC1A0LPgC8ITX7iJT0DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUox/5U3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUox/5U3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DD61F00AC4;
	Fri, 31 Jul 2026 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785527651;
	bh=7wpye8bg89s6iBjjrdwqVHEXVlgvGOcvKJ50cA5muqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IUox/5U3ZGpjG6szr+D7aLEH5MY1lUi9F8gukSxgbRWza8dDwoBuvnVXrEDdH1dky
	 2iZlBlKQWoytCLyzZlSYCetmFhvkFEZARoryLcMF5pEn0EEGcEDHcg5cI5sHQFSxZ2
	 fWF1eafBuBZlxRgGaDm7ZVv1FAnSlTLNm4CHpymm6I5z0AgAEO92pJTHDR7eSOS6OY
	 SkQgPfkwq2ALrGp96rwKR+d/RtyKpSStpWbeuKuQ6Z7KLIo+sy/MMC1XwKxwy5rZ00
	 05w4AoB4Y8LCTkeaOmn35/e90qdD2ZGyTDQ4yAF6lBjluZVnBejCSJKid/gD4UaZwD
	 C1/RRZnq9ezjA==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: cuerdoslinux@proton.me, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260730123920.104525-1-zhangheng@kylinos.cn>
References: <20260730123920.104525-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: amd: yc: Add DMI quirk for HP Victus Laptop
 16-e1xxx
Message-Id: <178550976514.353541.17391354002591590308.b4-ty@b4>
Date: Fri, 31 Jul 2026 15:56:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+6mXQ90sHWJAT8AFb7gXuaK8s+KWSQCIahwXQLzC0HU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbP1hejOSYcHmJaB0PI+18zQEmZ9z1igCVVP+V
 /6qfzbXAfeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamz9YQAKCRAk1otyXVSH
 0Fn+B/9q2tTTYtteekFm0TeCGpiqjai0l/ZL+MwWzso8sQPkpvczO9OEcvy0eVGkXrzPdiGWBaK
 GX0hyKSZX6uCHqBaVSnbP37/NEsBojgZHoSOWCzLTnQK9fI4sdBNkaAUWOyBFySWDNzXXYD5VJr
 dEI0ska38VgZ9YJ55bItC9871P7SZNb67hBihFuZQX9bu4ajqP5WC/KRUzjIoBn4hG+XqwRRV3U
 qqet9GnedId2XZterCGL2ItdlAy2vorZHHXZbA+PjYo9Hg9baez+t8x43Hk+8KuyDmFbRSlt8vF
 kviVRmh/fdFzEiJBlvS2Cv19Y568psscKm+MPsSI3KreaHiD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 20:39:20 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
      https://git.kernel.org/broonie/sound/c/38417f5fc8e3

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

