Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0E30E0C6
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764600456; cv=none; b=WQ2sl9cEgLnd2GRWFcwse3UePAykG7PQx8RUKutQaORqtjlrkYvoBUPw/B8GTHkKSganL/aDNrnHF3eTmVB/RvZbwf12tzLfYmCO16P6tFuBkaUhkGYLBlNYp17UPNrGv9SQIizfc+wNgkUq1a4NLq67voUN9bDsZMbLAucPCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764600456; c=relaxed/simple;
	bh=yTTSe1YMtL72iiBPZal2NSGLSh2Y8oJh+eMznOY7VLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mC0e5K/b1KvG2GBc0fvFoBbwS2JR3SUBauNmeCf/zOPREu2uPPR/HmWzd/tlMCgktkT/1Z/f51Kqxvz2oThiR6U1Syi91zun8nPkz4N1RTgOiXT46Q4EX2NchSyB/M6uDwivs4VzfTBswgrsM3YhzxYv9xjiAsYhRxxttFvKX4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eitC1Vt2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eitC1Vt2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aad4823079so3703924b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 06:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764600454; x=1765205254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7yd2OeHHeLWQN2H4a1r9umZDYSp5nZhea90uKoZ38M=;
        b=eitC1Vt2cyACfEqLqq8QmfaK86U24UmSGV94YtdpWCyRAgz6wVgrk2+2OpCpaEPIV9
         SDVBVQ2dZj837FXRRzaLXxFuv4RAwYr3Icl4XwcTz3dmi4im/1UkBNY+AqumNAWqa6u/
         5zAgsHeApTqN5DbewDJLXZayqGSnVpJsYBJ1NVohHf8C8I0iviNF62sQGgSVytG6mpkZ
         9B0pC2wNhEezCzj9eX09DlWqY/4GIw7uLYGtun8qRzw0blzvMvbOEdzfl2ptB/cfSSok
         HKLLIQOJFMrZyW8vRpyTfoL47FqNuYCZ2EKhXTN1vijZ0zaAtLDhCr32nopKqAVOUzwf
         xn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764600454; x=1765205254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7yd2OeHHeLWQN2H4a1r9umZDYSp5nZhea90uKoZ38M=;
        b=M3t9NkpSxSfaODQRR6WnpKggSOfC7nvQ75knF67fqCFp8DOAOtAO6E/XF3XP1FDVth
         +rXNH3bfCu2XVg0Bu1cvp53DwWwwBX9gXKMp8j95hcq0CUB+eR7wXtzvmOAWFtXdeGkB
         mkDCLjTMXKGq+mJfHvFx4dMLLDF0Uk31aSYavXXjXXlsb41Q32U7Ow7Qnkogu7OY1Gr5
         RJCl8CgZbsa3Bes7AbzQRb6r/DDSKvNGvBavGUIobWjcPdb2artpOjlvQW0h6ggPAB75
         +YBxIXbS0O07cib2iNg4BTJnUUlhFVovT31XLg8flj7KmC+wDMtk/ONQbKGbLUxACXGG
         lGJA==
X-Forwarded-Encrypted: i=1; AJvYcCUY+CJKE7PlqBwL/k6s3WbgJz31eXISHHtS7LIP0o3mIiiDUVOwfIDU3LsQVyOx56JK/b6sALyzBSpXag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkSH7aaBgoBcXoKhH3OZC1z6zE2DZx9fm3ySGh0sz7wmt9Eok
	D8j9NuIhxQH1c4WLkoR8s6b22RIYoWUoI6IB9xLzJj0B1UJIjSD25l4k
X-Gm-Gg: ASbGnctI2ZY2ZjycS7LbHn2IvrTwM5fKQRf9g38vr1TGuTYLwHATpqDqWj4vy0MPhly
	Ll7vQFDd3Pv76YinitI0ivYfmMQkaEZo+kwHTvlUS264LJ9l1z2y8vORUGyMysOkwA6JE51L2Du
	NZPrhYvRC/1Lj4WZ9AETtIQhGU23aAxs/unvmaxWPXwAJkOMb/G6YskFs6PLmNwh5Lxk3/l33Q+
	mq5/kxXTof4VFZVQYfNFbI9JC6g1osckARXypKMp3WsJfmHbEN92frb7JrnK6dhdWhlRqOf91Tn
	nwg3ysJHn++ErwFDBe3M4Pe+NmkObOUmTww4QHm+zvFwGWZDXitdISv4bEU694eS/6L986x2lmM
	N9wOI91S6ovpgFYSu4xwFYp+ASe/mr5ZUrVk503wPM+dFlGktNcm3hwLCjFb7QEnRV1sgQEojHi
	a02SH1M6b04jsR2Hk=
X-Google-Smtp-Source: AGHT+IFqaV+l+uwgbggJAl8KJZHVLFG+Baa2w5GQXCmzL7M73IUsEUZDXJ8mp5EylgbsmEKzWaS9Tw==
X-Received: by 2002:a05:6a20:7345:b0:35e:9b66:9376 with SMTP id adf61e73a8af0-36150f3569bmr40065976637.60.1764600454318;
        Mon, 01 Dec 2025 06:47:34 -0800 (PST)
Received: from gmail.com ([152.57.41.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516fb4a1sm13836123b3a.19.2025.12.01.06.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:47:33 -0800 (PST)
From: hariconscious@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ALSA: rawmidi: Fix inconsistent indenting warning reported by smatch
Date: Mon,  1 Dec 2025 20:16:21 +0530
Message-ID: <20251201144620.18942-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Fix smatch reported inconsistent indenting warning in rawmidi.
sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
indenting.
No functional changes were introduced.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch fixes the below smatch reported warning
sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
indenting.
Re-ran the smatch to confirm warning is cleared and no functional
changes were introduced.

Thank you.

 sound/core/rawmidi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 20d36a346cca..5d90341cc18f 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -2106,25 +2106,25 @@ EXPORT_SYMBOL(snd_rawmidi_set_ops);
 
 static int __init alsa_rawmidi_init(void)
 {
-
 	snd_ctl_register_ioctl(snd_rawmidi_control_ioctl);
 	snd_ctl_register_ioctl_compat(snd_rawmidi_control_ioctl);
 #ifdef CONFIG_SND_OSSEMUL
-	{ int i;
-	/* check device map table */
-	for (i = 0; i < SNDRV_CARDS; i++) {
-		if (midi_map[i] < 0 || midi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
-			pr_err("ALSA: rawmidi: invalid midi_map[%d] = %d\n",
-			       i, midi_map[i]);
-			midi_map[i] = 0;
-		}
-		if (amidi_map[i] < 0 || amidi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
-			pr_err("ALSA: rawmidi: invalid amidi_map[%d] = %d\n",
-			       i, amidi_map[i]);
-			amidi_map[i] = 1;
+	{
+		int i;
+		/* check device map table */
+		for (i = 0; i < SNDRV_CARDS; i++) {
+			if (midi_map[i] < 0 || midi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
+				pr_err("ALSA: rawmidi: invalid midi_map[%d] = %d\n",
+					i, midi_map[i]);
+				midi_map[i] = 0;
+			}
+			if (amidi_map[i] < 0 || amidi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
+				pr_err("ALSA: rawmidi: invalid amidi_map[%d] = %d\n",
+					i, amidi_map[i]);
+				amidi_map[i] = 1;
+			}
 		}
 	}
-	}
 #endif /* CONFIG_SND_OSSEMUL */
 	return 0;
 }

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.43.0

