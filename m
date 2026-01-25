Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9A2FF148
	for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 19:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769370921; cv=none; b=IPK/yzDI5Bcc33x7vgfHakW0rVqvpO1XUxYukuqoXDP21CGAEWNqsfIyPkucGc0cYKIU+5RFn+BXN76YuVyu7FvPkhNga9fLrsS+063SOE5nCZ+FeAQ2fg/T5c0RqvZTk3Xvo+r6Da8u9oqsACi3xUG0VHj/TzcwDXU2FTBUcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769370921; c=relaxed/simple;
	bh=D63ElmkQBduhy9ArQk1wZYenOu2d1wELR3szcH7Qn6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6IDAjjbotQLkb2GLDcJweiWf3Oxh1fk/XUkdt1WLHInISnTyZDBgyAKDwMCCpghvIGUDid0en1ZC6DnXUTiQzMTIp0/jOB2CN4nu+l7jRVU1L9Zj6xphUSwkU4X7mS5JYMzorQoINN900e9aGtyALWyeGGeOC5SZdwkM94YuI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YQLUFVOw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YQLUFVOw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so32799665e9.0
        for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 11:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1769370919; x=1769975719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3C8d7oW/spXWKZtRfiEcajw3kftC+fH3zE+Rmg5G3A=;
        b=YQLUFVOw6vd19RQLLGM3NANpvxuqJY2Tsd2ebscq1pE9smslBWSwZdC7rqS4PHln5z
         R5nOLfHFbty8xItEEtgJ0f0OC7mB8V+hUy1jVNnu6T4BMrpGZgqCRGrxdm+7jM+/YkcB
         Q7FvKjAhoK+i6T1c3przW4yrNfI3oxTNx7snkJKeO+gAlv4maGYYfOS7wxkWU6PqVUHd
         HOdHkDfI3ySFH6DyvvubCb3aD4U3XUTFfcEhpYogUXShHV3JJ19OsrZ5BOM6s94/DhaX
         YNurH54MeaLoBY3TWpje3ylEjf12wabXVJbLiPwG9Z882qP7L+LztQilw0SOtXlCH4zW
         g60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769370919; x=1769975719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3C8d7oW/spXWKZtRfiEcajw3kftC+fH3zE+Rmg5G3A=;
        b=kQHpq/De8MdnPZga8RrRjsLL+M3b9CEhmS9ymofJ2saG9qZEcNp5mwfPAA+uDvwIc9
         HHdcnnN8J8wFt10CMFNSiZOm2HD9HoC8zb082M25JGnofkDvrUh8Eor4N0Q8Om+s/za+
         E4XIiNTAd/CpyD3cMZavj3sNrpEJpl6bL3jQg4H3FukKQETPzGqpPFARKz6fvON3izix
         uAzIxl7WgzXFePN8oYB7xG7uJwr7s7lRPPgTu+2fpkTGZ6hUCBSldnmT39r0QTGziJAQ
         TQUXiGyjMvqbdmyw7jYnmru/QnkIdIBcIp9XTExs0vzihYdyOOVwhNZGtt8n9iIawoVy
         LT+g==
X-Gm-Message-State: AOJu0YykXPwtcD12OKgESrMl2C2iyHAx5LfBYeficAVyscZvVZtylUs4
	EB7WmtusOLTfzNTuxHD7LdLtaB10amqdZeWHEuFgZzsHhkX2BLpqzrr1
X-Gm-Gg: AZuq6aJJPEvPFV5b+3fLE5XURMe1s7gZnR2ptqj+dFZeMMnGWzjs59HndXnJzlTF7uL
	SdLy/ZU6zj3kshrY/B2cKDN/ibdS7HPtcuI3CYjg5+jcdARSsRIBUrJKjfnJlv0zZqlmjYGXZnE
	t7vZpzyXipaqxMF1/dttZh0qIa6jV2canWul5qG7UN0Q1p7GdxD69dWSbo/u9wQUTDvpmKA0zzH
	3R6aTiZ2QWmPskbOvkctKkJbXrm962vSMnkXM2j+ULyJOWF8fgeMZwhg+bta2To7mXWKjE2mhtc
	Tu8NY2G3Shy4MDPhdA8gtw1gZqayIyw/AAgRc1B44iv3ui2r+wwkZkqWOI3E1b2kJJfSeTLcsBi
	ByopeXE0T3djwPuZAFYPWjdvu21tO/WVOHpaBq24gPCGORGwwLdOBGNCNB+ibEIAJpAO4lZeTF4
	+15pZNbkDshVxSmzS+PlYinxMjuD/0i4qArbQbaWxaJ6qT+RBOmgCcJtEq8ooXLJxkr0CZDYQgT
	d8uLbG2Ivcpa+lTGzZfOk4RM/IBRDmWgiU=
X-Received: by 2002:a05:600c:214d:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-4805ce56b71mr28944795e9.18.1769370918482;
        Sun, 25 Jan 2026 11:55:18 -0800 (PST)
Received: from alien18.fritz.box ([2a00:6020:9cc0:fb00:6af3:5a49:f677:3cac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e716b6sm24307680f8f.27.2026.01.25.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 11:55:17 -0800 (PST)
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	Oliver Freyermuth <o.freyermuth@googlemail.com>
Subject: [PATCH v3] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU
Date: Sun, 25 Jan 2026 20:54:35 +0100
Message-ID: <20260125195435.9221-1-o.freyermuth@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
References: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the necessary quirk for the Alienware 18 Area 51 (2025).
Complements 1b03391d073dad748636a1ad9668b837cce58265, which added
support for the Alienware 16 Area 51 (2025).

Signed-off-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
Tested-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
---
v3:
 - Fix signoff, add Tested-by.
v2:
 - Resend using git-send-email to fix whitespace/tab corruption.

 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c013e31d0..f486bd74b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -749,6 +749,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CCD")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* Pantherlake devices*/
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.52.0

