Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734430EF8F
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575386; cv=none; b=moVvAc9LDmybqb3utwl4T6ACfXrS7jDLhoRzYvhcD5ysgddCg6aLhgpjpDddGelf1dDHy3iZ54ZGjEEdA2u0gq6pgjJH40SmMNxw5qwlly0DIoO0WNHPiBdAXX/nnoFMFGGYTNs+ABYEYhCyJRsmEJ9b7BXWeV5XS13WeU28YCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575386; c=relaxed/simple;
	bh=dB7P+hW2P2i24SpsF7yvWCHcLNtwvsI1lS/8EmcxB48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtO1PzGYTXV40JNEgwdzKgM1UrGyVr8hk3qxpZsyYs9ZeCCSZKzMdM8C6lv3yFwq+G1zvUsUvUcqfMl55hZz0k1HA2DTijaBwX+1UKmB6s692htvYXVwVoTSyykuEaUIT3SrSTpEcqFuz9i46ysAxXD3y+HKo1JfvNpZ+46bYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiSnbAJ+; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiSnbAJ+"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c0433a4b9so1617829c88.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575381; x=1776180181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xrYsGshoqQIuVHI2ZhqhKCWB+xMWS+Wc13rrkqN5sw=;
        b=TiSnbAJ+1e1aMlSilysCHdFKhrPGYC019nkK/0aHi+CktkkfTuYyjHkTaichyQ4sQD
         626MwnU3AV+z8GKT2OSUTy6CFsT/PmMWcaRQBjjWMilKypzckyWmcfoBeotewOnKgv1v
         zpqAslBEE9d7V0KwdjuTg6m9hSBdcWbJ0kDH6ufxXMbQtcDx1NepUMUX1FAq7nfkxGnz
         jElX2aDrWsGxCCzhB+Yx7AkpZlOMJKwjAM20nJV4kDDpG7Oq55B5+sKtL8Nmd/3hDUo2
         wxlXIivxtid2Gl/MVjfzQnCI0vwENiXHs2b0MOfdbxvdPjPVC83f81nvd1svSE5DZ3NS
         YePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575381; x=1776180181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xrYsGshoqQIuVHI2ZhqhKCWB+xMWS+Wc13rrkqN5sw=;
        b=HXeUu19Te22TBdQQkJEZviz3Vhk0pLaLh9QSaVcVVfmmjR5z/YSjAgACyU+hRx2xcF
         K00e1GHWOrOktWcF663eEcEaYzMweoTuYit+ILuW82uGxdScSuYoIYucZYC1+sMGs/zC
         TPsDmSfXJvmZYYwOuIZLxJCGhV2vuMtC3rAo63xXYJZYOypblQiHdQN0C4vOFSkR7Yja
         4ww7niCMsL8DHgL0tpmA5KWII7CI9rsJ6UVSnToBClOAGUyCD4R0oc/U5Ct4jGVdZ0ZQ
         vJy2OFRllN/y95/2UZvY/2OosQEBydrWhOOemJgHIBgPZYMje2KuqRbMTzbnBdax12DR
         aplw==
X-Gm-Message-State: AOJu0Yyz00PgCEAJz6VCZ2gh/0/LdJ1oRbzWioFLbQ7Zvl1GMdCASjej
	Mn7JGWvE9HzGTxXhTR5nv7SGcvlJD0wV/nbRItMuj8OwIu2xNMnpfW9M
X-Gm-Gg: AeBDievcOeP6O477wk0NjSCsizj9CwX6dlUVTmyRk6BwiRMRrwx1zJaDDd+ZolJo/Lu
	rZExjXXLNbnsAuIE+4FcHOIvlkr5dI3NIByBIIurIBjFGX1AE3BbCVmOwcWHhGZkAFVbPwJGXTA
	iapV761HM/zF4SOQ4/Wuo/Q/UAdKAghdDNOVFwgmUJKqH0D7Ff/FOzlRE8LDrpTvgSRGk/Y5ril
	ZSzwLkKCZcPriBPG5fA/Ud20gOmGnUYDISfztvPWYPfk2MR6X0gQuaGR3vBAYaKoRCVtM3vHPBL
	O4mI7oZdFYUHo+AIIv7kJmfguB75sNpb3ezKyz8qLY/I+udy0wrerZYphARqIuSAEVDM4r4NaG4
	o37csT+hHIWc9/ambNFxxr2lj60hTv0zKL04zd86Tk+vRbWNMEeLOzZT5Cd+EwnDGphVY3cStOx
	QCFQ9/vuoNnBeQ8p1X1HXzIj8CLwNVNAqwhccdoawg8sMtq1Pq9pzZbyFhBpz9mw/ACefdhzL8X
	Nm2
X-Received: by 2002:a05:7022:4585:b0:128:d5bd:357f with SMTP id a92af1059eb24-12bfb7653e6mr8610585c88.30.1775575380694;
        Tue, 07 Apr 2026 08:23:00 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm20628473c88.0.2026.04.07.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:23:00 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 07 Apr 2026 12:22:49 -0300
Subject: [PATCH 1/3] ALSA: tea6330t: move snd_tea6330t_detect()
 EXPORT_SYMBOL
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-alsa-interwave-pm-v1-1-80da1151f59c@gmail.com>
References: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
In-Reply-To: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=dB7P+hW2P2i24SpsF7yvWCHcLNtwvsI1lS/8EmcxB48=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXFf2O3Z5VIeOpG7E8ys2P66/gzgOPppdp/JWbZpi/4
 PSuA3ubOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAib38wMkwNl+HtviV6Ulvv
 R8Pi/enaJb2vI3as+baxOYhtVuPMV/wM/wxqWzfn8HAt/rV3b77KwZ7E9f7fXs6uUi91v5SiJzl
 7NQMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Move the remaining standalone snd_tea6330t_detect() EXPORT_SYMBOL()
declaration next to its function definition so tea6330t.c follows the
usual layout.

No functional change intended.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/i2c/tea6330t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
index e8c50a036bea..5341907b85d1 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -51,6 +51,7 @@ int snd_tea6330t_detect(struct snd_i2c_bus *bus, int equalizer)
 	snd_i2c_unlock(bus);
 	return res;
 }
+EXPORT_SYMBOL(snd_tea6330t_detect);
 
 #if 0
 static void snd_tea6330t_set(struct tea6330t *tea,
@@ -356,5 +357,4 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
       	return err;
 }
 
-EXPORT_SYMBOL(snd_tea6330t_detect);
 EXPORT_SYMBOL(snd_tea6330t_update_mixer);

-- 
2.53.0

