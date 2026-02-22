Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C5205E25
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771763177; cv=none; b=IO9/N/lFT1QTFw9kyKTBNiK2mtUXMmyxBzfw7kFTehrrY/z3BhDgDqYwK/3iXOLXlSaeB0vRwMsIQLZZTmgJIXAV35GgW9K09iPLKeXHfbj+JwRQndKsAep8mzCLOa9gf2t/7r9r8wG7Rumc4KjT6OeufpTPmAh0s7mZgBagwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771763177; c=relaxed/simple;
	bh=r8qtfrRZ+a9tDUEL52UyAQXfb+IQdTBvTcDT180+jDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVI5WUlzJlAqtoiRrSvTOX2C3SCUz4QqPiAaccyrQwVrOxDx3Te+N7zZNi/GroMKjwv11B34RJxoRy8kxd1uKVggigZInYGhLideSQP2h/Tu+tW0kIv/j3qO2fkzy2X9fFuFR0NryuTeW0cjZ510eKOeBqmnsy2h1aksvfdVan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMdVTT0L; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMdVTT0L"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c2af7d09533so2344392a12.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 04:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771763175; x=1772367975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7Yy+PNSGZ+0k2NhhJxCl7Lu7PtCSNFAVWFUv+fEbH8=;
        b=DMdVTT0LP05G7XVeZuvKCbycOC0vInnXnsNHeV8mLsTdsrEcqugAccDDKaY6wHvXl6
         wcjWsmLvrdvuSOfvm3zQHEfadDBOtNf62GrgLlfRwqLloDgOQVPOxrvXtPt3oT+SEy2N
         7q6mP9GiuxneZIZdM2No+PzknuT9oOqdVpz5VE6BVymsjFliu8Gks2LpFAXUU8hsCz0E
         CNgZVkqRLvPQHriTLcnVJ4l2779xSM8/k8rjJV2RUHJWIKPLSVbYFvLu6rrl6C2UJ7ms
         t1YOUEjk2OHhHLilpZYshccR0JKH6e0X1AjxW2g92UzZb74Yj2qiik7+mKrJIEXebqDQ
         sVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771763175; x=1772367975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7Yy+PNSGZ+0k2NhhJxCl7Lu7PtCSNFAVWFUv+fEbH8=;
        b=cIG78uO1jGJHp1Y4t0ibLRkCRm2Jir8t0cLYUh+23Gc5T0+8woGtRrFWif8V/cNfJx
         4FQ1SOon25400VBYD2DdWr9o33IiRAd74gqErqqFrooIQ3iKq2At0pZAzPOXEUKFRhXa
         STzKpJ+m+AuY23sBnd10R4NrVHmwy3WAN52BPvshnbbV+xInAOrKxBpb77xPvSFf+2Eu
         7z3V6/aJ9EAYVSHUJEHSacmO37NMfFej6QUkVdV+ukSbcqLeRl3bfN34k5jKooip22UB
         A1/5a++yIsLPGckiHcRs98bWofAmI+TPDxKhIp+1sPLA4zDiZIXW/8SNxJv1UqPOxrK9
         qbGg==
X-Gm-Message-State: AOJu0YyMAohV9zDUva/TBYpGzypn4Vzngf0+81HfZo0WkxrCARFG2hIf
	yy4cqcWi9Ghn8puVMkE4SA1Ed8hUyXZ8DwcXmTBZdnzEI3XhsaVA0VaFnQepmYLUEw4=
X-Gm-Gg: AZuq6aLj+71GzQMn+IT7gvzP3XdOV693QSJoBRt/CbO4t73qwrZVCrIN1KIFKNfckNY
	kkbpELBT5J41Dew+HoZTDcG7MvpOUUVpz2pzoxC16mOveSY44PvIDVYBxhb1X7/utiTulTPLFZw
	51iNIniBMRhcrcXgwnPqIf2gEMjayFdNGpQW60qGDY+heV+NIj61ImivbxTYpi0ZLy2W2nolsRD
	rrDurWQREF0UNBRr3avVjmA6SgmaU/T3UrHuWaifv33z7BrFsz6TTZcuUhnhk5onxTj5qMR+hoJ
	4H5LYwVQmBJq8ghiWopswJHZleFxyI363OSttLk4M3vlH4N7NBfuRF4lg+I2AOrYOWitQxw/sQu
	pqysALH5soL3RxBpr/oiOavBYS08d1sA9+TjEjml/QImgFE8Qg2mn3hESx9YQ97Z5JL8ssZnIWU
	uOXgFPaw0XGwKU04TE7l5UdZGgp7171SIdhca1ihSMnnQf4/BmOhBRrH1x
X-Received: by 2002:a05:6a20:748b:b0:36a:dbc6:2572 with SMTP id adf61e73a8af0-39545eba4d3mr4701634637.18.1771763175425;
        Sun, 22 Feb 2026 04:26:15 -0800 (PST)
Received: from arter97-x1 ([58.124.177.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7180613sm4408021a12.3.2026.02.22.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 04:26:14 -0800 (PST)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Juhyung Park <qkrwngud825@gmail.com>
Subject: [PATCH 2/2] ALSA: hda/realtek: add quirk for Samsung Galaxy Book Flex (NT950QCT-A38A)
Date: Sun, 22 Feb 2026 21:26:09 +0900
Message-ID: <20260222122609.281191-2-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260222122609.281191-1-qkrwngud825@gmail.com>
References: <20260222122609.281191-1-qkrwngud825@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to other Samsung laptops, NT950QCT also requires the
ALC298_FIXUP_SAMSUNG_AMP quirk applied.

Cc: <stable@vger.kernel.org>
Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 421a84b9fb44..22b182fd6129 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7311,6 +7311,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc188, "Samsung Galaxy Book Flex (NT950QCT-A38A)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Book Flex (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc1a3, "Samsung Galaxy Book Pro (NP935XDB-KC1SE)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.53.0

