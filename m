Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A717428473
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327818; cv=none; b=TKLwBclzCO+JSlqRW4EFY06owiMRwhO0yuQk4VeUSYJ+5gfWwcebWbJZi8Dn/IP0ApCS6U/merzmTQoRFRkqPl3VrJiRlzVC4Rmsj89zlQnQA1cHh6kxELEPuwXktz9D+tZ8Nf5HB2xWZHP5CfnY7UbdWIr99Gqlhghx7HsGUDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327818; c=relaxed/simple;
	bh=LmoWN9cJOdOtpu+/xkWYYz657EPQQE2dbxxqC3LCbZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMqRJ66kgrDEt1zyDEMr5Mt4q/v3VEUxR7+3D8QiKhg4Yn+snJSnqUm2EP7E+7qcYp66c4zg/DtHFSwscJI00oqKfnKCF8tB2OeujQ4tl8LXnVipEDkG6bQ+wNNbbPLjA6zgnYOZi1Xlw7YkAM1XCW467Tgw2t7J0HMApFgfXdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3aQxJ49; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3aQxJ49"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84783bce476so1841078b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327812; x=1783932612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4l4MHqh/KDadKmP3mSxP41WnIPSqSqdoLG0zsYCrnU=;
        b=U3aQxJ49Yz+U9z0bmH/E2t43FZwnYRIcotcK7RGHwn54UtCYnsLsht9FnoFXJrcbG0
         vRD/awYZYqWRTBmUHay3RilQHXFuoP/PTNc8zwHHDBLZJgPJP36StCLjspB8rKyQNwEL
         7q9uq9ShB3Lp5DdQ3v0PXs++qXge6WxPMGGUdPYbW4ne4FAR+tAPvDe7pRqj5wQ8sJO/
         oktdLulOyUK1hN4/V26LLivoJOce9QHJEcV5eh+vev3Ng2pmpJ6VetdYrpBdBDXS2SE3
         JuGxDqlPrP/ewVLFNzxJXNpWLTW+Zyu2hr2a3ZOWZCC2BoegeBQGxito4OJ+UYtPBtCd
         aXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327812; x=1783932612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4l4MHqh/KDadKmP3mSxP41WnIPSqSqdoLG0zsYCrnU=;
        b=gjIOGiOSnC4ilumPpl66GU5A0TF/1DrUoJhU3tUxiQoslvTXrkXT3MycN8gf9tSEwh
         XFn8h0bfBnzZ1SUBTf+hwoMrVBgxVRO3WG0j1HnD6pSVHbL9mECrerRceotVB3J0djMY
         mRthBrKghGoTxe6xMHEhC4VeUiC1z7X6HfVnqnH5y2P+FZv6L5baMysYei4mkai68tLy
         p0DgqrMRMgtV7RjXT/8RVRAVrYSHsN3zN/iX5dGPv8+0Zcb3fDCaw1m1OCJiNKI4sMRx
         OfK0eEE+ZCEeW35Uggy6dpDg61pPQcI23usgC51bQWxRokYSI5tk2ks/RyMYYov5tg+h
         3oJg==
X-Forwarded-Encrypted: i=1; AHgh+RqI5WmO6UYKWiD3QAtH7u0sY9i9bSfTksoPhu1xRA8eQSTst5Ot/acUhZ/wxIBuhUOgwDFux6Ryb9oqmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSp7/QPNZOgWcwfBGXkw17ktC4M2r5QhoORyLIZMs3FEja/u8
	9qQzuXRzmswvXnTUReGCUtIhC1JLSMv+OZyiaBdwC7OcWnb03Wp0Pl7P
X-Gm-Gg: AfdE7cnWFXrMjfAPpABga310ATE0ZaYB+Qw+fL4s+uaNOO+M0+iaxw6Fq5thLJQPsC3
	qCh1CLjY8l62oyqo9Dea0zDAbUeG0LEq9RfeDDz9kTGljJCDDCe7gYjqQ2YSc9M9NiBrqdUcjGY
	5rHbQ3xzLjOOyWNvzNFQN7vLHC9897d13sSXIZkoZOn6CTErYL9t7kDRHJp3WY2morU6LDQYehv
	gVSY6E6LkFGK4G9yaIO9EFRWt8ixGNyoN0ArXYno+vsncunRFYixusBXLiixwNHECPo4z4+8NoD
	/t10THbNDjocRPWGjoKgPGlm2VuZL9EbMIA74tjHUcqXBHerho/bTgOsRewSivnM8eCNrOuBaYX
	z9uUMr58Sfq2e87XiVH2ozIf0Hh/D7Sw4qV2JM2nQmMED2ifnC0T6yQy4lIsrGyJMI3L/aLRGzN
	KU0XZ6dFOrjq0PfSfo9ktvW/4tbyoe5eWryYbD7+nG/SRlT00=
X-Received: by 2002:a05:6a00:2d1f:b0:845:e717:ecf with SMTP id d2e1a72fcca58-847f6f0041dmr8318806b3a.36.1783327810779;
        Mon, 06 Jul 2026 01:50:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
Date: Mon,  6 Jul 2026 15:49:45 +0700
Message-ID: <20260706084950.49331-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706084950.49331-1-phucduc.bui@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in snd_ctl_open(), the owning module is going
away and the device is no longer usable, so -EFAULT ("bad address") is the
wrong error. Return -ENODEV, matching the other unavailable-device paths
in this function(the NULL card check and the snd_card_file_add() failure).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/control.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 037e455bb11b..f64b2dec746a 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -64,11 +64,10 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 	}
 	err = snd_card_file_add(card, file);
 	if (err < 0) {
-		err = -ENODEV;
 		goto __error1;
 	}
 	if (!try_module_get(card->module)) {
-		err = -EFAULT;
+		err = -ENODEV;
 		goto __error2;
 	}
 	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
-- 
2.43.0

