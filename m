Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5B3E6DF2
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173106; cv=none; b=t82zorwO1oKOlUYJazIQ6GHcZefZs9EoNqnoGyQ1O26bYxceuN6uI1F6BMCPzZJM4jl5cbcrIvMQaxm+NsuG2nJetkE0bAmsaUsINyx8tOPpfObgQits+flqYc3GEMBpE/hyk8ACiaTx6HDE0NSJ2DxqnXRBnrds3jey3afIA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173106; c=relaxed/simple;
	bh=RWMWWhBREYWNutiyCoxu5SfAs+bK2NNa7S06nm39YoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9zJiR1jm23cVtwIScvcsgZBXUodvYe9jMU4IjxuOjHTwSct58BD68PIcqqdItPSZtO2qSi+rgd44sjBQ2TxinUEgekUVJxiMQ28SIn/zklIAfJL66LJk52rXIOQq6AkcGtI8t77V7pLGAqXkghi91TA/ftfQVgJRFObkZAbKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7i/1LEs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7i/1LEs"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d9b4f93f0so1004863a91.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776173105; x=1776777905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opcylBd2GGN1SyilCKpA4V3rg0BLKqf3938q77JOvpk=;
        b=I7i/1LEsXQRh8w5EskKQtbUKMblrLhFkHtWNI8cNF5hbtFbFMJUbJkjwGvnW8LR+wI
         P1T8iIVU4Tq1tbuA2A11hPgUDbGM6I1YDgWpCq5rVazjkGlgg8/lyxl8Ca8sjw2Ci2+0
         hbTro6RrpmJXu0Fl4E7GRGhUqA57tPe/dKKirJHIFo18m3MsE6z/tsIKp3qNkfbRx7Pw
         jcU6Wet5FKnarbf0x435bbBcQ3t1eqRkEugXEbbEr74rxEPphefyqmDwd9VnV1SDdSr3
         oz2yfTTAujhWtwaz8A+Rs9rALIx1k8nR/VAsjodFc5y14vi9opjShTImOXoX8MzdNpaF
         Kd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173105; x=1776777905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opcylBd2GGN1SyilCKpA4V3rg0BLKqf3938q77JOvpk=;
        b=NIvlDlqQ5v5MSmV9zUmaWeBNYsEOhtcTPliyGpvC3JSTXBDvakDop3zVtzubfazaRr
         fA6BYVpf8VUZkYXpM0iH6eEmAklHpviD71nBHxkR/4pYFhDY/gWqVwhFrSMgpFKXIET7
         5JrZh0L1ONKZDH5mI159y4yerw+SJhwa8Ls9YPbzOQJK7K284sXlDWLZe3AN9rhUV2uW
         sevEzafRlKdlIMUzPKNRwMElOQlJsoQAI7oeC+M0QKXL80NdqeWIrDwlaMOzFCAHv2C5
         GeC4gxYx1qvghRwt8CWb92CaGhKdTrOme191mastNM1IYcYWqajx0apJ1HDfZqG+yxGl
         CYPQ==
X-Gm-Message-State: AOJu0YwRG5ILbPT24i5H3qcGTx+ncb6z4Blorijcm5ThpFD+XQm1nNZE
	CNUmQdaugH5xCLGImpdFBy8G1SDPoW0DXn4UlFvxT32wDGTDImZkRGgX
X-Gm-Gg: AeBDievorTRQ70c0D+p4ZwEcvdpNv6cxckUME5m/dTOlzHRLUMnhUKTeLz2WEQcWojK
	rJ2z6F1XcXlryzi3+jVfypO52OUl5gViFJD/+Xz7pjHYMAcNhypguM6o6sXs/qRSJpvPjgrAewm
	Wc66fUxOurcl74jwurMzgfU8Vfih0Qmly9SYXLmoMEfF9cY779U4NoEd2kGWXfqX0E/eerLPVYi
	QrSGGzAAdyj1af4MHlgbQRVVTc021mcRmuQVD0qT/+fRtEovkTm4xzY+Gjkqv0+AhqZwQ6wZxnt
	G8mATKIXKShCWSZOPWOh+A1yoh4a1Q5kRS79Cn5KVU2Lbh9prSNOS5v3e1/79U0FJnnxHOBoJ2T
	tpKmqlzOxW3EsR3t1DH1P3Zf54HTkjMmrFDxkcgE9y9QDcmFAb4fJu7cPJLazcro2gPJGcrRoe1
	j/9fk7pZST2ib/eMF7mRgaL9D7c7xiSZIKS1gMql7t4U3n8nl3uo1nqz5mhJ63
X-Received: by 2002:a17:90b:35cf:b0:35e:576c:7c1e with SMTP id 98e67ed59e1d1-35e576c7d9cmr6196495a91.4.1776173104648;
        Tue, 14 Apr 2026 06:25:04 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC ([43.224.245.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm12526545a12.26.2026.04.14.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:25:02 -0700 (PDT)
From: Ziqing Chen <chzq96@gmail.com>
X-Google-Original-From: Ziqing Chen <chenziqing@xiaomi.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziqing Chen <chenziqing@xiaomi.com>
Subject: [PATCH v2] ALSA: control: Validate buf_len before strnlen() in snd_ctl_elem_init_enum_names()
Date: Tue, 14 Apr 2026 21:24:37 +0800
Message-ID: <20260414132437.261304-1-chenziqing@xiaomi.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_ctl_elem_init_enum_names() advances pointer p through the names
buffer while decrementing buf_len. If buf_len reaches zero but items
remain, the next iteration calls strnlen(p, 0).

While strnlen(p, 0) returns 0 and would hit the existing name_len == 0
error path, CONFIG_FORTIFY_SOURCE's fortified strnlen() first checks
maxlen against __builtin_dynamic_object_size(). When Clang loses track
of p's object size inside the loop, this triggers a BRK exception panic
before the return value is examined.

Add a buf_len == 0 guard at the loop entry to prevent calling fortified
strnlen() on an exhausted buffer.

Found by kernel fuzz testing through Xiaomi Smartphone.

Fixes: 8d448162bda5 ("ALSA: control: add support for ENUMERATED user space controls")
Cc: stable@vger.kernel.org
Signed-off-by: Ziqing Chen <chenziqing@xiaomi.com>
---
 sound/core/control.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control.c b/sound/core/control.c
index 0ddade871b52..6ceb5f977fcd 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1574,6 +1574,10 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 	/* check that there are enough valid names */
 	p = names;
 	for (i = 0; i < ue->info.value.enumerated.items; ++i) {
+		if (buf_len == 0) {
+			kvfree(names);
+			return -EINVAL;
+		}
 		name_len = strnlen(p, buf_len);
 		if (name_len == 0 || name_len >= 64 || name_len == buf_len) {
 			kvfree(names);
--
2.52.0

