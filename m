Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D03C9ECF
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325567; cv=none; b=jXd1aIoUqWqO+/28j80FkleuDA61FUUp7E3I/nGnFEPYTes7WUwdfQR1RUxuoTYvzZMvr9EHGsbIW8EsEReqewiCn+RVX4JSVY2n0eebch+3TEVR5ypIn/dfEcHBv++kGch5Zri+hZICWEJpUG7gNgRlkDPg0lyvdy+XmkiNjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325567; c=relaxed/simple;
	bh=VilKTMUODu88Eqm2Pw4VrVCsM/0NxA5+oGoozbxftRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rDZ0ejS9BGUIJzG8wya6a12P08R1gMHGN5ySsKTk4Pu/34O7SCuAM7Mp/x9UVXn6L2ZJpqdia1Il1qx3mbhgQgKjjhW1V9bYioatqE+smOG1YqsP8RD5pmlIKFzhR/vvRu2iD8j8UGmtdT7h0wXcSEWg6LKqHBqAxfP3jl2p7NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6FJOAZB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6FJOAZB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4597625e9.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Jun 2026 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780325564; x=1780930364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/dF/BREYgluq2yc7QavjflbN1wLiPqAZu2uhlcXNI8=;
        b=Y6FJOAZB8yDjysWv3nu7fp/o03l3h7cbV1W9kvYyeHEn3jiG0+OPvfLiRo6hFCtLrk
         NtP5w8CVMA9CcY9OBFJ+3W1/jaJEdERapLQUl6cHJXfn7EqmPKAFWooNwdfG3Hp8Bkt4
         7F9pzcHDfzmVo6Add7oKNaQM0/sgmcMJOGdV0rYNhgMGPFCWjgFNzoim6lA8jRbQWimH
         qY1S+EATKl0RY+TkWJOEK3UXEN7b3/8mcp5mXZdHRSpCDghGNWFuIDX6Hz0G/50OYyYm
         7+tcbV753xzbaOfQZyzkjeB8DihzsH3YKnmQ8WUfWSJOSxoJqTV3SZxTZ/1YZf+7wdOd
         ujjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325564; x=1780930364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/dF/BREYgluq2yc7QavjflbN1wLiPqAZu2uhlcXNI8=;
        b=dnivYFCcsliiVUpnxmZhwdTRjntdQ5AjUgWvwwuknfFsy2nsPNO0HvGPV4d1bLlIB7
         iFwL3Ld/1K0WAjkFa01/WlKce8k86kWweYsgeUkuDsZ5xKDLv96DJrjeFQltd6g7g36i
         xD5nbtoVGRbuwXAGrZUiYwjUsoZf/eIt5eAwMU1xbkW9ngEGtf7RJAgd/WhHgkvYTlnk
         kSzOMxBNq9w9R8hMUCNuZcxQoUcI1SeYCKzTgLruqplGLsUnKVm7PlrByC2N7hLcrN/Y
         +k+OB/1fnmXZNPTaElFFOlkjjAPnxlbrq11ICPmSCYDD7xrn9/Ka4AI/Q2/YHvtnzABo
         YhuA==
X-Forwarded-Encrypted: i=1; AFNElJ9e/SU16qO23UhUjiQ//P15JHbFYd4iyU4pzOhvY7B0jDUeKD6NphF1mXxtGmOLRtbo2ydjvBuwvoaUEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iH0M50ougFc/sMmUyOw2CzKnfKbYQvjOOkdPUoXnibe9K2rl
	x/E8asQaCp3xQI91NJ2Cw5VV2LLaL0Zqzl7CQvLXfEzJ/x9ky29Tuu1H
X-Gm-Gg: Acq92OFecJbvVtt8LBhpuaYQEvG8duZ3s8BhYHVTfUoBKpYrbZ8CR78d4atYB8FUYt3
	/eR8vDPfs6UFMu+QiwLXHQESjH4zHPSYBqMLBQW4PSEO2gQD61qSGAoBgmnUGSh94WsVg5JSawa
	EkUf8kyfzPxAnLSvMLiaRtt2ii1OP0tfJ6xFSGu1sl3TUhgGo+NyyxL7CEg82cK5xcKF9i+VFCk
	CZRMHMSRyo4JRsVCmSEAxDNaaS+FIErEYzdXQpQlq+JRow6Pf3E1bpFC758cc1jGBnRo2UDoBAj
	taPMM4oGWVYmmrD8SMjjSSLMykUhsiW1IN6QHTUwRyFK1g4VzZCK7DSRGwabABsTC5Rpcw/hRP7
	gVUV30S67nhGdW48ROXvAaoHsvo3iUyyQCbPeOeNNGobOfaL90n+fveNb51y0A+LIoDj6UAQ91c
	j3x3z0YVFcZLg8yC4LPtmppyCxedJo5iSdsoA2prbFExdU7yeXEnKbZEWI9dRU877iaIXa4dI=
X-Received: by 2002:a05:600c:3f0d:b0:48a:5236:7f38 with SMTP id 5b1f17b1804b1-4909c15cc0emr236803725e9.14.1780325564291;
        Mon, 01 Jun 2026 07:52:44 -0700 (PDT)
Received: from joaom-cachyos ([2a01:b340:60:2221:4a33:2a16:491d:b1fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef357635fsm24615795f8f.33.2026.06.01.07.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:52:43 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Miguel?= <jmiguel.ghp@gmail.com>
To: Vijendar.Mukunda@amd.com
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jo=C3=A3o=20Miguel?= <jmiguel.ghp@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
Date: Mon,  1 Jun 2026 15:51:58 +0100
Message-ID: <20260601145158.4113-1-jmiguel.ghp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MSI Bravo 17 C7VF routes its internal digital microphone through
the ACP6x. The machine driver only enables the DMIC for boards present
in the DMI quirk table, so on this model the internal mic is never
detected and no capture device is created.

Add a quirk entry matching the board's DMI identifiers so the DMIC is
enabled and the internal microphone works.

Signed-off-by: João Miguel <jmiguel.ghp@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7a637d6b5..a93a7fd48 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -794,6 +794,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-17LN"),
+		}
+	},
 	{}
 };
 
-- 
2.54.0

