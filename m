Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E42522F
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 03:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733370533; cv=none; b=taQfvXZWW58Hiu7ZBbepI3RTcIye6zOZh9Pqzm/Rk+4TaaEpg4xVtcVb/yxr6mBNfXxxDX0Dk9EcvltYqPNl0IgXB6pVvFsZUoGbLyDjrIctDpuZyiXb3sCT0hx0FvATvTu3NeobC4HbGC14CSPrRRSTcNrnB3ap5V8hGCxXZsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733370533; c=relaxed/simple;
	bh=CIAcHTWouiSfHGDjG8PH03xC2FDVVTN5iAHXmkcPXM4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aZyWkqIVW5uvN2Wj7U/WjVgsTgWWrT+zu6APB6dvatQHSL7WYjZvxq3z2+rhlJeRUbeyPpSxsUoyL+BkzMS4NJqjVZVipUMV2jHqnATzF5iG3vP6PQ2O3flabOfsXkSrdo4lx2eiw7DnHKr/BkS0JlKIPMGelTJ8q4jVU+iaFc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Ebl0djXz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Ebl0djXz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fcfac22a30so512141a12.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 19:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733370530; x=1733975330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1My3AkdGBKswP/y3OSpVbw73PiJF48NkEn//NpXXEuI=;
        b=Ebl0djXzvBD5e5T3rlb9y0/SPkQYL1dVWdsnSENFvOShoCGvPdySZKJAgQuZv4Ewhq
         7ieWu4IyTwVuD7gDh1PtohiyPM8NuxyGCzDc946RJ/WCmhvw+7XKKLSR0AKgZwm0Vlb1
         06JUEUkr/ILJCHfIkkeeUtiZ0XbQTPYueB2h5oakk8NVDEJz8JO+jeeyaaV/zn8VqcEh
         O0m/6pd8uGbMln4xgdSo53ZpsUbZZZw2Df28aa9Kv/x75Zw5ic+9TVoadezxgQNN3IYa
         QzsHv5FtCUix2kRNhyZvkSa6Mekd25NyA1NJm1+/qYjVEAvhUfOoFHp9SQ8azFBXu0Pc
         FUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733370530; x=1733975330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1My3AkdGBKswP/y3OSpVbw73PiJF48NkEn//NpXXEuI=;
        b=O/XcZe1kMgItJh6fX7vkYizJgSQzsz3AxLO7BhZ3ZedrzVm+ocs/qUmpjdNL0iHXJi
         7V2fBWUqbwkKNXutTFJh1TdsNsSZ7DoLyXCbh9iAjGnRZciYtGE55Q0K5HksQKe8UhiZ
         5LB/gU8YFhBLO9b1EormS2mbBvfxkaZjOYQK/ByMbV6yhdTtpitKT66NKRO1xchqbV/R
         MfE3qIhFwBff+BHNA05tZzqgna4WN7HkZtVIeDJFHXWdDCfLoarrBKzjSP1M6Gx00khk
         3SL937LqRDchRatmyaYfB7Yw6GofS8SgxlzI2I5jqwnVZQAcSgHU4RBQODr5RD8Qtwpw
         yr8A==
X-Gm-Message-State: AOJu0YzBqT0IJU7wwFInsle9TGulSnIrxSgTp025CAXq0EuSSSatCRbL
	P+FSkZ0JMFsIzpPiRYFNlviRwxH9TKMpxH1bGKDkH5cz3R68Trh/hhQobWvXWws=
X-Gm-Gg: ASbGncstLOHIRyIxcj/1lMelUWuaaBAxFAK2sDzD7lIsdpwTI0SaTTHiqmzEL4E+U7m
	MDfVydjBvG+0rS1d0X3JW063oD6UHw0cI5HZw26B8huq8yq/60wXgM/wI67yGZEBq9xoOm0tcWN
	hqmxHFSbNNC+VZKXVcwDznCgOpEVsaUYmPmgng7dQL+BFIKoxDG+go2tUlCehvkY+LtQwx7AVe9
	E7W44TieHVdFuvyBgQ+lBpvGCmfxM7BqGuB6XaRTFB0mccg7DA0SRsbp7Uth35KwxodVG4Feg==
X-Google-Smtp-Source: AGHT+IG0GVE8o//UYrpSC70WkPCizpgVQNAmVt7Llskc+OX0sh/aoeTNdvRaY2GKFtHcgf8FaNblug==
X-Received: by 2002:a05:6300:8089:b0:1e1:d26:6657 with SMTP id adf61e73a8af0-1e1654134b3mr12995376637.42.1733370530410;
        Wed, 04 Dec 2024 19:48:50 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:b4e8:b652:1451:623e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156c4373sm263889a12.21.2024.12.04.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 19:48:49 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com
Cc: linux-sound@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] soundwire: slave: fix an OF node reference leak in soundwire slave device
Date: Thu,  5 Dec 2024 12:48:44 +0900
Message-Id: <20241205034844.2784964-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing a soundwire slave device, an OF node is stored to the
device with refcount incremented. However, the refcount is not
decremented in .release(), thus call of_node_put() in
sdw_slave_release().

Fixes: a2e484585ad3 ("soundwire: core: add device tree support for slave devices")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/soundwire/slave.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 4869b073b11c..d2d99555ec5a 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -13,6 +13,7 @@ static void sdw_slave_release(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 
+	of_node_put(slave->dev.of_node);
 	mutex_destroy(&slave->sdw_dev_lock);
 	kfree(slave);
 }
-- 
2.34.1

