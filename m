Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1A33A70E
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645061; cv=none; b=GU0KJ/751Zww4r+AXspoQXVtNBVJlfzOXVF5eoKppMPw1Arvb4k0kJnZhmGyu9yOAyzWtZwLOZGvHSp5Gu01XN5Jcv6Mf3TAKakJoMXxJ7w3kVuxlWVYd6ZeeHgmSz9dGuiEGuqitKQoXGe2OF0jxnZovAu0NBuRWVhekb4Qhsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645061; c=relaxed/simple;
	bh=oHRVYdIjd/Yd3H6psQO5ORnSPlcaHmVdQ/RqmmG7LOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HxRoNqCjigt3z3J0uBPWVOEIiQ+sLeBFZ6UFHwd+OwU4+1B4hIXy0b6MaByVMxVCrtUUm2PLRS/2aKyA4n5fnO6SYtBhPFRJAbjbMMgfe7ph4aUlAdBHmaHW8A3xHm6DK66yVZk545Eb8R1cDbKI/AnEhGx9gMO4P//8A5FROM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bPFO+MtV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bPFO+MtV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso9992905e9.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 05:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763645052; x=1764249852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRaQQoBUjPToTmVTOLCnaE+FSHPEdMRVOEcLCHXxxj4=;
        b=bPFO+MtVHT3k7aKlTyTpiBEylJlA21SVZMYH9YVtroTjV0wEESBYXA1usedq0ydrn0
         HklIaqmTcI/cUZxirvQ2nYi0qSUu+1PqU7SsW45dyruFMiEF0+VKzb6ZhnWPd+iTHXHB
         VRUz3nMG+MPDIS0ngWXBLPLDfJbQC2E5+Ch85VqalsTLsv5OwOLVK7C/tlN4C0Wn0i0x
         IppdBfPL0/Z9gt4i6yPCU2iFX5GzJHss8e5PV7+gskfAimkkCc/uauiB9d6BAKuSScRt
         y+Rb/vYrHu0cq5bNNPhw29KifMoKeyKnQ3dSMliTLmp2mIB4p1P+Ts3vWZhJSQRq3gmw
         VU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645052; x=1764249852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRaQQoBUjPToTmVTOLCnaE+FSHPEdMRVOEcLCHXxxj4=;
        b=RxHuVUZYLuPYA25pI15LjZEYi49LDHk7r1R2fDV6p9zdk2t+pwy4FlWoulcV+BcAkw
         gG4kmZ2v8b1CLakpTt9uHecgakOyvkGJlQrhugCEA31B6Jjy2t2qhOylMrtT2+3A8oAg
         xy0FVo3TZXW1x5eCqWYRJtUUHSO4HwZXoW77lBYaNa3UXgmUIO+FZx8CD9qvGkA4o4Qu
         s7bFK7joq8HF9jPeV3g2xy82lGaWoh5L916YR88ynYts6QY8826NNuZmWu6T4/xD7GS8
         v2wHA7J8Ok8d3FGTFPqCiTuiHkJlVLm8Vm7PlxY8sJgwB3LNfvSV8sgHnd2GBylFC8+q
         KW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpwyWr7GgRFn4eUjUaVlm8d7wI17BqpFXTA9jb4YFOzIOERf4CMc9UkPWPqdtR4NBQsd38Jy/3Bh/87A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiTb4GaJKrKSrPK+2rJihrjcyLr/oOZFbbFL3qi6IYbSiZo1h
	NBj6vBV5vMp+T/E7a3Xd4/SxiUZlKSs5Iof7lk0FXzID81R4bak9UiZLlGBBMRKFNS0=
X-Gm-Gg: ASbGncuee+jIRWRUb1NcJhnQ+VCg4N8qo+3OHG7UI7IzeCiL+aibZSknNMwsA3U+olF
	z6n1syvNHap+/K9QnWsFRAykPIX96jFdz/eYGtuuqSV0U0qCrX0cA/9ME706P4XXXX1lUVb9ItM
	C+2iDTPxSFXCdZHP2eTeIKktRQ9X2OiHMkNEcUjXkapyr3MT/KepCVhMHPXiOSo9IiARkoJ5Odf
	g1rEoaeCYFAMRwgggyWNnT+Fn5vhJk8h0lPEs1OdMMz1B+Efk9CamZdIojU6RUCq0350EgF3zDO
	bLAVLTyw9Fh1z2SCWgAzJBR0SlXsQl3o06hTQj2I5XF0XTI3pqAVZMYd6wwl2ScY6GtROCjx/b4
	geJnBs8CLoyF/Aevxi0RnCM+hJt3GT5MkgirG44lEKpQzEl06KOGVZZ4/YyIsFJ9lt2yqj4jSg3
	dQk9OssG19R4YMVw==
X-Google-Smtp-Source: AGHT+IH3hYAe2O/tKOuUpAJ7i/RcaZOaAn9ArFPrD5AK9VGJHEneDKjfYXeaAppiEZHUy4nrflG5lA==
X-Received: by 2002:a05:600c:3ba1:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-477b8a84841mr2670455e9.21.1763645052351;
        Thu, 20 Nov 2025 05:24:12 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm46762935e9.1.2025.11.20.05.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:24:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 14:23:58 +0100
Subject: [PATCH v7 3/9] software node: allow referencing firmware nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-reset-gpios-swnodes-v7-3-a100493a0f4b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jEg7ScMzld+wLGiHDAncvLuj6Q+b2Nv5Y09GFyLpduI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHxZyYB3Pcu0cgiUmoHlajxQL2+zrp5X3CpVHY
 lBTQ1ay3vmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR8WcgAKCRAFnS7L/zaE
 w28TD/4lXRUCRC+Pme/fHRFXDEnjAj6FiVe+JDQdH1IPiDeM56/qwpqkZ82DWBdobLTUvtx60FE
 xGzbd/A3USw5o607LH0g2clGxtTUUPH4iQspgkeJpdWStEnmxDDUhljg5gmxpCJb9ybB/rJV9jO
 Ft9X6GPHwCFz7GSUkQsWfBCEP8VnYgEUoLRmwrHdNO/ShEEwE8fsNuM0K/lqIdNArEhsGViLJrJ
 /wH+ajrOqreC41hSJ9QrjXj3ItlYRyl40gnwFFOwS1FdetroL73JTU8u657ZBaCWL9NoAqjpnQt
 uE8vxzSE0gp0tyo9aH5NaWsFrE+DZuqhb/4znM76VhN0zrfxKpniM230qLAbEkjSJGIYoQ1Gd7C
 0Lc+lkkQPEEeoPS584I7yvNZt4lVDtG3i7KO8D7w0Gs0UA85fP5XpsAq9eIMx68qalwLRESBlND
 FucPzSS+JIFDu8fX07MD3Qsw2fWqjFSm+45x8cMR1onVW/vtJV944OvC/Cl8kryEL9GI0EQCIBM
 ZuPKvhTH/G2EAu9IwSAS+nXRKVn9LR9ELm7UcyxHIkZ8V/TvPHKmNpyCdYyQ1eHcdNqlnluN8j/
 dnwLWN3lCCXG7o1+gdPOJ8/VbKnOzKnVVic9FNSD3HwHEJo7bnb0X1715D1QXqjSHRhKiacmeAV
 ANetY0o+KvwXmxA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

At the moment software nodes can only reference other software nodes.
This is a limitation for devices created, for instance, on the auxiliary
bus with a dynamic software node attached which cannot reference devices
the firmware node of which is "real" (as an OF node or otherwise).

Make it possible for a software node to reference all firmware nodes in
addition to static software nodes. To that end: add a second pointer to
struct software_node_ref_args of type struct fwnode_handle. The core
swnode code will first check the swnode pointer and if it's NULL, it
will assume the fwnode pointer should be set.

Software node graphs remain the same, as in: the remote endpoints still
have to be software nodes.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c    | 24 ++++++++++++++++++++++--
 include/linux/property.h | 13 ++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 6b1ee75a908fbf272f29dbe65529ce69ce03a021..16a8301c25d6390ba304c66411d1a261345184f3 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -535,7 +535,24 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	ref_array = prop->pointer;
 	ref = &ref_array[index];
 
-	refnode = software_node_fwnode(ref->node);
+	/*
+	 * A software node can reference other software nodes or firmware
+	 * nodes (which are the abstraction layer sitting on top of them).
+	 * This is done to ensure we can create references to static software
+	 * nodes before they're registered with the firmware node framework.
+	 * At the time the reference is being resolved, we expect the swnodes
+	 * in question to already have been registered and to be backed by
+	 * a firmware node. This is why we use the fwnode API below to read the
+	 * relevant properties and bump the reference count.
+	 */
+
+	if (ref->swnode)
+		refnode = software_node_fwnode(ref->swnode);
+	else if (ref->fwnode)
+		refnode = ref->fwnode;
+	else
+		return -EINVAL;
+
 	if (!refnode)
 		return -ENOENT;
 
@@ -633,7 +650,10 @@ software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
 
 	ref = prop->pointer;
 
-	return software_node_get(software_node_fwnode(ref[0].node));
+	if (!ref->swnode)
+		return NULL;
+
+	return software_node_get(software_node_fwnode(ref->swnode));
 }
 
 static struct fwnode_handle *
diff --git a/include/linux/property.h b/include/linux/property.h
index 50b26589dd70d1756f3b8644255c24a011e2617c..272bfbdea7bf4ab1143159fa49fc29dcdde0ef9d 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -355,19 +355,26 @@ struct software_node;
 
 /**
  * struct software_node_ref_args - Reference property with additional arguments
- * @node: Reference to a software node
+ * @swnode: Reference to a software node
+ * @fwnode: Alternative reference to a firmware node handle
  * @nargs: Number of elements in @args array
  * @args: Integer arguments
  */
 struct software_node_ref_args {
-	const struct software_node *node;
+	const struct software_node *swnode;
+	struct fwnode_handle *fwnode;
 	unsigned int nargs;
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
 };
 
 #define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
 (const struct software_node_ref_args) {				\
-	.node = _ref_,						\
+	.swnode = _Generic(_ref_,				\
+			   const struct software_node *: _ref_,	\
+			   default: NULL),			\
+	.fwnode = _Generic(_ref_,				\
+			   struct fwnode_handle *: _ref_,	\
+			   default: NULL),			\
 	.nargs = COUNT_ARGS(__VA_ARGS__),			\
 	.args = { __VA_ARGS__ },				\
 }

-- 
2.51.0

