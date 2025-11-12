Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817433A039
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955756; cv=none; b=FBnCR097rPNfvGuUP+9g38LSpar6Q5JFQJ+Lbweu1Fco+aPzVzL49z2ysxnDfUkI21eRgNO5IiQ1+MChQmzGpSp6x10rUquFUm0MFthdNKxR1Ih2ew+RDEvgsB796y2oVsNjg24teVgu/VeVRI3HlTjom9u03Jk7eCVhxVaOrZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955756; c=relaxed/simple;
	bh=pMVIDl094hPPBJ3k0e5jfhRoS7U501FS2T88kBd7i0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmZlHXPFBo8RKLKfBbmCY0+YZPRv/T9+gRn0/rBcx4edCLKvmfuk1PSG9/jZwbUIHOGtEXKUA/ztKT1N5QU+m7jiirVXBJvZI8uEZsJq96tkuJhPXzOPt55gXM0DSHWxmAMoeoQ7UixIuCDkdICsVep+1yWbJAM0/+4/tUsi2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QS+2BMr8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QS+2BMr8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477442b1de0so6166005e9.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955753; x=1763560553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=QS+2BMr8zwL0QqE6FRda7pLvxTD0XVkuKZ0vmbHn6+h8WNcTepnkta+ORme+Zk/36J
         572lqLKqsGnX9siT+ht7pUbQv68fRanbdyWY0WLtL7cWYdDn/Vr7OoIo1Qg+MiVS0U0U
         H1d0lqVhku3BLFEzndUceItzk6x+lFn86p2SOMCfDbr0FdvND4SzmfQWxkBytcD8rwm+
         KYH2GVGWbZ+2WWwwl9A9xKxpV3KnYg369MbItIm5NwAla7PoOtBSktf/JCWoWMajGZhn
         sL+/j/M0t2ehzE1P44uWaKNv+jN+xD681gSdqcUpGTZccBmWE/3nbDz/sWkJqGz7d4V3
         kH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955753; x=1763560553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=MU7bB6tobSAfWyhSUpxdoGH8G/2p8w3sWaGPso6DFVTbEebk4HHPTLwOhGv+Y4gDiz
         aG/It/lUqSYJAOo9CxIzYc7xj2YhS+cxYaIFHYLg9umKfW5+nq4WD9UO1s8DQ0PjXCHy
         gjBELJ87ziNh5PEXmvC7k75zmNiH6CFPV6xHTKhnTgn/zUPOlbX65/URV2Uu44abTmDP
         25xi3HDKjhSHnqiYySOzmXvWxsUQEtguQK5cCEQygBWTf4nL9UeaddpPqdUOVYE5bOHl
         gzY8VaHdFio4mX37TDkD/9cICgURiH2havKVUsF1Bc/Vi2lruFVde+VHMo1yTdX8yMKV
         yo3w==
X-Forwarded-Encrypted: i=1; AJvYcCU5knpUYNqi/ha9+A1K6x6JOVIOEEL99FnJ9sV9FQ+bpsm5z4neyX4Ua0zA5jjjpaoLINonx3S48zxpBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhKrsCIPPx/QSis7pVmLK6LHM1DqyGJU0n4eAY64uVw//xCXBb
	V6Y2G3Imu6YNLhVgWvieww9k1QmR45ondNXvq4q0iJ0ySLALl7966lK6oCBR54Th/rg=
X-Gm-Gg: ASbGncuAFB+xP8NW8FybcTa9dxh/zNU1qtKlOtuZCseJmhWwmfvvoTJhqjwByGqGriG
	dJ6+FMDpppyyEQP1AJTyWk64GFmNCLpun/jjoy8DMEU5hvZdQGJMlypKrogBcQx4ILx76wzce9w
	Aona4Ax29Fe5U//w67USEndLpyzhVNkMeTjmxtzaGAeqMUyWVxqzmGSRfOJfXxS2J1KoSOkCl57
	2ZKza4Im1sTvEiIng6DKoAsrTAwxz9jZRybpTjLsV+JyRRkU7HII6+1J/HL8/6w+VEd56o/Wm7a
	1RS90P5grrPKGWNDC2ZMQx4lDCgEqKV5KrlcBVbaBRbHxOXygUdJ9e7lvIHCFUi13tyiV988s5d
	t9OfpsN7tC5KRd216K8gjFLwiBmlNcH3Zi9w4Rwbbqcr0Stsg6zOLWK95lNeoybT96eo=
X-Google-Smtp-Source: AGHT+IHJt2UAXPW2MhXPVBBMI+uiCZQQH4pvDWU/Qe5FJx2daMpbRe2y7K/kRKjmxJ4TfWX+tRiFBQ==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr31124405e9.8.1762955752566;
        Wed, 12 Nov 2025 05:55:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:37 +0100
Subject: [PATCH v4 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-8-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5tWrLPzClpmnMADJpWcVY10mVN9q3Vw/ebyB+WPO3Cw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHXDZMnwTAKRmvdN9vLJzwjFFiSdS3OXohry
 PUdZAt0JWGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1wAKCRAFnS7L/zaE
 wzUMD/wJ3SBi0tLbJfLHaJhap/guD7pReEjnW/JOFDIC2yq5EzUDFEcY2ViZzm0g23lmQuNDYfK
 A9dkc1Mv+1lDHo2WyNnysll2axbhGj5aUrn/CRjyhAP38l+zWwE1lmSO8/4QorZVdOBbmKtqgs2
 cAh4KcGjmE3UCT6hw+o1H2Y9P9CjXJR9elZ1tGxe/rhxV/4AZcVd9Y/ii8edu8RxZ/sRYhEk5WM
 fRMEOqLO2vvrStmWdHmJVvco93x2yBlOM8nGDFyAfbus7MnFkbt3/oM1bGOFNMdljTdqAnmqduW
 9w2n4+muj0DODSDmbhf5LxohVoIe4YjL2osikP+z32QEPd+RH6u1WwW/yNKHWsCbGjxiZYp5ySw
 hukbppWtOdg7agAmIeium9gbFu92bYTi6faAUI6gElRB2ZpQxJX0w0K7vBLYk+yDV+KHtZwzdeA
 dYffKpRViRdgesoFBEq4ngvfCW2BXb6Igh6DGMUY7oMiWxZhzSVXJJoUq+3k3a3ly9r71Fd5t/D
 XwQRIape22DdjWtcBS0I+N3YZ551F3dIYO4wV89vQEqxGyIpGgKO8fTaDdg0vGfaz5fOGjHuyiT
 4vcee5JPb+QUHuN3nlCYmBKHKr73jH+0N+HzpMRJZftovkFJRJqTD/ScNSWk0I/RgCE8u/APQA8
 6yW1XuYbXdH+Qlw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
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
2.51.0

