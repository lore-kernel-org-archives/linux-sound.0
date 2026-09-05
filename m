Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349713DDAE2
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616905; cv=none; b=E/oJpszVJW4C/xl5w+3PwIxc5PTLIl9/AxHmgbuKsqMYPwWpsapevwRHu5A7ocwB3HiDBP5ifW86s958oUlxyT31+gYMzm1HMkq8aV/9AN2ctLbYZahIE11FsePUCoJoGG6uFJJ8jxjqkjwT5bgofoO2Z19O5V6zoQ+KTfmqf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616905; c=relaxed/simple;
	bh=EizzPFcHBTIh2Y7GKphJQqpoh7RMlGuXmOyHqJPayZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9a+Vn/vsDn9/x9drBxClgxjERuaC9vueMV4GwNJ5FYoomHmK19LdBAsHdHfrBRm18KR9yUaYvFb8VZcMWrchpEA6bqQlogEPeQp1C0pRBPW5ZbotRPYwuVDoYTOT177/WbG0BIYF1GKnQueLM56lmYBFikzo8QlHub6uJ10F2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAWHDYpH; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAWHDYpH"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9808f46d89eso1008590241.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616889; x=1789221689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=ZAWHDYpHOMJ2pb1rznJGqWziVaas9dmvZpinpC8dpdVqj28oQXoc8EcWh4t0vpBJzr
         OfhyVTe5DH/gmR5zTbIvGvTij3vy5znr4MnvveqiDbMkf1FnVpTTGTs6pPzlKhmqp3sz
         3YkwoIj1bZPG4c5xVmHJvjO423C0j8ygBV7y8w96COK+Mrg6bjL66EJZ8f6zhaipTXCA
         shq6D7fnizDyjnuKBYcpdih1sLm8oHZjgJYRBxZorjypAjnKdQNVQabQdDtTPlev5008
         KLDjEmNRmj3wxviz0WV5c0/pYxoL+Vd+BAWA+ZhPGQWWDpR2WZGmObxm4RgatpKhkaDT
         jmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616889; x=1789221689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=FfxQC2Wj2uX5EPS1ebIY1k7+ck5qHJpfk+bvyl+FAEvnLxHPUe0YxCBIFWoN45npUG
         13N9jkiaNv0LfanT5LbSGc8ii2oakta60fOsrynJ5EpzDQuzwFyC/0p9691ZTcDCIEUJ
         CzdSgENFmA5oLUkclQ76nkbEToAuWPZj8L6C6I+mhD9L/UHDJACw+pbkgza+4yVX1e/3
         KD/94FktDq2iIdh280qzShG5yKJmvnFwNJZ7IkQql64ihLa20tKQ1kHPfwY2tdgNMYud
         1q1sEsHZxFfcSPiFSPtpeNYc4OzMucyWYdqD7NPrkzC32vjBRyGmjRvUOc6gsW9fFnb2
         d7tw==
X-Forwarded-Encrypted: i=1; AKwUvBxuQzAy7fB7b7Ub1B94gG1vYBie9HEbK4D/6yqQ0Kxa/tEKdeun9PjXgyABuzS56xh3l3YnOyF7hXtt5Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kDAookpAuyMYtwrIvf4JnAe318gceD5YW+a2qahh+u9zXXewPc
	NatcqHKjkAvh0OkAsP1IONYppO1eSXUVPsV9zT8BnBaV0RrvS82qh/jg
X-Gm-Gg: AYBFou0wu5UAKAoyFykZLSFdTLOWnczcv1PgSsRz43tPF9w1DHWa8z9tXEVeS5Ih9gi
	TQ9tY94oDBFW981rPFi6U9PWXzQViif1n+D/HwwsbyuIGOJaEzZH3eW8tp/8eNpLOKF5ECy/OnC
	7PJKmHzOqEBc6ITbAxMG+umDxA9NVRXwDQP0AGwqJbUBZ3NvwkK30q6WZaJo5MxjPoKeHOEiUwa
	cn4uSxGpHcLiqrgyaS661WxxGPWzSmUXSRRf64bh8uimqdNT18R5C0LRWs3PSa6+NVRCBmIY3aB
	cRwQNR7Je3qc61P7rSx0qKVNwhoxFibJKtORGrd/tE7u8tY5Wmsan2dQIbPLzNWvrXTiq9RCs7n
	sbHv76yVryrjaxDKhS+sYDMu7SuTqXdLFzEvnmAD5zB/ttQBmztPYZJYXOMW66lgFmGr7n9wfG0
	15MCXhL31wGMkUsHWwinhMxa1PEcG7tfT9Fcj3YQ0VUu8JfsuMP4LvRSimeLue/aCJkeynFe+e6
	SU84Z9usuN/NPs30yNTSguUyZAgbdxb
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr5362480137.2.1788616888537;
        Sat, 05 Sep 2026 07:01:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 11:01:12 -0300
Message-ID: <20260905140113.21638-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..3a0db1be6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316) += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

