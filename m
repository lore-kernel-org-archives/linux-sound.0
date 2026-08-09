Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CD391E7C;
	Sun,  9 Aug 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270523; cv=none; b=W/xBpS1hyAYoDwB0UTUSgHcjpR1znJXxmoCAtGEXu30XHlPeAvq6YPuO0I/iAc0trG1aez9Rkujx9KKm7ycsohGcQ9aNF+6TJ4J6O+nLFLPsa1zPBceFE+wB7nFxhYdBwT8V0WKXr0b8WfobELT0YocO9IT0muFHYP5j05pv9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270523; c=relaxed/simple;
	bh=9XL25eFNOa9inE07iKLHMpVLj+N1fZZwPN1F90lQlN0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfvWsdhLcf2A2ifZeXHk27UerTPVrxZpVLbjYK9PdlNK58VmA2kfdLGirW2e2mHBx8T+4VyKU7Gusshn3J6A+TCXQU2X6EOgYiRLWVb7t6/AB1YhGLcb7v5oy94eApw5ha5IAQy0Vg0lzi3JUm3c7aD79Yd/auIId6vPu3OmxUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=jZ0w7K7Q; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="jZ0w7K7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270510; x=1786529710;
	bh=9XL25eFNOa9inE07iKLHMpVLj+N1fZZwPN1F90lQlN0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jZ0w7K7QYrEZWYRn+t5UF9BTcf9qYWD3b/eDTEmNJas06BuFubQjcWyr4IkuMyzdt
	 9s9ZO2JLb5QP0MhQSJM5upFbuVNFEU8CWVBcb8ef4hE7qsmKKFCmIC3DsvqGHxAZ2F
	 4RCCq4LDD3Noe1jMAA4ax55HQHXBy702Iy60PxAQ0Wc1dw/VQ1LIfAh3RNcEIeUGvC
	 LlDStnwhN4nZxcrIjWLBxh4LT+h19AhjzEtBUoffOwJiCkl6bIFkWh/BEnSOxC7dLV
	 8CB+7nMlxNDFmYtgQQ9GEfpwE4KqCiE09sXsGedKKP5qsURXXitsxWyUWyYs4VTe2K
	 72B2R0hUV5cNw==
Date: Sun, 09 Aug 2026 10:15:04 +0000
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 14
Message-ID: <20260809101439.4798-2-wiza@saarinenkoti.fi>
In-Reply-To: <20260809101439.4798-1-wiza@saarinenkoti.fi>
References: <20260809101439.4798-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 43dff90b788cc062786cfbbeba0a70afae81bd7e
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The BIOS on the HP OmniBook X Flip 14-kc0xxx (board 8EA1, Strix Point,
ACP 7.2) reports acp-audio-config-flag =3D FLAG_AMD_LEGACY_ONLY_DMIC. That
binds the legacy ACP driver and registers a PDM-only card, so the
SoundWire links are never scanned: the two TAS2783 speaker amplifiers on
link 0 and the RT712-VB jack codec on link 1 do not enumerate and the
machine ends up with no usable playback path at all.

Add a DMI entry for the board so the flag is overridden to 0 and
snd_pci_ps probes instead.

Developed with AI assistance. The assistant read the board's ACP
configuration flag out of the running system, identified the flag
override as the fix and drafted the DMI entry.

All hardware measurements quoted above were run by the submitter on the
affected machine. The submitter has reviewed the change, understands it
and takes responsibility for it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 88e4230d6..4ce8573d4 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -63,6 +63,13 @@ static const struct dmi_system_id acp70_acpi_flag_overri=
de_table[] =3D {
 =09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook 18 M1807GA"),
 =09=09},
 =09},
+=09{
+=09=09/* HP OmniBook X Flip 14-kc0xxx (Strix Point, ACP 7.2) */
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+=09=09=09DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
+=09=09},
+=09},
 =09{}
 };
=20
--=20
2.55.0


