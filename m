Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173109;
	b=hfHQYRzws0Gakc7Ibtrw3Oi+FqoMB+s3cImuT9j3T0AiwLA4oHCAhzJvVH1wv5ULTF4r
	 nWuHmHkzxe9zLr3MC1UjELdqXdK9hjlbyW5T89P9tDtOIuKjlOxz3Ke/sU3qQXcTvrZgK
	 buSwZ0B1sBTf8F23k8E9pZU4nDhku7f2V/JV7Z0zr3heu+A30YJchFkkF3iV378bdt1He
	 2uz0cXpGVDcJSS2kbHsVkY0eN4UDchEi45rZ0eLcrJxOvwgpG4Don8QrJzJpQ04ZT3fXk
	 Eu54K5gd+bT5nGqz5o11+Q2DWcZon1q98sY2ggSlJmrmVrip48M0zQO5/cIAt4y5HrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=cuiicWRrAUyZnamF+M3BRWBEPX8j9IJGR3LJj1dql0I=;
	b=T+V9sb3LdLGVrLcBbIBHopf3luUOgzEv8/oNpP9GHyhR2jGKhxYjZsL/M5bj7HQ/bQxm
	 HGQSTYFVDSquS1QEk9L6DTjqOJCVdsxgPodEWPE+WisI3Pmifown4u3VkkBI1dJ7YwBzt
	 yvZRpcPzb6ZAlU+1tvDAhT/IzP6Q111Jk39qXRwsfzP8cOhCIHaASN2JtAcTnKdXp2JHq
	 X3Gmhe9tAEVLlJ+x6KIYpS2G4hwatPyEI3GCfkqiLV2CshNb12mtnTR9/GRreORWLia0Z
	 i7V5CZSsFK9gtb5SPppWIe+0XHcxnkzOTemDc+fjjROCJBE0/KtPnh7iy9r1g/+IfHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M4o7stAM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE260A2621
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EE260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M4o7stAM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so6141555e9.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 03:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173107; x=1795777907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cuiicWRrAUyZnamF+M3BRWBEPX8j9IJGR3LJj1dql0I=;
        b=M4o7stAMTlrwBv/WtVwSB9GIePNPlbc5sv+jGi4LMHFQbKjA6YVOrAMeoT9BbQLJCg
         tH+M1Wa/E7CQtJMIAIZl6Drfmih9N5wkx8t+5OedQHxCxsRXI6QkiBUYD3Gga0IfY/OI
         rlBvwRWrzxSME1abmyjZB9IA7GeMHBc2K2acQwXgf3oTvOZYfcMqdzBDE2qcGAZc74yu
         yJ0vk1JdEsHRtmCEUQLctOG3gwmcBZH3Ovd0ylFYFz6VDFByL93l9DhykaebxoCQhqJv
         LjgpJ62t4w3t8EwAlpFBzCFZ9X+j/K2NRdDufJJ0BIQjyfdnAzHuaE3HWTD4ykg7FOXp
         hoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173107; x=1795777907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cuiicWRrAUyZnamF+M3BRWBEPX8j9IJGR3LJj1dql0I=;
        b=F3PJjGrImvcikIhf38ApT1bqy+ausSx5z/dDEofGVukQFZkT7mOx+TzF2uVjjTbgW6
         lnm/YmU4pVFW0ohF/tM/TQAOJKVCKpvMSOmd/BrqvrhA31kaM+DXN0cX2zBdg6OByiKU
         PsFQnaB5MuqpKIpwU6Qe1ELCtGfwIQNVQdDxoPSOzETZiWBRNIVWbyhGwe75EKVmzmoa
         pfZvTJpAi3ENFr+YqlKwG5iD/kRBLb1+7yXIQLR0u+TaQSM0wCqUtNzeFAteJ44MmhDO
         rjWe1+ybdTcmGQd3Nj8nyvoOqaZJp3XVF2ks4n1tvScJBTrsT408lg0PjhpPhtBew6XA
         RWGg==
X-Forwarded-Encrypted: i=1; AL+hErGcDkkXIyNzW6CjdxUk+yDns3bO3n9HHzmuby0ydDyTuWtTpD48NaXnlBH0vMUc4ZoJ/ZPw71J1OX+BTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PO1koqU2dSjdl4V5r3ujJSKKtx3XPVxV4OzuQMTUGhYdEH95l
	2vcCLkJcy3fRwGJem0je3tEIf1ANhJjJV7jf7aGK5EOM8AmewmiLBWlmXCxEyppvvk8=
X-Gm-Gg: AYBFou2u19xGkiXaaFMBaKEcCPCkykSRurbhO2SJz5733g2Dsvg5OlEGlBoPQq1yxAe
	A40yKX4gUu4UpzrL3w3yZxCwmk660rq/sjXiGP0iOLq0sLV3n+IWh2eNE4yTMBtZEQ3eU+OpSYE
	K/t0wH784N84jnyNeld6PG9lH8U+a5dO6JcyepBtGBvMSonXVDClmCSgo4867sSJe/3CZitppeH
	+NrvI5cDrrryhzdqQqax9nuq7rXJTnF7daI7v41yv1e9NKmJtbSVJ6TAV1eRERTjhw3fLD1/wmv
	lkjF5EUGmODEgb2aBUul6dkwbwfDNTDgsSZc7gwHCwpCvbcnqWbHJjaZjWgxJsmARPlNyrYMMYf
	DekoMgDF8FKovz3KYig5DgbVcfj8XNAtX1wUY2o0bY4+gmhqNfg4oY08CDPA3yqwIq2Rjldz4ld
	db9axrfO9M0IbdpDquiySE/hfYQ7WVrrsfWGs5pENrHu6XhBHMSL10oMWWiyet7JsgaQGfOewR4
	M8JaSDDyGATGlkCvowM92VpyLnD5EIdGF8qtrdECc/3oWAH3tlmobhPqUItDM7sXMC/RVtOhdJw
	WNV2gedXWtf64k7TzcKvZ1XvZ0/OSzi4NEymIW+N9Pk9uTe5AXEXP3zn3+gu1yChde992I7KcfD
	+Q7guLPHyqwscDapj
X-Received: by 2002:a05:600c:530f:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb88811eecmr54699805e9.14.1795173107047;
        Fri, 20 Nov 2026 03:11:47 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb895f66e1sm30127895e9.0.2026.11.20.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:46 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 10/10] ASoC: samsung: i2s: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:11 +0100
Message-ID:  <39437b69f33702ba7d77dacf03131df51166f21a.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NCbETnE3cdFv78WOvSzd9ijxsgB7KGRQfu1FsNiCyVA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrfm5+Hbbkg181I/azv7rYjAKeGSAw2N4SsV v/BjYJkMVyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq3wAKCRCPgPtYfRL+ TsBLB/46UlMqDqwhF+Hzrd6i1/DmRSvRbFxrJIZjT7l5JmCmW3xDm7xNCdTbVYZgYSrNJD+LoYX os+gkEOw7ZJz0BW2kOmIa8rRwy+Fzxu59p84xrBXmzGWWhlOkC9pSTp7jh3JhtWBG7EeqpmR+iS akISIODBb9ptlSCUYsxh3cRbH+yTuSq/daZTZIkFsckU5syIfAHheN3Sqn6Y8Ao60idv89m/wJR 1QONMUfpyBh6YxkCKIpMuZcOgyHfIy27wKMLviqJPlX3XnMYKmlTTIJT+DepajDdni5W2/2wH3Z ZUFLJu37X2l56fna0me5T3FMlnCA21oLk4Jfi9nu2hflrEk7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver is expected to be bound to devices using a driver
override---see the respective use of device_set_driver_override()---and
so should be allowed to match via that mechanism.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/soc/samsung/i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 8a938d0d79f9..fdddd3d4eb65 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1740,6 +1740,7 @@ static struct platform_driver samsung_i2s_driver = {
 		.name = "samsung-i2s",
 		.of_match_table = of_match_ptr(exynos_i2s_match),
 		.pm = pm_ptr(&samsung_i2s_pm),
+		.support_driver_override = true,
 	},
 };
 
-- 
2.56.0.rc1

