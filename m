Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858E822068D;
	Tue, 17 Mar 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774081; cv=none; b=FcAQFiwIPE2E29wM8LMVAlWhQ6JCs0arx1MmkfPooKYAjN8UW5BmbC02JPgh6TaYZ0y/H7DBHmc3Y94ggUzEOBdVNIqH6WRvXZX55CtB6B8751vzeR/ijP8im1XwVog2xO60PSPMyiYVnGqEtiN9UI51qQbp6YXRVNEnG3CsUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774081; c=relaxed/simple;
	bh=Z0E89ram56PYfOrrVGsFJAmeOV7rN0x1fI2r7Ua8qEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OBN0KD/7X78qpWNqX3r5hO0ZgIa+92bxScGJw+8GsV/UIo92j/IuftxESBEAn1t0iA32Ztwq5W8y+pEIDqUjtYO50eUwzJ4AQ7L1vhPjJvOoq2MK8Z4eMw4YzxYz75LuRQY+ATc4CDBxzPA1aAAf1oRdtwhJtuPNB40yKlC8qqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IniyBT37; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IniyBT37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C9DC4CEF7;
	Tue, 17 Mar 2026 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773774081;
	bh=Z0E89ram56PYfOrrVGsFJAmeOV7rN0x1fI2r7Ua8qEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IniyBT37H0/7/rZAbIoNPf9EOv6T9G4NXIp4c2wouagPQBO8Cjddr1Fal2g8tGCxI
	 QSIosdOeIkLRrxaerxu9zpGDuVuuyYWApcMhV8/Opa+0TsvpBffp5k62W0Szz7Vfhe
	 Eobp7CZdKt7VnAIITEg/6wUaxdY7MhT4y66Y0NkEAji4wVXkiv9ARfLO73u/hjETBk
	 pmdMZysV5CZlYQ7rdcBwAZfNcOkcE1D8a55f1ljnVT9U4frpveRJ1Tyg3H3YaXsaNE
	 Cx114BucoFR3CKtuRJGnw4AXLqRybtTJaThFj7epzY2BDzuHveS1Nd3poMrxIdKlOY
	 C0sx+xgqroWDw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Zhang Heng <zhangheng@kylinos.cn>
Cc: talhah.peerbhai@gmail.com, guspatagonico@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316080218.2931304-1-zhangheng@kylinos.cn>
References: <20260316080218.2931304-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
Message-Id: <177376912900.409229.1028433939946777948.b4-ty@b4>
Date: Tue, 17 Mar 2026 17:38:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z0E89ram56PYfOrrVGsFJAmeOV7rN0x1fI2r7Ua8qEk=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGm5pP6h1h+adO/Pynv0VIwe4lNVWSRZ3irXacb0srcrlpQR8
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJpuaT+AAoJECTWi3JdVIfQeLsH/R9q
 oVAneU5WNUWmYcPnEJ9ImeegtktI83dBQZnUFInJvYhc7eoLTVkzX2Lk2urTOea7jPmMHxsarME
 0YFD2I4JOPA2wB0L0Np3DgNUm/lC6UG6HyEF2rpVK0iwMRYtvLxApXISeCa1gX0sUecq1Qj07/d
 +yS24WiQV1UICEUuj4Cm7mwQ1oTBMeiXix9SwGS3F4NmDm2CE78fWOVScUwySl0qwfTvpzN0v8Y
 QInh1SAhL9c097hd+Nhw2a7NgDq8Q/6lWySyg7ll1qhlc7+IctRvprvsWWgK9nnGQdhw2zw9uoG
 pUzg5NjroB/7BJJalpHdAHCtLBjpQI99DDFWefQ=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Mar 2026 16:02:18 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
      https://git.kernel.org/broonie/sound/c/1f182ec9d708

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

