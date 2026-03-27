Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1883290D2
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627287; cv=none; b=sI3F5oSGKopEBCkPhKs4Qi0yr8Tv7PtQwA5G7mL287j+9rEMMD+vp+CnZuTAdeN7aDgqKNH0OZnxGo4HH5dETj/kG8Ow/xlf3YqurPKRf0rcurdfkcTFqOJ1Q+ZT8+vwwwYyJoijZuQ+Vaozg2Tpok/DHyISgRz6DJTIOv5RKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627287; c=relaxed/simple;
	bh=StZ2nYRkLjKoLkkTX4Rbqvq29191L7zU2kRO+Ve1YZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qmLumUEOmzem1ev5h21JxglIMKO9rUQLjBMh3AM8mrhDQNoQgwZ361JCYa4mWFHn25I6fr04QzP2WLh5UACox6IV8NMAH5ULH1X4ztiM0nfvR9NRfux8HUWN5hdxYS4JPNUvbCzuZKYodJpFpB1gjR20p9jjtvwyPDiHM1aFPZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKZhj8Gg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKZhj8Gg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486b9675d36so20206155e9.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774627284; x=1775232084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1H1O4UWd5ujd5bC+aoj0HjY6fPG/nO8fBEq0f9ckq1M=;
        b=SKZhj8GgTVlb0nAKRRNRXQIeBcsv0jEMP+OVmga585MsR01lUoUkBLcfE1jhzik87A
         VSYWpzgl0YkFrMpwnhm1ih/BkUxFGNnMUYi67SbukdlZf03+uOpLhgJ9DJu/oWP6Lb8y
         9RxlepnjYYofKuhX/YpCmnSN5cC94TqsKk4DA3l7Nmfyo4CmQE+8B3LrGGOn3bb4KqBg
         HAfOTAsINLcEcEI3AvYbSp1QgeW9xKaFYn3B/t0B+MPw1xxvkpMeOekHmduaWs46ESMF
         mNm32nuuJZt4T2A8TAGPS4SfSH/3eWUeK2Ff29cMXJuWxtD/OFp6ACMhVktSVDh2Cwnv
         +blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627284; x=1775232084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H1O4UWd5ujd5bC+aoj0HjY6fPG/nO8fBEq0f9ckq1M=;
        b=awEGgB8KgXOj99hGWugm3+JCrIF6HdNdnNz9OQKzKnjxP/0BZtamezrN00SvZrXPaV
         yVRR5dDxHA0qmtss6jjHYcq/9jNMH/zHRq5eT0jFnGDVpdiHSir/vjIwEKysKp3UH5tC
         qnSkOhIAyeXegr7rr7sn/8UrDvO6h6X1YFZKOEqD4IrfQqOOdKhYpbPZK8Y2qm/qYMWp
         1iWwEzIDQnCh5j8xf3ANVh9PUwmodxDveYvzYczq3MJxuziSmhJceAaQoWC7CVXTlFOL
         E4j/tas5O7mDMAu08oUXzt4AO18KTf7+obCrBLB9IHMbW8jRJSXeDOGS7qHoHYPISXaZ
         T7Hw==
X-Gm-Message-State: AOJu0YwwMw02mvOsvyvwOCNlQQKASAf7Kt+Fc/E82ifX0+IKBo+PntnL
	hQKCmUT+7Qhi8mQVWE1vrLMS5RkxJk9x6SocNmBpN7nCoB5R3Lvhu6zYkLPiLakh
X-Gm-Gg: ATEYQzxXmFwyFGvEtiDWIZKQCfYDQtrahYxV2IearNzph9S++wVTO87yHlsGRydpoyU
	Q++Ry2LH/+1lwgoMYcgv5526oFHWGCkQJPZTEyJ7RLHDG1/yPyoa6srS310jRdN6wiRc7ZN+6/g
	C8raT/EtmapK5p82LkgLBTIclvBMYow2mtbTk0U0lWL+c5EPtw5O1UiK5ziYp9XGKQTk2fsMpQI
	IqJMySs+KBG/eplZI9wIFsQkFEhcLLFAtfkSgGWMwp/P7Gm8dfq0i8isXbv4/en02/CuKqLGBwp
	FgmQwAuNrX3zml3y4NLOtiHhMUurVMFsnhHzQ7QNz05L0W27KOysIB0MVBbT3NRYWJJCBniOdau
	Wmc+siA9/6xwuESDAi1orzBCAkGx23UkK9LJhkj3BTa4p4xC8K/vTpyrhsNY+/Udw/kibxwqZDk
	ApttFcbp43cREl8+avRi1yXjmJy4IF0+zy5CNNBmRHS9sqlDkHdOWeXbDACj+gqrpr+3aXyCVCN
	gmVvvL11NDtO52LeQ+1m1bR/tt+Bc8=
X-Received: by 2002:a05:600c:c113:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-48727ec3c36mr39560425e9.18.1774627283944;
        Fri, 27 Mar 2026 09:01:23 -0700 (PDT)
Received: from snakeroot ([109.175.243.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e3e8sm18876425f8f.5.2026.03.27.09.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:01:22 -0700 (PDT)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by DMI ID
Date: Fri, 27 Mar 2026 15:57:36 +0000
Message-ID: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This motherboard uses USB audio instead, causing this driver to complain
about "no codecs found!".
Add it to the denylist to silence the warning.

The first attempt only matched on the PCI device, but this caused issues
for some laptops, so DMI match against the board as well.

Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 sound/hda/controllers/intel.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 2edbcab597c8..8a7bd49e411f 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2085,6 +2085,11 @@ static struct pci_device_id driver_denylist_ideapad_z570[] = {
 	{}
 };
 
+static struct pci_device_id driver_denylist_msi_x870e[] = {
+	{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1462, 0xee59) }, /* MSI X870E Tomahawk WiFi */
+	{}
+};
+
 /* DMI-based denylist, to be used when:
  *  - PCI subsystem IDs are zero, impossible to distinguish from valid sound cards.
  *  - Different modifications of the same laptop use different GPU models.
@@ -2098,6 +2103,14 @@ static const struct dmi_system_id driver_denylist_dmi[] = {
 		},
 		.driver_data = &driver_denylist_ideapad_z570,
 	},
+	{
+		/* PCI device matching alone incorrectly matches some laptops */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MAG X870E TOMAHAWK WIFI (MS-7E59)"),
+		},
+		.driver_data = &driver_denylist_msi_x870e,
+	},
 	{}
 };
 
-- 
2.53.0

