Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79E3AEF44
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528663; cv=none; b=O42d1ynk6ldQMCtXeSgLP/EHFfXLW0faRDvT9Q/R+SLlvUlpyCMMetDIMbdhdKQj72zap2FiZ+oInDKOmtTMbUb4vbD6tLIdwdRohlwO2vVfv2V3ZZOUsMh7IRRLJvPN/3kRdtYw5ny9G0+ZVPB6g2qmyRYLz1YAxIBAZ4oMJSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528663; c=relaxed/simple;
	bh=uq7+nOwrtH32PDGp8JR9DlXGRcIIieJn6cUtGOwFpCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LzZC7HsGdIIj+HcB7kbcBlqyo5Zjkp7rwfaEk6yYtSmPSNc4olu4bjxFxYGF51Pr/JT2dajOArXGvbDHT5k0s0tLhxqUGMzRlYOn12cXubX8LzDiZBg1gBa01hJbNh3SmqipNXH2U61qddC8K1qnU1FA12nD5S7+R67NqixIPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=erOyfCKH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="erOyfCKH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso6336577f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528653; x=1785133453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juNBVcgjd0xGcBcDZnfN4kMOJpghO8MZ8pSHe23LC0A=;
        b=erOyfCKHU0birH+QK86CYPg1uLdN5RRQxTazC7nh5ggTJKgSMZrJLaZN611HOB67yF
         RV28bGrThF9Gw32plwNQfop9wtF3Ufb2BLpaaS4EwxsCAT0HUToXY1L9JnJBytE96bRY
         kbmJBSpAGCiNGdTZWuf4oFkX0U/AnQsANAXJjlVvU+wtcUIw3RDbi1i4Th15GlUnsVx8
         jP0Dcf8+bLyqYBbtZPwWBhweVJY8Uu0FgtGs3HxwF+b3OzsPh0IhcT3VryOdOOtxyqja
         9Yf+Q7ChWCQy03lpJxsyQ0XfhU6aQMi47neXgswnA3K1kBaZ5AW5xeZ/LBv5OZSz0zpH
         0MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528653; x=1785133453;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juNBVcgjd0xGcBcDZnfN4kMOJpghO8MZ8pSHe23LC0A=;
        b=tZefTY+bMPtm9z+HwV02I/mkx4ThsGv9cp0xCG2GS6d0jWiIOGhGVo5A29y4wRLDPv
         uZiqDW/uuC3U0tYAI0Qk+bmMQf2+Ldi7M/qUNarcfCiNxlAGqbF0Wqy3BL2L6iKrA0Ru
         3CsdRHiaGraP5uO8zD13gHIV3ut7nv2tZEp7XEX//3HBUkmkO1AHgkzDJ+reGrPIBpjo
         Jkd+WinOeh8jgWRir4Ka/mwfgamAG3nv1jzgqF79yQiGuww+bqP8nVOKuq75OufN5A+g
         Hpgc4OVTEH9RLzo1Ocg4Vctvn5yZJH0WAkCjZcEaCRS6/7DCIYS5XPtYCdAf4vk5PsME
         ikkw==
X-Forwarded-Encrypted: i=1; AHgh+RqA+5TXSDC/TB3fKTpShxQv7kNR9+q9qD46LqIs5PBh8ttkGfc9NrKcDAMvtKxkaHccEKeKjsr5lEvfBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dT5RHGstSX3oMKqVQ0tT3KLvMkOtK7BjBRQaM/q83gdzr86o
	pvHVs/XPaDVhB57wGyFWN6+49kvV4Dtzl3i/GWaeCSsGRiBZ0rfyT2Uifno0GLYGeDo=
X-Gm-Gg: AfdE7cmbJuBaS6pfa1EzcnHuc43ySsX517HD/Tb/jPmcpiN3vcX4N18RBF8zmqlMjEd
	Qb7CPt82SGNm38ODGlqWgbgdRQlpwjK1XyvoSJKJZJoSNYCwH6/wsp/80uGEG/rVuFGmG1GyCNI
	Bimbl7ta3nd73aTPDpYAM6sczCh1mhA+evnPiRco5GAuRbGkT3F3fU9pM56IIPPtKjt7LzzBABo
	8poodjS6SWkH+gzGHnK8EeSqHbtyYJx0SSpHGso2RzxN6i/dIG8JD2cX/8AJBBL8Uvi1q4u+D3e
	1KGKNBlP1KUmnpGSZYTGBDLvLX+RUdY78KucIKEU19EWgHrptbe56CtSQ2p8BNFramAFn2rm4D3
	oUZt5MTy7WmG8epm5mRGBLXQMPSlQidiDj+tz62mGvS2sn+LinBtVMcKzsDOdj6b0eOhac1U3dI
	5EPjgBKaY=
X-Received: by 2002:a05:6000:41ce:b0:47f:70b9:4882 with SMTP id ffacd0b85a97d-47f70b964b9mr7245435f8f.17.1784528653464;
        Sun, 19 Jul 2026 23:24:13 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e496afsm27876143f8f.1.2026.07.19.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ASoC: amd: acp: Use named initializers for platform_device_id arrays
Date: Mon, 20 Jul 2026 08:23:47 +0200
Message-ID:  <a23fa9f649eaab706c704b671527c238f211ee26.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uq7+nOwrtH32PDGp8JR9DlXGRcIIieJn6cUtGOwFpCg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzYfT8yQ7nbOwSmi6idCzkp1dq9c98vt0MHl/gydGqYt vT639XrZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiLPUcDDs8t2w4+f+hPceC 7uT7CfP+yp3Zr8ysk7Xh5AwVnSD+D5HPZTd+LDYPKb3z3C4pRXOjkNf1uroqi78KKjHTd2xy9Pt wQLvV0DTg88u8Vfk30ifETlZa49rjw6s+3XJKSNuObA+mFSnSCuxcU0pux+i5LjNyecO88OHK5V NXvjwjfs7pw/1cSdu74pOaW4M+NCzZpNSwfMYasy73p0GnZ9gwhzckHnKuNpLmvPBdbtIU1i9/7 L5VCG6SPP6hKbii4d6MDJOzealmtuL9XrkdPg9eWsvZbDF7XtyoEFmeyFkj2rx7h+CTXN1HoRkR TzImyMa9WHk6+0hMyqrp27W+NR98/csns5zFZl53UTIPAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 9726a9d33ec6..637dd2deebfa 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -580,8 +580,8 @@ static void mc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mc_id_table[] = {
-	{ "amd_sdw", },
-	{}
+	{ .name = "amd_sdw" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc_id_table);
 
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 963ce6fd4012..8db889d824f6 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -438,8 +438,8 @@ static void mc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mc_id_table[] = {
-	{ "amd_sof_sdw", },
-	{}
+	{ .name = "amd_sof_sdw" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc_id_table);
 
-- 
2.55.0.11.g153666a7d9bb

