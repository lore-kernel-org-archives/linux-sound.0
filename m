Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4264F3191D0
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521074; cv=none; b=GVjmGqmqMLLActX+SOKcK32K1MgESIfDRi/0af4s92QVZZ96OyfSG5/ytm/d9El9Q8GTgTgDrQVG3qO0SeQX0pO/1hOknwHuvYEPhEzWqxQ6IMYEvUfKnlDi63JaDiy47pTrTh22vDxpMaSprFQ82bdmZQ/hOMivyOMS0GBANEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521074; c=relaxed/simple;
	bh=0xet1tZdbN9N/7TkOE9Uvqba8U62gpeifrkNhXaKOZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=deiM10VME/VoqV3xpTLq5h41sIV48Ye816CRD+bCp9SZ4VaxM4Q0JlSaq+gEdmdaLpHsKIDOblYVD+QTLKzvMq3Vph+g/DoSUSTrnLaxt1yvPFy0TsRXY4zJelSzDoZpdI0E17lhLwnsJIBrS8CksSBaaLkHx9jiiVz/6VXHf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd1rDx8k; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd1rDx8k"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1139126166b.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 02:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521069; x=1761125869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCic0ovNfQZtvGefKqOxCtoM7QMBYs+mAZ/6QvnPT18=;
        b=Qd1rDx8k5rvGFChXhl9FxP2CvD0jOaSJ64/ENmgjj9DYFa4sTn6pIWPftCZRv2DdnP
         7m00TCwukyfyaKuTli0jhNliXnZ1ZLReMy2D1MZyG5nEVdeb9wIu1I/xME4inP+lgSol
         PQQCJOtk/gudirrf6Fp2Yz0HXwazFF3OfoNkNxTcdUFsiaU3JhvwkhFyZSxokpS1KFrx
         1fov+b1hjbhhVipntE78Rxt2LCl+OeeghcpbC40IXTNsB/5f2JKPiz9uJe2wKPBUvPle
         74PEEIp5cTC9z4ooLwk6rK0ySRwmqfT/AGfbhS/dtGsteDPmML/Pq5sLLYhSjG0cXlYA
         PHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521069; x=1761125869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCic0ovNfQZtvGefKqOxCtoM7QMBYs+mAZ/6QvnPT18=;
        b=efiiGabge0XRC6LouNkLAzZ7uSqNc9l/IPKPA2X3wE2qcz5BfXOIDF8hrszLTbU56F
         nd/C5uvjWrZqzjkBXlVMAgvSUzS0Jp/SCjdsBLRybpLiBbGAjEEU/hgH/MKRpVGHpgDt
         AIqzalrQDUZDAlnmi1Mazx9P+peoAqc5tg5FGnIUe3ldslFA5RbeAgkmMZPrXW9CW++s
         XjtGH/AX70dYmkjeSRkddOLJQOc4Sx1mj59cfJw4dhZO59QoxtZtFkgcIRZIAu54A9/T
         xUSzqIhcO4tH/S611TXLlvV43TbsHGDwKK3xfWmZGwiltdPgWcm59hWT3BFjtZQ6yDb9
         z4lw==
X-Gm-Message-State: AOJu0YyA3i4FswcNMqOVj+Q+BFxK6d5NkAyLKCOCJgyHO39dTawr7Afy
	Y+42UkhZL/EPKZd0gGxIA2uzPnpYl/IASiebyFOZICpUM0YQrexvFG9Ualm2mZ2k
X-Gm-Gg: ASbGncsElbP8Vuio0AbkxPAlhoLoy0xV+/F7GJ4L5O8+XC6Y8PbHEIGWl6jwfHWxDM5
	ldta+/n6hOl8c7KVTqMZssMllaDvHBvgrOeCJMjJYHcDgY2gRDiZWr4oS3wOkXUrr90JSHruXQz
	pziqFWengwYo+Oa+w45d9YlNW7PV30aAp+Lj19gm2w+bmHab4nDg1epjUxpbWTmZEGlnastylYa
	ECUZt/VjUYudeftcF0v1u7QwdiY8lvXOkIolQsEsfI9uORwFLEFdft2GOVuztdeN/AFChOaT3wc
	KjEEu2y/f/8wTUObHSkC3zG83Ylklkbad97nirSCL6a4wE71IpNwYGofzU2L3MrFzgKQdMSO+LA
	Z8MC4qvBhlY2OxvhYG+n3W1CZ7KvTDeosFhEewrfoRkjBesRm/FjXt9q/K+NvHz3Yz+c6whReGz
	jcAvh/I/XqVp02iVHQQY4=
X-Google-Smtp-Source: AGHT+IFEI9engI72mZonVzxCBti0nzF+kQaSujsavyAA6zfeINSloeV1xY0nswGtAvBb321aeuVm8A==
X-Received: by 2002:a17:907:6d19:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b50aa99e0f1mr2870815766b.28.1760521068967;
        Wed, 15 Oct 2025 02:37:48 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd6b03f3sm179251766b.74.2025.10.15.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:37:48 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 3/3] ASoC: max98090/91: added a comment for the users and fixed an extra space
Date: Wed, 15 Oct 2025 11:36:28 +0200
Message-Id: <20251015093628.659936-3-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
In-Reply-To: <20251015093628.659936-1-sharq0406@gmail.com>
References: <20251015093628.659936-1-sharq0406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

added a comment that may be of help for the users of max98090/91 and
fixed and extra space.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 0eeea6c1974d..386ef0caa6bf 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1708,6 +1708,10 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 		 * for Bit Clock Invert (BCI). The inverted logic is only
 		 * seen for the case of TDM mode. The remaining cases have
 		 * normal logic.
+		 *
+		 * If one hears noise in audio, try commenting below code and
+		 * then try again. Also, try playing around with register 0xC1
+		 * record tdm slot.
 		 */
 		if (tdm_regval)
 			regval ^= M98090_BCI_MASK;
@@ -2414,7 +2418,7 @@ static struct snd_soc_dai_driver max98090_dai = {
 		.rates = MAX98090_RATES,
 		.formats = MAX98090_FORMATS,
 	},
-	 .ops = &max98090_dai_ops,
+	.ops = &max98090_dai_ops,
 };
 
 static int max98090_probe(struct snd_soc_component *component)
-- 
2.30.5

