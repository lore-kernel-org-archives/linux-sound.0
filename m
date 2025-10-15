Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14DB31AF31
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521059; cv=none; b=d1yw6/a0io+LJXQHAdUY6KyTvzn+qR+mvrrnHMq0hjec32NHq/OpEnbd5St9qvT7kUyHvGUE/fsyQ5YJ5DGLflva1wUG0tlsm49Zz5GV1z4d+fuiFYRsBR8FAeWxw3EBkFwmmFBgfYlMP8u/jTQXY/loE0ac6iZ68bq7QqCueMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521059; c=relaxed/simple;
	bh=HsZQ+8xezG7RmPZyTc4tLFMEjjO/kEQr3ktYIQYNhXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M7TSUfrhxCmaZkxM2mDFbiPW0boxo1qkSK95XghtrnjpFZj4OYIA/Nhx6zzYZdV3oAkLkaVocwRbYyGBdWO/mgg99oplcIP37Bia0wUksyoYMqSz3ESICgIuL4D5pbK4DmTiKP0lQXAKopsBAjnArOXMWVKJHJ9Mm5L3R7a8quw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHqRVPEi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHqRVPEi"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d50882cc2so1179792866b.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521052; x=1761125852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV+I9ISiZTQniiLmzAEgHV54k+5yji7cXo9IliWYkaI=;
        b=BHqRVPEitqZZgfpthNgSCmo0P2JRZID629ZSWKV437EHn9YtVZvFFZYMZ2mxKJRkl8
         PlzlLHH8ZTMLEW85O0ZTMihuPXoe8T//Pt0ZOH9cvLkZiHmZXchVRWVzYFDOh3e/m5G1
         1tkU3S5E1P+crxSg9aiq778Yy0ldHmNLEj0SV9TVCDPpe/w+Y6MShr89rX7tzETWH1WF
         X34vNPA3nrXfi16kvmqBZwUEQOW4Sp47z4Qo4I0AiS8kggy9MoxTLHFSQaTB4tqimZhJ
         qXQCvzwgvthYcAxUxq8y3Sqk1paHTr+ELUIlcAA+KFFLENhiLLScRrC6aNdRcJ+R72h3
         twjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521052; x=1761125852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV+I9ISiZTQniiLmzAEgHV54k+5yji7cXo9IliWYkaI=;
        b=U6B5ABmtRzw0bjtuDCuK5D1/WNhkFhIp7gXsDsSdbpUOldFDfJW8GNyIgkirRBMdhj
         WyFNSMg+tMfepLlZZhidIg6nY0tN2W3P1Az5N7lq1guUHq21qb7j0n5P1ULpgWLbDobj
         njf962G+OmzIgwUB+40It1VV9yEGeAlmFCu2u7WHttynSTgq632C8VIY06G/dy+nMVbH
         RddTvpg2p6XRcVCV7Ggy61u4wW9WcE694d93I/5QvFZvV0vyB+WsP+Laq6NT7LBZWQgz
         YEryjXafNr+H30PHPmegWjFfaNwq6g+k35fiRVzGc94XX0fd85K5eWTe+bPoKl3DQId8
         J7Vw==
X-Gm-Message-State: AOJu0YzWW6dGYSnZx9vJWdxmtih8vUd3iXT7kdcAvM4Ad6c7JPqWJjZj
	gIte8D/6m9Twf4LaLoL0scGmnqjrlTJOFmjap0cFvu1Y1PwaUF3KI2qv6WH1XyIM
X-Gm-Gg: ASbGnctrCKYOK31LjoSyrWRxyLqlheZc1f0NWHdPGHs+O6cvSMRKT+vD+ItuNxFlIph
	ZHP4VqJQXcNdXXWqmDdzuiWPS5vGguOM8bXH2mazrwv/lQqNx2xPKbDhydEzzjYgW/9pey5Nm+8
	LsBi9p1SFc3qt2LgceqB/WrYzYjWeFHewSWURXPHvtpkRVWGSe64G2oEYFAN1Fkj9C30bo3D47e
	yRubipt5/Pg23OHU9v32KJUYGXZ8EWiEiOjdgGJBhirSrfsD5AQY6qzxPcWqRL4pTdIPiO2UFiE
	qOJ1nPoOxfTxaYhoCNUpghgBoZBRwWDePQQhYQSgy/jYaeYCzkFEckFakReXfEp9Rl3gxEv4dCn
	h1GfB/eJqxSUTj6Bo06aPCGlp+y+neOji41yog2ySo9y1GUuYX4JI2KCcaZJ+BejaZDKDdw/DGo
	Qjse70Y6Drm20+lekC7a0=
X-Google-Smtp-Source: AGHT+IH9dQubxqnXDnt+yGwltn6lkJKIsTm3TxrlUgq7XH+yKTpRW/Rd7T1THoDdPadCBQotMDoX+Q==
X-Received: by 2002:a17:907:fd89:b0:b40:cfe9:ed41 with SMTP id a640c23a62f3a-b50ac0cb1cemr2582697566b.34.1760521051868;
        Wed, 15 Oct 2025 02:37:31 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd6b03f3sm179251766b.74.2025.10.15.02.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:37:31 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 2/3] ASoC: max98090/91: fixed wrong channel constraint for .capture
Date: Wed, 15 Oct 2025 11:36:27 +0200
Message-Id: <20251015093628.659936-2-sharq0406@gmail.com>
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

max98091 with functionality of supporting two digital stereo mics
together, the number of channels supported increases to 4. In the
current code the channels_max in .capture of the DAI structure
"struct snd_soc_dai_driver max98090_dai" is 2, now with this patch it has
been increases to 4.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 77994539c3a8..0eeea6c1974d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2410,7 +2410,7 @@ static struct snd_soc_dai_driver max98090_dai = {
 	.capture = {
 		.stream_name = "HiFi Capture",
 		.channels_min = 1,
-		.channels_max = 2,
+		.channels_max = 4,
 		.rates = MAX98090_RATES,
 		.formats = MAX98090_FORMATS,
 	},
-- 
2.30.5

