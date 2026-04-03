Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD5C24E4C3
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246132; cv=none; b=YsxJzHkSGEaJXlX3tQxgVVETlTfo8er3NZXJ815BiCTdbg0nz04fQlFJBsfNBzwpXtxk28q3h+VIA2F5ZLwfuZB2GVsNnXXaWQ9IkunwnwckKFRAU0EAZ3y1XeJOyuEXOqIlNmAyDssEc1BLndmffL/dKMCA1PuxjPvdn1Vh8kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246132; c=relaxed/simple;
	bh=Jk6wuPEJo+3AYgMNEz8BZHMUktNghhbc76k4DHqVaVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jof7Yw0CpwBn9nsIGquR6KygQuUogDMHldDP/+5Ty6MRj9vbVISz1XrEgfWmxsfXiPEx/GTayHimgVU0T36pAeGYx4DxZNxBmHHwUOE13SM7P8HxJLm9GVsjd9J2zdHQkm/6kQ6dzyRFHg8RrITscVkSLpotmSMnTQb41TaNL9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqL7RGbl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqL7RGbl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82a7539851fso995385b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775246130; x=1775850930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIJhE8/NbCHEsvI6MaIU0MyPtyYi+r06M9QiYMpbhkQ=;
        b=dqL7RGblUxlv6b8smyqnKJFA+2P5VZbVT2MI4/W6YysQEmgIDH9MZEs8m6ewMFq/cP
         PNstrPfyNg37E0XYlh3EVRosjLSjmBVbiy1lEXs+vutvxO9jMkH7vnXhZJg2UTE2HM+J
         a3iHomoqWqsHbxE3gZ9GGFyQ+OfdrfWHUUtYjZOaB2NyPNsTAGT2rXFx80vkUJtNTnFj
         9H5eHiJI7N8xyHHMgVyX9zkWs1RQ+adOrLp2MdZd0ax5GGIZ4AYSF5qypCSeD/qPSwuZ
         l+nAVvdV60kZw/WWx42ebR7f6V58K45he9LdTy9L6X9GywQ6nhopnaXE3ook8h6GMUWV
         fVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246130; x=1775850930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIJhE8/NbCHEsvI6MaIU0MyPtyYi+r06M9QiYMpbhkQ=;
        b=sA1vqV8XzuXzvr38DtTYUxt76d1PTrgfeS3hd2sFXHg93kZZ2S5XsVpU/MEczlEnxw
         0ITWeVysfuwcV5E0K/cI19rfJ/uxjORikcAncoYmbYndGoLwBD06OL1gY92U926kTyIS
         XvBevvpsJ/lthwXHPr2th2rJpqjWwo9+tq2eG6Miy14+qaM0W1jGieTT6vvmgk/WFeGQ
         gIrM8bSZr5F6HDKbsbDxhJlwXGthS3dHRFjA7OWJrWZmL2kGFOFTgdf7pVxnTPMYqt2Z
         OKo2FB0wpda4tVwkPlfnwzkAF29Mnb1pecROMHzXuFAPy2OxYn3DkTcmUBzf3ar6OY20
         al9w==
X-Gm-Message-State: AOJu0YxdXrUzVwD99a73Wr1BUsj0xgGgmMpSs4uAXRqRC8tiZVcBSKJj
	NxuTSB3+Oxik4u9oapUNRL+FH0roZJZWA5VnCe2lOBytSJqMEfRCecCY7K66qVAt
X-Gm-Gg: AeBDieuI/PUec3clrm4XIho5xex2f+PhZ/SdN+8+NIQyhHqaH4TArm40auxpXd3MOTW
	3RjLP5zo17v15BA44heJ13lGJPdiDccSAX36YGRUCMoF3yp5opxpu9OmBJY0YyaJMLzYw3mtPBx
	hepHLiuwF/w2+mClXidJrJzUeuZ74ON4aeJ6PIdIubnliayS9vSgidBfm+9UznbzEyn0A5DhJku
	Oz1Rv7D74uedQiG8/ZKm5gEUlbKjnaEcdY/9Bkw4zS3kidKdAZMoDq5Jpw7QoXPZCTN49ElIDe8
	3xWWH7K815XLmmDrfdiEBEEBppxJlghd8LMLs4Aa01i6I6dceMfZ8MELQUyJsx0Aqaquk1sxxXM
	hOiACp5KD9hCvPxCLkMgR+NgrLjsN08s3wIPFeoZsUhRf7wzdG3hm8inCFr44X8rsNFJ26NAQ4L
	rJsyEyM15IQzMw8HekQw9PIEnwymSs5jK/KR/eGi43b6fGkRSG5j+Nkl8=
X-Received: by 2002:a05:6a00:180e:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82d0d7533dfmr4063725b3a.0.1775246130227;
        Fri, 03 Apr 2026 12:55:30 -0700 (PDT)
Received: from debian.killsync.com ([45.116.230.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm6901008b3a.12.2026.04.03.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:55:29 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH] ASoC: Intel: sst: Fix firmware resource leak in sst_request_fw()
Date: Fri,  3 Apr 2026 15:55:15 -0400
Message-ID: <20260403195516.15049-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

The sst_request_fw() function calls request_firmware() but does not
release the firmware on any return path, resulting in a resource leak.

Ensure release_firmware() is called after the firmware has been
processed to properly free the allocated resources.

This issue was identified by smatch.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/atom/sst/sst_loader.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index a043443d2887..cba7f26cb0fd 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -350,12 +350,14 @@ static int sst_request_fw(struct intel_sst_drv *sst)
 	}
 	if (fw == NULL) {
 		dev_err(sst->dev, "fw is returning as null\n");
-		return -EINVAL;
+		retval = -EINVAL;
+		goto out;
 	}
 	mutex_lock(&sst->sst_lock);
 	retval = sst_cache_and_parse_fw(sst, fw);
 	mutex_unlock(&sst->sst_lock);
-
+out:
+	release_firmware(fw);
 	return retval;
 }
 
-- 
2.47.3

