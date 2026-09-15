Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC44A499E
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461928; cv=none; b=hLdwVqm1wj+3Yl7JpUaFM4xsAI68Bxe0zx+MMGxsrunoqA0xzJX7d8U/hW3vSgBrNiHRV9JaQRI/WnbNK3D66AJTLFvR6N57NiAjF0qZicIrXWcHHZa6wB10WpCieaUkfxrSYcENrZmhBawuuHHonixeq0o5xaoA3aKUVCYDOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461928; c=relaxed/simple;
	bh=Q3J41mm+ZqUAksOkXZqLDwbuyNuywMKNfO1hxOd5KMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E851jDmkldcfPSVsVysrycoqxYKVUXjjFbJn/f/HUYaTmNa2fK6TRkfW4Vf+du2ua8zi8gE/FgYHZDouyOR4ovet1lPL0fDKgf18154azDswjO3jicvgXJxTlTms+zty3PDXddxf+tE6XS3tcF8LAH6D/xX4EaeXNTr2kJ8DFm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+vHZ0O7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+vHZ0O7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so3144372a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461926; x=1790066726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPulxtgNfQy4/3bCHGD/xuJACMbrjO8dHwcnzYT6xEk=;
        b=Y+vHZ0O7Rsm2Ly9QIZTug7lmcaiYkFYDcNJK+6+mUHiEslqQze8N7cSTwzwSS4XDW7
         /Wzpf30wiZD+0KI5om+tEh9cnsuel7BUSsaSKWRn5CzQnfztHm9BbaAtb+WIezJY6ous
         QacUHjibvY6KqCvLFntogX1MdxwYgctH0mVFj9It455nImCFHQvKtwG5XHUOTtls9gOS
         EHIbaMjxG7tZE0PfhLbbMIE33LDEtbGMp8wxSIEN0X7ocgRxrUMkSN18WQQaPXc0sEK7
         oCAKD6fBARz8fAxlGYFqzg2ChzmeGqWIDlAp5+E6H7/5766D44e3TifGc/X78Udbc8RS
         JrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461926; x=1790066726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPulxtgNfQy4/3bCHGD/xuJACMbrjO8dHwcnzYT6xEk=;
        b=dXIyWfxmiw8kPXuMdMY4yvEFX6qfer0/YPeN+/4pYfLFyEdn4oZgnIDRtoS6pI8YeF
         0kuOzyXSy8UteFeSmNEVJy5yiJabl3tYkBV15YR+jLJQKDKkL9+pWfsc3PdfSsu3PXSl
         BnwcmByb2mWu01I8sxDwUGvKfs1ohFanWzUAZ+cMtJY876cRdSt7dLoCZhafRDK/D3pL
         kxGqvngNOLSaNuXWjPnen79/ZUiWIWjB+L0IE8TlZnnRzV4H4cdkXzpZL3/w+lXNAzwL
         MXPfn3YXs5ryH/1PWP4SgMvQGA+MHuOPkCRY0YwAVNArdddJE0GNzIztAIVRZs74GrFW
         lmRw==
X-Gm-Message-State: AFuF++k7G1RChvd2eeoy/dh+TfY5zkue6PKSrlFJ4gLyZY91cb0Jbfa7
	RYkemJC5vx4SA8WdPhOqM0lLiw1hROM5Q9AtOg3yEoYVRtAb/CqhVsy1
X-Gm-Gg: AYBFou3CSlDgewuxSNqhX1pJZEl6fUhZRzEcHT5bPxwygPZsryPGVOoe2BWXXSNFf03
	uN6Lq//7BKxh+YijKr2z9HNEKbbbOXHTFFqJbPh2KJ5h2fdkO6aksU93DcIXyOQQGxG/1JA5cXh
	YULep+Dd2K2fUkrlrQSUL/i1bRaH37WBotSGAGY1YnhvemFge6/4WIvm+Axrtr8TwzU6xRSRKjR
	kRVsNXOgk9rbslSAq86lOrLZ9pM9TPH7pU6bNeLTswuNv7DlSGdjwrJYMCb5mWJJxw8U3/ILu0l
	igH9thIF8Yot1WrIJxLi5jT7hJCS8ejGrgjjEW4JXsBlc1m6JIW90iOqfEFv2ma1kn61PkQ1bBu
	WJ47zxZgFSfBqo1ykhk8UWK4Vwmb3HsBeOwArCgUVJcDj3hKkgEXcvRdwOKyblXYiGlGTDCTqDR
	ytEkeJIl39s4dAbVilrCb/aO1ibBQzmEi1lg8229nvMHtq8/dHwTZoKHQfWlyuSUpDTGyTSmQJ7
	+XJ5+rRaIciaawDqYxFoZl1xw==
X-Received: by 2002:a17:90a:6d97:b0:39d:ec42:d61a with SMTP id 98e67ed59e1d1-39dec42df5emr8639965a91.3.1789461925707;
        Tue, 15 Sep 2026 01:45:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 20/23] ALSA: rme32: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:21 +0530
Message-ID: <20260915084424.1007757-21-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/rme32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 454a30a2c07e..1d5390621908 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -8,7 +8,7 @@
  *      Thanks to :        Anders Torger <torger@ludd.luth.se>,
  *                         Henk Hesselink <henk@anda.nl>
  *                         for writing the digi96-driver 
- *                         and RME for all informations.
+ *                         and RME for all information.
  * 
  * ****************************************************************************
  * 
-- 
2.48.1

