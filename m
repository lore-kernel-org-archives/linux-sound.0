Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74E1CB33E
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714521102; cv=none; b=CYab5m7rdmR61QpbIEEQdD3DcXNEFoz5rXRhl+J82km5usX86KWfq4MOBJVS7afOSXLpLwVhh4nFVvp7L1LxYm2sEroupnFa0hHXYp1cCW7mEEoOR7x+mfN7wD0GHctZuZ284D2v3yd8cke5XcJqmmzP6VQJ9hvUJBiEkzAi7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714521102; c=relaxed/simple;
	bh=D4RXcFdCF4K+k0y+RB2kHekGy6icDi6EgmaQjDFUewc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NBPIa5bfcSpq8DTM4xHgMJsDuaF3ASd6HrBPXRkLr5LLB8GXx+Qz2q2mXWk/JniCZ2MaqSPmPU3zACZyF2LR03ZOEc+maCAH599OjRmWD80wd4WbAHgN7j62ft9EHldcvk2hzYZWR5+5h6FaV8P8rrpJ1hv7FS4tse7cwpeqs/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4eHiHkw; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4eHiHkw"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5d8bff2b792so6200568a12.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 16:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714521099; x=1715125899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4RXcFdCF4K+k0y+RB2kHekGy6icDi6EgmaQjDFUewc=;
        b=E4eHiHkwXmvT12PgrwpkLzPfIMhZGpB3yEvGktCAQKQH6AKioW8quzwUuhhSyDxFZR
         VmKVZInAwOBKM1K8T7euqOT7vR5Cz07O1Ni4Stl26Q7Z6PkPheNXxo599djVYQ7J78S3
         Mmn6BK8j8wTpu/+qF98hqBQEexKvH+4J+nlfVAiqjP2jLqY1lLz67BumekaGoRM7OSua
         QhuUYS/ToDjvMxZtQLppXyPRMFsqXTk/lHzIpPjSVmIJ2iQ0tkJUOpKn3A+flaE9O3/S
         TawjMnEY35uvA42rTFhhr9mlzSFyVLBsDetcwGxvUTfF6c+zL3Nf2SSTYaJ4SBoINu3q
         A1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714521099; x=1715125899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4RXcFdCF4K+k0y+RB2kHekGy6icDi6EgmaQjDFUewc=;
        b=JB23iaRft27NRrkiX8Fif56FZpw7EtWoM/cloT4or+lu1zoWvCSW2eGOsovGnLdINB
         SbzvcNQZR4YmRmgjV6/NXxix2df+q3SXtM8Pf8Ul6opRlA8QWtRhNA75rcpbdQHC8cPv
         FlPHfsYurd+1gqROxRbtyyhORKRCdPIVUYpK76A4shkztrTs/V2iuv4OPBpmpyMds1Nz
         oNX8mcu/O+jUXvgN+4H1ELm2wyB1ARiT6OsV4tfupbtoOORkuxhhaiFH/tF/cQs50fdw
         s10zUJ53GylIFgn4qmyDjt60LvQ4zWc2ZXbJG8eCoEQbfPbe6Vhr8fd7nNKhJIwufdO2
         lUqw==
X-Forwarded-Encrypted: i=1; AJvYcCUKuXVUKkDSykdhxhPYVwh+wmAwuLsm5xpIfeT0I1Up1euUPke839AANsCDA9mlfpAJtL5TEIsc06KEJfzIRRsVHkO2c82rxiBMDVE=
X-Gm-Message-State: AOJu0YxUoiv7pMq4iPREyWmAkt84D8H84kR85SR2UmxCDWO48tNEP5mA
	cuIhf7Goba2pf3bZcTgmtsq4kKbAyNk512pB/rI7JwGpdIkpEbf3DHFpiTD3YaQbtOpjHogy7+i
	vgQ==
X-Google-Smtp-Source: AGHT+IHFexsRWV/l6g61+fcJ1FS4On2NzfgmRGaO6qc5XtBy09A9jgk6syIBuUu/8hQIpY0RuJdzwtz+xEQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:696:b0:5db:edca:d171 with SMTP id
 ca22-20020a056a02069600b005dbedcad171mr25940pgb.6.1714521098807; Tue, 30 Apr
 2024 16:51:38 -0700 (PDT)
Date: Tue, 30 Apr 2024 23:50:14 +0000
In-Reply-To: <20240430235057.1351993-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430235057.1351993-6-edliaw@google.com>
Subject: [PATCH v1 05/10] selftests/nci: Compile with -D_GNU_SOURCE
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
 tools/testing/selftests/nci/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/Makefile b/tools/testing/selftests/nci/Makefile
index 47669a1d6a59..f615f5d71f7f 100644
--- a/tools/testing/selftests/nci/Makefile
+++ b/tools/testing/selftests/nci/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -Wl,-no-as-needed -Wall
+CFLAGS += -Wl,-no-as-needed -Wall -D_GNU_SOURCE
 LDFLAGS += -lpthread

 TEST_GEN_PROGS := nci_dev
--
2.45.0.rc0.197.gbae5840b3b-goog

