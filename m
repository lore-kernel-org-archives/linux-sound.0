Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61072F4A15
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774791535; cv=none; b=fkp/jpNRhZ3tqHQva4Q63pyucS3K9qu9HX6P8MddLzReSlUgYksHVPGtJ641zSwK7fd4LEdMJZtVSXzIqXKAZONLpUChN167+cyeLGQcMt1UL/g97qHyC/o7cUzex5L8i58mwUObyerwP3j8wfXDCgbZOkSQ2DEpnu4Ukdu43Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774791535; c=relaxed/simple;
	bh=qWafS+rX9nxvXtbqHDoLW3WMpBkkmgZSJg+hRG7NBZg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jqZLGK8L/9U0E89vgx1mTdRIyUhW6i8FwbBWSL1jqQ5DQ4dpFFUG+sQL3BdiTSdJL+pnXh3SsY7NsJnmKxhnnyO9F7vgjxv1h8Cv+WIAOA5lszw9KRkw7O3FJxKungc5Z9EhOsJkg1zNrbA97j3yfM5n0LSb41/DBygMCvjVScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCRCbxKY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCRCbxKY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso42249605e9.0
        for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774791532; x=1775396332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is6bs1NfbxZsQnjfbKTIDgjeronxzv4F25oTco18Foc=;
        b=qCRCbxKYtplEyoJ/CQJN7Kk2cwxGtfOJYTBjEpeDLUR/o+2aQzGamihefQMBRT4ySb
         2V4AuTfsfiLcFvUEVM70KivFFEzcPj0SqpXm4JwoD+93xR+4AdcB15zXjjRsxokRL7F2
         A2AbADeZUfvS+L4/INM2mcYwClX6wi7sUzKi9aN1t/M8LEjEzllYGk8KVqfQUIE5+nz5
         Et61cb5/1oS1Q9np6GUSw2lAd47ixCN5Ll2xpDY/PmylUKgCEaw5ChDDiDGzbf3H/bj6
         Rug3GDGFyAvVhGcxK0tj1TIEvB9QfV8S3yjsP296TPGLxv0si5yAkBOFBGURLoaGGj5w
         X0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774791532; x=1775396332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is6bs1NfbxZsQnjfbKTIDgjeronxzv4F25oTco18Foc=;
        b=HjkB8pW6+YGyauJfppE3csyG06XdRVECwHoDP29WWdeFmnMupb7NGnTi00Y18dhuTZ
         tjuLfXGyvC1QQig2baDuVaN78l5zRT6K8DVtONdIs+mrAIjYba8By8HCWcCqZFLFiCeD
         kFP4b+Qoe0CURweUiGAHnsVdjqmQgXUo5OXFK3dJpYX071YkUT67nQvTL/DVQkW8Zv9o
         NeXpfCwPrrtKdf5j+Dg86ovZ2iAi7X6184AOKMOy0gQczImeiX9YmzRMBiVFyuvD9ahp
         GolePqRT26IHhzM3RRVfOIIfbVdBPrNx3AIyWnXpWVMMKWnPjn3QOAZ96qc6v6+o8rHU
         Q7Zg==
X-Gm-Message-State: AOJu0YxsTTsgMM2zH1avGN2rbC16zFjvTlrDQJcnBDRP8OvqtdSbzZkf
	z5y2r7WyhEZDOMgYkVKdFi9S8NQijv3O1F1mmXmbSgnRWOAl4UzkEuLo
X-Gm-Gg: ATEYQzwto5H2Se9ZIZb3x+3MQXNb09a/FkkHmMz1AxhRMrGjb1h8bkdPGs/dqOdpSkq
	6tEAUdObt3q0nOxFTnuAuBnHhNm4UHd5X+8g/GJRvm949fDoQ+CAkIl4NIkkofQtiACF2k4tOfd
	bXGe27YGeUalmKO1mj9cyIrv03MkH4sZQn/u5QRGuGwLiJOw0AYwE+UZ/5UdoQv6n1DhJqDpeMy
	179sKJ9ij/kwkO24wPfeDyvwWqjfGpe5AS3X2oA3hL+dyJxRwYBNrkQwaEKLgww4dCF0MuZ1Xl5
	/3jTzyc5bcGWTr5e1YVSqt5S9KdCCclGFt6X7MWjB+BQc1TPF0TOeJnQVSvPblEBr7kuN0e8an/
	gLrkJ+MFwdR7BIybRh3BcPnyG7axVp/ol++NfjiQO/wJ/BC1z70gaJyBhC17XgmBUOMtTXvCRCa
	8ZRsI+eqKKKQMBiPdiT6re3fYDwMu4TKHM0NuY2aBGnBfUOx9zLLZDlXLLl1fgQiKdWlAawQ==
X-Received: by 2002:a05:600c:3f16:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-48727c86862mr156203735e9.0.1774791531900;
        Sun, 29 Mar 2026 06:38:51 -0700 (PDT)
Received: from localhost.localdomain ([176.40.241.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873062ee36sm106872935e9.8.2026.03.29.06.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:38:51 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: zonque@gmail.com,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	andreyknvl@gmail.com,
	Berk Cem Goksel <berkcgoksel@gmail.com>
Subject: [PATCH] ALSA: caiaq: fix stack out-of-bounds read in init_card
Date: Sun, 29 Mar 2026 16:38:25 +0300
Message-Id: <20260329133825.581585-1-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loop creates a whitespace-stripped copy of the card shortname
where `len < sizeof(card->id)` is used for the bounds check. Since
sizeof(card->id) is 16 and the local id buffer is also 16 bytes,
writing 16 non-space characters fills the entire buffer,
overwriting the terminating nullbyte.

When this non-null-terminated string is later passed to
snd_card_set_id() -> copy_valid_id_string(), the function scans
forward with `while (*nid && ...)` and reads past the end of the
stack buffer, reading the contents of the stack.

A USB device with a product name containing many non-ASCII, non-space
characters (e.g. multibyte UTF-8) will reliably trigger this as follows:

  BUG: KASAN: stack-out-of-bounds in copy_valid_id_string
       sound/core/init.c:696 [inline]
  BUG: KASAN: stack-out-of-bounds in snd_card_set_id_no_lock+0x698/0x74c
       sound/core/init.c:718

The off-by-one has been present since commit bafeee5b1f8d ("ALSA:
snd_usb_caiaq: give better shortname") from June 2009 (v2.6.31-rc1),
which first introduced this whitespace-stripping loop. The original
code never accounted for the null terminator when bounding the copy.

Fix this by changing the loop bound to `sizeof(card->id) - 1`,
ensuring at least one byte remains as the null terminator.

Fixes: bafeee5b1f8d ("ALSA: snd_usb_caiaq: give better shortname")
Cc: stable@vger.kernel.org
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Reported-by: Berk Cem Goksel <berkcgoksel@gmail.com>
Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
---
Tested on 6.19.0 and 7.0.0-rc5 with KASAN enabled (arm64, dummy_hcd):

[  302.559633] BUG: KASAN: stack-out-of-bounds in snd_card_set_id_no_lock+0x698/0x74c
[  302.559663] Read of size 1 at addr ffff8000a3ff6b10 by task kworker/1:4/2208
[  302.559701] Hardware name: linux,dummy-virt (DT)
[  302.559709] Workqueue: usb_hub_wq hub_event
[  302.559727] Call trace:
[  302.559751]  dump_stack_lvl+0x138/0x1c8
[  302.559793]  kasan_report+0xc0/0x100
[  302.559833]  __asan_report_load1_noabort+0x20/0x2c
[  302.559853]  snd_card_set_id_no_lock+0x698/0x74c
[  302.559873]  snd_card_set_id+0xa0/0xe4
[  302.559891]  snd_probe+0xc34/0xf04
[  302.559906]  usb_probe_interface+0x2c4/0x998

 sound/usb/caiaq/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index dfd820483..3a71bab8a 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -488,7 +488,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 		memset(id, 0, sizeof(id));

 		for (c = card->shortname, len = 0;
-			*c && len < sizeof(card->id); c++)
+			*c && len < sizeof(card->id) - 1; c++)
 			if (*c != ' ')
 				id[len++] = *c;

--
2.34.1
