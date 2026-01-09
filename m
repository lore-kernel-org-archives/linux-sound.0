Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783F28B4FE
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970951; cv=none; b=sFDpkh861poR4zsRAQx3u3B7OvVix0TDWj0Wf0aJn/D3K+FmhLcnbbs8D7NB6qXWqOUesvlqmOX8iu3lD7kubrCEIbD2agHZJjcmXtO5N3TJwNmPS/YmEOGgGmoHBJedkhRvIQ3NcHGQl2D49JrTtTC1YNimtdADFgO/KXjn5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970951; c=relaxed/simple;
	bh=wRc5twflyyFQSILWhyg08ey4btvhfHooe2gCLfKHRmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=omab/SKnHYSIU9qiI72L78gXnoGTrdayKVXWbv67bih10ty63cQcXL3CTV9LF/Ky25bkFzPCJ477kpPm5VfD1qKqVcYIhz+KCTLB+haq6KHGfHEOStMTiNwOu4ZCBojD47+sE1lJrHPGmsIoCN7H7fcimXMgG+e4suVZaUploVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OP9P+Ati; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OP9P+Ati"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6503b561daeso6594771a12.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Jan 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767970948; x=1768575748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeSyD6yfhxvpe/Oaa7+xX4FTSI4jf1sOWdVvCt4V298=;
        b=OP9P+AtimVHq0KQKrUZY1RXODjDNWKv9gnhyoHq22h0/RbcnQ7lYEKSIHsKnsxsSKJ
         7NEumAoh5LmuV1xOn0SaSNdsT9dxp8hWBPtVvwxEJeQ08j/I4t8UoPxlpYwC3iep84Fh
         2UhBP5mCt60MzozCdcJm4NHAkEEPum4n6Xkx1bMaRMc8EGZ4DmIn2+ttkftZeJPqdfJD
         7smF5wSLTB61NwDXZPflmDjJRgSzkgVih3ArVT3yYmD91fRsXoFZllUCZKW0wAKadYE+
         PPgWyXJ4+/H2TjwtTAxSlWeVvAP1qR9SYsCbdYywuPkymj78o6u9wKhGPEirXta871IH
         NFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970948; x=1768575748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeSyD6yfhxvpe/Oaa7+xX4FTSI4jf1sOWdVvCt4V298=;
        b=BJ8SwgCQYcpkBMo3XlziPPJlUSWGTd6/qeAw34h3tPIlpXMhY+UZixOM5UxxEOHZOT
         SpsyVJHYMFWgDhy060Snf2tlIXmttr6A1XHYNyEkswQ6OMu7P7u4UGY6vO/zhgoqR9+u
         ydize18hFyealWTIvUq5MuV8teCHg4MpAIGKGtT6DK/kftEvH9e73199yKJmdJwRfV+b
         mqJHQnDsECAbiZCXDOB305q8Ra4rtlo4DVSJ8ypZy8OmXu3Z8fnmnWsqjy/iGMw4JAFq
         Jy1p67iSyLrI8eIei0f9YdPxS5wTdCDfzKH6FG4cqHU5Rlk4WxxyYp0y1hCfut3yaLrh
         VVCw==
X-Forwarded-Encrypted: i=1; AJvYcCUCHFn/L5U0l8yBtdQrbHwTYtUBbvqMJVyMraxA4gcQpW8oypTvYDnzx9MxSh/VhM7CsZwcpeQBlb5IJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIPaIPiLqWi4R9M5p0gFnfdEqjhUdpgWyypU8D1bzsAxPQiE5g
	+K4aPQ2dV5vXvd2dhixIbKOz4yOmXm8N/m8SVGXA4k2TszBDpqKI80tHh4hQq8y5ik4=
X-Gm-Gg: AY/fxX4XDY1q/I4qYIs/h6ShT6MSj0KXlWkgoIsDHraxVlpetG9pFPV2dY8NaLVJOQo
	anQY+z6H1lSuKiiltWFo0juK8w1c8M64D+e+VnFd0ckJ05vg0ht/sIRzyYArx4Lrz5RkTou0SoA
	kBuLLJtvk5HVDVMudnFT/GwnJ58oNV5oaaR5hJjv8Xx6i6nNwO6iaRFZH/7Lmy6fXibHzQyoQ2X
	oQjd9ExoeItO4wjyvZ2GwrgPeKeJMuMNkl0DjScldXvTdfvB1CLqhEP07m8xeiyTnDxJtnazxWT
	LK6edvIDsoUjXHZSJ/A79xgkAu/CumKMVjN9viOCkZ4bYgaJNM+hT+XN9Qf2JYOj3aTA8+g6Fl2
	wVcvo35BFmpnGba5Jy7CRgXTNTFcMqrODIEcIX1NI5z16aUWPVK+wWpSHYrwbxcvghgyk5I0Wq8
	bMmPNgc+QYEuPsAywh2j4EABq1ow5Xq71T+i+JMaaKsScNZSXg0R7XHyJkYXFQg3ZE
X-Google-Smtp-Source: AGHT+IEjfP6A1CmXs7mnARjKVxJhdK8lh59mDTvHmWizSVj8GLhKK2kEDHpDfzSLw+1QB+x6+N6M7g==
X-Received: by 2002:a17:907:3d4c:b0:b76:bcf5:a388 with SMTP id a640c23a62f3a-b8444fcea01mr1075396966b.50.1767970946131;
        Fri, 09 Jan 2026 07:02:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511546sm1132090766b.48.2026.01.09.07.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:02:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add devicetree support for aw88261 amplifier driver &
 minor cleanup
Date: Fri, 09 Jan 2026 16:02:04 +0100
Message-Id: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwYYWkC/y3MQQ6CMBCF4as0s3aSTk0K5SqGRaWjzoKibVESw
 t1pwOX/kvetkDkJZ+jUCom/kmWKNeiiYHj5+GSUUBuMNlaTduh/bWssYSh4tY0jHYzzxFAP78Q
 PWQ7s1p+d+DNXs5wj3H1mHKZxlNKpyEvBv9tAv207MZajv40AAAA=
X-Change-ID: 20260109-aw88261-dt-367910d29a1e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767970945; l=592;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wRc5twflyyFQSILWhyg08ey4btvhfHooe2gCLfKHRmw=;
 b=OqOnuhXtyziGYKDoEYnnsH0FVInvK21ffvcVg6UwstKtcIHKnMW+jrM3ZKsOPvuJtLOX9Hyri
 uDiFLAQzxPpBlSHo5kg355FyTfM7cPU9ylO2WEBrcRT1fs2Su1LL/a7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

A series with a small cleanup and then a patch adding devicetree support
for the aw88261 driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      ASoC: codecs: aw88261: Remove AW88261_I2C_NAME macro
      ASoC: codecs: aw88261: Add devicetree support

 sound/soc/codecs/aw88261.c | 11 +++++++++--
 sound/soc/codecs/aw88261.h |  2 --
 2 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260109-aw88261-dt-367910d29a1e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

