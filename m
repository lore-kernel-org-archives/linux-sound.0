Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B734B40C
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138683; cv=none; b=B/BZGNE18jC/pKlbQ836jlo4IUFwlMB4yWXRIGcaMbicwL5aFAu3acIEXa6FaOCXHYWxjjrPfV7TrjqxYgQZf7BB6RiaDj6utYNCtUh+5OpQq/3IxE28i9CBhdXn9U3EWmP9TKXB9aeDwYuK7UlWax9rq9g8T5xLIWXe20atlek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138683; c=relaxed/simple;
	bh=o3clotEVXCzqMxW1qJk3uiRPSq6aP6WSAmpPzr7h58A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgr/OYX7iRvpHqNGxxB8S6990+vTtlaOXZTkuNSd3LhwDpUt91ezDU0GHv8QPj1YAvFn182l2/NZXuwEqa35OXa0jlXkuHSYE1SP6FYEr6rN/CIjnYYORyWDSn9grs5Fzcn7APFfXLY46isAIxGE1zJn3IbS2LXkse8KjAYrqhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bH98ofeG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bH98ofeG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so64950645e9.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138678; x=1761743478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=bH98ofeGq2B5sIlsDhEpNKiEgLvnAByQsql+1Ix47/u/jivUYJEbsrT8P9YiFrTpEx
         5QRFklFfg6HQYPlMSw0Jz0M3SQ+i3uW9UPM0eA+G6ez7L5KEGZ5rjPa6i8EG3LdZxV+/
         Lxz2Ci1eiWgt7R8rovUwdXwMkRGaVArP7USx8CluvViXqXSM2fha7ds6mkkTSdpevI/B
         SBjTWf858h+7jTtF8sUeVz15kZKQ0gPuGwSDxS2Q6LRfH0rqs8/wNpSAprQHGWEL98lv
         MW+owMZqgXiO68kAH//wzUV5UnZeIphtmzeZxqYt3e/o2Jxi1gA3p5ky3CXjZWNAcMA6
         z9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138678; x=1761743478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=HayCmZNo8s5urmvb8LiWyMyLyHUAfZWCVQF9OZLDE1ubAroV80sgbnr4ZGxh9gIND/
         1HevixHUAFk55sXVKHbkLRK5HTNvO5/ms2ViEoahw51bJB1RR/GzMA49btwsqThLHYYs
         1iGEtIfF3WPnylK0fIyhNcroRNYCKrOBtaosF7mdjE8uywVW7S9AMjV3w8ZBwRDoPv6n
         qus2hGdE6SojvOs8ouinxgAJhPsfm9R7RR/zoyPm4e/tRX1okpBBs2m12F2su/22m3yb
         xjG389YDBIkqPIXeywgVNkSPiRwLIwU3uGM7HS4BqlGKg8+hTqNtZho3CC8Bj7H1Ihyk
         5fFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV86oKnXfg5fT6xzjpscwOeCZz2dQW5GobN0dqWYeqDmYOqWvgZZ1KUVfYpwSXzm07nV5OtMcNbZKW7mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLRYwXCAhQ5Jcm37ik0do1gvNxobXzMnx2USgw7Us8bbbMmmy
	dCAI7d/bVKJChQ+peJnbze8xupQu1IRB92iwVDnxDnQiTR+iPs8sCfo0GfgmG+BYvnQ=
X-Gm-Gg: ASbGnctnvzMkfv12yQdkp0/OSByoNkSoN6Nb3kZ4ubFVKA6lZ681Xwkwh69W54psZ4T
	lL9e41TejLMI01m0p/sdnkrFG2z7nf0WvgMWOF3daBXFtClUp5v2Z/UbcrOwLPdjL17ufQ0hPNv
	LfD7Dmjtzv/I0pJHMeOzDHofqGbUBsz9gVWZZ98n9Gxx0PeWyWQd+PSd1bFzXz/GXwhcxDrEqcp
	yBR4U/1vYoZhtUSMjHsVdB5WWxTBqRS/537Mpqan51zVV6N4p3+FexAcv+BaxMA6EmzL1ZwQnGg
	7yq1CPTFa1t2PGpWLg20tcYJy+9tz5s3od1v8BnTZ9MTmwQwy2OFcefdN3V1v0sgeOBBR2lZKdU
	HQ6LQngNiYeoJTBhkwg08BTDNs+vNxsJf5+rXPp3PykMriIQLpwdDNnRUIZYbNmzvPVK3HLo=
X-Google-Smtp-Source: AGHT+IFPbcXLAtn4sbFkYplsW0U9MyKC7XwA3JcXcQOZluMyTLcgHp4ST5MfcutgxyGiqz0u3cVNNQ==
X-Received: by 2002:a05:600c:a214:b0:471:ff3:a7fe with SMTP id 5b1f17b1804b1-471179123b8mr105019195e9.19.1761138678192;
        Wed, 22 Oct 2025 06:11:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:47 +0200
Subject: [PATCH v2 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vspstOLquen8UYYEalfT4SF6xCukX3qfgdJchdoYapg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfeRZqOvOB01WUMzaKtGFbfDIcDIo9Al+qfC
 +wjKxE0T0eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cqOBD/wJGzpam5upjt4XFG3ZtnI76Qt73nTbQAr6FUYWgq99m4KBvN2kA12dfb4qlkwNn7EoUjW
 SRmIlbN0zVeIoKGUrYP1ZX2Td4/d5eE//J5BAx70ZFkCnbIe2cQQdyMR3Qml7oKKdtE63vg8dCr
 Qu5FHzCdTlgUfT2/2uIPdU9r6i0ALa5XvaEjLLC82mevOPG1gtrUf83JWiVqWWwZ6msRsyR8GY2
 XrTb6OI6XEkj3q/1E0iIviuAujfBeq9T1Ownl5xR7pdIBs5WOa80hNH447+vcOFh7AzkfCBK3iX
 6dwc9e7MuhS5qhlfytzC6kern1Q2LyAbPgbSF0K2lTcpStRr+TL0C5u+/v/u2dlWaiQV/5vgsY3
 M38/d/+SMR9NIR6RIIk+gmsuODW5tcXiet+FSnoN/NdlEC6CgSZxjOwHiOrYi4WnmtXcBEdGzgE
 r5xh4lhOWKOX9bb3Om8wiUdg+R24dQXyNu8yvSMPq85qlKROmlzenKwAeuC2YAJy++X+TSWMIgj
 4lglVWusNTJscQ4jiIfdA4WEfjPwEeFljCXRMAex66b/J+Id6R/Z2yCKTeEXey+5tirG4UwEmbN
 6fQ70BxWL5mmJU+NhsjvDwKCH7yVfWqNhcvZptN3Ji+1XZMmeTXbss4HoAjdl2x6n0ko6/T6ydQ
 TFgFaXpvdEUEjSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 636e59abc3772fc0b333873a329b65f4213c3ef3..92a1e3bb8371e178571a6c1ed6f1185fe6c2e757 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1

