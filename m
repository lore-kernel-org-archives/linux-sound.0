Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050074A2E1C
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613045; cv=none; b=gWXNQUD8LgING4hQcphc2yOBZX9fuKEsYuvDgx8scTabBbJ+2lcGfg5M8pMXHZ/qXdzpPua1bAr13QOCb9LcqUNo6rAT8oQfmBfXUpw/g8KIPAHPvLWnx8PwOKoaNuuAdgQ8lecWvoJsTAHKVRPJ44qNwlMLIjI12+id2wOhAWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613045; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMGm9x0vfsy5lYhRDrn7syKlEvSub3VBpu8Ced9N869zJxIg4h6//TIxvY4xpT7GNQnV1D3F51WSkaJFfQVAD1TZasKIBOdsO/r5kL5KJZufSRZEslYWpm8aH7dxlgWwFCsw6gwT6Vnrq3AekHfBvobN9d2h70WNv4KiMD72Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL64eJiy; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL64eJiy"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c65d654c23so799977e0c.3
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613042; x=1789217842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=oL64eJiyZHx/JqXDa0DLvHL/BUopETrEFGRWlFErEtn5Vzcf0K1vZj5bfCjV0JTq5V
         wh9HWgh/Be4BkF4E75rIGN1PaxFiOM/a2z4Wkt+cGz9ucsTKSW2SPudorALbIM9YuLc0
         0/rMSo2ZsqcwuOKWbDecJDkcudLIJKxxOSF+EN2NhgZzrlPtP9aYhZdsW6sBI9OWyyUL
         zybdeZ9TJqBDU9IdHbsfUAWKFmiv5naM4CY2HTJj/oHoBgX3P9VfuE90DKXyEV8YZYE0
         uT0tLKEphUgSKWBDq5O05H82PZZj6CXecUWWtxF5ZkuyDmBzP1Fau+7xvpG8GreBgDkj
         UOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613042; x=1789217842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=nOB2MuyCrhYjsMdtMVH/2uHHbDgPVK431xiWuOGlpV2iyeB4xmnilGyZS9SLWHzuz/
         i7EtJZwDqn3QQseOcbPN9hUMtS0pXMLyWH2E3C+BaPZS4iJZPr3gCziSjN4WqRzT9WWi
         SGQB44JRiv/BVeQoxE9UdeTSARj2Z3jmzeCp1rimensM6Eq8ycgEHj2TgqNVN7/rf7xI
         M/8qrwE0cyPAPMHn+oxuhIXxn1HQsZ3W06UbvBEda6n4aEXplMEjvSKb6im6by03z7Vs
         ja00FTgtE0Mkg427MXFd1qDF07f7BHC0ZhyTo5jqdtlMenhPy5u/3nvMVKAD0fIffZ2Y
         okGw==
X-Forwarded-Encrypted: i=1; AKwUvBysMzWvhTjDIlnMOZd8+1tUXv7xltshuq3IB5AWmjL514q3IS/TtJI2CGcQgB3k7NcQI7PCoUWNKSI0KA==@vger.kernel.org
X-Gm-Message-State: AFuF++ll30ptpgTmN6oz87wOKJcnRMtyRo82ZaU5XzVUDMJiP6n3dacV
	RuLUJLJBRHZbsBnhlJ03kDS3BjPN+BGTvxpyRx8aYD4N4Jl/RwTolq4B
X-Gm-Gg: AYBFou0WG++EqJImkUAYGEP/7FlusaQQsyMAdxStrq3xls3FgF6h+ZE+b+pNiTSPK3U
	40e9Rd835U8DEW+ohixSmZH3iN2aP0PGEaDTwlwNbg7dTcZF0ereQJs80tXj5EUwlOSTX1ubfSF
	HVvhX8KJcuGhmA/phtGP88auuv6wGa2C+xNxPcwKigog991APa4stYZ1pN3QVw3Bhy5JYfTmb3p
	A3JI4B68C4vdi0ZL7vBLHU60FGksiSy/XQHOcvhGn/r18LsMXLXvRw8Xz5hQ4RWHYlxYFUAOYgO
	UiY1IZr+FfkQlThsSjWKbB9HRjnXYRBcMhGJK4VaRL28qV4aF1+dSflfGFMcnV9dHitc8V99cwn
	G5eekyQwN1hPXRDKae1pzwy+toxghTLAcfxCchsSkdaVT42ryXFzj5BAvhmo6GF6UKPO0q3bcOt
	9HGEGD05suAAxRqiJ9C6pFzmU1IbsAcdjmIXyKz54kwYIST8QZ7YeiUn0KBnIHetY2IkZcUx2Aa
	7b+EM6bUkTIrLT7FZwiMr84ADdXjKA+qpOcrDrrfpw=
X-Received: by 2002:a05:6122:4fa2:b0:5c7:c666:ec22 with SMTP id 71dfb90a1353d-5c7ed407509mr5471080e0c.6.1788613041673;
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v8 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:57:05 -0300
Message-ID: <20260905125706.6550-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905125706.6550-1-breno3011alves@gmail.com>
References: <20260905125706.6550-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

