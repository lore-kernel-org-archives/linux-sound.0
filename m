Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F034B42F
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762971557; cv=none; b=awkV6cGtRrkINZ/XH01HaAbVIFi6yu5zwlKCPn6YReR4czaq6sugCauHiXHXduCC4CgLb6X2/rgogWRJPViPLHhS13qZh734hnHjfQIvwdE3cKsDUSvrvnZ1G6btsq/xCc6u4gIXedPOmY56X+MWHXLF6uPmHLj4GVQDAnnF7lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762971557; c=relaxed/simple;
	bh=JSk2wiQKBahdJ8dYGksFv11VvJ1NPd2DXSatLhgaWEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe+TQwzcV4KewRu1wt0p3fWNClsKYi2FTzuo+oxHdhuASknCtIwnJcwm+bxqYmiEGE1rfXBwuTsXOVoKaD2kvED9h3duFWFe5xaN30SmrVWtrjkYBIP+ZV33ZWLjcChKd2FANP0aYBPq5REJfp+29kAsF1B8OkIctN3LEXpRhY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ar64TOml; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar64TOml"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo1082602b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 10:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762971554; x=1763576354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajL3qyJYFc6tD7lnGfH4M98Ye8+T06Aj5rRcRA12Okk=;
        b=Ar64TOmlxe3N161cZTBVfb/dIqX1VLovG5y6PwyGIPc2VMxhhcM+Gj7EAubKCkIpGN
         Fktk6wYT9DWPnzsYTrOoDCDAXoOgle6N583gZmaELsF/ifk8dI2YrwoccXb5f2yOmmIa
         Jz6QYNA8wx+hEvHER/Yey2e7TbLKBsAHuRr2G2o7jCzYSCjuQ7b/jq8owxs2nfEMuy9U
         IeX2v0wQrbU7gcBdDUMF9IzRitozq1Fy2Quu34FNEarVMSFyTuMRYA2RcLApmey0jDmP
         +OEQ8d2FwLumogpVUO/8IBqS6kLyNrE1eudUPMrSrTLPUP2nNLjN/v1gShWSp7zztx7j
         jMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762971554; x=1763576354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajL3qyJYFc6tD7lnGfH4M98Ye8+T06Aj5rRcRA12Okk=;
        b=bzAb3dISjclP+wf7VxWSKDV02rsRc/pkLe8LJCwiHErmUoFgqZA4y6732m1RTF5xXR
         UaCYXacbrH2sglh7J0QRPpjQ6hx8rgL2p/5inmVXR3VC5WXVI2FDztfhsOi7u1CPlmt4
         hVwCVoWHpvqLDyvBQECtwEciDFqpzpAgHqHtZ2ueplgrErBhL9JL/SwMuOQ2RJXFLNUh
         6GnKrdy1tzllgEc4wD6HEfeTB+J21H/1u+0xKHAjcY4VsCs1l96MJwfCbE2SvMVcHDrN
         ikZ+zFgBaDjbY171GvZidSjr/Q+0jmtoSJzC/OCH5hkW+cZwZ1H88XPUkF5IWe8mA1rw
         6UwA==
X-Forwarded-Encrypted: i=1; AJvYcCUfkPsMsuS2nJ5uZWBRadGxCZORW/P5YSWlvRqp3jXD7CMkSx6sS+1jnQOCGdB3cOAyRJjSLA5Nd0acaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDbCDZbIzvBlbiYc22HGxcKDK04G7TN8Nz8pH2AfnIgORsnOdq
	xK5GNHFDRl5dxPEYwlqlKpwD/A2rJu6b+5DzDT1+Xa8WpnMKSmLZQ/iB
X-Gm-Gg: ASbGncsgfH8eEJFyXetup4JZGzvfLTWX/pHkyyC/CJ5AUXedbJto80rbQ0bcs/xQGHJ
	cQ2HOjfSVAgdfbd7IbrSdgI1f4luqJhWqUfRtl+GNBIoCrm4WahXOxY2GJgbZZzmofV+OFnpOkn
	4I0o/qgiEi5hFtaFya88vjrFIYQ3LZ5WHqgGgJXOZaSWS+1OJAiiSvP85tBKcMfHDqnflKOwT3O
	0ySDUjcDP8b0qY3yenp/Xcz+EhD5SHmOv4w8eBHCy42wnkypiZ8tf7Y5aeM5VQyziYKA9D7UuDF
	ZjnajhMjkTCbaofP2QieKKGGnBWSEPs5YVd2N8cg1nI8OsFysU58teSh78axnydGFxPHbYr8uUC
	O7a/Y78ORNE3M0fmFe8O2BKAOvVAK8IJUZL+pLUTM8zvekJy5brWx1ozHjfwvq/jCYMfiMIEykx
	NogsHvH0aFhCcWG6AR
X-Google-Smtp-Source: AGHT+IHlsgCrOCxbH1xUwfriUBHh5Wzt3eZZ8m1hSbR+IpGy4PwSajaGLSMmb7HAExzbcjFaVH+8vA==
X-Received: by 2002:a17:903:28c:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2984ed2b896mr48147475ad.6.1762971554462;
        Wed, 12 Nov 2025 10:19:14 -0800 (PST)
Received: from gmail.com ([157.50.185.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9f8f1sm37051095ad.54.2025.11.12.10.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 10:19:13 -0800 (PST)
From: hariconscious@gmail.com
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	sakari.ailus@linux.intel.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH v2] ASoC: Intel: avs: Fix potential buffer overflow by snprintf()
Date: Wed, 12 Nov 2025 23:48:51 +0530
Message-ID: <20251112181851.13450-1-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

snprintf() returns the would-be-filled size when the string overflows
the given buffer size, hence using this value may result in a buffer
overflow (although it's unrealistic).

This patch replaces it with a safer version, scnprintf() for papering
over such a potential issue.
Link: https://github.com/KSPP/linux/issues/105
'Fixes: 5a565ba23abe ("ASoC: Intel: avs: Probing and firmware tracing
over debugfs")'

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
Thank you for the feedback and the suggestions.
Corrected the indentation & commit message.
V1:
https://lore.kernel.org/all/20251112120235.54328-2-hariconscious@gmail.com/
 sound/soc/intel/avs/debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 3534de46f9e4..cdb82392b9ee 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -119,9 +119,9 @@ static ssize_t probe_points_read(struct file *file, char __user *to, size_t coun
 	}
 
 	for (i = 0; i < num_desc; i++) {
-		ret = snprintf(buf + len, PAGE_SIZE - len,
-			       "Id: %#010x  Purpose: %d  Node id: %#x\n",
-			       desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
+		ret = scnprintf(buf + len, PAGE_SIZE - len,
+					"Id: %#010x  Purpose: %d  Node id: %#x\n",
+					desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
 		if (ret < 0)
 			goto free_desc;
 		len += ret;

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.43.0

