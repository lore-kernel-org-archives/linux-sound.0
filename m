Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE081A08AF
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068112; cv=none; b=Ju1HgcYBiVwcv9LFuX47xiUtqHg7vC/exL40rzv9TpQgTxqGPdVZqYkNl46UJx1Grz6rCsvE6HF6BtOLLzADgpxg0PrNHLmOnvLx67vl84yCQrYrCilQa2Z5gumW11h6EA6hIUuzUxFxms65zSpwGG6fXKXF1ORo6oufUGYLD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068112; c=relaxed/simple;
	bh=MleScNebmr/QZFfWvQ29HJiOauZJpd6IuQ2pFpYsVGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIJ/KSJ+UH05PLSoql62OQI+DtrMY/u5REqwVbfIKqiqBFKzN4oNnSWZNlQayD5P8eECeK5ZRi20xYf/kjDqTip/UwktHztiqyEMCWuPpmZubjhJ8H55tLUT61gud5IN4IvboJnmajwnDy+fWtsiPEKwODoy+DHICmkv6bmQHeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIHxo6ac; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIHxo6ac"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8230c33f477so172796b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 17:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772068110; x=1772672910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxujHuUWM9SO1xRU6A6jFOae3alKTW9P6VcQ6W3nWNM=;
        b=nIHxo6acgv0WCazzt2jlAXIHVxH206IDO0ynTQJSthc0Y2uhoe9HxCB4OPFsvz52Xi
         Ivx5rBeSe/jbVITXQA30GS3GkJcxWd/DLPp6wPaInv9y8WrKPPJnmmPEkuCHCGCCmbCG
         KHRlwAnRTC3FUsZx2Md+0/F54PUI1VlL7OFaJJJ3f4pIaHe156z7MAWstQm63/yL/9bJ
         bOwBLOLejeXaBC1ZkbaJuufQvlcVIvJ/4NNq3DP4n7u4MMSR5wQb/oGMaEpmo4jwI1f3
         FKUTGGiod75qEDoMxxFK6CfRdq2nCdxtlGg2Tym57VAqZw5ybycO7Kq13LaFq2N+BH7j
         ZPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772068110; x=1772672910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxujHuUWM9SO1xRU6A6jFOae3alKTW9P6VcQ6W3nWNM=;
        b=BCkTrinHwXpYaTeHkI7N5zZkLdT0GtunEjImKm60M8k9tm94shuiAo7ncLWIlehMMs
         x4ZvFAeWRhxiG87HyndMAjuqYWF4MwsH60uNqu/JdgW+5gHCJJMBTRqk6OVs29Z7jwJp
         oOIG13Ltz/vdKrmNSvHLyPZIDzMJzoUDxaAWBC8JH6nwVvg4y/9m1+IJcgkkEN3E+nPW
         Rcc50XnRUezBpSIP3p29ZbinjQDCxxo+DWw4AP+R2YwaXJp/mpOJu8Q/Lgwajc7AjXe+
         CZVFfFoZ7Tjw1YXbI7cROMU6KBpD1rtPrHh8seWkVqVzNVhMs9DWDAK5RFTNqXKCuF5D
         RnQA==
X-Gm-Message-State: AOJu0Yx5wWRHCE3rWRuJhFemH282Jw8jQ7k5rP/+PnzZmNqE1Q5cSclR
	XoFuuDFaXCQAhyIiIMIIuFCHqV0fMaJMseZBykxCMf1bCpTD/f/cM4m6
X-Gm-Gg: ATEYQzznN40k3M402aqTj2EsYcETrkirQXIuf2ohAUxQzBUfO6gChE1dQSp/ekZ8yBV
	56rYZVUyhtMyNddge1g1bBJARC3OsZkzih2TyHU7bX4nAqzyaX78DbrZM5Ac5iSAaTFp1T1kqUU
	xb8sPJnVWeEgjlkaC6oeWcKZ50Dlk0ApW0kPtsbMc+6vxX6eU8Fn3PbwZ3Lpvep2DdieQ/+V92H
	e/E82/EsdA8v30t6g30VH8R8ipDZwtK74482VCb/1xR5th3WVgjh+0aHAPNVTYvp3PA/yJhmELn
	/+dZcqnsUdsgFqki6VEDogZbEddQ1IIKJdOqluFzSCmESw4ny+BtqdWsrXHZdQ00PLvxY1Mwxr6
	ik8XdTWyrsWSzFNOliauvYKrRnco9p7aMSh8vV/X0KorqEka5MHxGmd3q8/dTCtIqX1h/L6Gcy6
	4AMmTlczUAIZrw5JMeISiGQ5gcV84o6wc=
X-Received: by 2002:a05:6a00:2e14:b0:7ff:885f:9c2a with SMTP id d2e1a72fcca58-826da8da56bmr16240676b3a.12.1772068110181;
        Wed, 25 Feb 2026 17:08:30 -0800 (PST)
Received: from localhost ([14.52.27.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d880sm507672b3a.7.2026.02.25.17.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 17:08:29 -0800 (PST)
From: Jun Seo <junwoo93s@gmail.com>
X-Google-Original-From: Jun Seo <jun.seo.93@proton.me>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jun Seo <jun.seo.93@proton.me>
Subject: [PATCH] ALSA: usb-audio: Use correct version for UAC3 header validation
Date: Thu, 26 Feb 2026 10:08:20 +0900
Message-ID: <20260226010820.36529-1-jun.seo.93@proton.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entry of the validators table for UAC3 AC header descriptor is
defined with the wrong protocol version UAC_VERSION_2, while it should
have been UAC_VERSION_3.  This results in the validator never matching
for actual UAC3 devices (protocol == UAC_VERSION_3), causing their
header descriptors to bypass validation entirely.  A malicious USB
device presenting a truncated UAC3 header could exploit this to cause
out-of-bounds reads when the driver later accesses unvalidated
descriptor fields.

The bug was introduced in the same commit as the recently fixed UAC3
feature unit sub-type typo, and appears to be from the same copy-paste
error when the UAC3 section was created from the UAC2 section.

Fixes: 57f8770620e9 ("ALSA: usb-audio: More validations of descriptor units")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jun Seo <jun.seo.93@proton.me>
---
 sound/usb/validate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/validate.c b/sound/usb/validate.c
index 4bb4893f6e74..f62b7cc041dc 100644
--- a/sound/usb/validate.c
+++ b/sound/usb/validate.c
@@ -281,7 +281,7 @@ static const struct usb_desc_validator audio_validators[] = {
 	/* UAC_VERSION_2, UAC2_SAMPLE_RATE_CONVERTER: not implemented yet */
 
 	/* UAC3 */
-	FIXED(UAC_VERSION_2, UAC_HEADER, struct uac3_ac_header_descriptor),
+	FIXED(UAC_VERSION_3, UAC_HEADER, struct uac3_ac_header_descriptor),
 	FIXED(UAC_VERSION_3, UAC_INPUT_TERMINAL,
 	      struct uac3_input_terminal_descriptor),
 	FIXED(UAC_VERSION_3, UAC_OUTPUT_TERMINAL,
-- 
2.53.0

