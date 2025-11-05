Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F3208AD
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 05:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762320239; cv=none; b=paTFBJMt7iYwChwPY7FJZKSoGwwpYye0wZiH7MEffjE30iwfGfk9PaLDk9XOe2bx56VnwDccQ7fprrvu7hyqGDdt2z17RlCNlcSmmYzictnsm6vKj3Hbw6Z5+4lcAylMfcKXUdArxYwYpNno5m87IY855dTQloeTOIWWnLHutow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762320239; c=relaxed/simple;
	bh=vMnA4b62LyVOX+kITGE+k8NsudOnI+PdEK2A45KcDPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6uigC3NukXCKNnYASf5u2EOq4qkJpFUd/Y0LttcAYkzdgirN//PctpimoBoYmHNYnMd/pISNHwx4XknKUZn+x1iVm48YL+r7/4+MF6ymysHAYucB5HJ1+KaUv6gXL83cIxxpFF/WLkkzz6M61bG7ZD3keE9aBX9BUTGkAssgrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQpfZrf7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQpfZrf7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ece1102998so4254068f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Nov 2025 21:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762320236; x=1762925036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AryDtBRCtbnQiPG+FgwX1TudBAH/Sf1WgDB+03Apd6M=;
        b=BQpfZrf74FNiAt10Oy0ZO8Dz+McOCfilUqGjms8tsd45BKueYG1CRtF2cI7Fp1Jm3I
         dOeev0D3wHB9DUlW3oNFNVugkV+JDzIo/xnaVpMTk0d99YSHIKqpgoaS30fIUfes+5/D
         qKehJNcDV+ZvqGSQPKtT/a/cKyn2z/WGimE7k0aeyfvRRWvHu9ZDnFwe8K43jDAc7Uqt
         LoBmBxUyHboFx9M1JpoI+zipwNFi1ZtcgYR+0bgTuxT7auOLRqurtyXSpWt3FymmJ2Nu
         yR4bTm/8kt+uCvapslWJSa1EXoQ+WfQC+toR5jz3AW8+kTgmkvMI7N10B4J1C42s6ed0
         j7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762320236; x=1762925036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AryDtBRCtbnQiPG+FgwX1TudBAH/Sf1WgDB+03Apd6M=;
        b=VrY5BgqmuMcvTYW0uI6Kueu/9SXZQujVTNQCdW78tVOKlwulFhHL4Jv/fppEhsTEne
         /VXheCTQMkv0o4tRhqvMP3qDXTBzKog8d1dZZt1U57rIru/L5c7JiUoNiUhnAw5t2z4/
         WFrMsnsFpkRweYuQ1FQWLPcteP/JFR+pYd2deHCrnHWa89JHuO94JbxexIM0XWXjs71h
         WHQ/R/GH4g4WRVF1tqCy2cch4ojQufRjenA/zq/K0ZF57mXlpvpt3Kx8cJvLaw8MePhJ
         5/bQ+MfikiIlfPGlFmQr1iSqAmfB8x/otTt1wJYUOG88ofGsvFOnhqeE1nHqOTICIhrG
         gmww==
X-Forwarded-Encrypted: i=1; AJvYcCV3K0n5XrpHN45r+Q/DRmJMQe1cxC5hxUH5pwzze63CdNxc5onxBP9g8CUKtl0F8sUH9q8h5x5Y5e/l/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn35L9PmmAma77QjNBLq7ER52Q5krBokB0BtB/F4YXRKYq0Mjx
	cWQjElSyyB5HPq+cGrTTxiPgvUhilIy/IVw1WAN+dFDFeqGoJe2jAQbX
X-Gm-Gg: ASbGncvM8Cz1ibIopXZZEdwfmn/Qgbn2D82tUFNJ4SRUUsEW6KudmMFKZ93jQ0lcCb3
	uv/hYE/+r60C/zA2jHCKxszio5/0Pzx6wbAZ2Odpc2c78njseZkus8uFwg2/LDJIA9qxTS1Ka5a
	4dJtQqzhHPJ3sh726IgZYqZOjVYqOBYBqVkxUaOkY+M88WxxguRj8RRSV7Q4T8YHPSMMX+IQfvl
	0dDXEtm7xBKeWyqtaz1SvZwHz+eIz10o6KIHB5V90wXKgARbkTlqrH+5icSOdD/rrUgEQQzf29q
	XRkDRhgWFL0OMmioJu7fqR89YsYzeMAdfnT8xjmHVLPwlpRB5peAbsNY8ooVJ9SnvXEtzD0K2xz
	reNqtZUwSyOvwIF+RAB2QmKM5qDoX2FOgLO4eVxTO0ZBQVgRDICcswncNaNbRTi5d/z8Y+6KY8I
	7PymzxE14Bx2G0oA==
X-Google-Smtp-Source: AGHT+IFXnns6DvO6Tz+dYOGSr8t9XwwvqFN7DRgi2I/5OsUu5Kbr1vlFlSJ/pAsSBpj5U1U7TK8YqQ==
X-Received: by 2002:a5d:5f42:0:b0:429:def1:777d with SMTP id ffacd0b85a97d-429e32e35d1mr1483263f8f.14.1762320235701;
        Tue, 04 Nov 2025 21:23:55 -0800 (PST)
Received: from gmail.com ([147.161.143.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fbeadsm8190909f8f.37.2025.11.04.21.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:23:55 -0800 (PST)
From: hariconscious@gmail.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: fsl: fsl_ssi: Replace deprecated strcpy() with strscpy()
Date: Wed,  5 Nov 2025 10:51:15 +0530
Message-ID: <20251105052113.39999-3-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

strcpy() is deprecated,use strscpy() instead.
No functional changes intended.
Link: https://github.com/KSPP/linux/issues/88

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch replaces strcpy() call with the strscpy() API.
strscpy() is preferred over strcpy()/strncpy() as per the
kernel documentation.

Thank you.

 sound/soc/fsl/fsl_ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 320108bebf30..b2e1da1781ae 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1447,7 +1447,7 @@ static int fsl_ssi_probe_from_dt(struct fsl_ssi *ssi)
 			dev_err(dev, "failed to get SSI index property\n");
 			return -EINVAL;
 		}
-		strcpy(ssi->card_name, "ac97-codec");
+		strscpy(ssi->card_name, "ac97-codec");
 	} else if (!of_property_read_bool(np, "fsl,ssi-asynchronous")) {
 		/*
 		 * In synchronous mode, STCK and STFS ports are used by RX

base-commit: 284922f4c563aa3a8558a00f2a05722133237fe8
-- 
2.43.0

