Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE4394497
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363228; cv=none; b=ruoW8VQMRR5S+YfTPQnvTmmZfXQpYWOulMRxNMsGpJqoHbUtyVjfj9zc711OlCeIY82ODuQLO/AcPHbqqh7hmKPTtmt9lwdkOpgaYTD7bS78yPGYSV9gaAh31anjr2N9Af7EZv188rDgnEKDNQjaoC5xnA3h6s1FqCSSzreUdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363228; c=relaxed/simple;
	bh=yVSq2mC6bxcnvZs15GLmjnx5zcUR3P33kpGm5Or3Dhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUNjswWrdSbVKUEIY91ImpgNFvpYbfOvt58MVVKehmIgHdJ1S/BIDN3txyM06GecQMQWiq9YrGoOK5jiRJfRKefT0Wkh1K4fOiSHCAIEPWVA9ygF3LhygJmTPB7IHWZEnP5y4VjcM7la/Vu91mLHJK4irz1JRY8A389vko5zMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTRT9PN/; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTRT9PN/"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c8ccc7755so4612813c88.0
        for <linux-sound@vger.kernel.org>; Sat, 09 May 2026 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778363219; x=1778968019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEoyzVdf1swwo5rTtJUc2k2B91Bm/y2EWjWabHORpvI=;
        b=gTRT9PN/qRQbnVzH0icbFrPuueDkzakJeCsgLuxJgec4H/5OHCuSHqJgOq/uQ2hxRi
         rHNXeVIoI7Q7dZNzhtHqIsc+F89WRRyVfkWuxybgTHY6p7DLtooF6wRKWF85EOT0ek52
         0p7NVlvC3Wb/gcOrQFeRCzoY1hhlrMQz3iE0TF7a7q4B6qwSWO1PiiTdoThyAWn4VaCN
         NAizr852DX/0/CdmWs9HFsM+ybwBBZak4x+G+Y1nFJKYjd9bii+Rd3bS28Iny/NM1Hpj
         5xGRglwOqkGal8swjSC5Fmww7aL9YOM5MsqzVpNnq70FzMhAv8jGAzt+BjGB0fV6jBDM
         3KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778363219; x=1778968019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEoyzVdf1swwo5rTtJUc2k2B91Bm/y2EWjWabHORpvI=;
        b=HK7/lroZr3DOjxNX9DqUTLBukX9lk4AERI7OhLUGh9wTQGhbbrXU80TtZh8Jt//s3U
         +t70Y0efyXRYqnm/4upJmhmO1Q0hG6imCtwWEB3V9hoSBxQWI+XA2Qty+RO1mOHiN68c
         T4SJa1qo5D8bGrV05ttJ5BnEOyxksZ2DotQuk7xJDEADaNnN3Tj5nlToUw/ThwBSCSNZ
         mJF+t613oZEiqTcAqhKeF+ZJVOs0r62k/yWNd/1whZxdDT4ep2x0sAJlXu5zolamAdDG
         SaPr6742jd+E7I627VDPDrw3noO+wT8GmXcedcd5/Mxf0WilKL9XMGjoXfZprz9o+o+d
         19RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5aVfWsIz1+4mHtYPAPloikxUB+uSsEjsKWrPZdGFXN7/evO7qhN4+0doRed8mojlJ4Kgow6SxuYBuDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1nf4yJ/dslsbH7JkFBY0Qs5TfpB7HOO9spbYJ43e5VxL7bbf
	Oov7F8dVTO4voCW0Dp+m7TVK8oCRGuIMQkVfITz0+VOPDHCzsKZkqYorcsOAGNj+l90=
X-Gm-Gg: Acq92OG8nTeeW3ak7KGPERGqJdQ190V1RGXkdOcWzIngYHg5XrBMeYVHf2SncLp6Gkv
	MkZtAyxwhqKQ9XX4nB6RGMkwOgMrM6b/C+4cmvOEG7S1HsJ8ExjbIdv1WFLQ0gSO4p0RNUErQPB
	V44LYentVrgNRTjqVTll0njKCRJvMx1HhZAqRFH6QXAukjkuhURjt4mc7D7wv/g2OWwVSrwEmmP
	uAgweocjRZJnpOnvQjwy9b6pywXKqUH0UdFv+uZ23SmYJWliwQApU5ySx0eS85vLGJn9ICVdvXe
	5qFBV/cV/m1NbIJplMlIqU19XldrcNT7CsiQSgvG8v1UUHQmp+sPh/2rGo1ULNMJK6hYORTS/zu
	LbDm81WJHEALfzuO0Nj3MuQ/5J/aLs79YoowK5H47eFVO8Jjdr2EM1B4L+csdic/2GUePUHIFeC
	gYKcZ33sDH9fb7E198zb9RpR08pMt9+k0Gv9msT1sGmI8ruXeBVi1XjyQlFp6GXByjIf7SQAAHP
	yJ875ANeGk5Gka+JAnh6Z4fi6W2VwGoh2xf7E4uT3QvVSUAmi4z7NNkebFUzvhyE2ZnAgCzsTuY
	NN8Fu0iYHjZz7GfhFTh4PSenI8J2
X-Received: by 2002:a05:7022:910:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-132a7edc646mr1830788c88.6.1778363218896;
        Sat, 09 May 2026 14:46:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm9965429c88.0.2026.05.09.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 14:46:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to use the DT
Date: Sat,  9 May 2026 14:46:19 -0700
Message-ID: <20260509214622.38319-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eukrea-tlv320 driver contains checks for ARM machine IDs via
machine_is_*() macros. The boards concerned now support only FDT
booting, which does not use machine IDs, and therefore the code should
be updated to check the DT compatible property instead.
Non-DT booting support for these machines was removed in these
commits:
commit f2f55499942a ("ARM: imx: Remove eukrea_mbimxsd35 non-dt support")
commit 3877942b0c7f ("ARM: imx25: Remove eukrea mx25 board files")
commit 7c5deaf77526 ("ARM: i.MX: Remove mach-cpuimx27sd board file")
commit 8da4d6b2f798 ("ARM: mx51: Remove mach-cpuimx51sd board file")

The presence of these machine ID checks prevents the removal of
machine IDs no longer used by the kernel from arch/arm/tools/mach-types,
because the machine_is_*() macros are generated from mach-types. To
resolve this issue, use of_machine_is_compatible() instead.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/fsl/eukrea-tlv320.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 6be074ea0b3f..2e6abd620571 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -142,7 +142,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		eukrea_tlv320.name = "cpuimx-audio";
 	}
 
-	if (machine_is_eukrea_cpuimx27() ||
+	if (of_machine_is_compatible("eukrea,cpuimx27") ||
 	    (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx21-audmux"))) {
 		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
 			IMX_AUDMUX_V1_PCR_SYN |
@@ -159,12 +159,12 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0)
 		);
 		of_node_put(tmp_np);
-	} else if (machine_is_eukrea_cpuimx25sd() ||
-		   machine_is_eukrea_cpuimx35sd() ||
-		   machine_is_eukrea_cpuimx51sd() ||
+	} else if (of_machine_is_compatible("eukrea,cpuimx25") ||
+		   of_machine_is_compatible("eukrea,cpuimx35") ||
+		   of_machine_is_compatible("eukrea,cpuimx51") ||
 		   (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx31-audmux"))) {
 		if (!np)
-			ext_port = machine_is_eukrea_cpuimx25sd() ?
+			ext_port = of_machine_is_compatible("eukrea,cpuimx25") ?
 				4 : 3;
 
 		imx_audmux_v2_configure_port(int_port,
-- 
2.43.0

