Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248424C076
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761756100; cv=none; b=aSl5EdNUw2Sdsh0nWNCCwXhAZlV3BQECu/nSFVcpENEwr+KPPsUzKUUK7bVVbTVDUOArCZ+iios+0kI8mpX7y+aKuUMOCO3N7XWpV01WaIq9ETW+Uh6z5N/xsi0Wb9Mfpp7PPbH42bZ7qB46wBtOGGvt2R7SdVtiHZn6ewgaTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761756100; c=relaxed/simple;
	bh=bK8V/r1vMqRPnTrBJEHJlk2rl2cERA+TWYlibgHEaIk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C3GXft1/ZzDco+/AAlPHTCEY6Y5cVeDL5ZwFjKfTBuOVQDg8r+er1uWlbCPAtMP+L+COAMRZHDjIgFajebZ4XE58sFCz6H64UktbgW/YgTBdrrzeaZBsqKnTMlbitFsjTifGdAzA5BbEYe//9WSnYOjXq60MuotjcVgZbdD/MYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUqKByr5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUqKByr5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so14434166b.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761756097; x=1762360897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntuNS1GJb6xyWRPcHR8LQRNb1Co3tBR57KGeyLs9sDo=;
        b=mUqKByr5EUvqGzhQIwCY6sk69KtAKCekpDKP84EidzWfTZuhb1qYWiLQ7mH/0ymwTL
         lYcvGi/ts3zROyGarSP+7D6cNOV/zMHLrZlIVQJ9yqtSULL33fGoA/dHIp4kSNAIS6kZ
         k6b2FuyaSih9BjNk5M7G3hOJ8XLXrkUg6ZebzBWg9/w282IrHr3NRx4FhpeqcSOpukAf
         Eyi1Qgm10ynb09NjcY3bU9g+cGQEzt7vHZ3fxxqXYqrVOOh3Qbn/pXKlprVE7uLsBGxQ
         GDVC4unqSR/I7xv3gUs+bGAqxCWCvrU/XZUncZQzEe6I/kGCQpE8R21hKM+ubsfGRz3g
         E35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761756097; x=1762360897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntuNS1GJb6xyWRPcHR8LQRNb1Co3tBR57KGeyLs9sDo=;
        b=emfyt8jFMMu+/j6ex6Q4HWx0zxsJYDEkL5DSr4czE9qdqpurRPXtD2e6Bh9pKA+Wjw
         HE6QZEDY8qw5phujJGXC9Cdy/3K0fqjYSolp46/kYcUTID0/DbVfw2DQz3U+z4J/yTfb
         FHl8VxaxyYcf0/uuetbEYdITlkKB/j1TewFUTHYcv1Ye0KAQ07/V9vhPotnt1+rD6LCK
         ElusbxGydRF5+wh6Ovkt8QQpPLyiJCQcHmlF6PPPOgfzp0rZH3CpwmrJ7Y8TfQYpnvBF
         bnckJzBhy+hbe8iTSnEdJ28Qr0FSmm2B/hMzoiH8UnVEoJ4Eoy2D8NjDjhZ7QloodFTB
         8abQ==
X-Forwarded-Encrypted: i=1; AJvYcCULLB+uaiK1GQjWyEuP1FOcUjAYeM0fyXhXVGH+/4+f7V92Qk/dPcqOZ0/ks1p9rA6PQypP9DnjYZAfvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmD2xEnCfIQS9U+7OPyn3/R2uD2GPN8XEd99mlz1AFgbtxAGW
	dvEtiWspbg7pz2/iXreYZ56yQMb3dmue+SL5bukDAMBogjcbOp51ri2v
X-Gm-Gg: ASbGncsvIq1Jv8xbuQD5k/g+AM3kyTh7BK2OdQBjXHX0nH7kuKHQs9NYsNvsg0Lkj9P
	WbOwunCWaTFLtMzcVUVOTXBjXHRq7nZ4vfTpR7o9BGrXq8BT6pjNs5MrNkvCdej3vGEHAozbvHs
	FinqJpXGYNCKBgDVaFpt206OG6hqR0N4zigroDc1wkBpZl6nlgldVO2JcvNQdSrYquoym14QuZP
	tvjG4bSl2yAkCVpPyyr8MxR58XXcobd33GvfchvFhiVoZc8qt14Lq+gT3/KFcNLauRtAl0kIOqR
	V/xRQuuggew0RHjRp2sKeb9GCD4qlhAWO1dAUnh659jnRu/FgWYFy08QCAmoPt/cMgAWvf43KS2
	WipH/n8iPGesnhyJszAjHRCQuKnqbTqdEf4X7mGi+SsAzLzxb2TxnBSK5cBMj+CgDlCa9PBCpy8
	+OTPUj4RoFq0/5gcU2P1OpoH1Q45Itd8Qg5sIm+R7Ajd0uTaCyL4MWoQ==
X-Google-Smtp-Source: AGHT+IE5ZDJmVtVTajVcHA0yKPLibrZMyGe97/rlp1JY2BvzhBfy7IZpUsLHyr+no1Pve6JrQ0ywpg==
X-Received: by 2002:a17:907:1b03:b0:b46:31be:e8fd with SMTP id a640c23a62f3a-b703d2fe419mr355708666b.26.1761756096987;
        Wed, 29 Oct 2025 09:41:36 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85398463sm1443155166b.34.2025.10.29.09.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:41:36 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 1/1] ASoC: max98090/91: fixing the stream index
Date: Wed, 29 Oct 2025 17:41:34 +0100
Message-Id: <20251029164134.4123618-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function SND_SOC_DAPM_AIF_OUT has its third parameter
as stream index. The stream index is numbered from 0 to 3 for
every output interface widget but with same stream name
"HiFi Capture". So, if the stream name is same, the stream
index cannot be different. Also for capture, there is only one
stream "HiFi Capture", so only one stream index. Therefore,
with this patch changed the stream index to 0 for all the output
interface widgets with stream name "HiFi Capture".

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 2e6ec2ac5327..0891ffd0e123 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1144,7 +1144,7 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 
 	SND_SOC_DAPM_AIF_OUT("AIFOUTL", "HiFi Capture", 0,
 		SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("AIFOUTR", "HiFi Capture", 1,
+	SND_SOC_DAPM_AIF_OUT("AIFOUTR", "HiFi Capture", 0,
 		SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_MUX("LBENL Mux", SND_SOC_NOPM,
@@ -1242,9 +1242,9 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DMIC34_HPF", M98090_REG_FILTER_CONFIG,
 		M98090_FLT_DMIC34HPF_SHIFT, 0, NULL, 0),
 
-	SND_SOC_DAPM_AIF_OUT("AIFOUT2L", "HiFi Capture", 2,
+	SND_SOC_DAPM_AIF_OUT("AIFOUT2L", "HiFi Capture", 0,
 		SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("AIFOUT2R", "HiFi Capture", 3,
+	SND_SOC_DAPM_AIF_OUT("AIFOUT2R", "HiFi Capture", 0,
 		SND_SOC_NOPM, 0, 0),
 };
 
-- 
2.30.5

