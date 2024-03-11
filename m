Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8C3BB48
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710162392; cv=none; b=W/3yXcbIktWtpAvD4oggncLKrnsxSC/Z3yKxWT4eiyRf7tcEQGZ6OWuUYcnijq5us2cV1WL2QruVXj+Aj9ddKdWy4H5ZEIsfEXi6tH6f0lHy4TCG7vRDoLHhAaB5Uegk5CmV/hSEAtvZaw50Nup01VzMFBZFQB5IDLWI8FgYW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710162392; c=relaxed/simple;
	bh=D5VpCYn12C45Q3ua40uyNpE/00UAStZCeDC9C0B3/+o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WFnTWAtYRKRxgHEvtundPadeq2k+6tdqmKkn3tqKI4IV2djulN5ST5LA+nns6XiC3WaULP2CmDVrAmMx8xjm2C45sxSb76zVs+H2znp3Jq8JPdlc4Om+Nb3ZlFFNjDPxcVkAkqHKuuK+J27Dqkeb7ABzQ7VFcPWkVL9hSf6/ZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NoyDJq0y; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NoyDJq0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1710162380; x=1710421580;
	bh=D5VpCYn12C45Q3ua40uyNpE/00UAStZCeDC9C0B3/+o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NoyDJq0yrHHWJyY9jb0o/ADfCmPbvc+luqstIQirjbxQoHTBuhYm66QVxkgcFu3//
	 KdLRqI6qjUcSfcpfkIF7/c27VK9QsgXUYLb/qVE0Ykr+1FL+W/7FH7FYwLk7MwZ6pv
	 0s3swEGDXzMVYmzF27t0YWrPFXYDEMMTr2tXlcZuMXD5gKvxdYJFipbj3I1QoU7qKY
	 AGBQU6DsOPoO3SXEuZO/w9etfnBTiPVQakQAxlB7TdjFY/CwKvrbYfjLkH1t717HnW
	 pUv9YusM7Qs5AMuk3njtnfmhEjdmM1QVD17PLmmnSYTSb4fITobFeFZPOh0lodKA6g
	 z7vh2AB2lJNyQ==
Date: Mon, 11 Mar 2024 13:05:55 +0000
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: =?utf-8?Q?f=C3=A6talize?= <faetalize@proton.me>
Cc: "trivial@kernel.org" <trivial@kernel.org>
Subject: [PATCH] fix volume mute and mic mute LEDs on HP probook 0x8a74
Message-ID: <_svHAlMKMyPfAYW80GE0F2Nh_0nIyML552foHvCW2Zr7rT4bgt9wKaTVDP77iOL2CCoFzh0uuvwEXRAgSH-DqNwTyZaRY9fIs9bCb5763Zw=@proton.me>
Feedback-ID: 76527010:user:proton
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> --- linux-6.8/sound/pci/hda/patch_realtek.c.orig 2024-03-11 11:59:02.9892=
67710 +0000
> +++ linux-6.8/sound/pci/hda/patch_realtek.c 2024-03-11 11:54:16.764227013=
 +0000
> @@ -9890,6 +9890,7 @@ static const struct snd_pci_quirk alc269
> SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE=
_LED_COEFBIT2),
> SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIX=
UP_HP_GPIO_LED),
> + SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC q", ALC236=
_FIXUP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIX=
UP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIX=
UP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIX=
UP_HP_GPIO_LED),

Some probook models have a different board ID, which aren't encompassed by =
the patches.=20
on my probook 440 g8, this patch fixed my LED lights which now activate cor=
rectly upon mute/unmute.

Signed-off-by: Valentine Altair <faetalize@pm.me>
