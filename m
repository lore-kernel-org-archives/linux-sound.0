Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DD30E843
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645054; cv=none; b=aWSu6Rre6YSdKEUlyGW3q28K4W73EwobF0GSIYGjO+lwZKfyT5qnRkOafa3YsbU8Wz0Mf6UKsSwf1cyIw7tA8D5e90CWpiwYRS2Iypgr+lyhZ+dZ8V7feHSuPV0lT8zirzX2MLVUT6h8skJEEL04HI/ZmChLiJwwhoB69o9v9bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645054; c=relaxed/simple;
	bh=BuYgFAZZbSpKpsTYQp01UrI9oIh6Sp0S2u9ZSteIe18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nh0wEzbVPU4pHc2t1Gn5LI9w3370NOGXm1Vo4+kUUIVcdYBjSnRf3HKO9vLiDWg66Xvp/5DdxWyyr6N53+GUjhpldEz1qWaM2g2FXS4jG0DQw+EW71Qw2ag5afQJ5CQ/dzlfhspuAsV//ovWn59aVU7QTxYWkEGWN0VbLsYBreo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1gnhub9n; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1gnhub9n"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so5954815e9.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 05:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763645049; x=1764249849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQJ9XtNto1bKDWFPhkt3LB0ixKNziS3EmuJ1JwgvOg0=;
        b=1gnhub9nNeSENnNr22G9g668JeQvD2+abmtSdy3y3/mCCa1478iRtA0MZrq1h+xNPj
         quxAV4I/MzVlguv74mVwfVaMf2pl1dyq2E8ADo0uJ1AqTFV+hysrEBlqGu7MsfMUllpK
         neCit+ZNfQcR89FezWtNp8Lc/olNjSEP5gQ2WGJF9HvRaAsx6msx9UOHYlVBF8pu/0j+
         v/8oPlS0PyIHwhqcJmqvh2ABVaGTqt1UwYVfTbLYDsa1FE6zPE1qtSBLKBgEsazZhLQM
         gDL5O4FXHyok64kOyG2Fi4K29556q+l8lgWF6YD/lk4ChZAFCY+W138P/CER5tNqvjYr
         imoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645049; x=1764249849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQJ9XtNto1bKDWFPhkt3LB0ixKNziS3EmuJ1JwgvOg0=;
        b=NUiQd9su/NHzSr4B9GySTcAp8dyokPte7PPo5yHPqk0GydVxKU8hYd1v5+YozrMTXM
         PoYANRNUCSRQsFhOe9pw6gQ+8bNLoTIoZNBol2UaDcoAy7mGvLLqqABplKAJdIQGjuCt
         aBqMc1rDQHWtWqCk1dgCps0xd8jAn+zJeQ1Wv1nkZxOpIEjvbwSmvsIbck+x/rdIvx51
         eqSXrgX1cltR77agfItjwS4A6EEQgM0F2x0PXAgH10mdgY16TBvd0acBrAtWXtGluL0s
         LxEjrWCml3DbfyEl/282pYEtYGDNG9hnImSod4SuTgnDmhQkHEf2W9QrRzjT1DfsKL9u
         Kwgw==
X-Forwarded-Encrypted: i=1; AJvYcCUdLtejzT8rI52oSPedjE1deFMZM7f6Jh/QuFzB7cgps8XMFwvoL4FX2mQN4Tyw34nDL+aEsJy8Elgo4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pidfEInECs6adX/upjy1sOpyMg3AwMVkRKXRTNkLBAGh7FnR
	tuBXyu1v15l1GNjD+BxwSyEwNrF0kkvIhInSlJrvqbgxtl8RgY+e71toADu6WpdwY0o=
X-Gm-Gg: ASbGncuXWAsOW+Fl8t0CksmPexP3UjNQXFxyGJBYNIWqLeRzlcShf9RlCcQHKSLKx2S
	HMueKb34U9gHlxZaEmrXlAnkLWQHmN4OnbwP2h6xAZG3BZ/dWTeGg+LZK0N+UiXStJFLjU6WtM5
	/sl3SJWCDYesZQos2xvfnFJs+e2X7xh6iA44wQtUpNPca4aep56Fj9NQ+wWAbDM72MpSTGz6W6T
	XwOMtaXtwGiqGcDfj0aO90WngchMFHmYjfPFGgTKvOJDqAMxHWDUBYgswGtbTnrp4I8WBaC5MIR
	fHhbQ4jlrg3h3n+GDSYM5bt7FgQExJv3cPjT0lpwCcKWcum8NBmWte33CZ3RPp/ShVqPvrJluyF
	QHD+03jTWckIuD+nQWTRv7RCfIAOx7Gd+ndDjpCzv9UpeRPEWrHDJ1FDiey5uEveuEevuHHAazs
	v7S7M=
X-Google-Smtp-Source: AGHT+IHe1VrYNEFSKnVFZzn6eN9xcn49No4MD91AWIJrNPyNSPzr4/CBgBGVsemdF8hxk1ZXqq5v+Q==
X-Received: by 2002:a05:600c:4704:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-477b8a9ab58mr28905855e9.27.1763645048920;
        Thu, 20 Nov 2025 05:24:08 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm46762935e9.1.2025.11.20.05.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:24:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 14:23:56 +0100
Subject: [PATCH v7 1/9] software node: read the reference args via the
 fwnode API
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-reset-gpios-swnodes-v7-1-a100493a0f4b@linaro.org>
References: <20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org>
In-Reply-To: <20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-spi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T/cLF5pkEYUrhB0PpULA+kEHdrTrynh6SpnU2EG+2zI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHxZyq1RhLZnYaknhB1KZ4rmSbfeSyk4JclFra
 WwoR2OkXHSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR8WcgAKCRAFnS7L/zaE
 w497D/4lHaTdMweES9UKFCv/L+yKEDQDbLoma2l27haxeLwUNmH0ThjalHneW6hHUvAJ00D0omM
 tQhDnOOsXRxFbWaX+AF7SGzct6S1vMpC141rRabE/dEOyEbQPxcUMEQqCxZoakJoh8gKmvvl3Pk
 HRwLJO1bsiozYXRhwwVdXqlMdob2UEp3X/hW9SCxwCoXAGSiKyg3ZTS6njxVPSvxqDNgh4ai6qg
 Gd4+mO1htF54C6V+thRwG274xE7UcoyV0sQWseE9L68I7tDga+WPGstkblKAB9etgWvE5OvUL4h
 SueuDW28Rol9RWn9W9wc9ZTN3vyoeBtR5leuLv7B3IpHxF0wzu9X8bFXGLY71OJ+Eor+y4zRWmo
 X99ipgf3dle7ixTqcXBi1Z+u8mHHQ8aZi7KQWX6tjlQLQp32wPhRfrU+wo+cV14MlksFrKMcyJQ
 lkkc7HWZiIYcEYMC7n7mMYp3nfITe4g4wEK1AGIgXVNrE0VuaLybfqVw4rCXpQ30lvhNr7lLtWm
 3ppsRU9iweLn18D4YOG+is76DHa1nhWoOpedE6JTEdEriIAMaduiRPQlUl9rtQtWiwGG6PVRg/z
 5VSKvIf7rFG9TAoOTjMcyWN1cyDJMjK+rCOWxv82QR4N2J1Ayjtpi2Uh9FmetW6sdrqTOEH6FVg
 EzNEpn/Oak+xpUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference all kinds of firmware nodes,
the refnode here will no longer necessarily be a software node so read
its proprties going through its fwnode implementation.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index be1e9e61a7bf4d1301a3e109628517cfd9214704..016a6fd12864f2c81d4dfb021957f0c4efce4011 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -540,9 +540,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -ENOENT;
 
 	if (nargs_prop) {
-		error = property_entry_read_int_array(ref->node->properties,
-						      nargs_prop, sizeof(u32),
-						      &nargs_prop_val, 1);
+		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);
 		if (error)
 			return error;
 

-- 
2.51.0

