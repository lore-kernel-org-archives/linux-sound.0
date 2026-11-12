Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516599;
	b=ZdGhdHAV/njpVqQ+jlHjaA7lwFf53hsXugnvnzP8wYUCUHzgqN5t6F8PFXnabzfVxfVO
	 YVdwTgx8QSv3W+i74d6WUA+9nNMRyBtI6326hO+Xa59IgbHv+DH6jjrPzQNxekDte2jiM
	 Z+HvGljH7GxTbKBdzWAPVQYC1zXBwNeskdfwBK9nwLg/ELS6NZs/1n++IH5r2poVlH+ek
	 Rq5a81EpZbqAm17hrI6S0QA6oAr0lGUlG4huSSGvsolvCGx1x9HX6efbp2bwlDMezOMp3
	 mUV7kgvvYr8Q/3rFFr/gmMYR6JdA/paJR3WPnEcTHzENEYZZDDAkFtRunyPtayzuNHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516599;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2TcM7gJItqmzX57vcv0yrrIp8yPM33+nlhWoGrV6TnQ=;
	b=KCwV6TMKzOXgwlKbYrjCvPEkrdJKrZ7Wsblmbg+Yzu5tx0PQLaOI07+laVgT9yRrGLsD
	 Xg4MBZCBPRBfEfuNJwo0NBX15xgR7e+vVyS8MLf7KEd/ABdVUiih720ZCWz53SI59gk5Y
	 jTvuaTYDJYedKQa9tgvX3VNPnRAG1YmXp060Z2aNPCE2PRrxsXt7d+gYWeWGEq2oL9SIw
	 z+ilLSA2kjh+VwU8WP1dAW1NIGAjlcqTsb/eQxWo2GJVqJW0UcuMGI/dyFly1qvpwaEcO
	 sltTdl+/eRodInm3iQYReZf1dJzgwHEMFs3xcIJJe4bss8SJG2JOisMr1XX+9rrbykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkvetxvP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB5606A32D
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkvetxvP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0061F000C4;
	Thu, 12 Nov 2026 20:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794516599;
	bh=2TcM7gJItqmzX57vcv0yrrIp8yPM33+nlhWoGrV6TnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EkvetxvPP97mha0VK5xHZW2sFtx+Ds8aAjKBudFPojwJzBz+d5kOTKflN3wHTVoJv
	 tcSmwxvcNgiiFH205/WNwQe0vTYNnVzjC4ejN5aY2mmEFDJoIFOlhRNl5Zy7dWbN9/
	 0H4G9tj3thOU43NLh5vCFxQGsFAux5jwK5hTWMJs1sxogiNVkdzl2UiZ4N3jptBJBL
	 +gEvrz+S0UZOcoP1NsbKztpmcMEejj78EMamVbiHWC5N3tVFwKnXqhBHYQWzxoJsVH
	 QaBRo70nzeB9H5Fpul1DhFrcckft/AkpNf4HOPOSTWhjsQJ7D7vCzlJHTg/uGHP7V/
	 t3Td+ibzCubaQ==
Message-ID: <sashiko-outbox-211822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG
 gram 16U55U
Reply-To: sashiko-reviews@lists.linux.dev
To: suso <gmsuso@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112204325.4696-1-gmsuso@gmail.com>
References: <20261112204325.4696-1-gmsuso@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 20:49:58 +0000
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
- [High] ASoC: amd: acp: Signed-off-by trailer uses handle instead of
  real name
--

commit 3113b97838256e779d5449f2721a7603f1495617
Author: suso <gmsuso@gmail.com>

> ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U
>
> The LG gram 16 (16U55U, AMD Ryzen AI 400 series, ACP rev 0x72) shares
> the same SoundWire audio hardware (RT713 + RT1320) as the 16Z95U and
> requires the same ACPI flag override.
>
> Tested on LG gram 16U55U-G.AU85BN (PCI SSID 1854:057c).
>
> Signed-off-by: suso <gmsuso@gmail.com>

[Severity: High]
The Author header and Signed-off-by trailer use a single-word handle
("suso") instead of a full real name, which does not meet the Developer
Certificate of Origin requirements in
Documentation/process/submitting-patches.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112204325.4696=
-1-gmsuso@gmail.com?part=3D1
