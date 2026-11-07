Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070925;
	b=Qx6PAicy07OdppEM6736xRQAd9wPJRW3Q0mUP5UCylBf4nOfmr0vof8wDDBQBlb5Ro1u
	 chlZ0IF/sSJDTzb3EGuTwqOheiuBU7OT4cdT6Rd1UyG2vayeStoVY4/WnNnnG51EeN/km
	 CEPUQSX8LExaworWOFxc1ytJrHd2hL92tssg/5BN2VtBrV13RhbMpyP/nOB70ceEmdkLY
	 6OiDMWpMx5dl/EE3XYEIkTDtikT9YaXzGgopLdL/+kAjxmlC2ti0ZbKJUQz6onJqbgxKV
	 Ehze38POsjuLz07SJSICO+ccjEL8f0kBnJYQR2yFcEbe/oNBJJI/c7jKVhb2QvVStug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JYKQcJOPplSFtWjteWjp77XJSS0p3knHJud3KPquMEc=;
	b=PqYTtVZhcigrCZkAwaYk7sn7QVYnWrkIaPLJe1jlectavZXaDM5cf9srpPQFpbNLt/bl
	 B2vfQUsEr2l+XUfIFJhymPgiVmkQui8xOA7OQRVsC4qgku/XvyxBo3pmqb/Mz99FkXrVj
	 eXc4APVwLebyyliAnRQUpkxMyripJhUAiTekxQ7JyKlE0o+kCqGM4HwSX00j/cg9JT4WO
	 rPF7WhQEYSZGJLN0KvhOf00NRHJy8g+6THEEwpvIhklBjB8rEK75dzEKg+QSsIPUKhnm0
	 /EzQWgaaWnlxoPIv3jnP1NgnGJE7ZaykepC2mjCdOU2qqrIen1HA5cFQdB+o9g3zz2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klesofrt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1A606A338
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klesofrt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C05B1F008A1;
	Sat,  7 Nov 2026 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794070924;
	bh=JYKQcJOPplSFtWjteWjp77XJSS0p3knHJud3KPquMEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klesofrtIKM0MLDrX5nUeknQaEfn3tC3EgQIlbkqMuRBzRsxCHMXANfK5hEPwkbs6
	 BdqyzC+2FEQA2WEj83IqDE4FsOQ8/w35MpBO1SOlTJ72gI9Zhi2Ud9laru2F68Kd0+
	 h30W8cNMwfOE+6Fsw9PRMnDZb8Y240yZwn2/0S7ak0WICZVPoidmxOy0QjTdNTyWOF
	 E/fRHEML55kkRLwqJkthXNZdUq7mzWr/CBhYf5FNrL/A6dQEpfa3D1Y0daX9t1hlVR
	 A/E8QCno/cFT6D2tw2oA8NTibsLt03sjHbKoEf2HTZzV4Ya9/Um77nb78Gj7spJylM
	 I0cO657B4ZS4A==
Message-ID: <sashiko-outbox-203084@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jude Gyimah" <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261107165527.576383-3-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
 <20261107165527.576383-3-jude.gyimah87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 17:02:03 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: meson: axg-pdm: commit message refers to three stanzas but
  only updates one
--

commit 1aa97aa37f974c96150326ff4ae32f1b755fbad0
Author: Jude Gyimah <jude.gyimah87@gmail.com>

ASoC: meson: axg-pdm: select REGMAP_MMIO

This commit adds a select REGMAP_MMIO statement to the SND_MESON_AXG_PDM
Kconfig entry to prevent link failures when SND_MESON_AXG_PDM is built-in
and REGMAP_MMIO is built as a module.

> Several stanzas in the same file already select REGMAP_MMIO,
> SND_MESON_G12A_TOACODEC among them.  These three do not.

[Severity: Low]
What does "These three" refer to here?  Nothing earlier in the commit
message names three stanzas, and this patch only updates SND_MESON_AXG_PDM
while the other stanzas are updated in separate commits.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107165527.5763=
83-1-jude.gyimah87@gmail.com?part=3D2
