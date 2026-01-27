Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85B364045
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539726; cv=none; b=sc2MWhquKgTURY2UbEjruHtz8UbIHBzZOdTdqWoO3J4xQY2BUcBSrqrhA11p5ssCB9CX2IP3/25VuFmZ4uBdIc7Fj6TMmPeNn/gasuiIW9B6FteX79LiYEvrWwO3zG7A4LrSoZRwbm9IyDlyUZH15bPE4btsS/GsmBEaQgtGIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539726; c=relaxed/simple;
	bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxKJI4DAsCw5v3Gi+F/sS3Iq1UmiDjCX/m0iS6bC/FaYVm2/9jNSfi8cXh0LofYjJhrTiAoLcZTesLel0cZp1oIr6j0m5F1AC6VX9SuLeqXfLmcQcsucZ3oasfM5nFR0T5+CrmgNvCK4qFeMrbiuROCuYS+ElUn0nZFg8mSKkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRRGG/6p; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRRGG/6p"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so1078725e9.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 10:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539723; x=1770144523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=mRRGG/6p5tdPv4wPB+zXPrbEhTAdxSk77PV9nnkdgaSwn4NuiwjJUvM3cV32i3rVWd
         G25bTRNr4fz6ebS6pKCIwtubm1FKjqrciL+gEJM3EgEPJyU0PP6qSzSxyNpWA+2t/vPL
         vowL3BZ9Jb2cCdt/ZGZpwB0tnqE3I8hBwbvhFSBdFFbPnSA0Ft64cVGbqJWkEcAfHMgu
         F5IzDBOSzYazTPBz6Yi7duCHrl2J5KFrd637+RxLOyts3uiuzmuhuOm8XoEeWNg2CtiC
         GMfhkANvb6fF4iNfqXbJWFv7faCtTyNFpWLOfz1XGoocXeLiPjwydZgtOzMq1WZBXwhh
         7HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539723; x=1770144523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=Rfcj5UurZBcoh3PkcuWlbjrU2rDHOyHPbst+4/Keg5ohDFX52YSC4zWeMaQ4+/KPQX
         ysu5iUg2BYDAZXYeEE5MY6/vIPdfUl//h/AF6Jewh0jmkVflb+6mP/WOFhOHBBxrw0Wr
         sjw0FVxbiAdD+MMMHcCgRSFQI9YDByWYoe5Sg9g0P0VDppcLvhLBxBB5sWLdeY/sAeGj
         PWQorS5K63gbzFCvdz6ceJ6+yM32VmkDB8RQoijlZO4x3dFXfjRvscoB1W5DJAsON8b+
         0YBv/GPP/BkWL8Qx6//4XSfEjMboCivP9ClOPCxn1/zrDGdp+8NTRB/KoUoEqNh1CIxO
         +9fw==
X-Gm-Message-State: AOJu0Yx/c/08kV1huiIG254fhQlMuOUczIS6njLUHD0cJgU4FjaWkxjD
	9G8d1VfENTSGdhndb8ocj9kP4f4RjdihB/Jild7xJRkRK1211BtLGl02
X-Gm-Gg: AZuq6aLF3xPo74d3vOsKcVUW0fiFf2NNbQVS4CKCgd7l0IaQz6uno+2I2t8CUqJPlq0
	o7ZpqfzBRoenbBFhy0Lzlvz1FxCvWpIEO4LSvbTeY7nDGbvvxdDyUnABCp9z6ZcMSbJhiB/z+Hg
	hAOJK06FbhR0qSf0HCUZRXMPM7VTmU/QDY6YkpULeoKEpA+KxI45T4ndHecykms7TCt8LkfAVT6
	pnyDMR5Qv3i6gV36MGl5QnDyo8CWqgPCXB2dYrUCcQatkS3BHMnKDdtxCi50/l9omN04gaGlByL
	kAicQ5eMtQ6wVb8lED3YynMMyjejTh0VKkkI+K5eIiGYLuJvaWr8pXzkLNDcIniu7pvJxL39CqH
	N6nQexiYqL/91V3m0jLfEWyxG6BadFRBEnknvIeyQ95hUO63VlFeHmr7QE/ujSoRtwN7zIlJg6R
	u+hucO3HdzI+PR3gLtvvI8IvS4IVaP6A5AHV7q0Q5pNX94
X-Received: by 2002:a05:600c:4448:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-48069e9b5dbmr38558875e9.17.1769539723087;
        Tue, 27 Jan 2026 10:48:43 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 22:48:08 +0400
Subject: [PATCH 2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v1-2-431b809c632d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=698;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
 b=N5uJIXd1MfaMnAMCepcgyt3gC9Xj7DoHIF9W3uU+gs94PPz93VNI4wEbeV3fdbL7ZL/vEo6tZ
 kH+9BQDgcF5Bj2ECBnA1a+a29Tr89ihFUjfl7+ue7ClXiU6Yb9Xs6wS
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Restore the empty line that was accidentally removed earlier

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index e4786f087589..9b454261bcfd 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
+
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc

-- 
2.43.0

