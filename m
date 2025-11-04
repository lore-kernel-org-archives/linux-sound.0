Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD62C0F8E
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762235320; cv=none; b=Kt1g0D7alhpDtJgCRnpN0yZ7eNBdoOMc/y4uxmW22mQYPxuuBoeYec6AZuZz6umCEqy+nupucbw9E6O84QU50j1hCgBniM1/YM3EyzN5xnEb2d7ufJonakSG2WO/qdtmhd5Gzk86sZ2pu8v14UMiSlTwBDIwGIXLuwW7gxQ67+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762235320; c=relaxed/simple;
	bh=SoQk+AByx0B9wRad9q+1vgZW/a+k5+ol7C2iIungM2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkH6MiGS093mUHdlcswu6O+tVnSOOrjSh2d3YaBYgAn1uusFHcmep0npbww9e7T+h/f/kigEhChtVEH3CI8slZaxG+z4DS2qPZ/Bdb0OXEV25tLJaTHOkIgWCK4Jz1mD6LTgiaHjlWgDGDiaAhyxLxzcZsKzmGFNqKAc7XfaKPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbQZ0ih6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbQZ0ih6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso2604761a91.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Nov 2025 21:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762235317; x=1762840117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwmlHepJDXaxQ4eDoxYf0LfaCV1WGfYtTqn36dvPOd8=;
        b=XbQZ0ih6hPQwK9etNAfBpEFT7PtpeuXzqAbLcI/KzveUwBK5ftNmpX8w2oAEVeYPql
         HfHTRaWmAB8fN+mgtll/YZui7Sgosv3l0Hf37x6RjOhVJm4CfFB0tAEdVKqiihKrUaxh
         36dbsWmJefTh/fXizivLKuX9vTKhhOGrKiimy27cGD33pypPaR2CkbDd1x63l8VyhAq/
         SmE6r6SmhL6KRDgbiW1URL5hVm3Pz6xaDVlSVraUqPBe3nA1SlkYvb35ZErD+THAZHyW
         PYr3f49KKJPp1PNLeF7FgFj++Ipln0KglLc5jjA1P5jw4ThFbWpnp9CBdOO+pzp4G28G
         U3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762235317; x=1762840117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwmlHepJDXaxQ4eDoxYf0LfaCV1WGfYtTqn36dvPOd8=;
        b=KUxbdbRMheO4utKXPWtqOjXuBNWNBinrDr2ulCYHLvfcUja0o+33qwjjJ5B5KllRxO
         Dx+ST+icTQrWmyt6tgU1HbbQ4e1bLfpEi/JfpW2NCvQF9JhQffnhhZ/fNm7ACnZRde+D
         3Bx+WMlQN6H2vMW089KKdKh171/swWfuDWyKEmucNsAsQoGdbXIEvUMFRFmjS+D59qGl
         wOKH3b4hP4ObhJohQF4rXbaNIhhmWvDkJVw4eFnUmFv+eEIRaHndc2Wo8The7Bv+pFYC
         G8zttfhJo8FKPZeSbjGzBOvMWkchD/u3MGjS1WB07lxn6raGZiovxagkQQlBA1ZcLG83
         FUKA==
X-Forwarded-Encrypted: i=1; AJvYcCWs3VvF88XLoAFkdCqP81b4ZfKdMtFLeIC9AU5p6Bcx//ES7du94CF7ZRPyHLwYsUEzjisahd3DzE6YMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjevdmHLTqXL63RxOM/1RfUfx1sWHDXpn/6+kfMthGU+DCc4Av
	YwaAq88jLO2E1miTvZ1KOmpjCagmiroT4V3VCOR8QwT/2Y6VwysyHPBA
X-Gm-Gg: ASbGncvcyifyak7m0DMh1MXl4A/Xn1QTBB/adUlKQGM5DtzdKZCTyl87USdEiLTvkX/
	t5rrZ2mZLFkqja7gtp7auMZ19Yoi2yrfsZm4yHizwkTiJYt8bUG3CI3IE2cmmysa7QCA8PhdN4N
	hYUkqAw1yt5G6fDkLdalSiLkCehnrIH9/r+uok0GfMxo6X1j4vPHZydLBNTUuGXx3WaspNMTZUq
	oZyPxcJ3+6c4TE5q6TcjKzrsyd9RgBspeAvvtyNTFKd1konC4DA2xOXV0UVerRxMs0WGOGbFESg
	7jePM311+MmwL7bhH0Q0jlpJLDvFF5PqJ+79pjlk4s/u615RaDI3salVNJaR1cTc5kHZY2izpIZ
	pBRTCzjyXoQmWI6bo78trZFIogDR+jRdht9hgAGlCQ3LhBO70UM7nHBtySLlOLHMudKilKSC3Vx
	tw
X-Google-Smtp-Source: AGHT+IEO/1QaqQevZmDtRbW5FSbU38Ge7FvQkdRw0BAEdkYOrDNaBqA5V2pQW8KxDTNIzn/JWdb5cw==
X-Received: by 2002:a17:902:ce8b:b0:295:5da6:5ff7 with SMTP id d9443c01a7336-295f946fc18mr26276325ad.15.1762235317385;
        Mon, 03 Nov 2025 21:48:37 -0800 (PST)
Received: from gmail.com ([49.37.169.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a3a80esm11858525ad.73.2025.11.03.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:48:36 -0800 (PST)
From: hariconscious@gmail.com
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
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
Subject: [PATCH] ASoC: tas2781: Replace deprecated strcpy() with strscpy()
Date: Tue,  4 Nov 2025 11:12:58 +0530
Message-ID: <20251104054257.9953-2-hariconscious@gmail.com>
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
If padding is fine, will use strscpy_pad() API.
Please let me know, will modify patch accordingly.

Thank you.

 sound/soc/codecs/tas2781-i2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index ba880b5de7e8..0f314523703f 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1999,7 +1999,8 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);
 
-	strcpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name);
+	strscpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name,
+		sizeof(tas_priv->dev_name));
 }
 
 static int tasdevice_i2c_probe(struct i2c_client *i2c)

base-commit: d127176862a93c4b3216bda533d2bee170af5e71
-- 
2.43.0

