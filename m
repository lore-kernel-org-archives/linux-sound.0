Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A736246766
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637539; cv=none; b=uuf9iIRjdB1tJyLAJOdugSz2tZZamLSiNrjGdWO4uLVthViHFBFPTkWeJCRbS9QvNcBe0FqMHB4QSR9HhOmnv5PBoWSfDT327uNlRE3bbcOKZ27P0b/XsGP8GWIXbdzMSZO91IyrtWv+e+VpSHZFbokG3SAqeL3ImoBQnB3mlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637539; c=relaxed/simple;
	bh=fvZVIobSVgA0V4+wbEQ8dctAdFoGdyKkjJ0YUscV8H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6xRc6+CO74XzGlMIyrc0LqMW99+XRDIKASsCwmmWXuetVyHUvK2hhKJnUZbGhlF1MKphSvH7dtQp3eEZ2LulkSsQjikQPraGWaXLpZ6w+jQOh5aT3HQLNdp9nUjIawmC+dAfK+x00Mw3qS0FBV4Pq9p2UsVYuL3mc4Y3INWgNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaRkpidZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaRkpidZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32ec291a325so4428631a91.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758637536; x=1759242336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XROprbCtjuklHYiP4Gbbtjd/RPICDKsyrvlFDi2oCEc=;
        b=HaRkpidZnPt9U2IAhKdSmWY9asS7hY1GLiYU3LMEb3G6qD0b+8QOycwTUgtQEUC51e
         okI/TKa6/lsVDI42AiGyYi11261wn918R3FHp7PpgC8X/px1MnfBLoZ1zYc+Z5mwxul2
         YvAy9Cdt+AgzBM1adTYcE4EzSS7pzghPRZAXalu+Aze3RtN6faPhoxRL1vc9tQv5amla
         3SLI77ySWUGcUA4SLx8Ck38xnBEmwvfRs/nZNj16QDJIYcBNHgPC0cEvCmWN4h82JU6y
         TV5jus+MHUduVb60pQlFIeoP3EXtvsT2cgWAdVsO2kTtdieL3yZfV0i9qY9dhj0maSjI
         PEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637536; x=1759242336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XROprbCtjuklHYiP4Gbbtjd/RPICDKsyrvlFDi2oCEc=;
        b=ELfFvpOsqvHI1fceiUKNiW8Ocm8qpCWCjYNVsBWhTKtEPOwO1kFjzzDYo+9N5CF/5J
         TLnLA79O8YYfncYg89AwG3PBwvEAg71t43l65Begt2wCXfZVkIsuVhKGmQ4d4LIXKa3W
         tAYrjgwGHgdm26ELk9nuCyCBLV3VVznUVBpty+nJfRQ0YmegFmXQqNoTsT+A1LaYitdJ
         znoc/WrAWD05xmrrhTscT2csKfdBnglBjjmlRsn822l5NBevxoJ3u32ZO6FeJgikdLXG
         KgSfDnp+A1uZwwrTq3OXLWfw7jIRw6qpfMGP4HMDKVKLnBt8gOGBdkZsjZjHrS6B0TlH
         AvWg==
X-Forwarded-Encrypted: i=1; AJvYcCURWh/8QhVAndcihHuGgAOn0izZ6gsH9KSO5h414PUVDCY1WIBXOrgv6OcImRJa6MTqTYzVL2iUsWkyuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyucJmZ2zF1/zf7MYsGaAhiHElUgFBFa8Nbi+zROu4z5kPexEvz
	eK+3g5vde2/ErrYt7XtmyNcaMCJpMSztABkK6o3RPQAWre1HS9AvExXjvSD6Enjm
X-Gm-Gg: ASbGncv9n0h05ormLGa06oxCd0SJ913DlU3FBPd+JMlq9OJdUsnSHHJkoL+KgKektGl
	XaCkW2749PK5q7I9NSwLGGoXEZl4e+2m+Eh9pB8NkRdTmtLD1aHLPRs8Tvu7dKK4rDE0g+1jJ3U
	ead6Eyg9AdunbIzfvIrxDpaIPaUS7MOsOxPo/3NPI/0gkOk8FD+HNmTzGQwytWDPL3R+MLE8dBJ
	Z08bIRx5nXUGNuW/6i8yO4YR2V7cE/LJKbVz67VG9ervcTULQAuvRnWd6Skm1YDxAOu+GlVg0sE
	S01768qYVSUyl6XnokDJc4rhNoScEZNRiEzmjWKiTiakGRhN9JSoaKHyyqvN46r1ylOPJReFrmo
	zllx4YttJ+ALQxjtC8tQ4VfK+bLhMgNbN6iwRgQ==
X-Google-Smtp-Source: AGHT+IGdLk45QVGsvBMFLlapJTj0bAWi+72cOD2C1lJ8mJoFxICxzqgCiJPBRNvESbhBP7jz8ig/2g==
X-Received: by 2002:a17:90b:4d08:b0:330:852e:2bcc with SMTP id 98e67ed59e1d1-332a95c4b83mr3635903a91.21.1758637536082;
        Tue, 23 Sep 2025 07:25:36 -0700 (PDT)
Received: from gmail.com ([157.50.55.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306061aa5fsm16092605a91.6.2025.09.23.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:25:35 -0700 (PDT)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: shuah@kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] sound/soc/sof:Use kmalloc_array instead of kmalloc
Date: Tue, 23 Sep 2025 19:55:13 +0530
Message-ID: <20250923142513.11005-1-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Documentation/process/deprecated.rst recommends to avoid the use of
kmalloc with dynamic size calculations due to the risk of them
overflowing. This could lead to values wrapping around and a
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array()

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
 sound/soc/sof/ipc3-dtrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index e5c8fec173c4..6ec391fd39a9 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -126,7 +126,7 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
 		capacity += TRACE_FILTER_ELEMENTS_PER_ENTRY;
 		entry = strchr(entry + 1, entry_delimiter[0]);
 	}
-	*out = kmalloc(capacity * sizeof(**out), GFP_KERNEL);
+	*out = kmalloc_array(capacity, sizeof(**out), GFP_KERNEL);
 	if (!*out)
 		return -ENOMEM;
 
-- 
2.43.0

