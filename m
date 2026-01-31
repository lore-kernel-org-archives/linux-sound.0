Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840C32DEA8F
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824878; cv=none; b=svmQ13RrTsneEpXaB99J6lXySB6dJHN3t/kSeDFXS68yjrnUF3q/sBqsQHYXZlnCPs06YIETA06vaZGSJvYBDjtllC/3nMi78Y6Fxs1yWFzhNxgAUMCZ+KhNIW8fX/pvJB3MGysBTGwysZ8ng2jWV9RIYIRg/mAKlOmFtohiQ+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824878; c=relaxed/simple;
	bh=92T2NSenuzpQ1IeP2UgYsAzY+M+FQA1qO2qwotD+glA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ta7uo93Jk14f+mlLE6G0gN0Ssem3I0EB24BZLYJsJ70P+H/301rjcvijOggSowv1gj2mE2qdMQEk0YUw8KvENsiJ1emRnTIuRd3KOuRpl+z0OEcJXXbLgK+7vYlLGaWwg7ehdhrc247VJFAGibkxbEcpahmMTYwo+dMF1WWVJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9d0gHCV; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9d0gHCV"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1233c155a42so4696494c88.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824877; x=1770429677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXzjo1qPCGsNjEppRvNKaCpQ8NopBy4yIETlX1eZ16g=;
        b=I9d0gHCVSbDKxPb3iaDrzAq7DT05UKy6ZXgC28ObFI4yJ8ZkH0b27J5mwDH3AqRa7t
         KlXdtVBYv089lx0PVhZ2IIXyQqXxJ1RV4U1xJT3SZFkHqs7k7/GJWcIARFznuz0nAbN/
         6BD6hmjWGROcBUbZhWlJMWhAlLe3oc5GfyKfAfIqwurcbwiqIOAf9lxQLiC5b2gfWdmB
         njCSj1slqwb7h/Cr/ub4dJxx2MqlTn5Hvpk8UHFidOJbsFEfMyNvbpBKpVRTHI5kCfT6
         qb31mP71uRzPn6p+j6QVjYbCDYaiEmKnT4zCWbM5kguneV0Q9sjeF/CrbRmKnKkQvxDQ
         JZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824877; x=1770429677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXzjo1qPCGsNjEppRvNKaCpQ8NopBy4yIETlX1eZ16g=;
        b=kEG3eM9rpRS50J+xB2PJtb/1viSpzb+RKJiTMxMJKhzY+BVjBM+nY9bZJ7+bdln4JU
         Ldq7dk+n5KeAq3KEnK+ZMMnqYmr/xINv516dxXJycD/oXQ9TAajJEIl6NREV7WyuGeW/
         Jnpdg6XpYQEV/zgBOzPaNR2TPirDty9XCw9JwsqXuWo3D2xX6BwmXYVdeqjYuRrg2bUu
         saMuiN1amLzjfTj4HC54wJPIM7iq5jrPMsAePP3i7fLcz64Z1vQU4EssTtAy3SIzKMmO
         bbuPvRRsfY2lZVMolFnLBwIs2u/D8gk2vTVeVRN19GdGJ/FeeBoprINVc/X0/3Pn/9EI
         en5A==
X-Gm-Message-State: AOJu0YzgIlGjURR8UOiGe6aduz0ccjMiLuVdvQM1v0GMUZedcnIPeF02
	AA8oXbttb4vU5QCa4H1slg/d/mfj2DiiYrNnYLAwuq8cH+xlN4NzrI7OunSJKWxP
X-Gm-Gg: AZuq6aKYyO8xLJfG0BhtwTd/CuOYNHUtrccywfhAJ3HTu1qc8G3jOH1SefWd+rKt6tZ
	qQLFPMFrVsMRzShmZFunfy6K8n+OOMqP5RvwKcqv4Ea+txWVZyIocCSNWVg9Wyz3diq6qnvJ1Ru
	54zQkW8qCAUoP3l1IKZOIpcHSSb3royVgws67CjUOZX/DfYCeUnPij+3tjEoNtveZWSswv9j+ud
	JySVTQOo4cGAOMN1NI5Oo/hpHNoavqFqyDaP+SQ7QUXMsAJvgw6LPH0TfRNERDPnnguo7oYAMVz
	9ELqVzDodiQsO++LBWDFFZfJ0h2QoOMz+icEsIyNcB2xEFwKsCPoWgCeGrfQNj8i33vz0BO8WS+
	5wsLu4MP42Vz2l94A5kXuTLArmX7dbpzeXb1H6a9p5TMvCLJY8jFCuhf+NJ8TgJigkRcot06kTz
	eeSdBwvlJY2W8KImVdNIUmDpmveb0a75nxpTppkk+WjD9XpNZa0UQ27+kvBlrts02K0lnb3Uvnh
	bdRPylGMKHUXf1cHM+LlotUZmux4cmVHFRG44z2FNSNE3NpnnbjbT6T1JJUpgZeB9XtI6D+sTrS
	pTsD
X-Received: by 2002:a05:7022:4585:b0:119:e56b:989d with SMTP id a92af1059eb24-125c0f87329mr2407082c88.4.1769824876553;
        Fri, 30 Jan 2026 18:01:16 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b663sm12290534c88.1.2026.01.30.18.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 18:01:16 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: wcd-mbhc-v2: remove unnecessary module_init/exit functions
Date: Fri, 30 Jan 2026 18:01:10 -0800
Message-ID: <20260131020111.46108-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wcd-mbhc-v2 driver has unnecessary empty module_init and
module_exit functions. Remove them. Note that if a module_init function
exists, a module_exit function must also exist; otherwise, the module
cannot be unloaded.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 26ebcdadeb7d..0c842aaa7eec 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1631,17 +1631,5 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 }
 EXPORT_SYMBOL(wcd_mbhc_deinit);
 
-static int __init mbhc_init(void)
-{
-	return 0;
-}
-
-static void __exit mbhc_exit(void)
-{
-}
-
-module_init(mbhc_init);
-module_exit(mbhc_exit);
-
 MODULE_DESCRIPTION("wcd MBHC v2 module");
 MODULE_LICENSE("GPL");
-- 
2.43.0

