Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1C4C6C
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 01:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524941; cv=none; b=IfIhhybtWopC2ItHM1sQXopqgZvDBRrPeYWhNH2YSah4ESWNXynNkyoE49H6YI4fK0FsMnM2Fh87XshF8t4QDFQviWvD0y69d+XkbDHY2/4d94UbWLI861teCecGB6/3mrNUX6ZQBf401B0nh5/kkETieJQmg3J+pMutF5TOBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524941; c=relaxed/simple;
	bh=acwV/AOrcJN6Ib6KUasJlEUAyNEHg+T9w92U/h/Wf9U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=shsVu7nWL5TgGFOTveStxLUeLGogjk67QRk2P4iWVHj1+pMW1uM63q2Rtna8h+WXVH5BO8VdN+/swHDR7yOFr//qwUyfxYdkAqG3XSex+ldnFAvgEjfQna0jmQ1V6suPzh9tocHdjk+tdueZZ0k97JjzRY99qxueZ581cs/GBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEaEn001; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEaEn001"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c0b72dac7so1834541c88.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 18:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524939; x=1776129739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4auT1geKIwNoMBtYbjI4decIviOuD/+AS4GR8kcKlWE=;
        b=aEaEn0013vRar28I1c4LFBZCIBA0703aK1yd4rgEroH5aKV0yr7JBnjEYJUsYZIzBD
         /UCVIdMH9ceEFvDifQ7Z08Sp6f7fihK57G3GIRFx6eGt98QcVPoSYSYy1YY6Zr48VdrD
         +dSSEJzAssYEjM3uR9+RGoZDyE7XdzuaRxVIhNBkW97tWEG+birBcW/z16hqivdc6l4b
         1Itn2eXdGW8Ris1PRBiFawWxWrpaoNdr9f5i0/Ntf6CTcCi06Z081EbDfXEscD+SNQod
         uhwGrv9Gr3N76dxLiAJboR1wUpG7gxDAC3LZtH8yUR9AoS6Ae6dcxJHjl5aSrgXZx0kv
         Be+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524939; x=1776129739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4auT1geKIwNoMBtYbjI4decIviOuD/+AS4GR8kcKlWE=;
        b=cXsNNS5VdQ2haB7bowjRIFdje4zAdJvGpoARXrLUcZsbNShd/ruvd7sqZXwBuMI6KC
         5Q5vC8hMci1rpx2qRFQVRnzXV4xupRiR7nv21d19DgWsOfEZwstCDSRYwHgXszlEQMRL
         FA1mmpfJLxguRYp0TjO5EzMlyheRe0rXcdi4eiN9e3iLYulqB/Zz6yfj7g5CyP30ertM
         XqUZqVNjgE8bY9GdAFGlPhyfjX/J7yDayXqhULTLHjgU0x3EC5qKcEQMT0hHGYYaeoHq
         sV33nD6Temo2Q5RtiSW/RNY4b5ChbZCHvcjHr239rIdgZPN52/93ImlZA2ZHITsZoy8A
         CCBg==
X-Gm-Message-State: AOJu0YxcbqTYt1QbXh5aVOEgUdhq+LVW2SRm0bHwmsFYpqQH7WO5l64C
	bjmshWR+B52SojwosufL+wkblAX4AV27rMwWIf1Yu5DPUlxhE2AJlKsR
X-Gm-Gg: AeBDieuV7qZ9hp7ik61vYDo35kjG9PCDiW1oB40qujVHw9DuDlVDIaKALUBR1yTapDH
	MgTc7He+BTxTYjwB83Ki4Ow2HoBRj6E+z5XOCdSvNRZngabmEqmmVCIF4Hhnpi8yBXi7yr40kx2
	3XVE6yIlAT/zm0flgO3uX6aiiOPMs1X8AB8Xtz9M+umQOVDOBlIYODCne7YfJOSaop+3LvJ+4Tp
	ba2tXinqnwNcjfZFO7sCoW58/wfwi5OOaQcrQ9CJNdUOo6+U1dGBLLOK52xtnMVSWsf0mPn6IKx
	MBnCffaqsNP8oiMuqi/1v9oFx5ypHZXV4bX4Sbn37WhOje6eCrHHlCJYnzBPymTvIlwOAJahICb
	AMUrh/jR9NgL0sxDj9XcNnU5LGnbzsmNkFFWLBQwcGz/i95v2V4pbvwwibSP9ExEFjqjO51zRSj
	E6CqBuBM1INP6UUqZxvuSDc4YkHQYvDJ/bRTwRRo36pdH6cU42IwapmEyIn+2VivaxaP/bekAzC
	3++
X-Received: by 2002:a05:7022:6b86:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-12bfb791b04mr6107879c88.34.1775524939331;
        Mon, 06 Apr 2026 18:22:19 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f542sm13098567c88.14.2026.04.06.18.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 18:22:18 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: add suspend/resume support for InterWave ISA
 cards
Date: Mon, 06 Apr 2026 22:22:06 -0300
Message-Id: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2YBg3YqxQX0Yw60qaSsVYQ7
 27U5Vv8v4FyFFZ4ZhtEXkTlGxIeeQbt4ELPKD4ZDBlLBVl0b3UoYeb4dwvj9EFLlSkr3/iODKR
 uitzJej1f9W39NSO38zmCfT8Aza/4cHUAAAA=
X-Change-ID: 20260406-alsa-interwave-pm-609259dbdf02
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=acwV/AOrcJN6Ib6KUasJlEUAyNEHg+T9w92U/h/Wf9U=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXYpwn6u2znLOo5fXzFT6870q7Ls+50HWD4b6DlMufC
 zVLjggHd5SyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEFksy/GYNy5e4/YE1hs/t
 6vpmo5mqhu+zG+b/9Z6+ykGB4f7L6YcYGfbobS85rOBxf/E65c+HJ568K1wyPYX1hVtyafXyaq1
 5JbwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This 2-patch series wires up suspend and resume support for the
InterWave ISA drivers and their PnP front-end around the shared
GUS PM helpers.

The first patch adds a small TEA6330T helper so the InterWave STB
variant can restore its cached external mixer state after resume.

The second patch adds ISA and PnP PM callbacks to snd-interwave and
restores the remaining InterWave-specific state that the generic GUS
resume path does not cover, including the GF1 board registers and the
detected memory layout.

The resume path intentionally does not rerun probe-time DRAM/ROM
detection. As with the shared GUS PM support, this does not guarantee
preservation of sample RAM contents across suspend.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: tea6330t: add mixer state restore helper
      ALSA: interwave: add ISA and PnP suspend and resume callbacks

 include/sound/tea6330t.h  |   1 +
 sound/i2c/tea6330t.c      |  33 +++++++++
 sound/isa/gus/interwave.c | 178 +++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 185 insertions(+), 27 deletions(-)
---
base-commit: 4e5929ff6b2f373527fdfb0727a3dd7a31d83a9f
change-id: 20260406-alsa-interwave-pm-609259dbdf02

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

