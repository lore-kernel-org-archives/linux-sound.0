Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679BC40DFAC
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050021; cv=none; b=Q+R5/8KtGuJXEtry5BkKxnb/SM/XKOYUJfIRAeWTHTyuIy8O5cWKYwnTN+zkj9bp817ZGYdBfyqMDmEmlHYENzPpFy+F8ROAVnWKKQQ25fU4cij1VjLecUB403jhuv0XeP4YuLq1/4zJV+OlSNf+8S3jm9EigKdDi6U1WdqbYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050021; c=relaxed/simple;
	bh=Eq7AiSyUe5x724YmkToZzNj+bhT6SMcbZlP8W/ontxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StkzSfu1e+7fcGwYuM6w0HMur0wiXtFqWSj2yoM4GwihhxHk7GiabUdEu6UaR/Bbu1vF2ZkwcDeUyFbzpFx45nWjuXWbRcIQBctFbsnz3k5FiIdFBEfEMEf/38ZZJa7C5cN5ik9kN1zZrybPC0SdeC0EJfU6+wGSzHEfUth61+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnZKMCOI; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnZKMCOI"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so3601320a91.1
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 20:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776050020; x=1776654820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GppEUacIi0+YAoU9LcH4rary7mmQqN5EezxmfgdeTAg=;
        b=NnZKMCOIikFoWOXVwrmm+T+Z+tWzJt1FS1FPonGRCkRBpM0EYO87ocb6+/O4/kaRa/
         lOdYGe4qbpz/Y3z8MC8WJPJ+XWVV53IPqHdY8Y5asON6YvAdI8dlGpi2P7tuuisR5LLq
         YtrIbDl5c/qPNaZtkI6cuEV+gYTFJCCJgduiGhjAN/UShhnlSzbjBDPLGWnjElj9u6pe
         T+hDj6+sjDLiSxLzTE2vtX9mgSAWS9xLshnQ0S5u0NStXkdYqkZ9QDqiwSCgZTOPCsX2
         kROjyVoSxUGNG5ziGbjZfzkj/PPxi0cLdmnNDeVjgSPV8WMO7wWNBmIzr3Be+BL+o5Xk
         bysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776050020; x=1776654820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GppEUacIi0+YAoU9LcH4rary7mmQqN5EezxmfgdeTAg=;
        b=XbqIFfEuaZRhOhXojNh1ia/VzMXGeJQZvH0UlAGBWaUHaJaumjP/R86cWyQA1M9gjd
         gFhGQTmQqHa49YUBkwxq3i8MUg6LnfWGxFo7shdVTOxiVFlo1nicd2XC+p7dAvhMuJHp
         EsS13MP5fvWOgS8r1StbL+Jf4VdyyeVzDz12YnUPOYL1YJOSYSuK40iNr8V/QAwpL3qO
         9vLI8X75V3AR5JQNafKLZ0gqv3kAj5qp7ChcZq/9w/ElELj9rZUL5LutOY3p/jiD1H+y
         cUPozr4LFn5VM1sbtFBrjbPAG9R6ssVUaFdcN62sRjkZSGcH6Ul5H1r1JJQsa0i6PIlF
         y7pg==
X-Forwarded-Encrypted: i=1; AFNElJ85sxFviO7AsqM2CHxokTkqPXyfhlscwgDaM7+kihmrW5LVbt4Ss5LJ70C0yDQr28d+9e00OMKOdVlY/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgLf0sB4GauJuo+8BlH4XVUDc6lvlvnFd8seXK4SUlFUVqEZ0
	xHkvKniBIQsj6+UAer9ZTopzOnL7EfziICcRcK0wg8Oe2SOu6tGjjT5a
X-Gm-Gg: AeBDievC1k5Ow8zOzpq4IfxGoEMr1KTjKF9H9D77PGJHfuYkxF2HhEwNX/K6QzzD99H
	8pl/0xvOuPZU1dI+0e30o/xc464IulcbXwi0xE+7QnnDS+Rjpc0/emrRTVnIAW8mTb5DPqcq04f
	0r94KYduN9o7fmjufTN+S6oDMf5Xvpibx3bmwcNPmY+9q9wTQqYh36tJalcXLsLLX9LhzSMgnou
	Db2SBDILuUVWJM54e3RCjvQ3pVCcZfrOcRYMIp8b09wOYu/UCQ9h3CAFH+DTxnifmhvMK4atilL
	iX39+cQkZ9cYDFbGzGwsxhVYQ3/FqIVwEolYtzDO85ryxN/z+OrVDY/PVcXzTtI4q2NPimHaHGw
	6lgJSvb1O11sGIkDRice1R12rVgVlQJDaJp0q4j1xW7/3HkF5KLj5bTJzds2qmHZfZloMepnwu+
	s01DWCWspHsVqJHXS50LXmHdzb5rDLcQGNcj3X6LvetQQpurALhw==
X-Received: by 2002:a17:90b:3d86:b0:35c:30a8:319 with SMTP id 98e67ed59e1d1-35e423f41c8mr12647368a91.0.1776050019702;
        Sun, 12 Apr 2026 20:13:39 -0700 (PDT)
Received: from FoxArch (184-155-120-110.cpe.sparklight.net. [184.155.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e581537afsm4808028a91.10.2026.04.12.20.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:13:39 -0700 (PDT)
From: Faye <faye.opensource@gmail.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Faye <faye.opensource@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer PT316-51S headset mic
Date: Sun, 12 Apr 2026 21:12:59 -0600
Message-ID: <20260413031259.30135-1-faye.opensource@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer PT316-51S (PCI SSID 1025:160e) with ALC287 codec does not
detect the headset microphone due to missing BIOS pin configuration
for pin 0x19. Apply ALC2XX_FIXUP_HEADSET_MIC to enable it.

Signed-off-by: Faye <faye.opensource@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cb39054..75466f4 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6689,6 +6689,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.53.0

