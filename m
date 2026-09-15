Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB443F8C6
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461886; cv=none; b=r6QivjoiXEt3Kvk55tOa3zfVUk4URsaKIrZVUkkSyPHJU6T4CnzrFjtErkLLLexXzNkLzFplsn1G+JCNeFXZoLE84B0HLUMUof3UCcAZZaFW5Ms/JsgnuAznmy4ZLWMEwhAifevqqDKV2M3yM4CQAPBsCnbyYa1GF3osAsYNxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461886; c=relaxed/simple;
	bh=9XicfmWtilTgi+eiBhdjuMb7LG/1S7fRtYRHeGAjchE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlR+FGoUE+PzGEEnyMXzPR7+EEBTH5bUJ31tqKSt16uF4njgW3gx5Cm+wiBxmLOmOLFeeJtzwuQD3XtNT770GGbtjRIsOl/V6N87WnmImoKnpzeZb8vHTIuACn5N+I9p4BFhibj3xqvb4QfVyiWxSrVLkpxT3CrsEL3VzfGOiqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfnZtDQJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfnZtDQJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so26903085ad.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461884; x=1790066684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0/sk2GJWWHPuapRtpSu4um/7nmREwKZC6ZaF23SvHM=;
        b=YfnZtDQJRcG9YfNCeZvXjSThwk6hvKO8YPmAzp3kqPl1i/qhjjCdht0eQe8Yw965YE
         DmeN6DJSZLNyKzEZXrafbl44rPh2rDlOIceCpTyHEJTipLoCTgnCtLd6dWKKG1z4uSHV
         x0NOQao1stkAtW3j8hsYCfRko/5voBXXTvQvhtWB9hPLk6QD6hvA1iYZNJ2hUNqDkj/p
         Hnyj6/f+INm7e0FYuTu6nj5ifqjnQuBGx/QcnSTZBELgBukYWRDGeTuKSvq2d8S4AFMU
         Cfwfti7mSHciow9ZE9rl9r5EWdvaOcSHOKY4gtR4kavSxIfcYCUDiX1MvztmciELr9oA
         gPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461884; x=1790066684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S0/sk2GJWWHPuapRtpSu4um/7nmREwKZC6ZaF23SvHM=;
        b=P/stmXcAX15sv8jkhzrcofa10b+Vw8otoHIj9o2frmaMGQkbCq91FcCz4Ey16Oj+U9
         n2fri6b3GtTj1Gshw+FSw7f5p/FAD45py8VuSHhG8mpoSXQ2nZnqr2GBWLjSk01YwRJv
         YhLH/DpsG4/O8BZK5pUFKmEgdgQSI0DL+jTCSz45rSSLh+1xjO5ZOzAcqJUWOiMfzHYK
         WKpS71LQjI1YrvOP7ycR45zS7clG4Gt9Y4AJq8jfX4A037kdBYly3PDyF3IY0z89RiGC
         9xERSXUHs93tDRxA5y58vNIWbQNQ0VPo8TOddn6LRM199NksGklPTaid5vAdeSwU3BZi
         3Bqw==
X-Gm-Message-State: AFuF++mr1iqR+t6AcuZJQ7NMqBgT5Z0nE1M+E4e3KHkTZlNrlhx31J80
	7ndJAYHayfBJqemWo/j2Duye9Y4d3ftid/IrU5u5DsNTHjff3KYXFc3Q
X-Gm-Gg: AYBFou1y96Xdlm84m12FPdYgtaSwVlgjajNlYt8I8MU/cyVHbnmKH1EkJ38YGjsS0YM
	W0uOqTyW8YuOqEK8tBkorSmLmVfhNy+2xYwat8PtQ32zL0ailvi61ldrOa3pgjhgv+tzOoJy4IK
	OiJCzhe3dRfpG5V/Q95C4qkElRONGdDdg7cSvowHcPqr0+DTcD284FjwOt+Owm1WbrihHzfl2fX
	fGdrvPME//Kt5lYbaetsIREmI13JXq/IhT6ZuhBsqnTpV3Qi3JLEtjkqIU09EvunLPp3yTvL+R4
	re/GWsOJrYtQP68GAtL/xupu4WMV0bzf8GPhVYfyevv71dn7kvH3k3MjToUoBbMUTezhlEo4AHJ
	1GK8usCdFNesL2wmb0rIpiuygWlRf6kHTDkiwhXI2x8dWIpyteixHsDoi6EixIsTZmid8q/k4m0
	hd28zB+1hcZ5pVPLNavUiKBTrGDfnYE/4UvwMJeo3CCY5TNZvQkVBSL00A4lDlP8fr67PJLCEkz
	sIJJ2nDT716CuesD3oIaVudq8mN8Mro2jVxGw==
X-Received: by 2002:a17:902:f541:b0:2dd:1701:3b6e with SMTP id d9443c01a7336-2dd6c73381dmr120490465ad.16.1789461883709;
        Tue, 15 Sep 2026 01:44:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:43 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 05/23] ALSA: emu10k1: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:06 +0530
Message-ID: <20260915084424.1007757-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/sound/emu10k1.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 4f94565c9d15..6474239a11c1 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -633,8 +633,8 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 #define A_ADCCR_RCHANENABLE	0x00000020
 #define A_ADCCR_LCHANENABLE	0x00000010
 
-#define A_ADCCR_SAMPLERATE_MASK 0x0000000F      /* Audigy sample rate convertor output rate		*/
-#define ADCCR_SAMPLERATE_MASK	0x00000007	/* Sample rate convertor output rate			*/
+#define A_ADCCR_SAMPLERATE_MASK 0x0000000F      /* Audigy sample rate converter output rate		*/
+#define ADCCR_SAMPLERATE_MASK	0x00000007	/* Sample rate converter output rate			*/
 #define ADCCR_SAMPLERATE_48	0x00000000	/* 48kHz sample rate					*/
 #define ADCCR_SAMPLERATE_44	0x00000001	/* 44.1kHz sample rate					*/
 #define ADCCR_SAMPLERATE_32	0x00000002	/* 32kHz sample rate					*/
-- 
2.48.1

