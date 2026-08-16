Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0943233924
	for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786878522; cv=none; b=e0i0QxsHfbYd5FQf+7xtCPwwNmbcEE0EptpbQBsUDvJoJBdR8o7uvLuwUjOS5ahfnh96YEhca5BzfACxeElDGgVvkQ51Kc2PONCeCNPuiDH26tFzEBGk62k2H+KwYLfM0POvkkNXD0cJNEEL2nmmehulBkHxW6Do+K7Sy1DUMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786878522; c=relaxed/simple;
	bh=klDkroUxF/t2SvOb5saUJkhCtYJos0RsBHYMYIDnNak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfJ49O+H1edpq2z5mgnUgeitjEuAVY6ZCfNizbIAvOjOawvvddseidSAzJgD71PNo7iPhpkg5GVJIhs76dFUvb5PeIxf3oFJ6liuiL/qpQTbBYhpXMh5bCngPXRv7k7VEyXLqUDbQp7/lX2pRtn2eJVcv9wM+kd15QLKFuCefkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy0aIKmv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy0aIKmv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc891373e0so31835805ad.2
        for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786878520; x=1787483320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xccMbsoaEFd+utsSqS6Qyp/H3cuoOBB7T6MN8Xr/VQA=;
        b=Qy0aIKmvMlbxBVUDkcBdf25kjgtnoEGl0yNl8SC2PdajWbrhMHD8QSvK/DhaiDrIs7
         kLrnLD/hLnin4itTTix7q53gicZ44f9B7Tm3Qs2oKlVJKNl4yMgIK/M5kpyKTi+V/rGl
         +1diKiP3mN4wJaEQyHPSusDOPCOcxkwk/10QM+c/qVPfXDsAeRvTFuYlQJEtYmpX5a6K
         Jc+hxe7vTE6FbLGcTRNVwf0eYlO8n/1Jax5Ynw29Do25ZccvvPw0sGyP8vrMyx3H2093
         Q5tU/9+PPK3Q677kG1jToWlbbJp9Yh9hbTDFx/LEsvomvoTxqO3EhFGG51KXOjn/QvnF
         ykCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786878520; x=1787483320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xccMbsoaEFd+utsSqS6Qyp/H3cuoOBB7T6MN8Xr/VQA=;
        b=IFac+Bf5dRSpAK7WiH7ja1yd7o3x8snKPU2aUSlIJPgNQNQ+Dkltczu67M9QUG+bcd
         DiKsLoO3Eb467jxok+Q93coAAIe2Pc1DyI3J1yEv5ZO0RjtrmzZeCIv/JWCm2dg6cKot
         auJYBXxtZG0UqkknycsLu/ikxW+GO/prFA6eJO2EsR6/QgWVrgm78aorSxAR17w87iIi
         SqTeip4VgqjmTA9k+FCJq6RneSaNFnxkdH8BeYugQQflyWZB9Hvpg4hpDd72X3g/UIsN
         Q5AGWXobL1NJP1OMtCmO5CjABOJ91F9xVdn50yfAgjgrrELuEKXb2u3WslmVO5WUmfvQ
         /KUg==
X-Forwarded-Encrypted: i=1; AHgh+RpoGuUvgUpN+zpanx7fYMyy/1yE47N2K+/lwe/S+634Ls6OaEqcPHrnYbO351e2WHvq+4KYT4Q/rDJoqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPGsjYMMN6iMY7YowNR2Yl0riqMKka9LnwzDErojiCehlkfSL
	sHK5NeTgvAE99eVy//JNylVwYQ8BZaA6LhtPEF/TaQ1I9IuqjU1kTsnD
X-Gm-Gg: AR+sD13Qs6fnuwdg4KF8Huo3yA9s4Fo99Y/oRWukQcG5uI9JcvZu9wAHZhIA3tnCduh
	j8Di59lMvFuniNuRKE1FVhNF8K8UJqIGUnl5T/aMo8aAgyzphkDqJlSez/KjG/eyw50OT/aiJNM
	y+LwqmjFIrapVT8rUnBNYG/FkYRpEixWp918tJjUr1uiDQejB8DZQvqCNy+ywRfVVe+v2tyPn9F
	ek8vYpP9qKHnVGvpxKn7ucv/GFBSHoutbP48PgFzOuOmalJSpDo06dcDzgxPepzXG00nG6SyBw0
	CEx4XNsEF0I8iLnKOoqSVaogTLKGAJsPGLKJGTYAivaZ0EOnWFeTTUet665kBO9RYk436KKDPTG
	Sg65MJkdRmYZXbqyI4cpAuW3ilpp4ApabIhNgMqVjS1ERDh4NtuMYrJxpN7RHgEbFWKjSjMKy4L
	SuqCj2P+nd6VfO+AL8NwaTIbBFqwBjQyk3luGuwH9OrqhvMsuAa1S9cly811yhf3/60GVJ
X-Received: by 2002:a05:6a20:d488:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3cc71d55fbfmr22877617637.1.1786878520068;
        Sun, 16 Aug 2026 04:08:40 -0700 (PDT)
Received: from localhost ([103.174.141.112])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1413889bca5sm41718625c88.12.2026.08.16.04.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 04:08:39 -0700 (PDT)
From: Yashraj Ghule <yashrajghule.221@gmail.com>
To: perex@perex.cz
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	Yashraj Ghule <yashrajghule.221@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix mute LED for HP Victus 15-fa1xxx (MB 8C3F)
Date: Sun, 16 Aug 2026 16:36:55 +0530
Message-ID: <20260816110655.11592-1-yashrajghule.221@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815163312.29030-1-yashrajghule.221@gmail.com>
References: <20260815163312.29030-1-yashrajghule.221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 15-fa1xxx with motherboard 8C3F is missing the
existing mute LED quirk for ALC245 codecs.

Add the 103c:8c3f subsystem ID to the existing
ALC245_FIXUP_HP_MUTE_LED_COEFBIT quirk.

Tested on HP Victus 15-fa1xxx (MB 8C3F). The mute LED works
as intended.

Signed-off-by: Yashraj Ghule <yashrajghule.221@gmail.com>
---
Changes in v2:
- Use Yashraj Ghule as the author and Signed-off-by identity.
- Place the 8c3f entry in PCI SSID order.

v1: Message-ID: <20260815163312.29030-1-yashrajghule.221@gmail.com>

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3f0e276fc606..c4a68d84bd60 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7471,6 +7471,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c48, "HP EliteBook 860 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.55.0

