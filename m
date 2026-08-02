Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3B285C8B;
	Sun,  2 Aug 2026 02:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785637062; cv=none; b=TNvuj97c+fRM+ffD5/uM0djZEhnIBanMM6MaoOBYZNXikWQEjuZ1ssZY04c8bxFiOIAT4Q761cVJQ6M3TvoqmTqKmc3MIsqauShzanJvUr7fiJ59RZydPMp70mMOUtrTg8fXaZ6vpI8h/1g8zxAM7LmlyoSeV9uL4WH50kJ81q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785637062; c=relaxed/simple;
	bh=wElgQyBzsTlUUqqTKvJgICfVYoemRd8Ueijr2xAqF9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDBroFkXT9zpYRz4Bauvd0CYUkCuygbXzewTO+mMc+RXVGfGQ4BF3aNUYYKXxFa7zFPe35DR8y2kAX3mNn7A7ffkWjZh3CDpgfW7cAOhLQhhtXvFrtDsGOzz9SxaE2UfNZk1N+daUfouB2Sg3TmSBMVDhjUys2LiL73HZW5y5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiUHTVjC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiUHTVjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED5D1F00AC4;
	Sun,  2 Aug 2026 02:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637061;
	bh=Aq/Cksr2yBrv/xNqFC5ZL66T11jbRr6+oFBbQciyapA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XiUHTVjCJhM9SZInjXWPGOL7KZE8HI8DzCPtbaapWyQC92euZAkap5bZAor/LX8nu
	 4rqEYHsm3K2YtqIM9n6wt8zdSNWd8lozbMvGZD0sC+9rl2nTKWfdQvx9Z6xMyDBqHh
	 fkUNbcYj6iuley/FM+VuC7EW8hc7+w40twF7OenBCnj+32Xbs9Bk4C+prikQl+UcOU
	 m1uU9IHo475Yo0XxUvDCWliGoRbonjX6hslOIL+fg5Qho50AUPhN18xHTC6C10u14Q
	 vIIBXdxU2EIidaDhBdHViYIGzy0R44xHj4TrLNHuIKWIrbZJpPQPMbxJxOmEmMa/+3
	 LJwoLhGW+KwdA==
From: Yixun Lan <dlan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] SpacemiT K3: fix I2S DT integration and add controller nodes
Date: Sun,  2 Aug 2026 02:17:34 +0000
Message-ID: <178563700560.1616223.8425945303990754428.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 19:35:54 -0700, Troy Mitchell wrote:
> The SpacemiT K3 SoC has six SSPA-based I2S controllers (i2s0-i2s5).
> This series fixes two bugs that prevented writing a correct DT for any
> of them and adds all six nodes.
> 
> Patch 1 fixes the ASoC driver's clock lookup names. The driver was
> requesting "sspa_bus" and "sspa" but the published binding specifies
> "bus" and "func", causing probe failures on any conformant DT node.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=cd01c677869affe1b01403ca2fad8fc0fe85e8bd

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
