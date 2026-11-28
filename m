Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848771;
	b=yGrptcBsjE78vU7qX7eIecxXlzDZYDjYYez63rl8SqoW6KrR2KNCEvcps9P+mo204ZR9
	 Jw0hSz76mptCco3+vh4uVAYr92QGJci8xvq/UmzDAsaqw71gDR0AKQA9U/6EuR62AATBF
	 J1JlbGknNmS2IoJcTbplqc+EocfGPpKSykL5d2cSWo5uAf2hjwV7XsMqj3iuIhLSYL1NW
	 GcS0/IsgWT0Gmlu4cPm+YYzWtkgdxtRN0gT77gYLHkEWO+9csPespmEMtv3HQv6P/xPWo
	 mWiMbrwbKBPcpw3rLLP1vhfwkLlJAig02ff8IbkVTDoU44g95b6sd5KCe42ZkN7eTSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
	b=U7hfBKI4WfEU4Lc7oKTL3Sg+RPh3Y2IZZDqJ1HOtv7/LVMS9M21eG29JMhY7Nn/Z8PCY
	 NBY44bU0XL2eeuNkxkT5SyirYMbqeO721Mjw9EcAm1DAoadDNrmRVwlLPXpnsnNk66Pny
	 xB0KGFbDDMXUFdboF1T0mtKRNm+s0xTwtFdfMKFS+7x4TFXMaaZz11XWBsWiLEne6MXGm
	 3ANkkkmbWrFwjLIPCkwdH6pmDg2qBxs/NryusJwoOPkUyh096+ruOR8ALfwzeTlaGzcLv
	 dyYIblf8Vc4SiIG1xkezIjwudY3ABO0+t8ZZjMiBmde+dKofXyJXXmS6qeOcC3ngCbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgw5NiQZ;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E880606A32E
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 06:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E880606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgw5NiQZ
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b542b4d7bcso372752a91.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 22:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848765; x=1796453565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
        b=Wgw5NiQZUceuxOQxc2tauQLWvq3tcPn2/7gmKBB95k4EKFQTfCBOp/nCTx0SEi8fRu
         3Mkjrtzh24NiMd4aY4SLUqQPntrXmnV4ZaY+X+i5MG2oBaThN1sBnKhDdZY2Ef8N90Pc
         lc8gsJ7BWjFz9YL5DZMcNXAG2H69eJW5gCcSSsRV3sx6B2WLe0+widcEZMjcI45zD12H
         ox8htxy2pnkKedOX38tft8B0I8YiR3svHqOA+qS4mbbf3tEdCSC1B0sfLzlJSxH5uyWa
         DpsI3tRY02tBmmwDeXpiiJLURqAxV8vx/M3KHSEHXJ0ORNbOeDnQmK4z8V47e1vU/18Y
         sewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848765; x=1796453565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
        b=Oic3HR1rST2XSvshl9IxybndYIBiL1PBLSLIAhz/2eksMKH8LA6ODXqULv505Gp5iz
         2vgyfp1l/2B/EiMmmnMMUgfObfDDgnYuJSkCgEd5WxIUwCsI+UiksKWC1q7HbxGOoGcH
         SOLUnxkMnCB617bOldc0tK62RJFTdpaXeS0nSjM2znfTsTFmr9bqKY4wtNBxh+Q8WTP6
         7NlefoFmfIsXV04tCAWzSAjdadAHSzWFJGYPII7fDM2Q14QZYYqlVBKmwpypDgZEFWsW
         upOnKWETOwNbDlI1mQt6s1cHxk+hDWhH+knszvzKHRhoEWeGeBTIQtExABbPPuQsY+Qy
         GjSQ==
X-Forwarded-Encrypted: i=1; AL+hErGsx2pGIUZnbenL4j6oBP/XwEXTswBclWoYYkvoOqzpOqtjp+F/t0LeaFgc/0ZFFGokd0cBe7UWZy1+Cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yymNcD6lzVEacF2jFPKKWt8WYZgI6aeMCDFjSatF1nGmQzKMW
	l0h7VoWOIgs/imjciyl5qfm02mxJ+ojfS5nAaC+/qiRAlV0V1mFHvHpC
X-Gm-Gg: AZFdTZfZdu94HPovPoStAlH1pWFlZqZOTWOecUngNw3qxhkFcyb0r7vUuevmlS+aEyU
	4fvFd36wtq22/lJikO36dSb0XnkZKOLyd0ZasYagQW1G8vd6VFiPo+fIUeWfbM85NHw0lJFk+44
	Lzsk1Yylyh8lfrvVIwBGALqROUQmVcEhbRssq3JjP3NZ9n1SvLWPHofHyOT7rGIRC7tM2znchBD
	dI35q2nd0/zpRBPDWk0RjC1JiYxxuP44uRFGy7iRUToaOWyCCNS1wioymVxnHHeJG+9ytWm+X7d
	9VI0UPakDBsygLalBC52MshQQYV0mjOWRUGH/5gy9U/o6+kh4KTvHgwG7D/pYBV5mnLp0geKcIv
	AvKZ2VPJEZ4DECBx7HI2uSTWaoGqgpnAApMFXHzHEixV8KKB5U028M78TLVjWu4pgqwRJ0ucKIt
	r1zTHUfjzNBZNKF00HWvmWRHEGKCmgftIiUPxBi45W1H8Z3eKHAOSoWq/EGmUvQ163AkmRAOHwq
	jZZmeD3ajAFcSZ/a27AN+XD8u2AIvFVCPrFDfP+LCAZntuT/o9bVgCXVTcs6RjsGz0HayLSR8H9
	TqE0dqBvcqUsBYtHcrY8s7qAL/I19jcMyvekZL88DZUpnlrUq2pCOSoAoLXpyTwE29UlOgh+Y/Q
	qtJleNn1EZfHBpZ4RC9D575Qg7bZcOz/MsRCjtfBxyLyiTDu7oSXdyK96NiWGZA==
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr25103895a91.16.1795848764542;
        Fri, 27 Nov 2026 22:52:44 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 2/2] selftests: ALSA: pcmtest: Load the module when it is missing
Date: Sat, 28 Nov 2026 15:52:27 +0900
Message-ID: <20261128065228.3628550-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test-pcmtest-driver skips when the pcmtest debugfs files are missing.
The driver has no device to bind to, so nothing loads the module, and the
test skips even on a kernel that builds it.

Run modprobe once before skipping, as the net pktgen test does. Each test
runs in a child process, so record whether the module was loaded before
the tests start, and unload it at exit if the tests loaded it.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
A built-in pcmtest creates its debugfs files at boot, so read_patterns()
succeeds and modprobe is not run. If debugfs is not mounted, modprobe of
a built-in module returns 0, the second read fails, and the test skips as
before.

 .../selftests/alsa/test-pcmtest-driver.c      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index b796a5613c6f..3bd6f75ac6f6 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -6,6 +6,7 @@
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <alsa/asoundlib.h>
@@ -149,6 +150,22 @@ static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
 	return 0;
 }
 
+static bool module_was_loaded;
+
+/* remember whether snd-pcmtest was loaded before the tests ran */
+static void __attribute__((constructor)) check_module(void)
+{
+	module_was_loaded = !access("/sys/module/snd_pcmtest", F_OK);
+}
+
+/* each test runs in a child, so unload in the parent once all are done */
+static void __attribute__((destructor)) unload_module(void)
+{
+	if (!module_was_loaded && !access("/sys/module/snd_pcmtest", F_OK) &&
+	    system("modprobe -r -q snd-pcmtest"))
+		ksft_print_msg("Failed to unload snd-pcmtest\n");
+}
+
 FIXTURE(pcmtest) {
 	int card;
 	snd_pcm_sw_params_t *swparams;
@@ -171,6 +188,9 @@ FIXTURE_SETUP(pcmtest) {
 		SKIP(return, "This test needs root to run!");
 
 	err = read_patterns();
+	/* nothing loads the module on its own, so ask for it */
+	if (err && !system("modprobe -q snd-pcmtest"))
+		err = read_patterns();
 	if (err)
 		SKIP(return, "Can't read patterns. Probably, module isn't loaded");
 
-- 
2.43.0

