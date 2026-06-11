Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28E3EFD2E
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179187; cv=none; b=UDzbBc7qwAFjINf1S5u8Xzxl7/ZhC55fZDz1fDzx4tOd4KUnW8B6AZSb6EqX4jNTlMxcz1nEgS781hGoeGbEqwqm6vfr/X+8V9WlLWqVccqFgsAlZ+1kgVzFQ/gHE0FVHz7/7eJgOS97yGj+1uTlQfpj4XVFyejXLA2wcgWiAc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179187; c=relaxed/simple;
	bh=htAEZCySrzq33qGWwGtCS+zVlz/zhBfdGf256hqsHfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhWxA3ZWenhvFX/lIgYy/RC8Doq8qlCYnOSejk4vE6cTwk/ZtLQLn31WPT8pgZ9pVLz3b/lg0s+s6MxY4Qkt237164ZvOM0kME+03WKyzuowf32cS3FEaREkbFykSLu6rGt0hKZvYQ67UuzeUK+kx6wRlZ5uUHec0kJwqO3O8rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAKbfiAA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAKbfiAA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b8d414666so4409512a91.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179186; x=1781783986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KLEz1QhI90d+vgH6Y2U77y/hPaySLgz9KvU16KcaIc=;
        b=RAKbfiAAeIoGpvQFkPnnd4651mVQw0WxASdHEkxSfxc+INhd/ykrJO/O38Hiq7xa7J
         xxS39DufavtZWT3MdgF7Z4qfYT11SNw4Irk/0sfcsLXEm/7frR+aPi7l+otymuo6M01C
         Bnfy7dVyENw4YeDNlGnEGMJep3E++l8peObpxzo6EfXGayR0MJIffXl6bc/tBvUjJnAe
         vWJr2nq+t+k8I1dKyGzhweZr3j2ifhhnj83Qy5jLscfrFZ0G7TtzLfl3nrxsBCtjtViR
         obUSIhPIbIqBtToLqdbm0GzxymjP4H9dpUJNNPaIcRpktYIkrhbkDu8OD5goKIIXo0q6
         CFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179186; x=1781783986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KLEz1QhI90d+vgH6Y2U77y/hPaySLgz9KvU16KcaIc=;
        b=V7yXXm7vNMTT6cPjr2nZu5nkh+hj1/ke53fxOEI8wY03gh+cdv57vgWjnG+WQejK3b
         5eNG0ZFsuErb1LE20+p4V9tPSB4O6nQ6lum0XKK0DuTJmZue9jDTwM5cuWZp/sTI4Hcr
         4oQW4q169gLTv0fwJ1M04Ufnhyn23HheB4hO+Cvok0rLGemfcByjjX42FrFQ3urdDq4r
         PeOB2PNaj1ylhjsq7LgqCkbbvzM+Wi1FtCyR+9TcQ31cQebZNw2p/uxi2Msd/31TYC9T
         3QDTcWZKu3P2g/NCsyhA0QHCQRWP6lLSoxoijjf0NSSvb18+8gYp1133HMaQ2L5k7/+8
         qCWA==
X-Forwarded-Encrypted: i=1; AFNElJ87nkACgC0S85XARpIduQscZaGQmcaDbwUFMaXBG1eMjcLCWp/LHRtW/Wtm3sRYpHI8vMb2Ezvq0WNmQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3ikUP6LfviFBXViTkOBfMOMQ9rpsZqGbHh/yRhxjLM/roReX
	XnHwCDSIeDaZCCrBiXoX/hQ7kxZ5Cvn+Ke57rAxmvHWh2d1ikNbpr5Op
X-Gm-Gg: Acq92OEA/4fxqOMoO1U0pSSO0zFv4faUi6oqgSC7VSj0IaUfhUFASToK6yrZ7X9O+BX
	tw0VHNjaY38YWRIVUY0l+Teyuin2gxdpfj7+KmPOoyPa7tYVJ/u9XUsnei/WNW8NRiceAUtHd9E
	ijZGsl1R7KwtUl8zAtO1przdERnChmm/UVvv//9NFvhL0pItiv6UdLq4bYw32ekoEBvcs88GFYg
	zezJmYps2OdBI/O5ZYCDucT1qds6UrJUq94Fe7rcakVcFWGAWFdE7aNZ7Yx3gMKBkLz0usLqoo4
	wMGrFEPPXV+0OFZfT3Cjjfeai677ArapUOJLquOBoYMricNDYFWWOlDA96FnUYvNCika0ls6ASi
	Tcv2d51nal+AE4BA+zLIVcdZBpyMuJb1VKqG8D+Pjj+BoEodJ6c8q9MuFnIjaq7LIej7BusB6F8
	E/7Nyy1DhJTiymdiwlfyIVncq7HAMqfiuncdUpt7wb59CUHdvaS8vzI3svjwaV6gnzBEYQJXxVs
	h1q1/o=
X-Received: by 2002:a17:90b:3f50:b0:369:c5f4:9681 with SMTP id 98e67ed59e1d1-377a870982emr2865330a91.22.1781179186092;
        Thu, 11 Jun 2026 04:59:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/20] ASoC: Intel: avs: loader: Use guard() for mutex locks
Date: Thu, 11 Jun 2026 18:58:48 +0700
Message-ID: <20260611115901.80438-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/loader.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 353e343b1d28..3b158039acb2 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -630,15 +630,15 @@ static int avs_load_firmware(struct avs_dev *adev, bool purge)
 	if (ret)
 		goto reenable_gating;
 
-	mutex_lock(&adev->comp_list_mutex);
-	list_for_each_entry(acomp, &adev->comp_list, node) {
-		struct avs_tplg *tplg = acomp->tplg;
+	scoped_guard(mutex, &adev->comp_list_mutex) {
+		list_for_each_entry(acomp, &adev->comp_list, node) {
+			struct avs_tplg *tplg = acomp->tplg;
 
-		ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
-		if (ret < 0)
-			break;
+			ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
+			if (ret < 0)
+				break;
+		}
 	}
-	mutex_unlock(&adev->comp_list_mutex);
 
 reenable_gating:
 	avs_hda_l1sen_enable(adev, true);
-- 
2.43.0

