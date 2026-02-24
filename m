Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B072DB791
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959806; cv=none; b=VOP2v1m7KrmJ1BEZJAtIKNYrk0sLcYteujFRD1qb92AiFyoESVYv4VNb6u0L0BWyFT7IV3mnPs/Yqix7clTx9GyWJm04D2/vJNXmBMZ4SFOMHtsCG0Afs5w+q/ICLG59OVSslsrtx8iKcH85V31VqP9SWEKl/guMYKME4g/1rB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959806; c=relaxed/simple;
	bh=Yo76suvhUL1en35DD9SV1UNW10S+cu361AlsQ8KjMzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7JFJxPspqamoXB7aFm3MFGdezYKZovWg075N3+Cesj5M+zbDwcmG0w4Y42Ai+DBqj/V4LYhSwqpOnSPWhizKK2TDgEw5JnUedJs3NigLSnk5iNl53NpDFHaLfXCqY72YLFQwYpQ1ppEM9utthg9akIUsSvlGpWwAJw3bFfX1oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=REXwNa8v; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="REXwNa8v"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43984d7e49bso957089f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 11:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1771959804; x=1772564604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO4L/Bt3TEjIRcKhBTddrEpwrn0gBzXfgZYfP0GxXW0=;
        b=REXwNa8vZeGGXoVfSiIyKL123/eplRk8431TNBrnzqsUULueM4agPXxMCyZmgxNYxh
         2gNs5lw68NBKr9V8Yjy73WkLaD9bfGAx5sdFl4NKoauBORM/JEoxo1mJLByItF/DmCH4
         nQInW2gndtl97W3y6w1VQizjKlj1rbMxidX4hI/a2dV4qqIbzlb+AVcxFfYOT7KFvyoj
         z96yfRqctW1zTBeVkP1YIGAc1lA5v/ZrmZDGEtbE/jUX1k1eO6fsKoUNFdm5IG807ccE
         bZ45Lzusy0nFgoN2FeZIdbAomIHqzNJ/HF21qmRxBzEiLBFD69pu1zAxF9syT1Nimn1X
         TJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959804; x=1772564604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xO4L/Bt3TEjIRcKhBTddrEpwrn0gBzXfgZYfP0GxXW0=;
        b=OT3wvbDVZ6VXlt+5x6MsmTREQ1vlevSyQdDBDUM7rv5cgxLTTo7yEdGDShEKo+ABi6
         JJPW6TrHgUX5g23LBZt8q4H8mNU8PfiiL4PJ6qXN9d0gEHY/N/G1/rV6zgHOV8EWf+Of
         QjN9USBaMbwaRsEIKe3b7VzWyQValBoT0EQGSFFzttUP3n/wtSlSLrbSYacRjfHc64Yv
         BfKoIYD7f70saMuEuk+Poul4/m4ZEA2iN1PcB8LWbBqDkg2GQBoiZfmICgzn2KflYaqJ
         cI76SiX/onmHiButhTwnm/I9fDuoNt15IyvclPD1/B5SUvJcXTWetjm3Y47xcNPjY+KK
         kJGg==
X-Gm-Message-State: AOJu0YzkP474BkTt0YFj3qH2/uMGbs7SPz6Vzziu1sezflQgBKomGdiL
	IVWgj0Nc6aHKmsfRzzr8d9MTlhCflzsxCU23drVLDt9/CrA3V4+FhYGC
X-Gm-Gg: ATEYQzyZwA9+XKPXbVh8pWl7yJ+dgscpYl2uoAe5mRoBnLTCsqSYZ9pwL2BS6bmDBfI
	Cx4nTzwxazeMJoBYgpP9P1QrsP5GxuiJxF1DSLV3y7lT8VccvjIJg8A/2iMerXHKmVKtvrHGnAP
	ar76AVQyeYHIcN9ncPl85XFLzXEJcq2A49/MuPkULiostMkrX3O5VwWhjJTQ9LUFZagaolxi6qv
	dExseCV0wvYHh+O8Ya7cMNsM5LlQmCFeyrpJYDtnI/sw7+zToDYwEMSsAB0yR4/Knr8nW2GOggp
	i/z4lVcoQsOLi9VU2GQ2v7O+wwCqO4vc9lss5Sg/sD7Spc20nfapLhtzDRiTEtim9dBE+z0vHVb
	2IHWnFFdUuDOpABS0OJpY4dU9/Z3ZdSdsZae5AhKeCpDL+5PjN5FQwr5OYe6VRROvozSYZ7Rf28
	9sArTF7FDeCPqqvpELm+QJyQJ5/+BOQwVryP947QNJnwAKLcc5zwwU8/cWUGN4LbaWOtcHd10R3
	QTAKwS4fZohOcAT7gqLMTJ9URgs+HmW5FA=
X-Received: by 2002:a5d:5f83:0:b0:439:5ee1:f64f with SMTP id ffacd0b85a97d-4396f17b4a4mr22531894f8f.46.1771959803583;
        Tue, 24 Feb 2026 11:03:23 -0800 (PST)
Received: from alien18.fritz.box ([2a00:6020:9cc1:100:7a74:a8e6:b9ab:c014])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm27901886f8f.13.2026.02.24.11.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:03:22 -0800 (PST)
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	Oliver Freyermuth <o.freyermuth@googlemail.com>
Subject: [PATCH v4] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU
Date: Tue, 24 Feb 2026 20:02:24 +0100
Message-ID: <20260224190224.30630-1-o.freyermuth@googlemail.com>
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
Complements commit 1b03391d073d ("ASoC: Intel: sof_sdw: Add quirk
for Alienware Area 51 (2025) 0CCC SKU").

Signed-off-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
Tested-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
---
v4:
 - Fix format of commit reference, cc: the ASoC maintainer.
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

