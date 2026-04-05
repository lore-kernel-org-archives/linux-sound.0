Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72228472
	for <linux-sound@vger.kernel.org>; Sun,  5 Apr 2026 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775428297; cv=none; b=GWsVSre8WAT0iaGJTF9epT6BNJVdbWoALBvBXqDRQC1C+8Ufk/oo50svfWYXhbA/V9Sq04VbPe/ClhuTW2rXmWJYyVidqN5FZA6XmzZ+mBPdLaLf/7D1NktAafJKMYManMGlWGzKx6dhpSwRO5h2iakXA15JevKKVZYn7BXGgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775428297; c=relaxed/simple;
	bh=6+2dTz8S7bV3HPpwWWVakuuG6+nkLshIUUvnWYZXBnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnDLS9RJd88lX/xF7mbONO5jDGudYZud9qE+oINOU2IVcffDnf1TMVfBSqYfX8jqUfpyBZ365Ge8c9k7837i4iom3SyWDxbu2XhLxz8DKJZFq6aUi0xlWN1GjmaZDuze6XVvA06RTdRqJiHl//6KbgfRlLSGEGNenbWn4JcANt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7Ylk5VS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7Ylk5VS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so34321675e9.1
        for <linux-sound@vger.kernel.org>; Sun, 05 Apr 2026 15:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775428294; x=1776033094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJzYFaqYRRvkUKik2UGeizBN3MsNmf77Kkxzx2gV+M4=;
        b=q7Ylk5VSFGc/NYtCmSVPqEcTLZZT0ERuSrXLHncocW0IQXgs/NbI/yuSJy/0qzd8lb
         CcaKrMgjaVCJb08SHp8Vm2apnc290XB/JV3Wxnu/65bMStIE12DsYEAqBmFxEtNSN9J1
         NJgcT9SALYeizEDtITd39kAhbJF1t0JGQy/Vl4T1ob3v5PN+A+6CY6Tgs9bg+vIjtJEZ
         l4kPlziuGZtwMSO5PNeanoPIOH6Jtao3TMPjbfpMa0QNmb88lqAqGNeNfy49bgbKeC70
         MGfsZ/x2duBOcphRinwMGCWlk6stpx15jausjbojpMdqW8kuUd3OlX31PzihbehL0uVN
         ezYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775428294; x=1776033094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJzYFaqYRRvkUKik2UGeizBN3MsNmf77Kkxzx2gV+M4=;
        b=HewGackpTJABLMHy/QaepVM5M9zXkjvzVf+ssI0CbTuql5B6opfI24f6lSePEfe0P2
         lN8/vUoG2HwtqH8fLKUb1xgxDGwCWCMWS8xVUU34hVnc0MDP6zQG9Ks4AW8pr7OiEN7c
         qSBpEwVvhcQMbRJ4Adh+7bqWnw4XUNByyhghcUayXHJXdDiuyZrA2y6fdHZNNXqS/nxi
         B5YJhJIzZzfkfoIKxGRUw0wgsBmeMgk3GuLidZX2yAHLtDapkoLeQLrrN5rO5rzqXW1W
         iWLNZTT0LWW99QRDS8320HMw5Y4G1XIBWrUl+T4dHqmBkAnpsNDovbljk/cHw2l/FDxg
         WL7w==
X-Gm-Message-State: AOJu0YyroWDG/QlSNDK49MVkZ/Lj2x91AhvkaQescHa3vsNP7jJ9BULg
	T+m4xKv6n2eaJ8OxnUJ8ta7/mWXIsx8H6Qg1NcY2igoVJ7R+GgexEKH5
X-Gm-Gg: AeBDieuy3vQ4O6QZPLYPzWujS1V+SR+9RJc9bm9h9mqQ8+zBl47mA/dWu334AGT6Jyt
	v5qa9RNb7fw4+mzfoWecXvHTFs2T8GmGn/JrXOJjTig4pSaNyS4X8Er4DrQuvUJmyF92ix/0zUa
	E6MS1l/byTIIl3pLPSb6hngJtbBeJVx75EI+92b/CEnK54qyvU6mUlRWcORBjg3LDTcBqNF7rWE
	XGKcZWvIcGLn0fjLqPp61u8IQ7INONlik/P5TyjdBHKHVs9w5NjKraTgrytS3np/TcWRYzggKP2
	Bm9x4O+jCtxStAUEy8hHo0heqX/3dGwHZ/y6XvL5C7UWc9egz8wQKMnh2Oem74w2bynSmowHmG9
	BFGg76XBurXme+npGtwXOfQ9dmHebfkzKqiBhquXGTdt5nhKeBqpCJV0Yt+Y8Pg+qVgGcrwVYM7
	90FvBi7P0z7MDNS7CyzCN1lmuoBYhSSJlcLhIFC9lnR5ON4jyYjZtkxfKhLT7XBXAr
X-Received: by 2002:a05:600c:a30a:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4889949bd2dmr111612955e9.11.1775428293947;
        Sun, 05 Apr 2026 15:31:33 -0700 (PDT)
Received: from fedora ([2a02:586:e909:37df:ce84:3a77:87cf:ccf4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e4921dsm74368205e9.14.2026.04.05.15.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 15:31:33 -0700 (PDT)
From: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
To: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
Subject: [PATCH] ALSA: scarlett2: Add missing sentinel initializer field
Date: Mon,  6 Apr 2026 01:25:48 +0300
Message-ID: <20260405222548.8903-1-npetrakopoulos2003@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A "-Wmissing-field-initializers" warning was emitted when compiling the
module using the W=2 option. There is a sentinel initializer field
missing in the end of scarlett2_devices[]. Tested using a
Scarlett Solo 4th gen.

Signed-off-by: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
---
 sound/usb/mixer_scarlett2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index fd1fb668929a..8eaa96222759 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2262,7 +2262,7 @@ static const struct scarlett2_device_entry scarlett2_devices[] = {
 	{ USB_ID(0x1235, 0x820c), &clarett_8pre_info, "Clarett+" },
 
 	/* End of list */
-	{ 0, NULL },
+	{ 0, NULL, NULL },
 };
 
 /* get the starting port index number for a given port type/direction */
-- 
2.53.0

