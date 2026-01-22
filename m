Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B935B62A
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097323; cv=none; b=tv5cnevKAyYyArZERzRz7wjhh9o9Zynyf2U0FOJ2auh0PRAKGvgjoTyRyYTZynWYcVYlb6bTd0X6iiOBFQWGiHSVzskbXaFWJZjxLaFTxatu20dD1/V52v71meIeGlwPfxasFMuc18doIkykXKPfYfYVKFyr0vS/aTgeS7MEVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097323; c=relaxed/simple;
	bh=Fv4eY4ZAe/ifk4I9BIo/tRFyO/cE+seyo7xdkN2ocJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1zUzaCZvZBiNJjMAZUwVdgB7TAmpodtNIstgQ7Hkez+JLazg6nxO2gZJ9HOJNdGpwM/5+lmcXYLBl43SKkraF5QeqkCZZNUMBGEq168Ct0yBJb7uXQu+qLooliAAldNMVNS6WbQcN0YkHCYJPEHFcZUTKMIkFMJtlFWG/Us9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgpIKp3R; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgpIKp3R"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b720bb90d0so1066243eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 07:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097314; x=1769702114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Oz/tfZRKv6Pmtw6Fd2KxgTHXyb+JusOVo4ZtSAS9YU=;
        b=XgpIKp3RyqAtUQnEI1VgojIBbEKGSn1FCmb0nBTEhArp7RPFqcbKvqJB26mL7PiLn9
         ts/pEuqTZHjZHJIzXmOp0Ryo3y7oInx9vYUksdfboWe++0wQDv+Ux9Od7yprE9BtiG9k
         CfQITGotcM6Y6wX6Z98ksCBUGnQ7pAV8oi+AtE5zYDOJ/P86HOQ0jeOB5Aml+oG3Eam6
         t6dNhemOKKxl2GuEdXW/S1TBCwTkmbw5Cr9WvOKdq2+vPezegZPagrKw2BeWpe47eKdy
         23MByUxAP5nAxs8FjEkaAXcFA2BRJc4ZSchN3Fuhds7IVXquhdqdvKQ/bdf1m97LNMas
         Ytcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097314; x=1769702114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Oz/tfZRKv6Pmtw6Fd2KxgTHXyb+JusOVo4ZtSAS9YU=;
        b=MF5d9Bpexa8B7bqDR9BOQ3yCqBjEmtPMNcW+vbA/96k+wHBfB0I4xaIZGdkDJZfT8o
         we3WDh2TbfbCTO5N0WvnVncGXn6qexkEsFCww9QquwMvNSdTxXkkCQnp28XH9kUj+1yP
         8+lQZPB3T06BY2UHG6jqxqyjD7d0nvgtbkEKVlELt1BN6ehwMPSqiAynLQqDspXfxzGq
         /L2hZGvL8HkYY/X5FmdTiRxVd9bfWS0mFqK3vCjCCeAByBoM/I7HrliPm54RO2aTSBmE
         8af+5kv4mfq+5G9yIm/Z3bC4UsVqkB94VBSUG6Ui4EhQGpJdqHPfn5u9JW3S5EzLatcU
         8HOA==
X-Forwarded-Encrypted: i=1; AJvYcCWNBheAWxibrWvJQg7p/+SJDRZ5qCTxF6wPn7Skzj15f0oLW/n3Z0tEZDaGpkYmULHfKZdtlqWtymUv7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx68ZyUCcNptfSp+WhfUqkExfsluq3UXRxkuYlfbB7dVg1Kprh
	BzkJP1oIpxyMtLb9oXy7MePllTtNacezVHoz2wm2HcSfSYqjk9k6le3D
X-Gm-Gg: AZuq6aI8peRSv8tIvpV5IivNEiTMNQu2uh5XmSksIUd390JVCaw8WhPsqYqUk8lSlkY
	A7rOey25+U+CsHIRNjSkEaZ+G/NyDK9qVeXi82lnirpTuPEKT01AQjHIAUWY9D/91xzxv4EA4SW
	dq2gq0o377mRQCNwXWioUL0A4O/sh4tf0BxYctJjrqPXPi8NGqsYbUxWQ1WG0Olxe4bEYFirVsF
	RGzjEuhDcuJc7V30PvSg3IPtCxfWcHnzsGw3vY4wdzsQbnRi529ZvaMHJEqiVc8Wk+ZxlSDQUz9
	/+wRBaFCX9Du+2cddBdb4h4vkiAvCDbksQpK8o8/1jz4l/pb6Y2qdXZajbBVNxm4oBI4V0v4fvr
	9rPhUV3bFy3WZc4mRug+k1qC1dn92YpJrjEYgmDOGKf934huofSPan5vaZ6q1J+1u+Dl5Ar1Cjt
	BVGg6GTir0Jg8K8Ngx3IgGzHSkRvaHiJlvNOo2R5wxCMvLPjqtVDkBNXP/aqWbr3k/HVDt+T+YO
	Q==
X-Received: by 2002:a05:7300:7b86:b0:2ae:582b:db80 with SMTP id 5a478bee46e88-2b6b46d2ffdmr17440533eec.9.1769097313706;
        Thu, 22 Jan 2026 07:55:13 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:13 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 1/4] ACPI: resource: Add IRQ override quirk for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:54:58 +0800
Message-ID: <20260122155501.376199-2-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MECHREVO Wujie 15X Pro (Board Name: WUJIE Series-X5SP4NAG), the
keyboard does not function properly without an IRQ override. Add a DMI
entry to force IRQ1 to edge_low.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 drivers/acpi/resource.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index d16906f46484d..2ec5472aa0763 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -674,6 +674,12 @@ static const struct dmi_system_id irq1_edge_low_force_override[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
 	},
+	{
+		/* MECHREVO Wujie 15X Pro */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		},
+	},
 	{
 		/* MACHENIKE L16P/L16P */
 		.matches = {
-- 
2.43.0

