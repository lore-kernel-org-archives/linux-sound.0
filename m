Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA5359A75
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776433307; cv=none; b=i4BvWVy8/fAkK7GKSvD9GXeu/4sehZL/7aNybKn/4WJvBPU7PLYK92cTMJzOblh+23kSIEnSFWVsRTBoZZxK7lkCHKSxU13+dmW/yhhqGuI2xHXlhbwXp6GNyK/ajKPAbuFXiOrB3qZK2j+Kma2Kgai9G/98UtJ578NkeU7E52k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776433307; c=relaxed/simple;
	bh=vAsdrN1qUjlvacNFFCfWkF4Ca43k/gLpHDrFlW9mC8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rs02E0JOYoGl/VLe4tAXtKL6EfZ4QBFwzeXdg3Fc1LDgR5y2V1cjQWl6Qa3WN5bAi0R+ZL9hiRmmaRwsYNry34/ihOAMGFwgOdwQkbluqr05anr7PFhS6eujyJh2SZrLOF+b6ZLUIIIxBG67i0BbcU+fXkEHq766jJzuQzMLi/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6k6re/M; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6k6re/M"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so1599544eec.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776433305; x=1777038105; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1jlidpPjctYjeym7P6Lu8ZRVlY1+ZMJFmS1v/Na3+c=;
        b=F6k6re/MghHrbLw1lwB8jFsR0lTTaaBERq5DUbjzqqqSYGriMTx4+LLfeM5CivfmOQ
         lD0O3Z98JyK15gWnanswmnWaZ6T3Kf5lBhNFxNjKAncb2LW9b1uaup8iypS2SZEG0Nbt
         GsvHA5v7KFDz9WZvotoKcfd+ady9jMRGShpKJ3qBBpBO740NqMxhiTTWn0VmKmKZn2lk
         QJfuRUTjcUZzB/rJ1TZHfKS3TQqNPZk6l4t+y5QHfLuY/bGinS8z8eti6tIiiE+xCe8l
         v+Vi3tGamyr+19F3eDUNM2sS6egLyCrde1m9KMrwsGNKZi/9aupTmYtmk+fNlF4DHZSE
         TItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776433305; x=1777038105;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1jlidpPjctYjeym7P6Lu8ZRVlY1+ZMJFmS1v/Na3+c=;
        b=bAxBpoLGPKVyDnFkDhtRK7OuMI0Kqx4G29xvOCwmLH5rVFTJ74UEDEqIZ+P/b2oh+d
         RZK9YVZmg8LacSBAqDWk2Do0Q1Nsg01OkNHsilz6j+l4IZ+AuPnE8FCZRtI/cTj9AEyd
         POc7nRiDRjAuhGVRmh2BMkfV1u3CSnYlMMNtsz/jBG8HHp2SL18xoVCI6+LUWjX8OL/l
         vnp5RZaMonRf90lICfCWk/TzsIhqpVt3BSpA5Ac1gwonK5XDptp2TQDzKp8f6tBamY0Q
         djWDvyIxgUKS8pJ6RnX+sp1LZDrsv/3uVsYA19lo71YYtvbV2dDroLKbjlHXtSvz2Bs3
         fX7A==
X-Forwarded-Encrypted: i=1; AFNElJ8rvYKD4VB5sf1Q89Ew0MLXitsjxrCvcW5/mZshXrY/gObRjFiT0qhy4d7t6oFAgk6smKtCpLvvrfIDiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNZ7tAudGCYujV/kFtzr6r0PgUM9GhBans3qPSJ/ZZh+HeiWz
	LGpEV8PAWZCVYNCCi24Wa0imJzxk/9vqia8onA0UZ5rZZQTzRLG/Hj7M
X-Gm-Gg: AeBDieu+2DBX4TW1DWfDnm1EU0mDKSMb71snObBD4BI7FkfCli6wSPcTaNi4VIWhEKq
	bqRmer3E00FxhRWVJ54itAjGOjqqdseJ4ZCnoMfdGtZCfxkt7vhfAn7vlA8BMud3qSenmshGiFv
	qy8no+RTGxzEFDwdRppBqoFEunHNIvccXvTgGVCzHTEOoARrZu7JaDmg4LJYa9tHI99f9eYGDaY
	++vZqqb/twRAoP3zsc3HQ9pU51KdLSu8kgjHSIZSTIDXXkjOuWLD/tmVhBZ+fANfWoGZSXlYerl
	Y2MYKNW1HaggGl5bGDlBcS5nkYkGzOAcRLsdl/E7oIVvyt4HcB0kROkwRGtIYs68/VtEfA0Fvkl
	wOWQuq120KIiWeCAnc5siXbVmn/17zKwepK1FZvptIf+Z7yOUOsFysy5pi+ZtUlY8mmFwgH31WJ
	27vIT4rkaoY/7iPN2Zb3DW2RCTCZITdPP6ZFmjlcLJWpsy1GW3yF4LZueHKZ1+1ME9VQJqr7vXX
	JoSOravG2nlEZU=
X-Received: by 2002:a05:693c:3007:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2e465293e13mr1388314eec.11.1776433304833;
        Fri, 17 Apr 2026 06:41:44 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm2153782eec.3.2026.04.17.06.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:41:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 17 Apr 2026 10:41:33 -0300
Subject: [PATCH] ALSA: caiaq: Fix control_put() result and cache rollback
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-caiaq-control-put-v1-1-c37826e92447@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqEMBAA0atIr21I/ONVxEWMrbZIokkcBsS7T
 xyXb1F1gSfH5KFNLnD0Yc/WRMg0Ab0oMxPyGA2ZyCpRyAq1YnWgtiY4u+F+BizFQI2qRZHLEWK
 3O5r4+392/Wt/Divp8Izgvn/h8AcSdQAAAA==
X-Change-ID: 20260416-caiaq-control-put-50be8a70431d
To: Takashi Iwai <tiwai@suse.com>, Daniel Mack <zonque@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Mack <daniel@caiaq.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=vAsdrN1qUjlvacNFFCfWkF4Ca43k/gLpHDrFlW9mC8M=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmPLCZI2K57tyJ0pZTVlBVlMwRWM0ke0n4rG1df977nn
 mxmzWaXjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIVjOG/9FyyWrM0928Nu9e
 /83D4NGk307Np52nasmZ7lZPrnByMWX4nxOpsvEp96N9Pbt5W+/N+F6wJmjOInud4v/nZU/tkL2
 zhBMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

control_put() always returns 1 and updates cdev->control_state[]
before sending the USB command. It also ignores transport errors
from usb_bulk_msg(), snd_usb_caiaq_send_command(), and
snd_usb_caiaq_send_command_bank().

That breaks the ALSA .put() contract and can leave control_get()
reporting a cached value the device never accepted.

Return 0 for unchanged values, propagate transport failures,
and restore the cached byte when the write fails.

Fixes: 8e3cd08ed8e59 ("[ALSA] caiaq - add control API and more input features")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/caiaq/control.c | 52 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/sound/usb/caiaq/control.c b/sound/usb/caiaq/control.c
index af459c49baf4..4598fb7e8be0 100644
--- a/sound/usb/caiaq/control.c
+++ b/sound/usb/caiaq/control.c
@@ -87,6 +87,7 @@ static int control_put(struct snd_kcontrol *kcontrol,
 	struct snd_usb_caiaqdev *cdev = caiaqdev(chip->card);
 	int pos = kcontrol->private_value;
 	int v = ucontrol->value.integer.value[0];
+	int ret;
 	unsigned char cmd;
 
 	switch (cdev->chip.usb_id) {
@@ -103,6 +104,10 @@ static int control_put(struct snd_kcontrol *kcontrol,
 
 	if (pos & CNT_INTVAL) {
 		int i = pos & ~CNT_INTVAL;
+		unsigned char old = cdev->control_state[i];
+
+		if (old == v)
+			return 0;
 
 		cdev->control_state[i] = v;
 
@@ -113,10 +118,11 @@ static int control_put(struct snd_kcontrol *kcontrol,
 			cdev->ep8_out_buf[0] = i;
 			cdev->ep8_out_buf[1] = v;
 
-			usb_bulk_msg(cdev->chip.dev,
-				     usb_sndbulkpipe(cdev->chip.dev, 8),
-				     cdev->ep8_out_buf, sizeof(cdev->ep8_out_buf),
-				     &actual_len, 200);
+			ret = usb_bulk_msg(cdev->chip.dev,
+					   usb_sndbulkpipe(cdev->chip.dev, 8),
+					   cdev->ep8_out_buf,
+					   sizeof(cdev->ep8_out_buf),
+					   &actual_len, 200);
 		} else if (cdev->chip.usb_id ==
 			USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_MASCHINECONTROLLER)) {
 
@@ -128,21 +134,36 @@ static int control_put(struct snd_kcontrol *kcontrol,
 				offset = MASCHINE_BANK_SIZE;
 			}
 
-			snd_usb_caiaq_send_command_bank(cdev, cmd, bank,
-					cdev->control_state + offset,
-					MASCHINE_BANK_SIZE);
+			ret = snd_usb_caiaq_send_command_bank(cdev, cmd, bank,
+							      cdev->control_state + offset,
+							      MASCHINE_BANK_SIZE);
 		} else {
-			snd_usb_caiaq_send_command(cdev, cmd,
-					cdev->control_state, sizeof(cdev->control_state));
+			ret = snd_usb_caiaq_send_command(cdev, cmd,
+							 cdev->control_state,
+							 sizeof(cdev->control_state));
+		}
+
+		if (ret < 0) {
+			cdev->control_state[i] = old;
+			return ret;
 		}
 	} else {
-		if (v)
-			cdev->control_state[pos / 8] |= 1 << (pos % 8);
-		else
-			cdev->control_state[pos / 8] &= ~(1 << (pos % 8));
+		int idx = pos / 8;
+		unsigned char mask = 1 << (pos % 8);
+		unsigned char old = cdev->control_state[idx];
+		unsigned char val = v ? (old | mask) : (old & ~mask);
 
-		snd_usb_caiaq_send_command(cdev, cmd,
-				cdev->control_state, sizeof(cdev->control_state));
+		if (old == val)
+			return 0;
+
+		cdev->control_state[idx] = val;
+		ret = snd_usb_caiaq_send_command(cdev, cmd,
+						 cdev->control_state,
+						 sizeof(cdev->control_state));
+		if (ret < 0) {
+			cdev->control_state[idx] = old;
+			return ret;
+		}
 	}
 
 	return 1;
@@ -640,4 +661,3 @@ int snd_usb_caiaq_control_init(struct snd_usb_caiaqdev *cdev)
 
 	return ret;
 }
-

---
base-commit: c4643e7c7f45a07f26e01a4a617b859c01dabb3d
change-id: 20260416-caiaq-control-put-50be8a70431d

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

