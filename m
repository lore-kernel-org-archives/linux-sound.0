Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341632C94A
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645055; cv=none; b=A11CAuJ+pFYoE4d2a97TxHHqVqR/wCu34HeKVFwPv0Gz10eqU6X0oZMJTC03PwnWENMScMZJnJLq6umNMkzivtQgXa8Pcs+xdIfJ9LoFV5wZe1+SqM77RVbso3rzHgjNBVhTkSMj7Dz4r+dq5twbjLcPJo1dzlV3NbAHDDrTD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645055; c=relaxed/simple;
	bh=nGvOsKJSYyuX08yZfx7ehkwdqK43axSBuUV3X7zPZPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dg/x/RplAFNp71A1JZDlt5dsjYMw/A4l7i8WY9RhYsMRafhardNsgI0Yv0M87PjfZjqFTxeEOiGT0cl8Vi5XHdEbGmqOVAmqFoXX/8quIau2urz/d/aNOrp3hWmvaY+1F+QLFk3AFjAlKK1y11kPjWNRO79w0NlD3920ntKfYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FWTAwCPp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FWTAwCPp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477632b0621so6216895e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763645051; x=1764249851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjurEy66uFzhgqR84OZ+03Q+oPyKtXngi2acMZEt35U=;
        b=FWTAwCPpv8zMKVYk6RmBR2VcLCilJrqKmIuPryZvlYK2tASFQyFmtXfn21PP5Uzr8Q
         O40HOid/Db42o0VF0e3WO9B9Nn/x7OnexGenRR9sNyjwlQfY5sKedWFLgv8w5TW/BoeY
         oWMEF9QXBqnkCKT5sI3qzzz91L8Hs71xJDKgSAsD5dB1mbM5990K/Ag4F0ywvlfbn3TQ
         7ZpAfboyEH3jAja4klbyekpy8lfKBatR2XRLxNycVMNL5Jva2V960s2W0rnENuh0VjNl
         sm5+h0W2WV6B3U1FmHeliTRb8odAxTiNAIBd/yetuulgNPtuVgvZtg8JO4Etvlkmf0qm
         s46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645051; x=1764249851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gjurEy66uFzhgqR84OZ+03Q+oPyKtXngi2acMZEt35U=;
        b=NBcTDbNCOSZFG8o/5kNxeE7wbCKukDtOneXjSXW+YSpjs3YexOGrZzsHFR5YHWL5x7
         SNvBt3OD50l0B6M1bzBZyYbHQ7XY5OrWfhfDa9vcoLXhWZvvioV8GfI1XXL3/0GU89rF
         XP/g5EgRBW4mH+8Hwpqdc/0tpBV51KJNEyIu5LFxK9S1dxKWuuJmKw4qikfIdcE7E9Hs
         32TJipTXyYBBuXyMeX/oO23A+xIf1zt5UkBYcEuE9YE0GP/GRdjbIGB83Q1TdKSCmZQn
         HaYnMD74E0O+AYKsNTqCeabqI40eQbfck+C6MY7xFd7W2X8mHM22fNxAZDONGv/JYkbj
         +GnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtulPxNBIBQyzdENF4Emq6L3XGRmQAHMxu31hUxI+n/cb7Nq4SM2XVvbHO9iTmdRrFMh7JeNLQEopoAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PPYSeGFvePvnMmVXK8/3YjLN2xSTM8eDiUrTWrrdFtsRu4cc
	xRcv1EgKiyRhnDq6ooQ3cBbH5bE1tYlD/7flxDqjxBb7OHJNeg8s26T07L0AENcJ2Ns=
X-Gm-Gg: ASbGnctceC3JzbZclRB7amzeZ+0KtemIxXP42hYMC8HKZOEq2/fKLIheV0ES8lM6KSa
	CP8y7WhD67VvOqdWI58t9LlMMu1hwKmBGSzgYoLg6FqZ1rIy2T+mD28DemrHQNoRrDHxTk2Dzdq
	Wwe3+GIs2rXJ/YM2QKx7i+fho8o3oBoqHyl7Nr0t1XTUv0Ak/RS+VE+ZQ0SlRtqAeZriQO7Rt+9
	ISeDrGrbArP5+nbQaXc80V2rnLARH7B0McsX8VCrVASSFCyQE4VtMc0vdnUVAU+KKCM00HArL9T
	w8kjrebTKvk9T3+qr3n26pkrvqmzEakLcQbtLTS21wdg5q0T12NGx/1A5hczPIzf+IHsxRoZGM5
	6vNRya9ho8/GGEuhxV0/d5InqHO/uQcwoenBtQVX5BEY17gG9UTQhdFRP96PXbrX3fRmxz/bq30
	R0I4k=
X-Google-Smtp-Source: AGHT+IEoNE5KMStZzlaZi+zRosECWOIXlmzVTWZ/StxtAPpEZjiVCwXj8iHk/ygAx9K7h6245IYWoA==
X-Received: by 2002:a05:600c:154d:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477b8953efdmr36161755e9.10.1763645050673;
        Thu, 20 Nov 2025 05:24:10 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm46762935e9.1.2025.11.20.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:24:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 14:23:57 +0100
Subject: [PATCH v7 2/9] software node: increase the reference of the swnode
 by its fwnode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-reset-gpios-swnodes-v7-2-a100493a0f4b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=prKyYsy2Naj1W4DD2JlmvlVbpPDmr3NjqYB+l80Q6J0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHxZyYz672OW3spWBP1aLSGLK6NVlyo2KR15zD
 qV9wSVZNSeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR8WcgAKCRAFnS7L/zaE
 w4uhD/4lKzA6330y3LuwdXfUPHULtSPTWc2hSoyUauQHiF9BW1gHRCnIxQciTJcQvwBgShkQnXN
 MmPCgqPvHbL0ndMm7oRye2jzzt1FiOBGCxWDNdsuopO0Uy0SqVTwbkPrVsqTtuk90ygUnxrf75j
 pCsgPkPwONimP7Dmw2/qQz8uW8J87ZRpVRoy2+z6sMdyFwtD7UySvytPJa2Mik6zVtNYoL0d3C1
 3f73uB8FTTO1yfVvTbUqMzlvRPlOSUkr1z+BEL7MozwcslXpOeqDhC2oFMBS+xBn65aEM7fEZQ+
 JIaJGzVOjVm3jtJ1L3ghuWRKQvsOULZI7XAmRxL+psqlnIts8elhdXU/B8uOSV5qmGQiqi/aHE3
 88Ec3e9LRJL4cvfRlPMXI++28Q/TLHjBJhZ2RQKelVGenfzL77Qe8RV4ZtSeixonVvh1bqexPtj
 T220Uu1tJa4WPY1BaggY91dYNwuEPpYDVGsDYOGuGhb+E4hxoUGGwMxyiTxCHflzZewut7TjhiD
 /LIiaikuy7GhKLaj9s7gu+Bjnyn+FLIJ8VP6NBrrVL5ByrpXceP2mC1mIgw09lSsT5Ppowsaftn
 FOvmyngYhvw9dJoYvhxQdyr6rXsSgvGy7sXdCW/OpEFtrMCf0E3V7inlVkgzTSzjj8Dw91tednT
 JRxaeZqtlup3lkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference other kinds of firmware nodes,
the node in args will no longer necessarily be a software node so bump
its reference count using its fwnode interface.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 016a6fd12864f2c81d4dfb021957f0c4efce4011..6b1ee75a908fbf272f29dbe65529ce69ce03a021 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -553,7 +553,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	if (!args)
 		return 0;
 
-	args->fwnode = software_node_get(refnode);
+	args->fwnode = fwnode_handle_get(refnode);
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)

-- 
2.51.0

