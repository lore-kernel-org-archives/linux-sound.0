Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591991;
	b=HCp8wUPJmCT7x/6471uax6GtrPRCRqdak/u6RjVCp4k/0yT0xBvrGEmFuM5xm3S2x2hz
	 vZWMeHemuALi2om1qKylm4Wdde1ehBRHWFxtIxhDAHFAzVnsi0qxl5ZCF3kgjBuTF3zbI
	 ORZToHrwqBWzdLBs3Sad/CMAC7PolbjIzn/7M4RL7P8/4BZQvh35ZA45vuMkl7RdIGkm/
	 I4kDhbbXDj0L0oNvWD9sMUPq6EE7x/WNLMZGYpPcv/4VsicSRcHARDnP6Z5VwjgJHLWGE
	 bq261tG5/lxEG4Jm1K7YB3Q5Ti2hDpDp8TycCJ6IjIh9C7lozt3UN7phQ+1nwdh4Uyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LY9PIL87+p647dH24UAXYUoRiDEKyNrn4zGa9K6gDcM=;
	b=Wt3aNPJyY8NQAiuywcWNmsBhKLXyrTJ7/GWV3bRJfKey67UUcN7+F1fAokfLbVrDC23/
	 QE1VhdWQNfEF6mpA2cuwEj4ETTckBcR5UEhHrmw/zGNRs1YVRNenSyFtEx97dzojCmsWO
	 FgrTL4jp5/Go3p/uwrwxuiGzdUpi8C8SOU20NWDhafMA27tcmf73Ceydz6K5wTlgRAFwr
	 zOGSfMXlso9+6zeEtgwaTMlxCAb2KF6cADzkfvHSBdmlMPWIDjOlsv6F4Fpu6VAhLuCA2
	 pM+M5iponmh2w6jLmWt1Mh3FPwdCBhNLf7O3Q/UvHwjof0wq8zUvUrkjWRqTiSlKAPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUHeKRSb;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EEC606A33D
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 07:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EEC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUHeKRSb
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b563e5cbc3so120927c88.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 23:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591990; x=1796196790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LY9PIL87+p647dH24UAXYUoRiDEKyNrn4zGa9K6gDcM=;
        b=rUHeKRSb4wtr1LFUAu6mYK/iO9og9xSu8Cy75l7lBIhBgreIzjgAMHY+KcYT43wwia
         r7RmcjGnhR/cFImCmA0dl0BsCw8QmzUBe4syhXvALpiiupQjmzf2pq/NvB9/OrFwV93x
         XTkicsOjVZxa7vxFTLb2uyrA2uCGyhXb8c7sU3laEQv8H4ulm+EWMzArxtACYq7r8d+q
         VWX0I4knzqhr7IWTbpJ6w0gxcsl8yt6/Q1P/D2jBfaXLIKmbN80gPRRgwrvnOAeJrRb+
         xIeORNkknNy+LRczGEabzZmyxYXvTQv9FE0RxnZu5+dfUyCV4YsJbSOvgjo+HImnhAnV
         +M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591990; x=1796196790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY9PIL87+p647dH24UAXYUoRiDEKyNrn4zGa9K6gDcM=;
        b=f3jZvJ+BylTyi//ur0Jkk99luHcPYmMtaSc6LSBbJ9CxRjW/cm0KoyCAuSXeAPCHZn
         WXauh148Dt5U/6kTLT7nz84ljSC0s1gWQqCFbkhExfuUsHY7ItsFSFNtSeOvjCqc+RMx
         WkDriFAZ2q0K5/0K92VUYSgAd7WqafATapLIutsECVYO+RFXaim0Fvk1OuAYH6S33pCa
         qjHQodUz6uXhY/4Bp7cXtYa8j5CoIdVEqy9gVth6PWcMWmRZl3ddettJVQ9M8p+7SqHN
         9ZN2Dhointmeed8HscoF59QItB64b8KQr6Zp9CCyPtw2tt4rTd4ibUjut3hVpnufo/Qp
         5OjA==
X-Forwarded-Encrypted: i=1; AL+hErHrK8Ay3DJ1rlDaqFweiXi1Ex0VfkWsaHY7cSJ6FLy+u9/BrcdLGMkdle+2slHMmWfXRXtTe7odcHHZ9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xuFF0dviKmibUbgA2cV1MZsIJjAkgKQg55rWoWV7vrEkFdlxo
	StwasFh7onRVn65RfT1SB2086JUfzCKupPIjRHQOC1bclCWOAqU6a07qIrPQ0M67
X-Gm-Gg: AZFdTZfQaceElTepis8tL4btpniSBV3+B4MQ/v8yBMaoKqdOb0mcd/lbipuxiA6IJ+f
	MayLfExRdviFVYy/9UzH1hQFrck/cYp3SP5wEJzGJ405mUH59s9oWGqiKVvtogJCwZ4MFlevV1Y
	y50PpR5LLEp6DXW4prtgejbdkBhA/ohj6i4TjehBrWYsw4hRicK7GJxsx1S4r/V4761AgcuRSIC
	+UHILbyxU3uz5gOWgIE/1LNNE2Y/vv2LPhjePHD7QiLL/Ov2RfanB97DFDgceGZhYf1v/vjIK/H
	m1CcrK3M2hu5Uh5N1aKtuRFP7KbQsYSg+4tHJagJAlOdgEtkTDVA3r0NIimUxAFVOXRtkjMnFHN
	2pv00EXmM7a2b8HqrmOIVQvOWGKEMd6YKc9h+veWvSkVuuVM6U686h2OUIQbbVwsOBiHkMFFWr4
	69sJDrrD3h2vL3e40wEeciVZAIN8WyevumQhpsrIjMFNzoyt7nQwuQsjcXw2OHigOqwEvdX1JBm
	uUMysrMia6ajAmczpGxOqCY2h/xtXpTB/cwPB889GXaQvd0jfVMDxrvrq7K2DUsp0zwJe1Qf8FX
	jvwSUAi0WOWx9SCKT2wfGuoRM09izLVdPjmZ2/fWZMOylmMz/EXA
X-Received: by 2002:a05:7022:b056:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b5568eb4acmr18251286c88.12.1795591989931;
        Tue, 24 Nov 2026 23:33:09 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm45906027c88.5.2026.11.24.23.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:33:09 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: Fix dynamic major number assignment
Date: Wed, 25 Nov 2026 07:30:09 +0000
Message-ID: <20261125073009.3091-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When major is set to 0, register_chrdev() allocates
a major number and returns it.

Store the allocated major number and update snd_major
after successful registration.

This ensures ALSA uses the correct major number for
device registration and unregistration.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/sound.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..eaead62cf814 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -396,7 +396,6 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
 	snd_ecards_limit = cards_limit;
 
 	err = register_chrdev(major, "alsa", &snd_fops);
@@ -405,6 +404,10 @@ static int __init alsa_sound_init(void)
 		return err;
 	}
 
+	if (major == 0)
+		major = err;
+	snd_major = major;
+
 	err = snd_info_init();
 	if (err < 0) {
 		unregister_chrdev(major, "alsa");
-- 
2.55.0

