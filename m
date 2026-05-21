Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3ED3C8C7F;
	Fri, 22 May 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445406; cv=none; b=D+PD+rSXt8cbzPrExyY2Ygu9mOXBHr+drkVEuC6bz3ipKtr4P0joAcIqmH9ZxPdeJWYqONvxVfFom6BYmaXje8J4YwFXzMHuxNYCNmxBIBwUrIKUEF7qmW1gw2nCthnmHJZPalFZPeMA0RTqozQwj+CRUOc5VIm+x47LBNkkN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445406; c=relaxed/simple;
	bh=ez9ZZ9cP6lXYiwnzCim8pGY/c8pMOgn8xVsWukhhPyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dHvQyIAlgqAeMkYjggXN3oaqpxoZh5GdVLglEWj+q+0ANIoCiYgFkRyOmeqlsaIEhCwWgNBrxBnUUhmtlI5qpXbuv8kDrRLQaW8ykSTVnLY4p8GOec4ooShhSxbo9vzDYSGhgbaJZ1mCHXUdfukPRD2eEqlrS3CLWuYuVqHRjP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oow8DnvV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oow8DnvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159241F000E9;
	Fri, 22 May 2026 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445405;
	bh=ki3KGM3o7K9A3t+1ArahkGMqq3S49+NnXZYGD1cyp90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Oow8DnvVAhkygSzeAUp8/aGoEs4mr09uu/2Pxh455s0sDqLIbo0LT503h+UoeGfW+
	 P+TdlSW3QctsGJNBoJRr+kUK2tYbGPmJnsPQ7NGi/fa6HZmLmyhCnSlZh+8HASL/eg
	 9MAdl22ejAm3Dfn0UPx0TGyqJRY6DPIq/EF8N8A1rswCMDDhUHF9bdatxbI794Ix7E
	 2RLs8C8lD9FLqb3ixPa1/n8GlbNczQf4KBcNToqWQZeEBkwzNHkfeRW233GZoYU152
	 84AwGIwS6smYbmLhHPQ3pToBLSBd00q+xLgbtPZbHxxhJiQq3sT0U5yocpLXwlI61J
	 rXv7YJQnWN9+w==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jeongjun Park <aha310510@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@kernel.org
In-Reply-To: <20260521113712.227438-1-aha310510@gmail.com>
References: <20260521113712.227438-1-aha310510@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: pcm512x: fix null-ptr dereference in
 pcm512x_overclock_xxx_put()
Message-Id: <177938810897.58022.82836103612098180.b4-ty@b4>
Date: Thu, 21 May 2026 19:28:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ez9ZZ9cP6lXYiwnzCim8pGY/c8pMOgn8xVsWukhhPyk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6aFn4sjQC9I/KGKX91LmGGiTozRY6BrDkJE
 GXXsERv5laJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAumgAKCRAk1otyXVSH
 0H3pB/904yAOb6vvs1rp8qV54ovj1XZ2RqYMmvXrzJQq5womcEwA6l5Aj+Rd4YGeP/5wg2yNUYP
 zdXuJMsGyB0iT7FsMbpmJ0R2uA9eAHNeGCBb5nFam/wkO9xjhVU4RI/+JBny9gNyghB35b4k8lk
 X+tKI8aXaSjgDevI56OIP7Qsi/rEHXM+S/0oFmi/kdAGNP2e+cTah3rlkbh8cltoc7p07vVtybS
 l+hPe+ug8S6s68i8fmAEAeDheCMYWw/m+Gt7yyW4//Y4KyyAeEJo7b+OAqcUfkGgPjZNTd/O+lH
 Midir0kO/s9jCLzKmsr3/H2BXqcSwonE15QaJjBvye5OOyN2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 21 May 2026 20:37:12 +0900, Jeongjun Park wrote:
> ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put()
      https://git.kernel.org/broonie/sound/c/09e8f9a9aa19

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

