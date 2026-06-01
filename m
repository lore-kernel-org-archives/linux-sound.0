Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE821F1513;
	Tue,  2 Jun 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402047; cv=none; b=k+ZpIXjroIW9RjJ/w8AEutPXYex9859aYA52Kbv6qKSulvjr+tWMSPhVzZafituWGILNQsVmxncUeM4gh0vf1WTsi82Zzhl8ld1bVtPaChGXA8jkoGgeBz8h6KjeIr86vo+4/4IsNr05+ZV8IO5Bho/0zfU6/qpTyWtihvykXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402047; c=relaxed/simple;
	bh=3cyps9ScAvMSV3+VWfUL0M6k1ChbuL/SBkwUCIsrAeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O3BUNjrPTSRafKtQclno1hAl4rrbEa80rj1i8D4nSzlxNvZ7MXrOrGq438YvpAstifJLahUkPXvQyDGWiKqnFeq/bAD+4PwE534FXLdT3w93S0rbvrIzjOrYGxDoHXtxVxhhp0NOMflRbZUAh/M49h3/dgzaejgqlU35v5fqoCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFKtkeCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFKtkeCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939EA1F00893;
	Tue,  2 Jun 2026 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402045;
	bh=JaY4nFGKBgtMdNBqjAYYG/gzZSj94o7wFfEe6d3BCaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FFKtkeCxprqLa/prpqmOM2UmV6F768Uj4KuP4FWBbr9jAEWVnaAU9Q0iLMoRapdSP
	 U4jIi2xMW0xlxtA+QXXw+Uy7tv5SXYcyy8fEhKKT1Fc0TKqG1JHyytCoIl/jiBy7Tm
	 eGkJDqile6pNWpi1tMzDY9sw3yIWhQYGGeul8nPu3geQzLIsCvTlGQB34AQBTf9PQu
	 ev0pJ9hURCP+7kMXAKq3B25NFCn17cf2PTIynDhICshR7de9aM8qM6GC67giY+M/6I
	 ImbwheAVdJtR2EHwMYfCdm1IsLTSV8GcSDKtep8NbbfLOIet4eE8SYbK0yWD+/VnCb
	 gYPwa9ZIJRZTA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexey Charkov <alchark@flipper.net>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
References: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
Subject: Re: [PATCH v2 0/2] ASoC: nau8822: add support for supply
 regulators
Message-Id: <178032324548.44654.13965516048964342305.b4-ty@b4>
Date: Mon, 01 Jun 2026 15:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3cyps9ScAvMSV3+VWfUL0M6k1ChbuL/SBkwUCIsrAeE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiy541Xu89yXb1wW9/b1hzl+Fal/7/4Qmlq9y8Pn09aAp
 R0zZKq/dTIaszAwcjHIiimyrH2WsSo9XGLr/EfzX8EMYmUCmcLAxSkAEzF3Y//DFZZZ/v6SROsh
 Bo+IcmnGzbM8355UPmESnL7ktF6NwGGm/M9f2DOmlIWKXcvbXb9n4idWjRtM4m9Zjx5xKFGxMzh
 RWJzx5bJUgdxmBs7Ztjs6rrExmIrK6ZTE7RZsm/ArvkVzjrKpUEw8T1/p3ciNk3t/lHBUW8uez+
 lz0fjE7MJX6dJ6zFrxw/Nb0/W2JGX3HmA/39tV4jnFyO5HIVsSU1/Lv//xdtmHW08LSATPvLcj+
 bdzD2N26/uvZ1nEMk9EpQi4nTySLt9Z1WiluoHX+M/7v62/Db9ZrjGsq7vWl7y2Sv/JgrsabifW
 nGfiSF41/9UT3ohw+bs/pa5WvRLu4tdSlXF83JG38WcXAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 25 May 2026 13:20:44 +0400, Alexey Charkov wrote:
> ASoC: nau8822: add support for supply regulators
> 
> The Nuvoton NAU8822 codec has four power supply pins: VDDA, VDDB, VDDC
> and VDDSPK, which must be online and stable before the device can be
> accessed over I2C. On boards where these rails are software-controlled,
> probing the codec before the regulators are up results in -ENXIO errors
> during register access.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: dt-bindings: nau8822: Add supply regulators
      https://git.kernel.org/broonie/sound/c/caba9259a22b
[2/2] ASoC: codecs: nau8822: add support for supply regulators
      https://git.kernel.org/broonie/sound/c/f8e7cd48e5b3

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

