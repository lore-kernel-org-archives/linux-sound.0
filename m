Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8954427FD75
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 05:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774416255; cv=none; b=ng65OT4zGwI8Hvtq1g59sbm7MUm+NTyr13PZuHCHzQA0iTOo3sCRCfkKiEZoOXulQlTLCFNZieEXLPzwXYntWJpktjhlpubzA+dcXo92Y5W5XGCKoyrbekeHLU2hDRqXorL9q3vqI6oh9/ugLRwqEXxVwxuWt/8VNvdE9TQnPBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774416255; c=relaxed/simple;
	bh=KqjaiNnAlAPreuSxG7DjoetmeL8FSolRRY/lNgyvst8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VAcxVM7H0lHRSFlYpsF223o6RzIfaC4aiKxf/+LAoEynVoLcldFet7RgG8hjrDaPjwMS8zm+XAkCvNDlP2nlnLoscOTJyxB//hlytfgaz5pZZlbyWjQTN/Br5IEynOShmAHU7Unf0xBLvUU4aUa0nEi0CCwjBE3Bph93ihT622Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLfkDFU1; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLfkDFU1"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1273349c56bso6166355c88.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774416254; x=1775021054; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e88oFCh7yqD8A+Tm1/EPxMaGiF4K7zil+zdbycpzdGo=;
        b=bLfkDFU154MNssCt+ivhdDqNzYAd1eEFYTQj55yVf/95zvJGymtVZysHlYeir62JYS
         7MV/dho+1+gb+0IQVQWtW1vaxqCRPo5imnX2ON2UgqO+UYaJYfKrT7uwcoDvAarA8O4T
         aRM81xVT6KmmKwFNXoNxTF3wxXCsCsKE6dnZZ3mDH6O1H2pfCL8+13b4kaIrO+nRg0rM
         tkMKfwgLNA9CIqXh4ZyVWoOpSKVmJ3jnXOHc9t5wykos4rQphxDOju5WfpCkl8/vjQ1V
         6OOu3/YpigiAPSLQE4/MNBoa02/nrbrfiqvLYwTu9QERIBawTy/wTVEPpXPa6i7gArbd
         vOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774416254; x=1775021054;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e88oFCh7yqD8A+Tm1/EPxMaGiF4K7zil+zdbycpzdGo=;
        b=jg6zoD7gmXxcOwTKuym3skGS9ND2OwsPAQY0D+AMJoKCmEOBHecF7ahpH67kidcPuf
         NClxUddQ3/GF3D/1xeTuZidTtlLbi4bl7ldzxUNS1fAj5f9gv/5iysXi72NCyUrt8TjP
         +nDiOOr3gr1nOTaq0ojTKqbF5aiU4PacwACE4Yv2CYYzXDZ0PRutjq+C2+M8/tqorolZ
         oA2tln8szGuq35UpMErX9IdbBCBMUaF62QqvW8cFKRIg4FFLe91gARtNS6orJetkzg6z
         Exjf+ERr0yv+xctNt3ImvVpFpLvT/QHXf6VJzlSIs46ZTTVH0nZeZF3bLoxl4jGl1yN1
         lRHg==
X-Gm-Message-State: AOJu0YycsxEYqfVkdSaVpiwJe0PNnRxFqjhYCHB910opgtkvl7WAuMBJ
	jHbLNbxUBtILrg8jm/+5ItOrPGELV8qwiFgFtXqC94X4f0DX4yg+Z8HJ
X-Gm-Gg: ATEYQzxVrddtR3Fy/lG2BIUfzdhopMUyPPIuCjXvGJLEREnn1o+hcDfwhkXHfeF/NUK
	MDMs1Y6yBiNWsMwEPyyx0RMJIfBXYELz0R7BNiBswCaobB5xbbEb4gQ68CBRH74P+lPfa7CQPrL
	wtFfc2ATnERn8YB02nondhAssBIjh/EmIV2+J/wncSfBtwb72JwQqVZrUeW0uGqacI/AdMO2+ZS
	CKmFnReRAmzkm78WaPlkQK3/pSmkONUDKX2liFyHoOAODS0oQ4ItZuCyEzVPNl85UfsZyxR1YKy
	zFdpGiJdEL8dovC39nXxT7MJ/b2jrxye7zEgMM9+a6JbY8gBWLHWEU8ugfz2kBwrxdeUu20j1SG
	jKgJSHETSUUv8ndPuKZHVh7ZVRLiQuAB3oIQJNVmXyCgRJc58cvqUK2Rv28NieAHjf7R3u0v5Qr
	99iXwePXX2TLzSmdu13lKaZtLfQICCTaKcKzU1W+zM10M9N/GzmNLHegBk2pX4amt7Rf2+ePa17
	0EyH6L3q16iB1o=
X-Received: by 2002:a05:7022:609f:b0:12a:78c8:d3 with SMTP id a92af1059eb24-12a96eef460mr1027541c88.25.1774416253413;
        Tue, 24 Mar 2026 22:24:13 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733d199asm12387631c88.4.2026.03.24.22.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:24:12 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 25 Mar 2026 02:24:04 -0300
Subject: [PATCH] ALSA: core: Validate compress device numbers without
 dynamic minors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-alsa-compress-static-minors-v1-1-0628573bee1c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAxA0V8ZeTbQVabor4gPaZZqxLXSdCKM/
 budPh643AVMiorBuVugyFtNc2rodx3wndJNUMdm8M4f3N4PSE8j5Dy9ipihVarKOGnKxbAPMkY
 +OTqGCO3Qmqif3/1y/dvm8BCu2xLW9QsLDngOfwAAAA==
X-Change-ID: 20260325-alsa-compress-static-minors-1bedfc90a7bf
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Omair Mohammed Abdullah <omair.m.abdullah@intel.com>, 
 Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=KqjaiNnAlAPreuSxG7DjoetmeL8FSolRRY/lNgyvst8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmHCyt5/6xv+LbX6FSgXnZWHs/6Pc4LVt9nDJW5vJLTK
 /zDffH4jlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZiIjgLD/6iccPueTsmTizbs
 lzjkr8cbffh3ErdC5q6235NTK+es8WJkOK/EaXJzf2v1yWVHU96yffPd2L+2tvw972Z+85Uv6p4
 f5wQA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Without CONFIG_SND_DYNAMIC_MINORS, ALSA reserves only two fixed minors
for compress devices on each card: comprD0 and comprD1.

snd_find_free_minor() currently computes the compress minor as
type + dev without validating dev first, so device numbers greater than
1 spill into the HWDEP minor range instead of failing registration.

ASoC passes rtd->id to snd_compress_new(), so this can happen on real
non-dynamic-minor builds.

Add a dedicated fixed-minor check for SNDRV_DEVICE_TYPE_COMPRESS in
snd_find_free_minor() and reject out-of-range device numbers with
-EINVAL before constructing the minor.

Also remove the stale TODO in compress_offload.c that still claims
multiple compress nodes are missing.

Fixes: 3eafc959b32f ("ALSA: core: add support for compressed devices")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/compress_offload.c | 7 -------
 sound/core/sound.c            | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index fdba6e4b25fd..5a0308eb4e31 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -41,13 +41,6 @@
 #define COMPR_CODEC_CAPS_OVERFLOW
 #endif
 
-/* TODO:
- * - add substream support for multiple devices in case of
- *	SND_DYNAMIC_MINORS is not used
- * - Multiple node representation
- *	driver should be able to register multiple nodes
- */
-
 struct snd_compr_file {
 	unsigned long caps;
 	struct snd_compr_stream stream;
diff --git a/sound/core/sound.c b/sound/core/sound.c
index 93436db24710..8d05fe0d263b 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -216,9 +216,16 @@ static int snd_find_free_minor(int type, struct snd_card *card, int dev)
 	case SNDRV_DEVICE_TYPE_RAWMIDI:
 	case SNDRV_DEVICE_TYPE_PCM_PLAYBACK:
 	case SNDRV_DEVICE_TYPE_PCM_CAPTURE:
+		if (snd_BUG_ON(!card))
+			return -EINVAL;
+		minor = SNDRV_MINOR(card->number, type + dev);
+		break;
 	case SNDRV_DEVICE_TYPE_COMPRESS:
 		if (snd_BUG_ON(!card))
 			return -EINVAL;
+		if (dev < 0 ||
+		    dev >= SNDRV_MINOR_HWDEP - SNDRV_MINOR_COMPRESS)
+			return -EINVAL;
 		minor = SNDRV_MINOR(card->number, type + dev);
 		break;
 	default:

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260325-alsa-compress-static-minors-1bedfc90a7bf

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

