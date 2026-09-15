Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AD499F13
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461895; cv=none; b=d1pRGpZYRJnlQikXL4KB4hQBCJawc5VpXhPxlhJvZHv81cEBKog8ohdZE0mEr4KxqdqVU8kIt+faap5ItWINkD38zut5+dEyCPug6wQqCE3UyZx7eacl7cVZrtZjj91CRw6S0pA6LFJoddpIcM7vP3g8kZWzFaVWyUywAXqAKFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461895; c=relaxed/simple;
	bh=UxDDQ0RU9M9F+qqFv2blr6XIi/xZl/4Wriymu56W5pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LR9qTzxWuEqJaVO0HKLNAF1x0/6+h/VyyX2eh7L/1NtCp7lmJaDpCqNf+BCL33A4Vx8GI41PG+z6oqaGXdQPDyjEzQhLax0qKSppfcoPLi6E9M2C+3/fn/IPFrzQOficsdo3ktYpThKoXk/kjqnCLl4IqPrj4w590kiJTgNexCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6hnhKGE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6hnhKGE"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2987075a91.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461892; x=1790066692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhviqnNprA5p+wjy+HIKedRMX/OnI8Tgvx6aRl+Jg0Q=;
        b=B6hnhKGEPtw21CossfjR1N6tPL1rTxCEDT6u1Ux4srZ/Ri2foZHXVmuUbqtjXfjsQI
         UQmcqIxUE8lPk0yOJO1TuWG/8ili+DcM9XtKUGbXQ0WWxP/6LV+mrOYbVgmCR5q2PU+p
         Y45AQgWAIsGoxX1ohqZxDs1zpBmDeQmo1nqi49rX1XPVvVWHtHk3qH+BBNwMt0l61emz
         mhce2k6+U2tS9RNxym8Px/d+HsykzYgQXLocCzHJFvH9NyKw4/aaDbyESuXf41D9DkiP
         NWt8uXi9FcDPty3UWiM9VBw8Qt03b86QsA5EN9G/PLkiyYDZJGgq2Hz4SMuzNoitHOSk
         DMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461892; x=1790066692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhviqnNprA5p+wjy+HIKedRMX/OnI8Tgvx6aRl+Jg0Q=;
        b=VzPuQzQo5fqqTgdDcuTnEA6VaEG4+1206KuI1vHeHZnuGhZEZd3K5vCuYpWDWmWbWf
         8Y3/YInpf2yUpacxNie/RAkPIqzDzxE7Itxoq82QOVdlmFOMAwlmux+dioxaLLd2/8Zf
         5WIulBLX85l+zq8Q/Pg5s4Vi2dN2pBgVz7bE2weolhIvWVZuXBppvHwXiN1o2kP8RQ7L
         kHpo6vkhJOl8F2DcZXoO3LiqKUJlkJPDIvduDvC+eojDGHm/nSyJ8N6OcXubHOCK8sDk
         +2VJ2iD/MFtHPnUlkjjLDUzXeC5qDEe4d/i2mUT7FVJxJ0NLOEgKpwCb/DEYJdknrWt0
         Nx0Q==
X-Gm-Message-State: AFuF++nHgmlDlo53ivDNXm3wAnBwYStb5KpVyQGpkQl4NkaUWMH8TcL3
	cB99hcXfLeO7BGnqH4gseZm6msYgCLi4qb1vpNssc9jUR4M/gtiVf73u
X-Gm-Gg: AYBFou0/ZDbfhtO7iSfdLejxGEaHUigBQ7hwfLNQn2u/1c0lg4O0CBRVaIuqEN4u+/7
	BkvNB0rXt7VOp4B2WWb3uz//BAPXTxMDXBW+TwqGtIULOPgH29JLlPmgd4MsGsoTmnKAM0DSBnb
	aX88Nk9Vv7BD5Au32ILtk+5OW7MsRgZTULJqso1fm77IoEKiko4+S8xMav8fjOmUSFMp58RLu+8
	dqGV3SpFQ1AP1OWJoEOz1lBXYzYR7g9gHGXZGXwc5C0RLijprjgqWJPgE/32zyFa2bQUsikhZDY
	+FGGQaSLC65vMKjxE08TDB6CpZ6CKzpKaQqkf0/ZN0lJn6ojNxjV+5VIfGywWisI5TnvYyiQjBe
	yGOB7U2zB2/RiVo7xhh7f/4JBgJY/oeHmxzHr3VLsM2CfFp1+45SULBnad2DWObg/8bF0Np0i9w
	Tj/GoVU1CV+57PUTHJckBc/9VraOiFYh2uaTkTywBxsnCJe3M9AgZf5zkJSgX6ndhQjyiTlP5sG
	aBeY4HYgMHdH87Vo6Yz7LhKteo=
X-Received: by 2002:a17:90a:d610:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-39df06f80c8mr13098521a91.15.1789461892002;
        Tue, 15 Sep 2026 01:44:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 08/23] ALSA: opti9xx: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:09 +0530
Message-ID: <20260915084424.1007757-9-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/isa/opti9xx/opti92x-ad1848.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index abaa3ed3ab5c..8a6db40ff893 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -378,7 +378,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(21), 0x82, 0xff);
 		/* 
-		 * This bit sets OPTI931 to automaticaly select FM
+		 * This bit sets OPTI931 to automatically select FM
 		 * or digital input signal.
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(26), 0x01, 0x01);
-- 
2.48.1

