Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70921E4BE
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565713; cv=none; b=XgIMyfoawQn6H7V9e19Yc6yztIXISRI24ySZe/nHZ2qpKBd9ePmupxYo5NqnCn2vSwLieAWcVJPmrFnC9UhyMsLlYwhXRa2sfbgc7QxQvBx8oV661FNExlQxpjk3QxsqUZxWhubGjoJ0dCdAS8Kv1blr9dDj4UXzdn8i9cTsPoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565713; c=relaxed/simple;
	bh=oDSK2ULHOlVmjBMh66/oyeBlMdWtYVadz43n1YwCd/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tM/XhWKxjCoQ2fkMcZgAWW95TvJWdDnOZEfqkpTFam++eOa4cFGNUyluXCvGXC0e+tFJF/4El1SPYTuVZ74IIS3eq6xTGZRc6uljvZxrnWO9kPp3UeT9MIJnERY7uYMXegTQxK6SEXbbT6Ttq/dEBSK8tkZYmL+cERXupKg9FyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cDseboje; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cDseboje"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so71668445e9.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763565710; x=1764170510; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjXruME0Ouu82XWrp1Tzzei1PpMyOyh+DAHkVu2G52U=;
        b=cDsebojefxZYtKO/MlStg4YSbJ+SAyvazjyrDXaN8agSzMd/CnGOQfybE0JeT2dfp9
         E2EQrYBtx78LlV41TaaRfGwu/7/JB4qjtmLnZ6lWJrFUtIuF5JC43ip0t3OobMpfBM2C
         Jd0Yk44DMAvvmiP3MbDAQpsU5EPqS0q3ueWu7GhVR4Eu/b5m4BrwxiCSOXN2sPicJEx+
         P0jE+TnPrM3s62fnfrzv0cqngX60U6Z1+xoonzEN4rzQ6aUGiJfG55H4t+iVdJBkyXv6
         kElcotMkMeWvK38Faw43a++o0wNMckjRDOGLxaK1xbDgvGbZ404rrC+Oo6eJYxfWVszm
         GIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565710; x=1764170510;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjXruME0Ouu82XWrp1Tzzei1PpMyOyh+DAHkVu2G52U=;
        b=NFp67eibNklR7SWRB7kKcJ3kKWn0iQyhcOt91aGTkMV+7ThZlfHVi3c+XcwGKK+QWm
         Xxs5MgtBpNzF2nSq6rmNlcwd09g11EyT5DK6cc5NEXVyrUIRCZTF8o+l3dYg5ldMn4nZ
         fHX4NuWq1alSXKutjV5cHVcodPHRMHeUpQYWSQzVypGKBiJEqD+/Nu3jUO4aMlrHaRgi
         UJPVyN93QiPJI1qajdNy8X0s5CuAcv3/hbXw7Ke/lmS8++voZXnRzyn0HT0bUbjDPZKn
         SVGpCpovNeTqUYnFoX3YI1yi3G8/hWP/9Eqeg7Y4PlCjvewSb15LLAsFndA80Fn+7+Q3
         kNtw==
X-Forwarded-Encrypted: i=1; AJvYcCWUuwVVunk+DtxYLa8ut4+eYkZNJ4iRKy5PXaXZdcVd0GHDI6d8LcgqMJqt8DalwFLJ9u5mKb1HzhDynA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwghrUV+QERmPzVcgZ/x31WOm1ZH5FiJW0GxFgmkfGtMkQfI8Tf
	hyITctkO27XbjKH3VJd8kAvRHN//LDihov3bpipRT2nI3MJhyvW0iCImfikm5krqDxA=
X-Gm-Gg: ASbGnct7J9KYqPyhy+TQIoPoduboMkFenCwWlDWWEbiczALnV3HU1y1E8tKplVT4Ei+
	q/HVbgc2xYSLFscHLRXdM8NTGlMg3g+RS9qfIj3XrZYbmppD85I7fpmF3AhMcWNbJ9+zqSQKBn6
	iYgGiZNbWMMUUocwtV0q4B0psDKieNoyA4nTZ+3RHp5xU751J3a+uyhJCkHsem2Rz3b6xIrTEZC
	JgsctEo1vbNOCq8HYS1EkLJIfpmr1vPCukaQInjHEZMAPtrz7Q0Kmz3kXmxyuy1aMfVlErhn/Oj
	CSuUv/MaE671Qry8hmVGqnTx0cB4JWHlqSetIfXvQ9tL4f5OAl1D5g7WQArjLvtNISEjlTr2U/Z
	rLVmiRxaXGc9IWP9RALtdL9uIODiI2tDZZl530Dn8s7yfd9D8utDX+KnVFeCxziUeghr2WpDOzL
	tBY5vv
X-Google-Smtp-Source: AGHT+IHDrTb9WmcmiSAl+5yblnjYWbZRzDWbcbz7wdw9OvkhjWzjaQgcBhRc2/vJCHDxJ83+5+VEfw==
X-Received: by 2002:a05:600c:138b:b0:477:7a95:b971 with SMTP id 5b1f17b1804b1-4778fe882d9mr219494405e9.31.1763565710087;
        Wed, 19 Nov 2025 07:21:50 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1076865sm54429375e9.13.2025.11.19.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:21:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFT/RFC 0/2] mfd: cs42l43: fix GPIO lookup for chip selects
Date: Wed, 19 Nov 2025 16:21:27 +0100
Message-Id: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHfgHWkC/x3MywpAQBSA4VfRWTuZCwu2ygPIThYuBycy00yk5
 N1Nlt/i/x/w5Jg8FNEDji72bI4AGUcwrv2xEPIUDEqoTEqZ4+hTtacaF8sGd2O206ImnYl8oEk
 MGkJpHc18/9cW6qpJ6qqE7n0/sHJ2A24AAAA=
X-Change-ID: 20251119-cs42l43-gpio-lookup-3e3509bed0b3
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-spi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=866;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oDSK2ULHOlVmjBMh66/oyeBlMdWtYVadz43n1YwCd/8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHeCIxJHiYu69oAt21idI2uffsvUlJ+5INTLKr
 o4x198QCGyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR3giAAKCRAFnS7L/zaE
 wxMXEACW5t53Uo9Ljb3mqUgjQMFgXk59bsWrzacvo/BsgexbvWG22uN53mHLlWQ/LH7OTiKzrBS
 uX/9tW7T4/mGwf6jhk7rdXKdxZnRG6oAPvQkfPBYk53GdW3HiF9khTaQ5p8GO1hqKdLv9wwSkBF
 p0NhtauwUm64dFdrEHegtuT9E1F5+0IQlhun154LrjTQmXsNr3QCyzAnMiLOEMuvDTOi3iKCHHY
 sXSXOaN8o8uWTNXDWuV5l7olIK0dT2sgS+9iAH4SNh+ikFbewo125nn+076pR7fL+XoxHRI1Tn2
 FepKp+T0Yi8dLwzs1NDa9Gc5I8gx4ycet7MrhGcoP8Du9XaGvU7euefD/n+HFUVgRNuYP5JXNYh
 XxokJiQzpXxswfPOY73+HBN/5I0huqmdBb8ba00T9Hq45soqJGi0JULPdjxiE/zbcWXHLueCT+S
 FItqYon7LTeq/cbE2wxQbQ0qpu7kCrIrr9bzORyE3RBcrfD6ATOQj2YUb8g/CHKLPBduvW8n7Hj
 aMenyrSiPm/3c01sgHRgR0NoNIJBdmCFnMtSppo6gHRpB0a/IUISNhWaI4qUJOn2O01i4kOydUK
 3LOMCGr3CpiLWR2LAVq2BbBlbqzclREzbwusrNL7FpCEmuBuMP+VMaCfdWXpAS81tTC4rom1p2H
 r1dSsJ65CNS4lQA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

It wouldn't leave me alone, so here's a proposal to address the software
node issue of this driver using GPIO lookups.

Link to the previous idea:
  https://lore.kernel.org/all/20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpiolib: support "undefined" GPIO machine lookup
      mfd: cs42l43: use GPIO machine lookup for cs-gpios

 drivers/gpio/gpiolib.c    |  3 +++
 drivers/mfd/cs42l43.c     | 23 +++++++++++++++++++++++
 drivers/spi/spi-cs42l43.c | 35 -----------------------------------
 3 files changed, 26 insertions(+), 35 deletions(-)
---
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20251119-cs42l43-gpio-lookup-3e3509bed0b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

