Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964A43E09D
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827411; cv=none; b=iNo3+x9dULHEiY6DFSyxwbJJVaCVXgQU1D5KAETwA8qqDKW++PXOvkl8K6y1nFPdzcLeh2nbkJB2lB/xtBphe6m3m3K2HrLHJFAKdE+zIZjGtvht/3L1A3HXiEgXR9jmMg/MNzd+q5jSsZtONvBOA0w3QGz6r307Pr7wZRSnyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827411; c=relaxed/simple;
	bh=NqmzE/pOKE5LuH6urLswzZwp6HqGLA1qIc7ZyPlaAqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/wkMHDmCEA1zz4QirxZzUljdLghePTyJ+r4lttWMMwufpDPrNFyZ4FTGVKviK1cmXHSZrq4g2g/4neeewJovASlrIbMA+1JFIOAbjRjOV3+Ms+DFi7birIJg8ZWtKJzZprRmYhSGSAsxmY59/oWkRBQKsJqR1P2ZiB+w5JEuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaeWuf4P; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaeWuf4P"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39266382df6so479207a91.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787827401; x=1788432201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR+R31UmLdNq/47JB2RO+SmIFiCAwIdUTOKseODOfow=;
        b=EaeWuf4Ph6MqnbimVX/WT/aRTtclQ8+ANBI/57M9wIQIzvJmp45bHnppkdyPXNA1FJ
         POqS+HV2vRbV5l1gqBmMDxUF+kaOStIwxQbMB/TFwjKYaqanIH6M/GU4ZlCbvMPHj9aM
         sPnG21sSD1ViSNbhW+2VexiWJrrL1c/VBINLGhHhyOrmfKlCm3xoE7NzKoGOKsyFrmM1
         GFZa5Zvbnj2KeOBDZJlX7pZAtvNt82p0tzdAUkbWYojIU9aW06zT9kbNkSGwGOLPyEhO
         URTKgaTsfuAAO7sl8K83FtQp+UKVLY0L4JNLSmRTakPKAyuAZgwRJI7dCOaLHTrYp8PK
         7Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827401; x=1788432201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dR+R31UmLdNq/47JB2RO+SmIFiCAwIdUTOKseODOfow=;
        b=czmKYvOHC3jll2Y9DwD+D/7sArWYgZo4FoFp82lyabSW3hW7MZpuHMVzv+GBCNPiyu
         QY+Vtwp/EtwiCqa97ZWH12ToVCoZuUqZW6UzuSGBk7Vet6LIupyHEZq0j9FXrlAoUGPH
         vxtIZ3ctq4ai2CajTnRVR0IdFG8eHh0ub0qwZioiq5CwJyU0b27gowTSCns8FrTKkppl
         fudmawO2P3evtIFskAXxHlfv/a3hO3VeZevZnULHvyzLN4BZNiJKuK7w/GtjIDSTU+b2
         M6hVqkvZnkZ31W8Pad2KtH6fdTTVuFOh0MKw9RHFVYKDkDMw2S1ljV6QHVztK9soJfMK
         0CHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6/lMIfRvOFmn27DTurCFNxYKtrt2S3aNjhty2JuMPmmSjZnt4gWNBFyqJ8caXGt1rMAEyvbnvIaONDg==@vger.kernel.org
X-Gm-Message-State: AFuF++kIdLyhy4M6YKINngvg3qYmNVdt+jE27EmfDbaugoG3J2NRB4Pf
	YnYfmsV2sPDSc2gwxPJooYRuJMh6jmp7ZnpDUd7j+u97IQfzYXH1mv3/dkAXRg==
X-Gm-Gg: AR+sD11l1AGt61U4BoIZNCjQcqKRhYMm+ha0h8IhZ4vHE7mM6vct6bM9HfpPnajPhvF
	A54iY6HKxSSDDURnpNjCe+MlKL2tzBhtAY/4t3EIQMjd3T9kzWbsPKVLWDqWzGuz48xjKIaQP+y
	vZPNI+o0YH4Qc9Skuv50mqqpEaHuw3OIxc9cTVBxBDKrwmFttjTdzKVvoy1tn2ghc6PvsxG6UoV
	F7MuWBfdREa7+lCajZT7/5jNOMQm5reW/qTFES0gkQDmHF5uuK/qRGsJh8D2FpgoC36gK1DzDaV
	hpkZgD66nXyG/C6O1aAqN9NcYIH7XjIwGrdZQB5tzStbaadm8Ebgub/iNLUrFAYAv811CmMPMPg
	paAFOwSznINVUDKDXOzLIXpylJxt7IHVsz57Y56MlMwsIorbWKDMXn8dv5rwW9tGZCpo7FV8N3a
	mw8nBFCLimOYQCIKL1dDm5ca+tXaWjS8P/K7nXaz/Ex0F6gPRxZFzueis1cfjkBahRyQ==
X-Received: by 2002:a17:90b:4e8d:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3966d400334mr28906835a91.1.1787827401171;
        Thu, 27 Aug 2026 03:43:21 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a907c682sm15103423c88.15.2026.08.27.03.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:43:20 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer dereference in snd_ctl_led_get
Date: Thu, 27 Aug 2026 16:13:06 +0530
Message-ID: <20260827104306.21231-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
References: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 818bebeb63dd

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 8cbacee57ce7..f6a46ed97d37 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -114,13 +114,11 @@ static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
        info.id = kctl->id;
        info.id.index += lctl->index_offset;
        info.id.numid += lctl->index_offset;
-       result = kctl->info(kctl, &info);
-       if (result < 0)
+       if (!kctl->info || kctl->info(kctl, &info))
                return -1;
        memset(&value, 0, sizeof(value));
        value.id = info.id;
-       result = kctl->get(kctl, &value);
-       if (result < 0)
+       if (!kctl->get || kctl->get(kctl, &value))
                return -1;
        if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
            info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {

