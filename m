Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A14071D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826539; cv=none; b=HjJqT+jwfjwCu3bllGOn++ZNWGGgkeunAH6uEtCMOBe6IO/PTokf4YWMXkJ9V255bSzWt4WXZBCQgnANZz0336o5IyweXLb3e4S+WL+aOy6+dpgpXg2VZ1X9KvIby2Nzg0FOdaOcag5UBm8b/wW8enuXdL3Tx63YKiIu8PRN5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826539; c=relaxed/simple;
	bh=cnZCmRpqAqEOWEgQ1ue8oKzm6+iLdIFaaz2cMdzlopQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQHoyupSX64jPLnErlD1k5pxOLaHL0HzJcRT48tcN5s/1Q/vrAM9UBw9jYQX6N70EguzGm8zWisiPyajvz2AZXe4SKXmsbUWAHYFp7bSDIxAq8ksZCDhf+k23WuvCYAOnmrbKGtc6Mslqr1h2tT7vqohNKtv5GuGWuExlj6upaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPAEx1bQ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPAEx1bQ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so1539697a12.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 03:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787826527; x=1788431327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptruR1AcBwxfHwWoiQ4jX61oJnM3pifrJ+nJdGn6vn4=;
        b=IPAEx1bQry2AlAX2mC9XJG/+T07VNZ/k8yXnEqMekrpmKApYsBCo2P5Mu2zP0tDp/t
         G8bQEw3j+UPOktJBuR47udztEhrxIK6Wo/ZUb31YjfCFiAjEIc+Bb1IvNXljtvA7tD+Q
         HsWcmuGnAiufu9aXxQMuTc+QLf/pvKdm0uw3GHPr/UFx+XJATRpXQSx/OiZ3ey9S1+ZC
         jKGG9HQ1kyi1MR87hY5TLAa6IWEwzE7ZqQ52n4J+tDVY2S8OPtOuzeUMyKj6cqX+Uzml
         14VnQZ9jjNNrAchIHiEicRGOP7c40ZOkH6/JNhBRQfp+oyoQcexXfrQSflafg06m0YWL
         2aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826527; x=1788431327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptruR1AcBwxfHwWoiQ4jX61oJnM3pifrJ+nJdGn6vn4=;
        b=ZZbJBtWfWCx6c6Nx7l+ICEdP6KwFq5ML+l2MDyQomQtq5mCa/HXsHDpkgA3ZEjSY30
         Rrn2DL6vMugpiKYpYivhS8Zof99zDhFSfkkTyasEvwFoFvWvLKa9dtJD6G2wr4dd9bdQ
         Rbvg1X4RiDLKEiEE9vOcSf/mN70jvGXGuysTnGccQJpyZCl9SW5WDhyZfhVOurFWB9CZ
         fDCylQWQ+dfeZRF4QtTGLlz3vdqoMC7pm5PxYPzcJMOdZqoTADHV12d/IXMRoK7xjUns
         emjpH02umoA/9dV4WiHo9ywX8p/DAd0Q2RFGlBVDld9qvip48I/PHb2Db16kx66Lc/I2
         2opA==
X-Forwarded-Encrypted: i=1; AHgh+RpcdCNjqd8P363oToJJnXoIJ13+aIaBRxGvVfz3dRMce8OA3B8uBEyrySu5gzUv8cBOH86xy/AdnOx9Yg==@vger.kernel.org
X-Gm-Message-State: AFuF++nxHuvmx6w2hewd6SBermclE+SbB2DM5/tBaae9yHuboNlNDHq7
	sfLKRYI1wB3QrvrKlzrxpjdUoBadWCwzSY7yN2J5KjraPpe3nFgMvWwRyzTyQg==
X-Gm-Gg: AR+sD13qND/vDDURdlPA/fmutNFXll5A6OHkvLV4kH/8zbuR3xdah5PMIueFJwr/jg2
	fkHbMbz+vpBYynRk8P7hcZ0MtQK3apmT8b7LMQYhojP7xNVJl0/JuytVDhPEFaKzO/UQNj2njkq
	KmBlAY8DSiulequZJok1/wqjObMblF6zyA1mgl7xJSPaZBUsf4tREC4P7gC003KnwlCGyrmOcZq
	O5o09panxBHLfrwOWDEEyz8vBg8t52rerUNs1trq/xF6UTJqK7Pkh7Smdq55PNbN18zGVq32dVk
	QDnwBUDsRZj12A+RtlapeDoAEUfaYYHQPL8IOXq9N4KxhX1oRl6duusfn9G6Zp1rNbDGZ49Evn7
	hg7HbZE0e1pdIVOCQcmy6WjBluJALJw3CukL65RDRRbYvCxsU+pQmmTh7isC57kGcg5o6l5KV1/
	JJ/vE06jqGK98uPY2O905AVm4buA8f07/cykZDyDOyq9+7dfp/7pfHlizoYVcKseJQ5A==
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr28463295a91.16.1787826526788;
        Thu, 27 Aug 2026 03:28:46 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285d1075ddsm5130994eec.29.2026.08.27.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:28:46 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer dereference in snd_ctl_led_get
Date: Thu, 27 Aug 2026 15:58:31 +0530
Message-ID: <20260827102831.21012-1-jeffinphilip14@gmail.com>
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
+       if (!kctl->info || kctl->info(kctl, &info)
                return -1;
        memset(&value, 0, sizeof(value));
        value.id = info.id;
-       result = kctl->get(kctl, &value);
-       if (result < 0)
+       if (!kctl->get || kctl->get(kctl, &value))
                return -1;
        if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
            info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {

