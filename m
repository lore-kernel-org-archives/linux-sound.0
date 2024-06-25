Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF250145A0A
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303161; cv=none; b=YkUdBwmLWvby1tIJYmw+pXrcQYUxM0YegCeX9gh39hearKxtK3xZM5SkXFzYI831/VLssWVg5TDhukdQervRlEipRapiAHff7mlv6gkLbXsDzPzbj/NXUdhwFaYmadc7fyw6JxVg2Mb0yER2tkF9CCjjSJ89MxbFdLyaB2OOezo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303161; c=relaxed/simple;
	bh=vMN1xgC657OaLjjWqE7rpIlU1kguv/JgOY6au3IjRsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSFVncXhZVOl07datXjOjPit/7uewBftpVRuseWIn993lbkfJv7NGNkyq+LNeE9dtjtpp0Jgc7m4dE1/rG7eChCwTnGfThkzp4PfmzVcQW9m6BVK8+cGULh8g/pD1ulljwmdF/vaXGhpod0bH/FH4SCUyLWOUofHHsXYIf0femc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXhkJDKd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXhkJDKd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd80e55efso6253290e87.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719303158; x=1719907958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGXyn7PTqpwG2INs2t/YRAwM96Kf45qCMiBh8HTKBqs=;
        b=WXhkJDKd2EFHEQAVJ63wyILTdVXx6iSUwWVEWEZoeRfBHhREeLxRPGFt/jna4bFWHB
         svR1sZuXVivZiw4wXoq/WdEbJGMuLryRAEbSZhIv4d4JeZvm8a3+WZN22buJ+aE8vFDj
         EUdksnf0COArCbrt5wEheX1rx2XunlzcFEM17JriwB6pFO3db21ZuMDYT92gRzEndMD/
         1KsPfUb0ZDHV/We0iDK2HDXlClwAv9CJrfcJrhVsRsRVFJB7d6QcyGbBeqBSOwdlHVPW
         Q5rHGcKoeJ5iBJDl3ZLQuEk7oYHeJdC/00wjMe2it8YXtiRdD7gt5kOtPK7cadjcYIT3
         82Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303158; x=1719907958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGXyn7PTqpwG2INs2t/YRAwM96Kf45qCMiBh8HTKBqs=;
        b=D2fRMm+AQY1nphmFCJdhyo5yATsUBFCemsR8zuDS70oXuDiFoXnFgdwP6msFVOqn/0
         fOQ/4b1WuHclR4SP4xT0ughKJFVoEVjgUJPp8eOro7K6HXh7NRkQEBnZ23xfkrwKKRbA
         Cg4BpSipa6C093ereQIAHq9UzgOPQ9m5aMLlVlhSnpMBj5sKkfcX0I2nEuu9G4VqlPnb
         +zC0njZTe3Tx2gsRnlEMRTBV0u0VzUeHBwttkQRewV975+uwDNFOSJZQxSPEbpz92AWl
         Q33U63/gazIcsHqR/UnJRIX/lSZFjctdkq9pfRKisO3dASNIobaKlb2u4Xaeg5QJEAfJ
         pldg==
X-Forwarded-Encrypted: i=1; AJvYcCXYeF2qO99scJbMmtOiZebqMeE/JHJ3nMeYA7ZAxlE3/2v1Cahu5AT9pZmkcwe75CwSj7qH4WuW5+TDm/u7+obZolZ5WLXSJI/Tuds=
X-Gm-Message-State: AOJu0YzCnFu8qzneafCMcaNv7K9Vhbbo3uunS7WRvcWhXnGfmXRKZ3Bx
	ubg31zd8qwBzF7WhlZh4SvsyzrfPEVrhJLHnKbJBmlWkcevJmpMK8u85Hg==
X-Google-Smtp-Source: AGHT+IF7U1bkThjiffhrTEU8uHSD6SUmRo36x0/tiwvN9sc9aj94VS2T/qXPd7m7mr2CuB3al5RL2Q==
X-Received: by 2002:ac2:5195:0:b0:52c:e080:6a07 with SMTP id 2adb3069b0e04-52ce1835949mr4884015e87.39.1719303157695;
        Tue, 25 Jun 2024 01:12:37 -0700 (PDT)
Received: from localhost.localdomain ([176.59.215.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdef84181sm811747e87.249.2024.06.25.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:12:37 -0700 (PDT)
From: Aivaz Latypov <reichaivaz@gmail.com>
To: tiwai@suse.com
Cc: Aivaz Latypov <reichaivaz@gmail.com>,
	kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
Date: Tue, 25 Jun 2024 13:12:02 +0500
Message-ID: <20240625081217.1049-1-reichaivaz@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This HP Laptop uses ALC236 codec with COEF 0x07 controlling
the mute LED. Enable existing quirk for this device.

Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f4454ab..cb9b11d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10069,6 +10069,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.45.2

