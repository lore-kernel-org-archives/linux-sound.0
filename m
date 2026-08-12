Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF4398915
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529704; cv=none; b=A29pEIPtxsjGZdcv9Vgfu0cM/QgRjbpYIwzQo6/Z9BZK/y1ukePfAZRD8nS7BjMzCJ2GaqSDLEFO3uixOj+cpo85PhdyIm8PIMqBsI6hAMg9aevLNFrTgkBQqBqaxFqp+hqPZSywzCExbTVQAs5DLvEr7gjZu5m7KO1ssx6miC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529704; c=relaxed/simple;
	bh=4BhTPX3pNziHNfBGlg/7EvSa3yOHXxAR3Y3AgDtsako=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtnxjclvGL6D+b+ukOC4XGK2uRbJGQa1PIfcY7j1wriyZhouuH3DMeDq113ivvg3uqgBEDueyFjuDD3UsuHv9KKvtI802pSmbBSZUIqlOcaRK/dF1p7p3pYitHSfqAS+c1iSApQccntmffgdU0kB5/SWYNDQrKJKZE58jHqyRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpzM0Zgj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpzM0Zgj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacb8416a1so9940855ad.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529702; x=1787134502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=;
        b=RpzM0ZgjQzIl0hYP/fh9hbqXMXPEZHmmIDRVWRGb+BCmx9YrvTg064Rs+ET/5vn0l0
         hU8L9/7hfnc1T9BTaTU97LNVCxONGOfDiUdtGNcLm4u87BbHJPBW985jrTjfuvsWH9IV
         ewWyFaXx1Z7DNW5G8NiZS5fEC/KA/JsLVSWEoHuDnibxfy3nMQme7yDJ4Pv/OSHANy3H
         pNzFTf4c7jX26ah8HMyp1PZHoHdmhwklIJn0Ocuch4zxkljepkUmAfB+1M1fLXAVB1jE
         XJ6fD2Oob8eWAlVY5nOGFtHTqn1UkHUoE6eP2SmIfznP+7MfSRdX6HSQWEuOZ9BuUExb
         0vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529702; x=1787134502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=;
        b=pd1O2mSH8XX3+a8wZyI0ybEdbYGmaoS9kClgYxrHvwd3h6X2ji9G+kk7w8pZydLs8i
         puJ2/iaDHQIezRbopEEO5uuMyDkrqklLzDn2xqrB6kPGRwcOZ8Txr1Cb0I4er67NYwvu
         xkLR6IO+IIYXR3Ri65lmbTjiV7dvmtC+5JVAFp4hpFLMMWez6wPKiIZ4q8EwzdaU6hhg
         YjDLLGW+UWOmRR5bx9jJWGjAmbcw84OmXCBQRx9rqgCDHBmkvE2rdi4vj7PDkwSqdjha
         zCzUkJ/H7tQBiCuMEjHBF+agoEKE8+vK56/nBs9iRJcVpUhBPiFHxam4wvJ9vBaEqwzR
         QTQg==
X-Forwarded-Encrypted: i=1; AHgh+RopxLnvdOzv/Hfvpizq5i6TWjtjUPXJRxCyza4CEo38nfU432uoWgAQ/j9Lyl1XOM5x0hbqW9qtoojDOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRMMSalkvcIx5G4ZFLL/Rxxgkrc3wsqSfqP4m3uKUfRc3EQns
	BIxWGA0Tpwi8HNC/gBr5y9zzu0EvhDvDs3rjRj9Cg0dg/kdwUldE8uKc
X-Gm-Gg: AR+sD12N5U98lk/zMS4xdBjkbFE2GQvHQlYATGBU8H2A4h1TssQrHXLGwTMzp5ej2KP
	tlIvag8NkgXCXBT3ahzYxrEgKR2OPXs9WF9YdJH154A6F1MwVgle1L5pNNhWRl9cTWXndC2Albg
	zZJ79hEQ0SBB8bqQyGq+94RrtYMTcfBGa87wvy2eb4DFov3jYAV/7F9LjLgEQ3di7CfQilDCzUx
	OwcdLCQmuvf6g2mJaQi14dRF0lOUum9kFE/8DcnXzYiB/1waloayIM2/NTSUx/7qj1Q0/v/rfxi
	QVz00QRCDeb+VxnL7ulEj2Ze4Rqza4GCEBAXHEwBpnQiLAW9SUZRB/iaSWynKr7K8Zz1KcqAXTw
	pR5459bTdw0WkvEvY4dj1+FtiBomcoCGwjmE4R9qkyeZWTbx0+xVB4NNzSm42EvfOFufixR46HY
	DJP3CDoLpzIvP+Ixew2omZ5tLiA5QJ1T+gg3yo5TBUu4vkpc6TYNpfkXdv7KNXUZ4a67BkbUyXA
	BcGX3Ex8hQmowwsyWYahKPAfvvrvs2vpCHGgQ2MiQRjP8beqRbgMsGoubLGY3ploMGYYClZ139S
	1bpUcTg/S6u/+S8=
X-Received: by 2002:a17:903:191:b0:2cc:d69a:354a with SMTP id d9443c01a7336-2d3457202f4mr40437445ad.22.1786529702440;
        Wed, 12 Aug 2026 03:15:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:15:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mxs-sgtl5000: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 17:14:18 +0700
Message-ID: <20260812101418.37966-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index f1c0e612313d..a253a48ca59c 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -155,8 +155,6 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 		if (ret) {
-			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
-				ret);
 			mxs_saif_put_mclk(0);
 			return ret;
 		}
-- 
2.43.0

