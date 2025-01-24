Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF11DC9BC
	for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737753277; cv=none; b=eRsVUq4eccKaFxNSgb94dNVLgamrmcXJ8J89zOZbnkxKbuA7WlVzkFM9Ue0TRWyLu4nXzShl7D0YMphyVBuHkeDlXFPBUW8qQY1LBA2Ef+dHBk2clZ1rZCYEJZxx9tRo8wTv16gmz4/F+7tcvxhUTTD/S3O0RqCN7Q18ontp7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737753277; c=relaxed/simple;
	bh=D94x03tgymgcVuYlIaBBwKXUFO4H/SSRqSlzEJmhoWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DLTQJ6gYnIZsBg+AKAuehF1Kl70TQuzRE1MaH4HxoKVEAXi+X2hp2Cb2k0xF2+3DSA74oyMu7qTNlOY6+/XpF34e0tL6xoS/h7svUVsMRFb8o+LZKnS93Ai6lJmVZHYfjOwnViWd6xc0gv/4BDKPfdAcY+HhWIznhB61YUs+/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=deCDsPuB; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deCDsPuB"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227ccf803so23768171fa.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737753273; x=1738358073; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKjozC5U68nBZ2dVYjv1Ebo6CnOKaod68UbM68lTdqw=;
        b=deCDsPuB+wTYdkqTusNkCNy3WFBtaRbHboVs8A2keIsY1afVAcZC5aIJSeE9PLDl0A
         egCgJpYUI1rj4c4lbzA607lIMBOpFmHITBoxIPX1z4R+T4ea/q844pMHyt9jGfQhnV3s
         JYa7UYYmlaMjjC6qoR8B3gYfBaeSpk1LI1pS1TR3/NynoMR9PFbiHMcXdxLAIwUsZOQE
         BYZl2aIsMupC04mvBxoHevK4pH1qaAHIGaJxaSAjIzmyiw2SiSkDQ1osq77loycTnIhL
         fdvwu/CrdHr8A+N0CmEjnnlU4MeUmPv/OAjw6b3Z3mHWHFy6fUhi/+TuhfmYPNllBes9
         FlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737753273; x=1738358073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKjozC5U68nBZ2dVYjv1Ebo6CnOKaod68UbM68lTdqw=;
        b=NMleThjAk3ail3kouvE71gL2JR2TRYxo+eBQRZiwnrshhgfryptkR5Tm1azvo7M5Rp
         XiCvshuFx1TR3itPNhn2Dc1dagGtwD3K4412QmuQe9fsXOE/X7KeGNpXYmsvLFSx0HJJ
         /gcLrj7nvfeJm6ArMc42+s1uJ4E3f2Ir/gJjbO8JT+2iJEmVbx4igy7SVbLlGEQ7bE7O
         KJ+gjFLsQqmQ6Gvwq/uWmUR7O1LtwJczY8ss4b0Wm+EifTRAFyiLGGBp2bQM+0eOaiXS
         Sr+bdEJOU0pQJw5/RUHJ4X17F4JxIeFz7NdzUBmLLTUHdImCHong7IAd6vg2kyfQlY7l
         4FOw==
X-Gm-Message-State: AOJu0YwXVUuSd4LTF++BwWCmoswBn2jY7mQJIXOXXfKEPIHFHtDkd0gG
	dl1WPb2WHOf8SrO37lAGkd2UQg1KM9BfeW63iMbTjaBv+16v2ABcT8EEprCCp6JYZdmAggfJZPs
	5JPk=
X-Gm-Gg: ASbGnctTZV9FB/D/Exvu2k4rb8KKZ9/DDvL6SiJ40mnI079sGYEFf/OxClm6kkVz419
	RVhQarnWBtZFCMdfGhIJ2xn08vtFtiXIcVL/0Ig3G/B4iFeiXYUvonR5bzSi03CM+abkAgnnQkI
	/ajaRz+04tZ5/yy2ZFoH9GWsFGDXIz2316bXvk3+yAzHhx6lWZrO+eirMc7lWFhifA2H7pWXvyJ
	Ep8W++8ZFuEeqiskEve6lnDH6/VKvtQjgT1QwxPljwPcNMhv8pZwIC3oySrdXqoUpJUjcsd4ynh
	e7KnXJBOgbqJ
X-Google-Smtp-Source: AGHT+IElFiwIONi6XDUFbWKkH9UMac3FdOQEAhB2ttRXoxhEYS46c7Vh0mHfwtzXdKqgbq8oCGnkEQ==
X-Received: by 2002:a2e:a544:0:b0:302:40ec:a1bb with SMTP id 38308e7fff4ca-3072ca99b57mr131185861fa.21.1737753273146;
        Fri, 24 Jan 2025 13:14:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076ba6b020sm4780781fa.19.2025.01.24.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:14:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] ASoC: hdmi-codec: add ELD information to procfs
Date: Fri, 24 Jan 2025 23:14:29 +0200
Message-Id: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUClGcC/x3MMQqAMAxA0auUzAbSooNeRRxKGm2gWmlBBPHuF
 sc3/P9AlaJSYTIPFLm0aj4abGeAoz82QQ3N4MgNZF2PPlWPMeyKnIMwSgpI48psmYkGD608i6x
 6/9d5ed8PMFn3oWUAAAA=
X-Change-ID: 20250124-alsa-hdmi-codec-eld-09fcc1cc005a
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D94x03tgymgcVuYlIaBBwKXUFO4H/SSRqSlzEJmhoWA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAK2SvOubVrSPMAOQ96/gD2WW60GPnn0Lvhcs
 4TL/DCpqU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QCtgAKCRCLPIo+Aiko
 1fWjB/9L2oXbim9Y3m939Qi5JDDnTREtD8GwjcHmHUw83BB4vdaVahNhQzHcLJJYtxwm3rKZXFl
 NTODmhwVIKV4htCEHUDyb9F0FBWovntGsOEiwMbVfZ0v4dfis42sNtcNRAbXnEJRUZMjthuPj1H
 LsQpZjMq9h6/m3mDPrHKLfZLp20zXYDYqf/4nKAJVMJBfW/ShDCTT9FP6EHE6kPIpi59oaQLRbX
 C/CmtA5DZZRA/LdMc5vSpk7Z8sAYdr8JY0s7UGx4axA28ecXD5QHQJn/tNo+BGCi8rhH9RB8nNq
 zco1leGZ6E6GiPhTXGjZw8/z3bgsrMBgU032Jco3SG9Sh2GN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the HDA lead and add ELD-related information to procfs for the
ASoC / HDMI-codec cards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      ALSA: hda/hdmi: extract common interface for ELD handling
      ASoC: hdmi-codec: dump ELD through procfs

 include/sound/pcm_drm_eld.h   |  91 ++++++++++
 sound/core/pcm_drm_eld.c      | 387 ++++++++++++++++++++++++++++++++++++++++++
 sound/pci/hda/Kconfig         |   1 +
 sound/pci/hda/hda_eld.c       | 385 +----------------------------------------
 sound/pci/hda/hda_local.h     |  49 +-----
 sound/pci/hda/patch_hdmi.c    |   6 +-
 sound/soc/codecs/hdmi-codec.c |  68 ++++++++
 7 files changed, 562 insertions(+), 425 deletions(-)
---
base-commit: d5e972e5216ebd4cb9a0bb0b0bd310b86f270d36
change-id: 20250124-alsa-hdmi-codec-eld-09fcc1cc005a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

