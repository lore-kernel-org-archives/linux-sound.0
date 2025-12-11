Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F153B8D7E
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417815; cv=none; b=N1yDN00fYxnMc03eFpE6WJTUz89zKzs8qTBunt130Wd8lwNEHKGK9DUCuGAerHei2fXt6ql7vjhH3/+K2ZZYu/H6L9unrFyVVJlKVimA9RaT0QH2bMxEa42qtFJs75snwPBEnJ0AtKiLe2MVKkgWZaol8c8ZWEkYzRM4lE1cxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417815; c=relaxed/simple;
	bh=BAeAs0vH8yw53s7FDDOWArkU2yzYGCyVBMFBh96Yr5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GkeGf+0Pv+jo2Mi8bo2ftZkaLbVnbSATwm2ml9Fq3EIPmZUZBphoIgi9lkqjhj1hC6iumrPpqtSacwB5/lRi3ZXjmiTlrBVaQmwEqBySPlySEpRdLPv9TNECfFZy+XnsvGpi/gBv1T9DjAd40Cd4ww9EFDDCVApCXEQKuIzDjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKVulaD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKVulaD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DBEC4CEF1;
	Thu, 11 Dec 2025 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765417815;
	bh=BAeAs0vH8yw53s7FDDOWArkU2yzYGCyVBMFBh96Yr5g=;
	h=From:Date:Subject:To:Cc:From;
	b=vKVulaD2lSHKwkJ88o46nAKeRhng4fZPIcB9XOaHVRWh/9/+I/UeRW9FNyQQQH33+
	 zZcAO15XhFqux0rAqvkvxEIkheu5dqsmbwN8L+xbHuBuZ6hNBeYsrFgnq8QQflizD6
	 amLOWv80dxHqQI1TiKTffZvXDrxC6RD4rsPs59H1rxYC9yrRSSKSfzFLhVeGvdErlB
	 EeNhY1D2oJ5jKZbrPIzaRwp+j+MHrYk/j7OhiepN9SJTx+52gsBTIRwG/div+RknL6
	 XsEVgQk7dqxqKBmwiR3I/EcammlFgw5tNAe3uK01pdhfgjw9SULOTretSc7Z16cz0p
	 fIPCCXz7GMP0Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 11 Dec 2025 10:50:03 +0900
Subject: [PATCH] ALSA: hda: cix-ipbloq: Use modern PM ops
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-hda-cix-ipbloq-modern-pm-ops-v1-1-c7a5580af021@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEojOmkC/yXMSw6CMBAA0KuQWTsJ0wgkXsW46GeQMdLWjhoSw
 t0punybt4JyEVa4NCsU/opKihV0asBPNt4ZJVSDaU1HhginYNHLgpLdM71wToFLxDxjyoq2d/3
 Qnd1IQwu1yIVHWX799fa3ftyD/fs4Ydt2fbQVwoAAAAA=
X-Change-ID: 20251211-hda-cix-ipbloq-modern-pm-ops-a6b6754bf170
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: Peter Chen <peter.chen@cixtech.com>, 
 Fugang Duan <fugang.duan@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BAeAs0vH8yw53s7FDDOWArkU2yzYGCyVBMFBh96Yr5g=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlWyqH+77ddE7gzu7fAm0us99cCvRXWS327V+616fbvm
 LN/ZeHrjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRRfmMDFt/cCg3y7jZPt+2
 nc0mbJ9+4ZQ45fdXZm7vz3is9engQW2Gv5L37XfZ+EkyKvj3fJovqvJnDtdu3mMdXScVWqbtmnr
 emQEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building without CONFIG_PM_SLEEP, there are several warnings (or
errors with CONFIG_WERROR=y / W=e) from the cix-ipbloq driver:

  sound/hda/controllers/cix-ipbloq.c:378:12: error: 'cix_ipbloq_hda_runtime_resume' defined but not used [-Werror=unused-function]
    378 | static int cix_ipbloq_hda_runtime_resume(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  sound/hda/controllers/cix-ipbloq.c:362:12: error: 'cix_ipbloq_hda_runtime_suspend' defined but not used [-Werror=unused-function]
    362 | static int cix_ipbloq_hda_runtime_suspend(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  sound/hda/controllers/cix-ipbloq.c:349:12: error: 'cix_ipbloq_hda_resume' defined but not used [-Werror=unused-function]
    349 | static int cix_ipbloq_hda_resume(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~~~~~
  sound/hda/controllers/cix-ipbloq.c:336:12: error: 'cix_ipbloq_hda_suspend' defined but not used [-Werror=unused-function]
    336 | static int cix_ipbloq_hda_suspend(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~~~~~~

When CONFIG_PM and CONFIG_PM_SLEEP are unset, SET_SYSTEM_SLEEP_PM_OPS()
and SET_RUNTIME_PM_OPS() evaluate to nothing, so these functions appear
unused to the compiler in this configuration.

Use the modern SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS macros to resolve
these warnings, which is what they are intended to do. Additionally,
wrap &cix_ipbloq_hda_pm in pm_ptr() to ensure the compiler can drop the
entire structure when CONFIG_PM is unset.

Fixes: d91e9bd10125 ("ALSA: hda: add CIX IPBLOQ HDA controller support")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/hda/controllers/cix-ipbloq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index cc9153692ef5..99f9f48e91d4 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -407,10 +407,10 @@ static int cix_ipbloq_hda_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cix_ipbloq_hda_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(cix_ipbloq_hda_suspend,
-				cix_ipbloq_hda_resume)
-	SET_RUNTIME_PM_OPS(cix_ipbloq_hda_runtime_suspend,
-			   cix_ipbloq_hda_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(cix_ipbloq_hda_suspend,
+			    cix_ipbloq_hda_resume)
+	RUNTIME_PM_OPS(cix_ipbloq_hda_runtime_suspend,
+		       cix_ipbloq_hda_runtime_resume, NULL)
 };
 
 static const struct of_device_id cix_ipbloq_hda_match[] = {
@@ -422,7 +422,7 @@ MODULE_DEVICE_TABLE(of, cix_ipbloq_hda_match);
 static struct platform_driver cix_ipbloq_hda_driver = {
 	.driver = {
 		.name = "cix-ipbloq-hda",
-		.pm = &cix_ipbloq_hda_pm,
+		.pm = pm_ptr(&cix_ipbloq_hda_pm),
 		.of_match_table = cix_ipbloq_hda_match,
 	},
 	.probe = cix_ipbloq_hda_probe,

---
base-commit: 161a0c617ab172bbcda7ce61803addeb2124dbff
change-id: 20251211-hda-cix-ipbloq-modern-pm-ops-a6b6754bf170

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

