Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94B32C92B
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383778; cv=none; b=BveqfJ5BT9NMFy9GJ0PL6Kk4Y3KYefRK9DhSIx0aTvO3dnQbmXeVkHCs+DQANeOlAWuuMOKvNdMq1yPU2wMtOFYly64Y3tE+pduqF3VDpSlH19T72OT0bKq/dvEQwcB1O814bRhPwjgw6bGfSE6I9DX4AiT9cLt30GkX2w7dL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383778; c=relaxed/simple;
	bh=7QDzArpPkDf78FgofYCjB4MlwIxW1fS1U1cKxpl5EpI=;
	h=From:Date:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ABNivqyxT+96pcAwoL+bM8JCxNpxcWhC4OB08vBJE60yOXs8mi0YZBMG3zjeKVAwXrwGJfRMeuFn88FNmzXa7iomxsN7e3SJhOG0EpwuzgyVNPENqx/r3Baz7OKmxdfYfJjhkh8r702dOjSZQUFm3n7RQm0xLpC0Ztuk0LDSoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWoEKaIg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWoEKaIg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so20047135e9.1
        for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 04:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763383775; x=1763988575; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qw6Pp3es3uiGeWTh3c1UyTYzWTlqi3gwQdIzH7NaW8M=;
        b=EWoEKaIgpkCut5FLSlN5AaGV5qHKePlBFWpN1piXyzfDejdX1p6UiZSfhA8irYtfqA
         O22z5F4qaLZb8S89tLo+GnzpB0tHNMTDB7KYzKcxIm4Rg6gnz0ZxNYJmOgcpBU/KNeY1
         bXlzy9IkoOPjQz11m8x/nnD4grHEhBvOeEmxMeQg+DQdOpOpMVpuUcfUCrjTxecK+BJO
         lo7HAFgaJw0ssg95aJHTlpCiy+Dd+TXDJnnZUXV8pqQRCyoU2RRwB6sq9B9UvEe05fEH
         8bxXL2v7lJazFxd5NJST0CCw4hFfOQy6ikLLuGBtaUkMeJ2U7tmVs52XV488fUMg1wdz
         qHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383775; x=1763988575;
        h=mime-version:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qw6Pp3es3uiGeWTh3c1UyTYzWTlqi3gwQdIzH7NaW8M=;
        b=chS3uFIfZCazwmsS8J6ApC213v1xU+giE9vbFNaWRw/PF0/LXje+LrcqfJwAn14IMI
         VxGYRjLS4HpE+Ff2kIuDD88iI9IJNuCRDU5wSOQhzd8iLPENfCNSX1ZnHMzgmuE+T3UM
         3106JROC4cR00kGlTqU7fIiGwj2fSu0jTDq9lLVAakeelkYOf6k2u/LUK6J1Ic3n2/T2
         cQmbs1Yt/ToJG/qJtm4/tuZQbfrHePAK66rAsRnTo/YmuHT7vG0Ii+4qquIjgYdNmxtj
         jtPq8y980Zu9nh5eU4sVPRTymfXl5oRwHYydo55TfCwbow1d8LsqnHpDXgqQEp8As3W9
         Kn6g==
X-Forwarded-Encrypted: i=1; AJvYcCVidIQeT85OjX6T14TxryYui5Qqhlnp5QdDg/r2Eq9mfWgv4+UKVaL/GRRG6A8S5C9wjxWrPDfrKT52ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZ/KrFbebDSB+hWPjAZlm5mhB4weN5ditR6wT5qFDxiKiyVgY
	sNerUzAhKuVnDay6Ul3PJd8KNUI3gzc1SExhbzOSZDqW51obB91CF77M
X-Gm-Gg: ASbGncsybicaYqgU4gSAY7lmgSITGfDGL0AaRv37fXcemH788s37hGO9VgxjBODISaa
	SzbJYpGhuDISWZ/Xy15j5IZy3V9WQnQaOm506T7Tx+MZPffN330F156EpYiPSEVoo+0BxA7njQ1
	o7ETWrpXyColhS70mPh5cU0Orlou/WvtVbnedguft1N+KdUNEdwWelTOFfEFSSZcmtMoU6+F8B9
	vLL+VDsXKAhWXH8CdOQkp5csEQvHIBW4lL4wdfDNP/5jLVW28f3A+poDPuhs17HWNeXhR0jPp9o
	vkPvWZYAMjJl086ii/UGz3oLkyH4VlhN6XpvB4viCpilaC8ygjTbkyQtUSSzGNLniiWEbQZ22Hg
	oLYvYx8rUIOcUAZyiAkC3phZIsHu6ea9zpfGpBhVg29O1PViCVmRfygCBzKGUf4yhazH6nJ0sUO
	txYwFTNJEJvNgxzjA=
X-Google-Smtp-Source: AGHT+IFse5FhQt+hk3MIPICFWu+/14CmeS2Bhd7R2kA01bNxKpL3m03hFI/qrr+DCZAdrQF6Xxm0xw==
X-Received: by 2002:a05:600c:450f:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4778fe4a05emr128385105e9.16.1763383774859;
        Mon, 17 Nov 2025 04:49:34 -0800 (PST)
Received: from [172.23.94.183] ([136.226.168.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e35b7esm313927355e9.4.2025.11.17.04.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:49:34 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Mon, 17 Nov 2025 18:18:48 +0530 (IST)
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
    nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
    perex@perex.cz, tiwai@suse.com
cc: khalid@kernel.org, shuah@kernel.org, david.hunter.linux@gmail.com, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
    hariconscious@gmail.com
Subject: [PATCH RESEND] ASoC: fsl: fsl_ssi: Replace deprecated strcpy() with
 strscpy()
Message-ID: <29c40b5a-3e4d-e89d-ca22-a1059cca3480@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: HariKrishna Sagala <hariconscious@gmail.com>

strcpy() is deprecated,use strscpy() instead.
No functional changes intended.
Link: https://github.com/KSPP/linux/issues/88

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch replaces strcpy() call with the strscpy() API.
strscpy() is preferred over strcpy()/strncpy() as per the
kernel documentation.

Please find the below reference links.
https://github.com/KSPP/linux/issues/88
https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
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

