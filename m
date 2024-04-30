Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A61C2317
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714521091; cv=none; b=r+tfBRJet+hN9MOgM2IF8z4UBvX7rUObR33i6cGh1Xlujui8Z+2vRuOacuNFUokZtKmAMc2JjNWR/bFSeONjaeqRIeVUX5MHLnRClSD7EqyRdP1S8BXBAxuwD/ODflxTxz66FNIWCRb7rOD5hKggtl0HL+k9J/gNhPSUcGLOEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714521091; c=relaxed/simple;
	bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q2OkHtSZBiA91aWICCRoc5od5mexJwS3NSzDqcnRZ6ioyfktFY+0rRDa1GJPyDIXxPTNk6fqxb1rRJF0s0+T7PgIe3+Y9Mld8Ez4gDbYKWGYwEDeVfe6JtNQ+RaNkGDpyYwY2/abkneX64TwWz6HRPmOw27PrKfmMyIxJwGeSdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckLL+yi9; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckLL+yi9"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ae63694954so7118026a91.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714521088; x=1715125888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
        b=ckLL+yi9rIZvpky/0YOzu/iCUml5oJ095EDOY2GFeVA3ZS/B0Yvy9ljyyKagzlZu/E
         zWfMYHDP8isZ5t8eRVrUer+buWyO15PpcvkfxvJxXdFAdyDu7tzqqT7J8gzCU8E360BP
         XGQQTPdxpzxQEAn9s+M0sm0gBkYbxgM9EEinCSZh508V3n7ftLZ9Zi9dxDPAAfa/gImy
         WiMHpdJaIm6kBBTwUrPO7e/zKlN2WmJtP+OZK4P/NXZFxcxCTn445CPIsdAKUm4m+H/Z
         ODyPltbvq8jlm7LIoXgefy3g1Top6wefCrXBM9zSf0qAhVXRhRkYjB6ZSwbOZF/d0l1J
         Wlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714521088; x=1715125888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
        b=rgJh7IEAlOygOn+07yB5Zs+JdV2DaSG47loGUFgD0q+QcbtSM/DAPzyIam2pm3e91h
         oFScZLEi7Q/FXCsj1jkzd0xDyuv7u0jCGuFPUeoNvSHrqrDRzWaV24N5hmdm67rpopIY
         BgzKIPHrYF+UFOviW/i1x/N/o3Jfms+VBHONFDaoBph9r58Vu6hWPCFIQyEJxrVI9DXp
         fTi6oZJJv1kKSNE+H1YVqELbJPCQHn11ISmKW8rVI0mRNE6VrseYWZ4TW3ltO6CYwhaX
         U9dGA9jO0uN3SkviK76iOTTnMiBV3jP7vaJ2bzPqUz74cn68k8yo6ELaZZTr/yyn8Jps
         fqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW21FDf4uGSXyjLwMAa0cNyaJSY7HWHhfE15bwpVgfnTFoe6kFWnchRACDHH68jc0qP+PAKhomKRB8dQrAvsIFLRy9m6DTNN19V7Cs=
X-Gm-Message-State: AOJu0YxRmrJ397eULrvI9XORCvf7/3fwcl6Q1uneuvBgZilEAkalAuLh
	QDQhYkpOquJa/dXp8+BjH7f7eXX2z6UKV/nLwFIAtHAaRrsJ+MfLc0USKvyn6j+v1M2Xx404xH5
	W2w==
X-Google-Smtp-Source: AGHT+IFtSHl2ws+41HKA57TwcS7ukKljLv0iJvc43sJuHvghYmCWKqHkqlRowkQ3pfhszR/h4a+oHj0mSuE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:dacc:b0:1dd:cc3f:6510 with SMTP id
 q12-20020a170902dacc00b001ddcc3f6510mr6327plx.3.1714521088265; Tue, 30 Apr
 2024 16:51:28 -0700 (PDT)
Date: Tue, 30 Apr 2024 23:50:12 +0000
In-Reply-To: <20240430235057.1351993-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430235057.1351993-4-edliaw@google.com>
Subject: [PATCH v1 03/10] selftests/hid: Compile with -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/hid/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
index 2b5ea18bde38..33170d23315b 100644
--- a/tools/testing/selftests/hid/Makefile
+++ b/tools/testing/selftests/hid/Makefile
@@ -21,7 +21,7 @@ CXX ?= $(CROSS_COMPILE)g++

 HOSTPKG_CONFIG := pkg-config

-CFLAGS += -g -O0 -rdynamic -Wall -Werror -I$(OUTPUT)
+CFLAGS += -g -O0 -rdynamic -Wall -Werror -D_GNU_SOURCE -I$(OUTPUT)
 CFLAGS += -I$(OUTPUT)/tools/include

 LDLIBS += -lelf -lz -lrt -lpthread
--
2.45.0.rc0.197.gbae5840b3b-goog

