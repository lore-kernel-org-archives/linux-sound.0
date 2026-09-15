Received: from mail-pz2-f20.google.com (mail-pz2-f20.google.com [74.125.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F64779A1
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461936; cv=none; b=F6jewivtu8WTYCIpFBj5MNutBF7I2djkT4HF+Rd15GTb7uYQLr9eKAthRpjjWdvmOu5J6rVMKBSBkxZ0XrticQvRaQDOpYU1F5sk1anBW3j0yb28/ZL0fcSH1tOTaFd36XeisKpPtioQ26+zWFTpWNcfajwQdiB25W5CuYy1lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461936; c=relaxed/simple;
	bh=H+Casj91rLGYipq8ytk6EsEcu/qT6R4LQyFeNF6gEZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjxrQ2iwLHYCDwAz0DB+QZOIKwSDTjxOiPtAmzPy9Y5ZGfEXL5S/eREstvpxfWfthOKWKO5ALIn9AY/23L6sJVGsu08iKKPruzFyI0Jpda+c6dqC0a0OFRyAfHZAyzjyPko4wvQaSvgHDGn5gbxBJns3c+qHswhM5kJmwOSZVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuFg45Vx; arc=none smtp.client-ip=74.125.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuFg45Vx"
Received: by mail-pz2-f20.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso2138535a12.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461934; x=1790066734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi2cJ4ErFNrHvLJxpqfCchEU0jyj0U2j6YYuxAsvr9o=;
        b=fuFg45VxWcuM9Yn9Ar4ZbLZnCcEJB7J26IoFhLX1uqzo6syLxxKzuk1Z460MygKB1d
         QjDq9ZJgy3DXbuxQvmyuz30YchcsA8CSa3po+jLW4J5GxwuurBdx6ug0kn1wUMGeThC6
         imcO8GjntsF+hkeY8JU+n1+YtZotCMnSDEf8ycaKfT9AVW1nJn2yXpQ0UqMErp201OIp
         vqxv34alDj+UKo9TK4xeEm2N0g4LlWCgjluf5TQFGikVwByiLqumkc7T0zykKBvoXbVk
         a9S1N9fiU8pvUM0CrkmJKGTBXwVH7KbQdzJauqlxcoYQmR7TANsYo9o1w+blNMyQ+Cx9
         Kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461934; x=1790066734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gi2cJ4ErFNrHvLJxpqfCchEU0jyj0U2j6YYuxAsvr9o=;
        b=rVOdwjIF0zu49o6tVbTGFPywaVt4wabG4b74YsuuOMEzgUk8MWe7cWpRQMobZ6TQEZ
         2ZuvHsbzA1xsQcMp31ItckwW8zQAYZf/ZT6tdgtx5iE/KX2NE76Oq/uMNM/pDnxByHIQ
         5jT+ihsAcwz/wuGd1dThQK1UU6wj1Knc/XaRzsmeV+9n4JeFKh98Lyio1xOy4942vQtV
         TziK19kNEtmee54d4imqNncDoS7lSukM2nZ1vMIPDDivIcekOqv6KFuHbiyPzK2KU2DC
         Z2p6x5iUQeZ5/cwHqLX5B/o4fjs76M8ephbFMgi8om2KvMEnchDqYFEOgxOl4d9LsZvS
         Fmxg==
X-Gm-Message-State: AFuF++k+DWhc9UZ3UuOMobcs3r19DG2nsmV7ScGkHdozKwVjzjQAXKbH
	z2S0PFIkKaVuNNQ0GTjPOShr0w37zK31WCX7YtIbo3gLTA/Qii1BDg/W
X-Gm-Gg: AYBFou0rTcA5vK2mU2HVvHgVAB63Bpovgpu56yIKH0pBzKpsn8/Opni/OG6SQLXaWSX
	DDpvzaTlErZqsdmyEdKtWC0bJZMGa2WnZogHmGGuHMu1GihdDkXNycxCZaLL5aJTDZZ3c7m8ACy
	bCJ+zeuvKpItHeBfxNCzQfXStWihmU8mZCh/qFg7tHj0mSgFzVQ9OJXn9qzbxc6ZHXk0ArNYDad
	yRlqL4leG4EQXuo+eL9Oa1Fs5lkBHDGQtfv1mwUL4NCrZ4rhPfcdjwpB2L3/izhvV0+0cM5kAYK
	My+ifAgM+ee5Y02qhxStuQTxZLQ9+B32bQjCqz5AY6tx/QZ5JFQilbEQt7kCCpgxgd8QVXrnwrZ
	qoJ1UM9mBnBhXXtrgmHTzRrQWf2WIg1e6CAK4kNX9jytdLuLtSARM2PBdofD2TlOR3/5tgH3LqJ
	c1zkLC4qw4QX5LD5PKjGzsClp2LS3OZiG+7Bmt5G0hx+DGKUs60LGzoIuy/r3Ki685nj3jbAiCz
	TcG5qXkoHuoVyNEP2IvECBI1WU=
X-Received: by 2002:a05:6a20:d090:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3db4044614cmr14695371637.5.1789461934096;
        Tue, 15 Sep 2026 01:45:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:33 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 23/23] ALSA: vx: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:24 +0530
Message-ID: <20260915084424.1007757-24-hemanth.selam@gmail.com>
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
 sound/pci/vx222/vx222_ops.c | 2 +-
 sound/pcmcia/vx/vxp_ops.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index b6459dbdb1b0..40f3716c478f 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -431,7 +431,7 @@ static int vx2_load_dsp(struct vx_core *vx, int index, const struct firmware *ds
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 4211e7239138..e52b61125629 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -265,7 +265,7 @@ static int vxp_load_dsp(struct vx_core *vx, int index, const struct firmware *fw
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
-- 
2.48.1

