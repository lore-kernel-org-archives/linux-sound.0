Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A33C3033FF
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783271463; cv=none; b=Rp4bE5iJ1fNXPdM4I5tSvZFDDri+SbG9KnKcEDUsY7WMxB8uOXMJmKQuddHWbKSQbi6wsYYG+GQh19m24e9IZdXB9T03JRWVAzIAKxIqek2sZNhWLUHGWUijsyWQqqobXoxnRKmWv+XH6j2r5aZAu8VcUTHBC7FZkKX9PmPNCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783271463; c=relaxed/simple;
	bh=dKbDeK5JMWOskgWhH2hh7caMG/c2GZ2IPAktPg/6cNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyIA4UZL154CEA5o1269fuxLn2jyzw1dHHvMUt/v0lwnj6Zl/HfKK/z5wfgPt4t8wfAPnFS69Ol8dGXYMfq4WXsxGQvyLeSm36+TW3XnX+sKkO12nNUCyo9g9/zeHWMSG8yxeKJLwmMWXA6XYgQ+hmzHZf1aNqIj66haMTiKXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zm5llgA8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zm5llgA8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad4170e8eso25648715ad.3
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783271461; x=1783876261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6oriXBGQKRVO8BFxyvH8HRrLjtHNA6kmEs+Bsjv0iU=;
        b=Zm5llgA8bsFxiBJ5h0YpQRLxOJ5cis7Q1bf/n+UuEMMyKIS/1tvs1gz6XtG2K0U5Si
         +woWuRbZXbEKtcJpAxDeRxxf4uyGhl3HlCTTq15+i5+dh5Ztl05TPYWYJT/IDLWV+TBj
         U+nDxzddO2mFuuJ5qUSmL4nU+l9Ys9JNv9N0YW9usb4Bl+IP7pc+N+GaiBQ0hiTw8dP2
         v9VlOIhnHaoPh/i5CnnGZoUggjkSy6VyZq5zB2McS2MYg/3LIyC3TH6sAZ24KdBcgcx2
         WUydxm6TjdEOmR8oWzvUKV0y+yVWCxLtj9/9cfXSBCedf2AT4kF/i/ZiFfi6aXKTsbqp
         jEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271461; x=1783876261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6oriXBGQKRVO8BFxyvH8HRrLjtHNA6kmEs+Bsjv0iU=;
        b=nz/Eqgh3GnqCRyMM/K3nvBWdLtn88K0ksh40X8sN5ai2fwDyKt/+nBd9pqmpLkwWDW
         TJ/R0wPM/WC475JCp7FfUSap/niz0Qzj/SsRjyW+bR0Igyi+vgxsULPPbkBLKh0dexRn
         05e5h4EvXQl+PcjXx0ffBqsBos2jKsoL7uGAAZeWv/3UwmtGxLnpXZuvHULotxphjeX5
         i464MgOIeCOKPMacLhL9dEPVQl3K8d4aiQ7c6klSQiAP6/jVtGyEdtlILjQuQhVbRLJt
         BbDWv1IARaU+Pe3DN01bMvUoKhB/CU/08EjOVK1Rb1BjKjAi3XkCcBraK36f4un3e9zC
         9oxw==
X-Gm-Message-State: AOJu0YwMitH8p1kj7MqwHCdhouzAnASWDr8dq812wPaStjrL1+18nPNQ
	dXIiZZGTnrFIK1wareKCtlN+bNZKYpu3WF341Oft16cp8pfE6aOjItZcZKl0ttvDruc=
X-Gm-Gg: AfdE7ckDlCFYNeVHD+donx/MS2+r7aLDb38R0RWLjiSPWR+pv/pjgYJSR6CirW2ZnvY
	AATtfYsELowAaMo3N+vV3VeY7dW3rC3PmP0s8MaC1bx4FMxRJESUIos7gwguZVpkfBr7T6DHIQu
	OzkHZtFd9qTcsKVSfvjUjIqSsfVCDKxeiCuU+gUMVNRXTKMylY4LOIHzsY38BKqyehV/WMoVQp9
	s3SV+ToEkSfKQdcfy55ZIy7M+B8acscC26j4uYbidL+c9x/KzevnYskN/R3QpQB2UjGUa8TX1KU
	c/ospFAamxOG6XSpanWUd29zShVYhXr/K9JZ7UL0CXXtDLYdmeXUisffOXf8T9iAbrAj8K/GJRO
	9qzNG8BlDOPlC/jqX6iuIdN9ha2sERDG1LpHfI9vehmeIuLVU9VuRRjyo9egcwduMMwFyP5tO+K
	mMO8cHbVF9smQltsTXjr/diWi2026xC25wZs8VLm2zMszRKNQww72VfgXwrg==
X-Received: by 2002:a17:902:ce83:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cbb9f2a80emr65200725ad.41.1783271458503;
        Sun, 05 Jul 2026 10:10:58 -0700 (PDT)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([103.133.229.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm39655434c88.13.2026.07.05.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:10:57 -0700 (PDT)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Malaya Kumar Rout <malayarout91@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/alsa: Fix format specifier and function mismatch in mixer-test
Date: Sun,  5 Jul 2026 22:40:38 +0530
Message-ID: <20260705171038.171966-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the ctl_value_index_valid() function, when validating 64-bit integer
controls (SND_CTL_ELEM_TYPE_INTEGER64), the error message for maximum
value validation has two bugs:

1. Uses snd_ctl_elem_info_get_max() instead of the 64-bit variant
   snd_ctl_elem_info_get_max64()
2. Uses %ld format specifier instead of %lld for long long type

This is inconsistent with the minimum value validation (line 335-339)
which correctly uses get_min64() and %lld. The mismatch can cause:
- Incorrect maximum values being reported on some architectures
- Undefined behavior due to format specifier mismatch
- Potential crashes when printing the error message

Fix by using snd_ctl_elem_info_get_max64() and %lld format specifier
to match the data type and be consistent with the minimum value check.

Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index d4f845c32804..242a0b21e85e 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -339,9 +339,9 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		}
 
 		if (int64_val > snd_ctl_elem_info_get_max64(ctl->info)) {
-			ksft_print_msg("%s.%d value %lld more than maximum %ld\n",
+			ksft_print_msg("%s.%d value %lld more than maximum %lld\n",
 				       ctl->name, index, int64_val,
-				       snd_ctl_elem_info_get_max(ctl->info));
+				       snd_ctl_elem_info_get_max64(ctl->info));
 			return false;
 		}
 
-- 
2.54.0

