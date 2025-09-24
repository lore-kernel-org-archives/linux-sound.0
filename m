Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB414E2F2
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710069; cv=none; b=vAjgIbCRVVRK6vzSwKF6jTbIMRJBcO9cvCDgzMsaG34mOls2wVfshTQqWS8xysJnpYE+AkLYrfIo+WCahc0u0aYM0U4PltFA6vDuObhWSWBAs4NoHw+13w3H6SvHUe1JyZrs/dl60ZULt+mS8eNhf5ahH11ljnk0p7U6cHUSOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710069; c=relaxed/simple;
	bh=iCZecmGO+STxbUbkpqNdKtXsZ7KCXVwG0poykSFvFX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fCu4NHT4Py4DEldvieVPuxIr79ZhuphqyKLrsLLtJcNLgrWWIpomMQ1eeAq2GX0yq6SaStrRUhXBzfLWFoMBWpPTSARZiiFLnjIASpBHLBgBkcOR9VnvsLTzKAx7jceaGGpDjz7LBUUC9U0FzAGS+E7q+CO4vkkdLGL6DrpSU9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIfdVrrF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIfdVrrF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso3252194f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758710063; x=1759314863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dyqsmjj5lpyVJoV+oaHjMaHdvJL32WXjX0ymuQZAuU=;
        b=LIfdVrrFyzETP/wQuwKKYXe6P8Te4IltzXFRAtw8obSsuQfebLnLSTaQaLJ+IqkWku
         XFF0zmpYghGY9VJdb7x3AnTERiE3eY9K6m4FxP6M/2niMm5s3+aW+wxQtqcH2iRUHqIT
         TXnpyspReaZrPf+qZ8I1a+bHVtwYnCwVnwne2pF78iRd4GqvB9AW+0U+X4t1Aur+LtOD
         Gk6KTcdKFQOFsttqZDuAqfZEvD1wRl1EjnTxK4zoJoDSfNuUk70tSvRXIomcMxHsZWHv
         o3zvRe6AKrXx+wza5OG6Nc/0M8Kz4DE39LM856FraXNKL47ltHCoRWwEUkgneBwYaS2h
         ljuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710063; x=1759314863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Dyqsmjj5lpyVJoV+oaHjMaHdvJL32WXjX0ymuQZAuU=;
        b=Dfs7M2Dpjpdca9tGJbwaFu06g85jVnwY1S7ghlKDNklvxeEbOhSiUkkecWBcogWOEp
         ZxunnyQsndf1hLfDV577y6qEJDP/8imwd2iHY7GFYySXexq8+XoEgOdx9U+vISO8I3tL
         +20PGSH5pnmExgInLVDFHSTGX9/xPDTnAUFFCceV7DEjVkzE4QYOoY6RvEuU8/xMab0X
         wluYOAOVmy8Q6ojUM6NXGVuUoxIXa7ummxzN9mWfTsijqNpIuHiwMfRlLFXOO/BPVxX4
         eNDFINnWATXYnQUcs1bvRjDgrenQjCsPJlREREhnfKZ5sYCML0nyOe3dgURnhjUFvSdX
         XHqA==
X-Forwarded-Encrypted: i=1; AJvYcCW7srOD4Pm8GvBJj2ARfgIG0pU4NdJykOm38M/8lIz2OQKZ/uSqd4kMBrfhzpoN3icWtmHWRtjojVQYfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykLEWTYyz30mRMoZDDgD6U6R1Rk8wQx2gke9VQrpI1z8uFCm4o
	27i4CtU538HTrIfchhf7323ct5hkdkwXdMNEh5WVLJnNaWWmrtiTt9YN
X-Gm-Gg: ASbGncsuoviAW+Ta1EK5p4CVfpwWTdsYqflydVS91LUUXpqczFGYUjxgEfihb0VIMSc
	gtkr+zebZY2HfrFd9bqZzS6VY6Dyv/+5yw6V9bVavslqm+Lmko+KavTRcD3Tw2lKgdbx5ZIPkd1
	cePfBzW7R6PWczcfFrk6BQDHldjo2hgUXXyuiKYJZUKjJuEd3d5eRNUT1IYP2rkcbpcrRIiB6P8
	38Fbc4f7W0KuO1v4gCPes1a/n7RKKWIykTNYHXMVy6SLApNICmh9vp6eXq19hHIEEGweCEWue+R
	VITz2/a573wE6iQ8hb4vfjCCvNKwPByvZ4hN932P+XhMZlSy7FpGDEmFIjTEwVLdnaU1/BQCnSW
	aB+37fLxez9QlLs8xhmtMnA==
X-Google-Smtp-Source: AGHT+IEA4Y4Oswnv4lzMacht4nwo2IDihzUjlV2YSxZ6/wz2OAJZ/oXm6ngVsSDWYTRVwUEndg4jVg==
X-Received: by 2002:a05:6000:1a89:b0:3fe:efa8:7f17 with SMTP id ffacd0b85a97d-405cba9c47amr4576595f8f.61.1758710062608;
        Wed, 24 Sep 2025 03:34:22 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee1227cc37sm25825584f8f.7.2025.09.24.03.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:34:22 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: codecs: wcd: Fix a less than zero check on an u32 array element
Date: Wed, 24 Sep 2025 11:33:34 +0100
Message-ID: <20250924103334.9832-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently the error check from the call to wcd_get_micbias_val is always
false because an u32 unsigned int in common->micb_vout[i] is being used to
to perform the less than zero error check. Fix this by using the int
variable ret to perform the check.

Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/wcd-common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9bbfda828377..9fd3965ed540 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -65,9 +65,12 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
 	int i;
 
 	for (i = 0; i < common->max_bias; i++) {
-		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
-		if (common->micb_vout[i] < 0)
+		int ret;
+
+		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
+		if (ret < 0)
 			return -EINVAL;
+		common->micb_vout[i] = ret;
 	}
 
 	return 0;
-- 
2.51.0

