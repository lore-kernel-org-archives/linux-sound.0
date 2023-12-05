Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gU77UWLf"
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4271B8
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 23:32:10 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-db98b9c0fceso307864276.1
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 23:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701761529; x=1702366329; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdHfmQmZDYuyXCu0NGdHRUb/90Lva6Q2oB2rwJOjRS8=;
        b=gU77UWLf17NGFwns1NTtH4ufmlGXSuKUVMe0SMM3Z/hkuzpNhnNVs/ZdiK6v8qArF6
         1iPq9ZvY1n1XV3BuyBhS4bmkK8n6w20y/1zUlCfOFepTmp8dM/vEVUVW3ZPiyfbMRP09
         hCwu1fRloMi511BNUmei169Jh4wxlce0fe+rV9OB4IrxNpS6tsjOgXiLaRfHNMwnwex2
         ejrpMQ53Cn32gWbPxEVS1/Yjq8olZc8mk8my+okMtGnUhPA6d6nmXnJXs+6+EWW05mW0
         ifZyaaeAlZ2xHbNk+ndalBpIbTFFUgDECLafYNtE7lWJ7IA0Dp9H6goWe+DyqAqCVbkp
         Y9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701761529; x=1702366329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdHfmQmZDYuyXCu0NGdHRUb/90Lva6Q2oB2rwJOjRS8=;
        b=dVlSNpGGQgj+Tm+K0alE0jj/ZsQQYdbOj+XIFu/xyqHsZ26W6QEKEO7EvC8tStUunA
         z5cI4DLHxYf+kURxV4jdoYsfXrhpZYoIjZIwNwqdFH9Zhe6R1FcafzF1GWdUyihfnGDA
         LRAfsgTI2BpB+kiubeeDJE/UzBgkrrX/j5DqPG06p48qS/jA3OXNXu60cQ3Z+wWOXCrH
         9n1aqIIUC5EYTqPsFzfv5v7COsVTM9pU8jJQYgCiL042omEpb8Yn05+gYHrqWBMMvNXo
         qkB8olcy4EeVSr2LsE8RGwk5G87ElmZSACMP8XR/NVR3NfGn1u+XwJex0VhL69uAszbh
         Xl7g==
X-Gm-Message-State: AOJu0Yw7WTCE07Cv2ndQ9md3sWCRtWe/5aLtofrrPzw6ZtegY4qAw9c7
	JSSSl8EmSx899RX6eLWud/AZy4W7r67zSg==
X-Google-Smtp-Source: AGHT+IHHF6+HTN+R7wTnVRWLqb4w18tX0Cim+QBivHuTkcMFGQFLnFtpexLAxiytHhXHivrQcbisM6rp+Y02ZQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:d6d1:0:b0:db7:dce9:76d3 with SMTP id
 n200-20020a25d6d1000000b00db7dce976d3mr188630ybg.9.1701761529700; Mon, 04 Dec
 2023 23:32:09 -0800 (PST)
Date: Tue, 05 Dec 2023 15:31:36 +0800
In-Reply-To: <20231205-kunit_bus-v1-0-635036d3bc13@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231205-kunit_bus-v1-0-635036d3bc13@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231205-kunit_bus-v1-4-635036d3bc13@google.com>
Subject: [PATCH 4/4] ASoC: topology: Replace fake root_device with
 kunit_device in tests
From: davidgow@google.com
To: Rae Moar <rmoar@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="utf-8"

Using struct root_device to create fake devices for tests is something
of a hack. The new struct kunit_device is meant for this purpose, so use
it instead.

Signed-off-by: David Gow <davidgow@google.com>
---
 sound/soc/soc-topology-test.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 2cd3540cec04..1d7696e5bffc 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -10,6 +10,7 @@
 #include <sound/soc.h>
 #include <sound/soc-topology.h>
 #include <kunit/test.h>
+#include <kunit/device.h>
 
 /* ===== HELPER FUNCTIONS =================================================== */
 
@@ -21,26 +22,20 @@
  */
 static struct device *test_dev;
 
-static struct device_driver test_drv = {
-	.name = "sound-soc-topology-test-driver",
-};
-
 static int snd_soc_tplg_test_init(struct kunit *test)
 {
-	test_dev = root_device_register("sound-soc-topology-test");
+	test_dev = kunit_device_register(test, "sound-soc-topology-test");
 	test_dev = get_device(test_dev);
 	if (!test_dev)
 		return -ENODEV;
 
-	test_dev->driver = &test_drv;
-
 	return 0;
 }
 
 static void snd_soc_tplg_test_exit(struct kunit *test)
 {
 	put_device(test_dev);
-	root_device_unregister(test_dev);
+	kunit_device_unregister(test, test_dev);
 }
 
 /*

-- 
2.43.0.rc2.451.g8631bc7472-goog

