Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30559392807;
	Tue,  4 Aug 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876642; cv=none; b=rHNc8vetgG/uDUyoJdtA5j/MhuX0/V+HH6g9cWZEwTKFVDUt5z/yElg/3pQiwhLRk3iyQRBrUe6s25wyI/XNzWaS78uG96SVoQrVmUlNirTPxSVLGdXZzsFCixJYNunqACFJLN9TrS+6Xj6JSsXWP4hCvm23vG/9uQn7+BXkKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876642; c=relaxed/simple;
	bh=h3Cw8IDRRTJGK6mAdJYujvp1Pv+X5oeJ7G+ffWYEIp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r6wF4rWY7oHgGO6GljUpdalkEBYspuxp72GjLPiDuJHDOr9DFPxyacSxp1l+OvyXISoXmwPs2iaaPBOWWcTpNQzDxvIRZvDc6zrUNUUbM1ADUrYn2l+rgN8/zJ5Id/HXjFX2Tl8EwI9ZMtukaWol6iRCVavxJ0/ZfiTCtc11ieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVSpn6Le; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVSpn6Le"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCFD1F000E9;
	Tue,  4 Aug 2026 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876638;
	bh=pshSkEeGZD9pNT3c581k5JqVyFGxX5X6P/PK9n99Boo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PVSpn6Led/JpPiSatHB4H7kvPp2suDDUork4u9uYsDSRBhNVan5jizzAlrSOcbVV5
	 i0pIcPZJKcEjWzbmVjSx8o/oZIjufKomQenk5puBzVFX3KGNjhffJJ0cCNWbLL13Bv
	 PV0bX12cuGUUx0IcYAQ1fEkdvG96XQ8J6JymSTsl5yhIGPvGp4LqOAWS1iknqo6NQC
	 TknCIznHkqtKkYNcruwnRxHSdhS13Lnn/YjnzAnaa2/6yZejwBZ6SR6D+lxNdbKwKa
	 t/DPxR4o97qndAjpv+ymB4K+6+cKo7zwcHK/pDUk79xivFFKSyIb7Tf2VkImybVCdD
	 iNLAF8C4uBLyw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/7] ASoC: qcom: add AudioReach TDM backend support
Message-Id: <178586116504.111355.13161957289674329112.b4-ty@b4>
Date: Tue, 04 Aug 2026 17:32:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473; i=broonie@kernel.org;
 h=from:subject:message-id; bh=h3Cw8IDRRTJGK6mAdJYujvp1Pv+X5oeJ7G+ffWYEIp4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqclCa4+zFEcuzE0u2EYGV7D5SdMN8p11ZsQZf3
 6LnAV0cM6CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanJQmgAKCRAk1otyXVSH
 0M1jB/9/WCjF9yhhx88tnYvSJtOlWMVZbotAG7MOMtQsTXzWmXLpCnq2X1zmp2Q4AgQKvM/4eGx
 Rv3ZGSndIqF15Sf0uHTli1v2lkXAK4sdfj6CuSbATyVM+lACKVsb0r9jRv+Rc7m1Cj8flIZaZz4
 LGNQe8RmnFmn4dF12HXKHzsgM4hQ4RX/PAA0V1+e5WR8ZyzK6k9ylViBuHCiPV9KLNhMuCMkiUU
 8AKUU8JGE4UV99oVrUkpeXV7ieEUvtaWXv725fL3N5tIq+nJ+IeEnu/5aFmKn014WPiPXU7kpK7
 +utnooP9ilPXTpKKBWUlHC2P3wyoHd2EW7Qz2vnt3AUMxymk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 04 Aug 2026 12:33:00 +0530, Prasad Kumpatla wrote:
> ASoC: qcom: add AudioReach TDM backend support
> 
> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
> up for the sc8280xp machine driver.
> 
> The series first adds topology-driven Audio IF source/sink handling so
> the DSP interface parameters can be described by topology while runtime
> media format and slot configuration still come from the machine driver.
> It then adds TDM DAI operations for q6apm-lpass-dais, exposes the Audio
> IF clock IDs through the q6dsp-lpass-ports binding and q6prm clock
> tables, and introduces common QCOM helpers for parsing standard
> dai-tdm-slot-* properties from backend CPU and codec endpoints.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF support
      https://git.kernel.org/broonie/sound/c/67605cbf8dfe
[2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
      https://git.kernel.org/broonie/sound/c/4d0840175893
[3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
      https://git.kernel.org/broonie/sound/c/ff09adc61210
[4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
      https://git.kernel.org/broonie/sound/c/d6a4a2e190fa
[5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
      https://git.kernel.org/broonie/sound/c/269b23d5135a
[6/7] ASoC: qcom: common: add DAI-node TDM slot helpers
      https://git.kernel.org/broonie/sound/c/1e844ecbc9cb
[7/7] ASoC: qcom: sc8280xp: add TDM hw_params support
      https://git.kernel.org/broonie/sound/c/a689ee3b2fcd

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

