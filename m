Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A14229B2B
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420755; cv=none; b=guCila02/kTG35A4+iiJeHMWB3/idAXaSY7+KW9N7zHpbD6UcPh8AdwF7S5wZfXXtxsq732mrsGw0DYuMCDBmow/gEyPbX9n4ri2Hj3cWgHP/DHy0AjKTKMoHnxwWLp8Uk5MDtM6KDW5mgRFWnNyIr48PnE8ipKVtQlsCoc+IuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420755; c=relaxed/simple;
	bh=VlsN1y4ZMRHLcmrX8scixqd0Vvvyz2jgvsJCDQnq7cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lvUsH/IP+s4DDAPx8JP0/qj52j0cEkV7GqNtbJNzzsNtVt7yHDeMl7TwAqSDAiijv12d1i9qTJjcnVefn9GFnMZBKalcR1wh04AcOwnIO/HK8OFY99jbDlCSEE5dnCVbYSqV4Iv5fpF9ZqXa4nwP8lGfdnJmcGYVz6Z8WnSvyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=d7aJZPQ9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="d7aJZPQ9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a363d15c64so2920635f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748420750; x=1749025550; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQgBkpDBPRTw134Tn/zp7QWRfZiqjrIZv2nl5UdLNb0=;
        b=d7aJZPQ9/MxuQKtpUx9vVoRkf5cVigXuB14uYOGoUF7gfdEBThVRQj6EJxbqPEiPL4
         AnHst6DCvy9/VYvzp/Rw2wZNo1nwxQftAHJ6znICxdhA2eTwZpSwhH2AxkXHTvMWYnK6
         4MP1i1X/STWxI17sQHc29cmZOMXVWvydDUzLOLU75AUmIQeDBIJ6DV6q9fraGwl6VIX1
         a5mUg53zleeHXgbEX/V+UiMzhi4Tic1gHh0DMVoGk3kZwmVMW+TK8PrqRYdlF9a9ObQ7
         zkThUwy05gbeEgSx3caM+39hwY6pw/eNcgkXHouMbIiXJ2u4WnUH76Jg9AKhMP4mhHLU
         3Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748420750; x=1749025550;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQgBkpDBPRTw134Tn/zp7QWRfZiqjrIZv2nl5UdLNb0=;
        b=ppfRnsG4X70VcUAKbAvgaCJShIWC6za4OfEqt+o3s/hPI3ruaq9PVfNGMpjfA/HI0X
         kuXb/qONdwMeENcxZqGq8F+ewxMn49GSkOhvDn9P053u6BVx2JyuxqM8IL6/UvXN1W3h
         ZZNUayiqarA7PgZjPP0Nx6AlTnf7vwku9mBRr6b1B4dhMPxB6McVX1WAoCrPve/p611y
         ZV54wufDkLnaJN37LgaUAZCNlYI9iJOT6fmfdWfsSygJgdlaL2dYtu+9LBOv2bRd+APp
         9tVDMw44aEz/vwVa7CznPFNi9LPci2bQ1MgUoMTFs07fGJ5RK3uOpu6nN6J5dhXPxLgZ
         HdIQ==
X-Gm-Message-State: AOJu0YwVARXgE+zc+K2VWO5QSSHYYCoPDU8y4TjsWtZq/kYnMvZ3Vnvs
	JJvRN82bUwa97Pch63JynoVFOgZaoBLz69cPdcjnLfkMRPdrm9Xd1TK4prZqQnRPjdM=
X-Gm-Gg: ASbGncsWx+2yIoMKHY73Pkjrwsp/ak6YwIrbhDvrd9++tA+ESwg12ITmWxB7Prb23+5
	vRJnw6Q/DwW3IioJahwu+AtgYRY2HxmkxtGUN/tJWscrztASs7EpKzLa3tMGY88BKw5MjHLD7BX
	zCL7eWSPieGSsaild7HDBm5T9bKj0X/8GgE7H6pLTGW77sYF/VU5VHw1dcCcZXBap6JlWeo8iex
	OsS+Y3y/R0V7WCIzgvWxWReb6iFniaZhkOPK74WURltE0+pZRPgmXo+HkCzlikt5TiCgqDr753S
	pFRW6QIXGWuQ1TxTNOgI9FbKUNfaHDG50P4SaCHKbi/LtnBHQzkqNAtcbY0/5zfi5h6uKpYvQ/+
	TQNb5TgpgtAKWV6W+JogqUPMRDb1XHi5ok+1FkBelTQs=
X-Google-Smtp-Source: AGHT+IHFPkP2u7PmZOuSF74kJDUP1U5Ppd3h9qvZktrhcp3E4VbXOBQgP+zpNOdXBTsKfvKAWbA8VQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a4e9437a5emr1346230f8f.1.1748420749819;
        Wed, 28 May 2025 01:25:49 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd78fesm805814f8f.72.2025.05.28.01.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:25:49 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 10:25:48 +0200
Subject: [PATCH] ASoC: tas571x: fix tas5733 num_controls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-tas5733-fix-controls-size-v1-1-5c70595accaf@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAIvINmgC/x2MQQqEMAwAvyI5G7Btist+ZfFQNWpA2qUREcW/W
 zwOzMwFyllY4VtdkHkXlRQLmLqCYQlxZpSxMNjG+sbbD25BfescTnLgkOKW06qocjKSNYaIRuq
 dgdL/Mxfpff+6+34AnGGeqWsAAAA=
X-Change-ID: 20250528-tas5733-fix-controls-size-4211444d4b31
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peter@korsgaard.com, kamel.bouhara@bootlin.com, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=VlsN1y4ZMRHLcmrX8scixqd0Vvvyz2jgvsJCDQnq7cE=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNsiM6LMdvtHRZTGKEC1Ur+ZyURKIFZhIjJkQe
 fXnJOIr40yJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDbIjAAKCRC5WrpGvQUG
 8OQYD/95OMr8hM8sTip7vn7zRZ8JKHpADTrZUr+WUMSmN2qivhLs7DxMzQGjkQw7hxHb5VCezG+
 0nwxg0GzcHigsD55Xi7yGjFItDd2muZcP2dH2gC+VH2d1jUZoneHfmKVjiZJIeoupREVWhapf/T
 A3M8vIh+D/xmqkb+1NHcV+NkLMjQDscMSVWi3yS92AafDJKpwHb63rFBf0lMKA79L9K8hsMe7Kl
 y3L/KgmB9XOHyogA3FoAXDRfnRwClMGPDrESmmd++GoQiLq3U6tJXL3n6iMMqtCZdirFicjLD6j
 pW7pxHXAKphjVRxCTxg+50BkgyVJBYJyIb4Bq64MXdksTxCqXDTH/+t3mxU9xoSJQmYmhLsyi57
 ct1hq6h8hYCxlZnjsWOonS/8/MwW1JXM9drx/hTkCh5XDcayuoAyG/WClouyq5JwUs1NrWWizkR
 oLRmwFymGgewfbzSQqlcJcjKkjj1f6MZHwyrMXVPi3SmPMZikl5Ej7EHVZ+nmMi3rFDQ8GrlXtm
 AsULVFcBquHAjiQe/pCxCBnD8GDum2O4qjAVEvQbr5LIesCJO7YxmSWOy6KcfFb0gUIP6DvziyQ
 SVuVVwGXJDP+4Txvf6C9XLZNe5U0UlKLhi8RuJrQc6R1m6UWiEGBz81UbKdF9ZZr36arflvzHMN
 ThiCUr8dUiK59/Q==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Commit e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")
introduces a separate struct for the tas5733 controls but did not update
the num_controls with the correct ARRAY_SIZE.

Fixes: e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 sound/soc/codecs/tas571x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 00b131294547812f1406056d17e6c42ddf92003f..6bf37c77f0a77b11464a3560b1680fb89b0ed2dd 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -834,7 +834,7 @@ static const struct tas571x_chip tas5733_chip = {
 	.supply_names                   = tas5733_supply_names,
 	.num_supply_names               = ARRAY_SIZE(tas5733_supply_names),
 	.controls                       = tas5733_controls,
-	.num_controls                   = ARRAY_SIZE(tas5717_controls),
+	.num_controls                   = ARRAY_SIZE(tas5733_controls),
 	.regmap_config                  = &tas5733_regmap_config,
 	.vol_reg_size                   = 2,
 };

---
base-commit: 76f8d35964e4de1b464de22e4f3fdc14937ed854
change-id: 20250528-tas5733-fix-controls-size-4211444d4b31

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

