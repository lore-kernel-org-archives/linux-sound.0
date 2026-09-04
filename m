Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5834457BA
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515520; cv=none; b=a4iHS3p0mNCn4Ahral3QuCM3IGWkzfHLy3H6b16T7F2kqtpAKPstgyxKRYgPlLUSGWkHwDMY8BcqWjdG6X/Z/Ulk5/fY5zoFivmdIV4q7gf68PgREfRgGZrpqcx6rPAreYKiJbaGVh+vGq2mo0KC39CMG+mxuzwfqnc9Jox2ONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515520; c=relaxed/simple;
	bh=y/jj7dj1XTBqq0OOBBoLIE+SYQ1wVIKfO7ZtEWa5s0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elhVKFNezXckDJu7DkLD3sGpe9h7GCkZeQl4ZUowbMkm6YPNZqMMVhAQoG3Y5cpdAksNj0RHJ5sgeZEpWdJGqp+RBlPON7ClVX+BBwMuiRtF84SdZYJ4tTgeQxwIHsXosFy1TTauNorIHpeH0kX6wRKkSeAejqGtaAtQ5viUZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StGNaEYc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StGNaEYc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so9348685e9.2
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788515517; x=1789120317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDFpOOPjaPNPNg1hiGAqAAUm4IOc8XWZHx93rqnlN4k=;
        b=StGNaEYcdFYFcf+Cqihh2jA+KIpwjG5NPqqaxwHQnrMetjqPGMJzkzzlmUkqre66JA
         EI+4mpxRTR/TLV4X8KrkV2vToJn8l376r8NWoctnXlzMdPkR+JDn7GAus/pJgOx0uv9c
         N+rIB+uAU/ZApTSEMhysQ50zwglRI6zCiQVwI/ygD9G6KSlpIG3DUOaMkCNUUTaTIG8R
         1ByOoabqyE0C3+ga8Fjc8rOdupBK/2GSyUjHxnwph3NS1QII/owBXMfqvbxuCJnZCH8C
         NfTl4s52iAIAC8kHh1pS4NLCkd0JcSdLanpGrcEW51BEal5hsHN9HL5mdOy7ZMn4gkCb
         G8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515517; x=1789120317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDFpOOPjaPNPNg1hiGAqAAUm4IOc8XWZHx93rqnlN4k=;
        b=iAsFIRg5chtCPCdcpeg9zQVFwXL+7D2Aik8sSHhEkHquxchT5r4fxRDtKKyaLnniIj
         5t6e5czNp9Ktjy46uezp2m4WdQEoVQg3cuOInNg+pqhD9to5dua4Aei2tp9Ak4Jr3t0x
         dnWklEZambtF2ukKZsYPTVD5rUl2mB+Cy0Mj6yQY7DNJgTMMia9HF8m+BEUvYvQqWXDC
         18bCX7lIhuWxsK1kcpJtGF7nwPSrgPP4ZtRjBBhlpUA+lZv3DlIM5J01p4GfXpW1pFNW
         jfWY5Sdykq3mRH6MYIcRsirrG0DM4gh2AW13LVKdYfbAteAfYv6xmpPFlH6jTKLFvVZW
         4r+g==
X-Gm-Message-State: AFuF++kh3MRS1mHwAGzlQ9PR8wZkwbPLoBBJzeq+c3jqmD7ASbpWDQMY
	zMQp9fRKjmsmYFL/NeR4zSwfAApnIP6eyuWqf0jzDqUCSSjqnjOkBrM=
X-Gm-Gg: AYBFou0b1k43wqoPdTpoq+p4h5ZZ8dFDtOzkH9uC9HA/FUdh7F9x7538maQ0bdV1E0h
	JY1UW2k0rj9hgYT2D3dchVWk7VsU0kh4TMYBMGbJJF2QEefoEVUyOe+JHXieLCuknsGqZ4l8PVs
	oX6k+ihvTdmrNNdcQTMwcTjBUbS9VWjEa5PD/65E9RNQ4TMxLXzOIetWbAYbeAzL2aO6+PcTGpQ
	Y590Kt7xesiyxdPbLmGTWR6+52ehXB2dRDbqyTzj1h6n68i+eEUaPL9+Abg5BC7bIE67lRuNxcQ
	Bnp4ml9Hlnk1WY3WmsxRIc6pXkOiY9vk0dtoiriqvf5ozn6ojOUBM2OVnB6gMb99KresM7dSVf5
	H+NKCnxof4dSRhgqIduTRSD52U/I7lAik5WgMeCwTzUNk5wiX2uCLqMNpl+XS3o4fIN1RMjC2S0
	6v1HLD3ZQK28xVFm5Lb5iw51Un9t9XwGeOBEPUXBAm
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr15440495e9.33.1788515516566;
        Fri, 04 Sep 2026 02:51:56 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm170369845e9.1.2026.09.04.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:51:55 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usbusx2y: fix in04_last array size causing slab OOB read
Date: Fri,  4 Sep 2026 09:51:54 +0000
Message-ID: <20260904095154.3905899-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The in04_last array in struct usx2ydev is declared as char[24], but
in04_buf (the source for memcpy) is allocated with kmalloc(21).  In
i_usx2y_in04_int(), when ctl_snapshot_last == -2 (initialization path):

    memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof(usx2y->in04_last));

This copies 24 bytes from a 21-byte slab allocation, reading 3 bytes
past the end of the kmalloc-32 object.

The comparison loop already uses the correct bound of 21:

    for (i = 0; i < 21; i++) {

Fix by reducing the in04_last array to 21 bytes, matching the actual
USB interrupt transfer size and the in04_buf allocation.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/usb/usx2y/usbusx2y.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 6a76d04bf1c7d..266a3483ab81c 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -55,7 +55,7 @@ struct usx2ydev {
 	int			stride;
 	struct urb		*in04_urb;
 	void			*in04_buf;
-	char			in04_last[24];
+	char			in04_last[21];
 	unsigned int		in04_int_calls;
 	struct snd_usx2y_urb_seq	*us04;
 	wait_queue_head_t	in04_wait_queue;
-- 
2.47.3

