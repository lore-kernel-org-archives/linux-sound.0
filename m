Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91081A3179
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768719340; cv=none; b=RJg/zwnDct+s8MvO87oZC/0putydK0pbCwIUPgCnUCbgObLu7xI/GAlGHw0RSOYF4PYwfeUkimQ/dI/GuqgS8Oc8ezpKANibQ2dyfPQqtPoBK+8m72USo7B4JyCLJS4SmxHbOIr7iOOXatdfHPqvQl0N+ShMC0epmpitqnrWJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768719340; c=relaxed/simple;
	bh=u/GjgTAvMfnOixIrqpZgUxRPxejTvZ25uycB9M0lvlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZBdnlNJ7X6wLFpevzbK+Txg2oPicJY7csAgJsLsUeGMIGIHdrw/sAZxfbZAQubo+lpzHIa5zLXDdYUttMRncSoLVIlRXvFNUeAI1YPp5yD1RkKqgOOxrnp3s84IdXQJQNsUjTCtvjg4AH4/Ka2Ztv4kJ6xSGLFzPczyk0i31du4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRnOMNHl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRnOMNHl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f102b013fso29876355ad.2
        for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 22:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768719338; x=1769324138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syz4hhKfkVl8CBRKwpksblWsc7ovAlARMhsU/2akUZk=;
        b=VRnOMNHlXADqspHg1auuyItR2vWrMm/PSRw3Tb6h4NtNNwo6c6rsh3mXgkQ8U6zVVX
         GRUN0hlOfJW/2FhkI78VMD6HjIh9CwPyCg38PYXlwHRJhH2W5yz3tcJsCrjD0Fmp2T/G
         qBQDm4r3argcjFUEPtIv4K05sCXyld6tGtFen6bO1r23S3zGD35/55OAoJYWNyrWnCTe
         aGNaTAkbOlmevLzB9TJMQ2nF0Df8j5SSXWBVYfpc0QEZk+slUvGT3Nft3MX0gHjg9XUq
         Zq/3nEhmpxg1+wuNiwRGPoDFaxJtfGY907Ue1SLJszzvmalQCd7vhItus6CNxQe6tcTW
         I1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768719338; x=1769324138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syz4hhKfkVl8CBRKwpksblWsc7ovAlARMhsU/2akUZk=;
        b=G5kmw3/WMDe8OIMvRHnjqRO07CetxiIFvJ/ldCSQjJCeubasDYwJAw69CFCb3Z2Nrc
         EhJ6+mOlC/Obxy6SxPHVbXKdERHBs3maFitU9MdyKOxV8p/7ZF1yiOsA8pdN654Artzi
         elTrq99gjY/tNkLPhdRvttkrSLwECkKTLDQDC1lMixtcFv3verRRiFPTiGhuoYvsh51h
         lOs/AQnuTiGXpXN67TRTy7hkMVNt4e8uH9/Qe2YX5p5xHH7eblipQXiWYu4wUt2yaUMJ
         8NmwVSCIlMKy63A6KMhxCB79LTW1ET8aYvNqmGmz64aurwCmM6Ew5xADTIMw3w2NVBPk
         T/IA==
X-Gm-Message-State: AOJu0YwPPdPx1EdwT1Qlx9fRcZ9lNS/PwAgwaPfNTw2bSW7RdmfWCDhv
	7f3ck8XZNkQRUulBd0q8rAKfRArKd53Uh1UgYdozwsCozpW1n3KpqVGB
X-Gm-Gg: AY/fxX7Bphyh1GeMuMWXRdEGbc2nr+77CwK3CEkee9SqqUPThx//Ttp/S6RCcRUYOCh
	9fn525ngARPEFAD+xLCNUlPD/KbmUQwCVVFYhi2Fkt1VOccS02PYY6Z/Bq2M+A3QK39K1aXmwEP
	irlA92GZypTwDy1FJv2/i0RG/xUFXVtpLY20x+DqqJMukfcGGo+AyqkbJc3Osjw2s7yiGrQqt+g
	Adx33MBCcsOdnnoPS9DpDsXhol4XsIn8TwBw4YTxZPf09WrYjVnk8ixv6nrxUobW6Fr495trBiR
	2+J/L8Z5jmnPbuZ2oSZw4W+p6y8zLK66sC25NcL0AdjIV95BxMCBdk7UAv40Un4WPqYS8Xt8aXY
	RrLx79rxhFntFZz5CNaAyRkz4PmunOdQjlooQWZJKhAUmXGOj1WbBtveZluFTGTdx5ykCgHa2HB
	nkBXPegIo9sSyVNXCJ6/xN2R8=
X-Received: by 2002:a17:903:1104:b0:29e:9c82:a920 with SMTP id d9443c01a7336-2a7188589bcmr73881425ad.6.1768719338281;
        Sat, 17 Jan 2026 22:55:38 -0800 (PST)
Received: from localhost.localdomain ([222.110.133.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab97csm62215735ad.11.2026.01.17.22.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 22:55:38 -0800 (PST)
From: LeeYongjun <jun85566@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shuah@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LeeYongjun <jun85566@gmail.com>
Subject: [PATCH] selftests: alsa: Remove unused variable in utimer-test
Date: Sun, 18 Jan 2026 15:55:10 +0900
Message-Id: <20260118065510.29644-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'i' in wrong_timers_test() is declared but never used.
This was detected by Cppcheck static analysis.

tools/testing/selftests/alsa/utimer-test.c:144:9: style: Unused variable: i [unusedVariable]

Remove it to clean up the code and silence the warning.

Signed-off-by: LeeYongjun <jun85566@gmail.com>
---
 tools/testing/selftests/alsa/utimer-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/utimer-test.c b/tools/testing/selftests/alsa/utimer-test.c
index c45cb226bd8f..d221972cd8fb 100644
--- a/tools/testing/selftests/alsa/utimer-test.c
+++ b/tools/testing/selftests/alsa/utimer-test.c
@@ -141,7 +141,6 @@ TEST_F(timer_f, utimer) {
 TEST(wrong_timers_test) {
 	int timer_dev_fd;
 	int utimer_fd;
-	size_t i;
 	struct snd_timer_uinfo wrong_timer = {
 		.resolution = 0,
 		.id = UTIMER_DEFAULT_ID,
-- 
2.34.1

