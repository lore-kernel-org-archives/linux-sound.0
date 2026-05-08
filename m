Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56F433120C
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778277488; cv=none; b=AMzcHm9tqiztjGATXNprb4YJlUiAdhfQo1M7XKAlXdM31t6Wo6PWQg6l4TQt13Iv52eOgXy/p8VIkUKTMDLk3b+CKPCA5qvnT36sK3jdgs8K+kjlBCuS//qfTtWd/9rmCHXKb6jtRjWRsELDRML1ZoeH8aq/Yv5d695rBxVs+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778277488; c=relaxed/simple;
	bh=IWVOtZz4u6tPdMLeRDxFe5RTpc+6TK3csNaUY8U5axk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQgNGyYOALcSfZxx2lyJZglEEceh1UU21joHWRPgQYIEjhuzpo+ToUidcbeRiB86BlbUxoLtdTynJ6ApG0PyKWrjLUSMW9/XyS5MibdYj3dXFskZyhHnEayktZOyWzRq7XQqIBmcl7PFhWl32SKy++7z61NpYiJGcgiOjnF8oqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aj6VHzqk; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj6VHzqk"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12db2e415a7so1828267c88.1
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778277486; x=1778882286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra1m0iEFt4Ii5As6pFE3oslI9m1TfA6XVE3WIA74PV8=;
        b=aj6VHzqk5Np9+61py4aZpRWUXQisbqWaXrxjaE+CbesmNeW8af+2z8lLzLWg5xl/9o
         7XJMBIHClJPhE/Xyb9Xmwmi8SoJui1KoM1+eAoUKXyPn45fNXKu11TUdN9WkGnMmL2Ue
         CwMWfyjNRchstYxcxTcxQLW6dIPY+CwcUnTiGTWjOrjAHt49ZvALZYzqWG/Ey5ImE8rF
         AHAYbRxov7p1rQYjx+GiGNuTRBxKfNdyQfB4JBuCFhVeU0P2NfFf5gwdxzlEyFlobLWx
         LsBroAmG3eJeXT+V/q//CukewvfP6nZu17AwE8g4l1LlXj7juC5qMiqYnzr+i3YEPeZb
         VXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778277486; x=1778882286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra1m0iEFt4Ii5As6pFE3oslI9m1TfA6XVE3WIA74PV8=;
        b=BNHQ97mKDm0T/Q50v40wkJT39k+RYbnSDs7HLBDX9GCXBbtoJecNem3o1Xd72NYHiU
         +pRrESMTEYGw9tS0rqhjUHK6JcG/y3464y0Hrghsf7k4AlxtkfSXtnz8Te/b8qjR8Lfe
         HGu7ehC/oTf7sXFvrbKztDnHQK84XH5jeufSZd1v7V1POZSxlPQmL+BOqrLNbBjgC7c7
         cdUlPMkZNkbNvZTMatDLGb47I3uZgjehJLgQjmwLH8QSzLVpUlX5rckuhTXFLXEq1Ll0
         e25BMT0NP4mL1Ga4uVeU5Y2J2GVrLbeigpaH96w24l4SCtJQRoBs3NNDEE6RMAOj8vgI
         w3Mw==
X-Gm-Message-State: AOJu0Yzm9p6u9gTndEiV2TU+t1Iq4R7ylxmoAAbKOjaF4lmIo930YTx/
	pCKNK0r6sm2Vkfo/8k8i9yR2nn5UueWea+4xQNpS9ZBt0MLvpyk6zxoBS6OshR/MnmI=
X-Gm-Gg: AeBDiet6PN1EtpFsf4euthXjNGTnoJ+NgrvgpVtIBueiQ/NXwNuGETEBolyI/d3b5rW
	tvSKKXLtJ3YdUG+MudzKYGFMfFE9G1PPgvclA2X01Bysb3lcECAz/D5sI3eXw8ygLdbRw9gPFwl
	b4Dvh9oQr0IVqgKRbyt2lsnDfOT/ZaQ9LT06mqXC4NCe3pobGUF1ZVS7B/mrFQ2Jb7R20AA2f2I
	zshU7yXStJgkSb6tfMb0/GmnuMTq6vddONMVLFJHmeHJKMAt6VDVtgXEIMJZ93nkMnDf5IbNgLw
	CJ0KbNuWAqIQ3uQvfozEgAZ7K0urSK6+bWNEwTIT6i2DtlVPYvG9HPpVcA4J1PwKc8q5AUlEAzo
	zCW6O4feGH/QboNYik7D9zCBl4S8GSkzg354OQtBsBFRIKiLiyr0ABBse0UAqm1vPjEKVvEEOgJ
	R1X6Ql6q2IFkSubYk4mhgJ321bhDgGS1NcgHDVX0fbh9RUONRl26N/byymTpAX+KA+cBd4gXfIc
	SopwWr1w3T06lN0tyhTJrVysRrw+k9XBQqszE4=
X-Received: by 2002:a05:701a:c94e:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-1319d14b3e6mr5825184c88.30.1778277485686;
        Fri, 08 May 2026 14:58:05 -0700 (PDT)
Received: from fedora ([2804:14c:87b0:929c:d535:fda:fdb0:eecd])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1327821fd00sm4928408c88.8.2026.05.08.14.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:58:05 -0700 (PDT)
From: Breno Baptista <brenomb07@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	Breno Baptista <brenomb07@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Restore headset mic after suspend for Acer Nitro 5
Date: Fri,  8 May 2026 18:57:46 -0300
Message-ID: <20260508215746.15564-1-brenomb07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headset mic on the AN515-57 was shown as unplugged after resuming
from S3/S4, requiring a reboot to recover.

Signed-off-by: Breno Baptista <brenomb07@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed859..449a5ab3b0d0 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3578,6 +3578,16 @@ static void alc2xx_fixup_headset_mic(struct hda_codec *codec,
 		alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		break;
+	case HDA_FIXUP_ACT_INIT:
+		/*
+		 * COEF 0x45 (CTIA combo jack mode) is not preserved across suspend.
+		 * Restore it before restarting HP JD so the headset is re-detected.
+		 */
+		if (is_s3_resume(codec) || is_s4_resume(codec)) {
+			alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
+			alc_combo_jack_hp_jd_restart(codec);
+		}
+		break;
 	}
 }
 
-- 
2.54.0

