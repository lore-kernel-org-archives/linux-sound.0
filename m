Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E803246EC
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778391760; cv=none; b=MEx8BH0RRSyMP38c7we8mztqNxvrPRSssqDLdnb4L2SM9KeIonWR/k7UXiRrSiaBp8J82Sqcp4BF/y6mRXDzDXeP7GgBlWhcOW3C2rwtCFk5I4tEeGlKwU5ShtiR271rt0HWCLtldVkx5VtVTNS5zm1VrzROqu9SA9+GpOHFGDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778391760; c=relaxed/simple;
	bh=Ihxi4KNOEEvlmd2zoiWy17HenaFDDKThY+SN88NDvYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIIR1+CLB92dlvSTYDrmNjsyDfjtXuoqKz45BpkFyvF88sJ9kgIfzoBsHcfxkZ7E5e0F3r/dKzTYpxmbL0BryD+PQNKl89fUZiSE+0c5XaAd9JJU1nyPeqoiiFwHZSCshBERjVkTyGR5vcc1Wv9R8bnzP+3DPo5gSu3rymCGo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlG0ZtGi; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlG0ZtGi"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-132c3280e8fso618417c88.1
        for <linux-sound@vger.kernel.org>; Sat, 09 May 2026 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778391758; x=1778996558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8enRmADSeIqpedQJEEHvSBxiqLlAtmUEe6kyexwW70I=;
        b=rlG0ZtGi9i4yyFM8Fi6RwU4PzTZwdeuGwcIdk997Jn8qVBiG+sigjcsF/bo6PdlpS3
         YdBvO0MgZeEfnh0GmhNUKMt1pKdaRvdvNG0j8uLsTPMVHfivpuu147U2OOPbltayaffn
         skN4ibOtcaDr5JbhZ0uFhq3WmLVkL8VbYqS4J2ZnWTwq95WlWJaAceh+w/bSywX+gsKB
         vfEx7srwoI5o2qIx/WL+PDFw/TWh8hOrfvq6zhfvS7zUCM71Aqze3T0rTyGFekhjrJg5
         eAiYVv0UCANr1TRxcQy54V+HrbcTcgUmYp8Uz6cGaAXs+Q5GY8rcJIoKrt8Fv3odryRg
         1pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778391758; x=1778996558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8enRmADSeIqpedQJEEHvSBxiqLlAtmUEe6kyexwW70I=;
        b=OgAK771WIn15JwdR/39SPi9Q6RjyW1OqFHlzNgVf8vNx6Pdcbr6ye69w/OGxg6sHRF
         GxYM9ZprPoLpa4AnIfSv+MencS+ZbCQQ30NOYdVQ2R7US5fzhgWkXXkJI89Y9PfTGu73
         b0OcC3XaroZxZY9KxsCL3JHHwN0DACIv1F53fkX04JA6HwKAmZdOl6N25Olxy5BTH5vr
         RB3AfE3KzvOJEMZmLsxIqoNJ6yG+j+UjimFTUAOky0dHzD/v1rplQAZjQj45IfxDJ2p6
         56TAMXyfxpy5fUqw7HxbSa8OZUaRXK1uvQKZbHIUfUTWhS7asQbAGd83EtzoBGvt7sdt
         vqKw==
X-Gm-Message-State: AOJu0YxGd0PUohX05vLU4QMutFxD/YYTxbLf1IuUMG0e3tJlARDUo/so
	36t8SouQpDStVTWAbNmIYPFCDZozHCFqT6YKCNAj0nDJNLq7LUekXV0mVLcTsnN64TE=
X-Gm-Gg: Acq92OFgCei1HNFXNm4OgMFVe65Rd+1c8n046zKRlhD+1fjITby/N2jzZ9Gdi1jvg6B
	Uq+zWddJXuGzJ+9Xgl2lqo80xwRBi5tD3xjd5XCLQncWMraku81XutsxvsIFPfD3Pm7Ljyw8KYy
	f9GLVYWvsjRVxvZxQuaKX3MYn7rgPpgmH/aoH1qLRrPQrcandttL46F0eg2+zvWNCAKS68E17VH
	wwcvVc7lNJ4+lfKllt26hRc/6GpIcxqUW7rixUWDK9AX5A0u/GgctliCuNFHRe+MYsHxbbxgqa6
	M1k3GgFneKND4uO+9wJNNL8UYIPEZ6Pz4akqBJdZ8gWe8VZ4aFNScJ0lTgMDWgiDWzjnGpA6D1P
	2iqk7e42RNcbF2Je1Omai3XxkVDTzMi5ogvX7KhOR9iStFPxyJSR3Djhy0qgiU55GOepOnVtKaC
	6DJDjJyHktH68P87Zvt3R48+PrFE5MZGs9N6vFzTKXxZ72jirxSfWee+NzTqAxEDgUSaGmm9sB+
	nN6UmDpA2xaW2Jl7xly/7KiXLdKUW0Mn6DRj/yll4afhys5sDq4oJU94H8zbQtScMZBDw/WLTMt
	9j0VDlyHEjJhC3Ovgg==
X-Received: by 2002:a05:7022:f10b:b0:130:9b78:b180 with SMTP id a92af1059eb24-132a8715f72mr2229438c88.43.1778391757910;
        Sat, 09 May 2026 22:42:37 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm8820237eec.12.2026.05.09.22.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 22:42:37 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: ti: rx51: remove stale reference to machine_is_nokia_rx51()
Date: Sat,  9 May 2026 22:42:14 -0700
Message-ID: <20260510054214.564950-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rx51 driver relies on the machine_is_nokia_rx51() macro, which was
used with the legacy board file dropped in commit 9b7141d01a76 ("ARM:
OMAP2+: Drop legacy board file for n900"). The use of this macro
prevents the removal of machine IDs no longer used by the kernel from
arch/arm/tools/mach-types, because the machine_is_*() macros are
generated from mach-types. Drop this unused code.

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com> # v1
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes from v1: Fix mistake in commit message - machine ID checks
still work with DT booting if the bootloader passes the ID

 sound/soc/ti/rx51.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 7eeb12e5066c..cfc23e0838c2 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -19,8 +19,6 @@
 #include <sound/soc.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
-#include <asm/mach-types.h>
-
 #include "omap-mcbsp.h"
 
 enum {
@@ -364,7 +362,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &rx51_sound_card;
 	int err;
 
-	if (!machine_is_nokia_rx51() && !of_machine_is_compatible("nokia,omap3-n900"))
+	if (!of_machine_is_compatible("nokia,omap3-n900"))
 		return -ENODEV;
 
 	card->dev = &pdev->dev;
-- 
2.43.0

