Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF13911A2;
	Wed, 12 Aug 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552201; cv=none; b=b5qhckycWcMXX/WbG6yw3tG2BErbY4o4Pnvjwoz7/ORmwrOw42iJDLQs50R9ep9Z1j8cJQfX5KdbMrylidyNmLKLuxs/OzW1W0la0/Ea8F75VIXQdk6l/Oc2Buq0YspAegjtO+n9v8kNjR2SyD/RgeKFcS9rMJAhRCnhrGmedHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552201; c=relaxed/simple;
	bh=wnZ3dwLi2v71HRTnl19XP230YuzHDG2xlcwtpxnEExM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PkUiJ3xCEvrXpVv5OEi3kVk59G41lQP2hDZvBK3XbyN+mbQ39V1xYsd6TbKZDPlUzEtbEaalnsFta6nevlciDrlOxV788xJT4GbljBLoMOYd2C7xlCG2HZLE62emKQ+Z64uJ3N4Ia2aNr/aM4Y2t2TutGRUgBex+KVQoirPpWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNhQdhHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNhQdhHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872DC1F000E9;
	Wed, 12 Aug 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552199;
	bh=6UWAE3YyH4XKWS1i6AZYOVl03Cz627Sq6U1AvRQjmsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WNhQdhHTGn/2BWrRfPpoU56S8XSJbzUreg0GvIRj2hNGf+zrjdFJIt1CeFWvXq/C6
	 vStJ4AtGZJgfjzDi2nDHpuK30NYEbROkGQZFm2aKy9z9fnfzbu8b+WhT3DYRSLg7zt
	 Ip5b1S12GLpE5z5mGSvshS6GdagcT1jlmfoFYncuqcYPd3u9+Bz3U0gQg2eoEiirI2
	 5/jd2nbK6AsylTrsE4hoAfLRsqMhd9AJcF5+Itj8eTOVVFgv8gEiDNOTVYo8BL2bYZ
	 UCCL0zoKTttdVEkYMbwquf+7e/0hJJA0eufA+yqu+khfmh1OhdUnu3WSrbtgkXmuRy
	 h5w86XCDPwisg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260811042424.66882-1-rosenp@gmail.com>
References: <20260811042424.66882-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: use
 devm_platform_ioremap_resource helpers
Message-Id: <178655027936.8393.11056539340382876563.b4-ty@b4>
Date: Wed, 12 Aug 2026 16:57:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wnZ3dwLi2v71HRTnl19XP230YuzHDG2xlcwtpxnEExM=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqfJ+D9IUcUTa8aN8BdfJR70JuBC1nerzCrNVN6
 XUamXYxiz6JATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanyfgwAKCRAk1otyXVSH
 0FkqB/jelPTFXsIwlc/UGyL5aieoa3lN30k90fSwHzywnFlnuY210O1mo+m8hKrYtKS4Cc3iieZ
 mHiwU7BOnjCrOk76enRTLa4e0kSpoecdQQMzP9wUdn458s7wVnX/JWyVw3TAbQtMpjIryegKZWw
 VRuL04lh99OyDVuDPEgLOdIqql19Lh+aVgKZJoX99WsWZjKwxjLtFFI9S+EX0dVg2bKE+Rj21Ns
 BPG9k8GQzLv13WONqLDk3k5PSSXAJN8WBSz20LA90G6x3h5nGdGDdXEsrKZCDi/NylmkZoiotnz
 OJMxpq1fAjqdlvb4GaULRDvvppFfdYCrYGtsVgjZpNmuuPE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 10 Aug 2026 21:24:24 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers
      https://git.kernel.org/broonie/sound/c/3d7fb01b36aa

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

