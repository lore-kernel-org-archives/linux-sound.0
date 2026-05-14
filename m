Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61DF3C0A10
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764599; cv=none; b=kqKhL7CX5xqDhcYvp4aHmIdKitFQG4r8XAKEc3X7KFJ/A2/N906TaF00nu3sSicgFx4ED/ZM493yxqPGTalD3kxE+gXmVvIuxUMMYmSwZKZ0EHzCa6hLaN9QoeT0AyuNsRSLudEcT8LcyuaNlTUCioeC12prpW2aSi2XmggvJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764599; c=relaxed/simple;
	bh=4pZeqNEIRlgzUmpbHxqmhT764b6atPfHoaHlBsFD/bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lsHKVWYbb0iiOelbSwX3ZqeF25kjjSawlIiyt61VhsFtJZDljCtizkS9locnNHV/Mm1LDmhrY04UpaGXljNJle2hIkHuG7WiA9MbkC895ESq0sJ8a2y4Kc4OC0PSxUz5qynyrYeqIRQNtGTHcGsGifv4gjWTLW4faHT5o3jeTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/NRo2CX; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/NRo2CX"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso8995766eec.0
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778764597; x=1779369397; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UuCbmjNhRHdd+Wlua8SgD/3zuyLVpkgjH0Mbj/jGihg=;
        b=i/NRo2CXC/Bk272AcLFkf2GugPyPF8/egt2cvNpT3aq3ZZvTqEXis2sr9Yb2fjsg1h
         xkg8WZLXS70M4Q5sFrmUm9nGRVHh4NODwonZePmkMRm522jHj4dNTiFJtpAn7Kqnobl0
         YeG7MljSZhevZWZP885jL/ZPSTgsZebqDdRsr2lr7xB+tZzNkrKXwLcGahpLTA7qG58C
         +aZVHIfLP4IrN2EyYiUuKc4oxAPiXdk+JO6NVf56Q4qyoAolCYVJoys8uQO1OIdE/MgG
         B6Mb4b+1fLFLGgcmGdtZiCYcpmQHV6ciQQVMaRJJXzYrdMBi90KvGZt/UEdL6xDTD6Mk
         S5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764597; x=1779369397;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuCbmjNhRHdd+Wlua8SgD/3zuyLVpkgjH0Mbj/jGihg=;
        b=MbyeuKII+yjV6WYMq8Gk+fZOMfVtAkxGbE2qgKOBW9Wm3ZZRdXbZMdvx8CALuHjFrM
         Wi36odJbgqyLNTO4GjmMbc9ENiGDZRmUH6h+VR1T3M7k6NibZmfnKPsUpGBxfPbe3+1i
         SNXKaB1frBw4D6uKfZkG4/DkkQ3W2tZS+Eu8tWGKU3XvQMj+3bRw96o7W7NLNiZEQV0I
         Y8W8ErJ8zPH3ZWBshwcD4pSGQ26eaAQ34RA6ujCKJvDH1j00k3vVR/Jxlba7jnK1zbs2
         p3XTrMcRIbcxXnuUAkyjnJcskefjwAcf/i46o9Nt0x5HvJL1bcHgFEzlEhQ/8JZXOD4N
         /x0Q==
X-Gm-Message-State: AOJu0YxD4yJF2eFW0OK+4hptjztJEXjSWGRWDcHFtzvJgi9C6tQPEzLB
	nUjXkvFpnNIyTDnO9pkB0/HlN/RWhijilwdJahBw4SEzjBFKz73lTr/AXmgliQ==
X-Gm-Gg: Acq92OGzmspRvpdpGwQnKDKe2+0GHztmKNhcQJ09rHubM9cUoOInXBrb5BJ5nlfGlqF
	8qvB9jeVzLTv+pQ/SWyTkc7s4FyVW0s3okkWpZ0hT1m14SGMig7u+1ZAGBf4MCbgUO5NGbowINP
	KYHsSIywRL34Sl095uTSrz2DepSFUsAfWyyZvbqyXD1YTVcWpyPJEafozTEnMsgpjbR+4WGO1Jc
	DtpTvvt85DruQYZjUet7JwTIozKm78efbaVdHSstDKnB14AeQxbE3VTYAgwM4zONRb4uK7N9NOa
	ySNKKxRbIfevrHWJOIOB6V/HnNdeqMaF/xG2TIfIuxgP2SHhkLAciyN8fViMa/jmF7F2tnkmxnd
	4ZD7kW5k0yrMcdppGC0juTB4py6wnsaowq9X/RlrbVtGUH1xT9pMy05rxljtMEJJ7ZdfCY/BNeE
	bRJ80VjEaQSwip8fJmjeCv0HY88chbphFBErz63w6/rzrTJil+QFu6pbMLYYMi4MH/Vp+9lp8nu
	w==
X-Received: by 2002:a05:693c:2b16:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-3011a36df36mr4886948eec.32.1778764596511;
        Thu, 14 May 2026 06:16:36 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30290c4a699sm2924197eec.0.2026.05.14.06.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:36 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 14 May 2026 10:16:19 -0300
Subject: [PATCH] ASoC: tac5xx2-sdw: Use SoundWire init wait helper
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-asoc-tac5xx2-sdw-init-helper-v1-1-aa2a62e87383@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORvIMlvQXxEPtYsuIt1oqhbG/
 t2qx3d5K5hkFYNjt0KWl5rOqaHfdRCnkG6COjYDE3ty/R6DzRFLiK5WRhvfqEkLTvJYJKOLPPi
 BmMgfoBVLlqvWX386/23Py11i+Z6wbR8dszLlgAAAAA==
X-Change-ID: 20260514-asoc-tac5xx2-sdw-init-helper-5c2363020069
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=4pZeqNEIRlgzUmpbHxqmhT764b6atPfHoaHlBsFD/bk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmspw2Dvjx9s8fnmcKsX1wOISwqn5VNZyY28O5fe1RiZ
 +iOY2vTOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi224w/Hf1WbP9qPe841cW
 1N/o4movd/x3LPh2YV67nvI2ySkHFCYy/GQsidmu7zVJXv9zyIrZ0RGXzondDJVnXPP4y+7qnhS
 nOywA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The runtime-resume path open-codes the same SoundWire re-enumeration
wait now provided by sdw_slave_wait_for_init(): check whether an
unattach was requested, wait for initialization_complete, report timeout
status, and clear unattach_request on success.

Use the helper to match the other SoundWire codec drivers and keep the
runtime-resume unattach handling in the SoundWire core.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/codecs/tac5xx2-sdw.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index 917b36ac1cd3..bb12cfb6da12 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1437,7 +1437,6 @@ static s32 tac5xx2_sdca_dev_resume(struct device *dev)
 {
 	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	unsigned long t;
 	int ret;
 
 	if (!tac_dev->first_hw_init_done) {
@@ -1445,19 +1444,10 @@ static s32 tac5xx2_sdca_dev_resume(struct device *dev)
 		return 0;
 	}
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	t = wait_for_completion_timeout(&slave->initialization_complete,
-					msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
-	if (!t) {
-		dev_err(&slave->dev, "resume: initialization timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-		return -ETIMEDOUT;
-	}
-	slave->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(slave, TAC5XX2_PROBE_TIMEOUT_MS);
+	if (ret)
+		return ret;
 
-regmap_sync:
 	regcache_cache_only(tac_dev->regmap, false);
 	regcache_mark_dirty(tac_dev->regmap);
 	ret = regcache_sync(tac_dev->regmap);

---
base-commit: eeecc92a9f1dd213dd52d9b8f42d155595b1d278
change-id: 20260514-asoc-tac5xx2-sdw-init-helper-5c2363020069

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

