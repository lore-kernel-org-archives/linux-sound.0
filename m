Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DDA4192E8
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009215; cv=none; b=t8s4f/k70K6zBFes9+KNgY3IPRDBB5BU6jmN0X9PjM2YDGHxgg9yFx/KLcxTgXnttfah8JnVOxp/Y5mKodzumcQiAQjrm/1zooHZVO7O44MYOuXS+BQnM1caZY5X+aHiB4M1fAyo2ERf7bH/Y/hU0Q2YZy/ZDzieDsi/ucSxIFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009215; c=relaxed/simple;
	bh=cjdOgadSSDaWURVAcDXO3X7tT56t0s+Rb0cx3WiAsrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/fn1ODR3SJB05B5biSVVL8zqjKbUt8dtOtFp0fu9i1eqzjC48zFa9vNrwhuF6LJ7u5lNFT7pT0UjhGck2vK6YKyl82aJY9WNMVyy7zNxiW5+Mrt7T0QYkUkF4uyrCVMvSP9vvHvtDJSQdnXbrqjarbUYYQ+UBYrFDIjD4XwMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL3y0fym; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL3y0fym"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf30d530bdso55017395ad.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 05:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009214; x=1781614014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PQFbh4iIFVpBQpk9v5GXIkfuw4Wf5Q5RI+306FTgI4=;
        b=TL3y0fymUnS21FHfak3jDQPPyCdUfSzY/4WnNkurt0hHSaYurxN/Hj7wLBFgAgzP3Q
         L3cqKzibp4wrYMw7AWeeBwy2OIHjpQjZP9lJ+bb5Lc62fUeCdvCHt2Wl4/eqwL1N0SR/
         Y4XSncTd5RtsZoK/GWlnZe7jnAcfGdLPToArWaf6XpSKQ75zZ10+yLUv+ylRDO2uhiys
         8AtMya79HC7DKrE3QC1E2SrA6jgs2lXP/j7utd77uVZkHG1Dfd4f8O9Usr4J4IXeQ8le
         UYTAUtx1tN9XRiZ5RjzYQRHuS4n8AT406aLQszbFvnLPhiKnxd8r4M91Q477tYFdHNIx
         v40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009214; x=1781614014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PQFbh4iIFVpBQpk9v5GXIkfuw4Wf5Q5RI+306FTgI4=;
        b=S/pKZgO0VKmSFG0xrxsw4SACTObLDI1Cx+ounCEXytS0bR0UNcqA3pFIO6+nGR3JMO
         oEtTcXxPSCGCqvkFsFW5twpgZ3h7G/czatg6tbatgzKW/6UoN4jXz6f44Lwgjz/0lPR5
         T9W9q1kb6XzJ8NXaTJPdBHlHjW2j+AmjIj4yozSS8aJgb+9/zdU+r9qNMuc883IqiurF
         EMiOdw/11bQKaB90LdRMnshUHq4ubBGMcZNRLuaF9V+dp7fii333dHAw+qzwe2C/gk21
         /spjM5dnWyuFiALArg2EmG/V4uy7YvvHWODH6rRyTsxqyQBX57jilBlxTUlDwNs6o45j
         efSA==
X-Forwarded-Encrypted: i=1; AFNElJ8oWRYYQrV28Mt/x/7ArnZY5qS7503Hy7EFww81zM9E20zWMySxyOSz4dO/wTL/qGc+sHxjAG7MLjHAbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwQt2gIWuQ/zqeGLD6pSGBWgdRgk0V2SeKGan8uoh1cJivFwn
	lShy5V8MsEVPqm7lDRp+aCsfmVkCt/x2EdoVePsAkEZkMC7Eg8AchHJZ
X-Gm-Gg: Acq92OH6lUeeGLHG5GA6hHW6zqaqNQG8+sD9fV8wD0TygVv6tmAE3V+lecVekIZ8H71
	5RMV4YizmmI8mywU/6Ea76krPjR1VEw0L7TEjHjnLAQeT9ioI+5m0gq0QMDO78vzeyavacnNxx0
	V8VlyBUOfpf2ShR9eEtThBD8SETHdiehyXVEGzd+6S1e985lGL/OUGPQFhzkcRRTySBJJu6oaEd
	HC9O9EUAHXF28TYtSTq+B7hXiZPIC6ySQlk4SfnMc2LMEkWRzAEP/QMSNXRVp0MllED4uKiOnmj
	lSLejj8oS7RVOLepL+7t8zu84iSDRpHEX8iv2ucqeTIhh/kqmvuXPMqSZCemq/fM4xDhHIa2c71
	Y/goNb38X4k6DL/0VWB6LhqjynCpZyyEhqPcdTTUNPdmC+4+1I7R6+i9SORLFhrPW9vzXfyqpJU
	8Yq1Y4ejYET5+AHqD9UYdYWQJMYDrzCu9B3Gz1FMLxntVCFfntj94nIwglkecCAlaoTF+K5xNE6
	2XBHcMDXa/aKL32i7+rzgRfbWA=
X-Received: by 2002:a17:903:1a06:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c1e7e866dcmr236923465ad.15.1781009213784;
        Tue, 09 Jun 2026 05:46:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:46:53 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/4] ASoC: Validate written enum values in custom controls
Date: Tue,  9 Jun 2026 21:43:12 +0900
Message-ID: <20260609124317.38046-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some custom ASoC kcontrol put() handlers use the written enum value
(ucontrol->value.enumerated.item[0]) to index a table or compute a bit
shift before validating that the value is within the control's enum range.
An out-of-range value written from userspace is therefore consumed before
it is rejected.

This is the same class addressed for the Meson codecs in commit
1e001206804b ("ASoC: meson: g12a-tohdmitx: Validate written enum values")
and commit 3150b70e944e ("ASoC: meson: g12a-toacodec: Validate written
enum values").

Fix four more instances:
 - hdac_hdmi reads e->texts[item] before validation.
 - aiu converts the item before validating it.
 - fsl_audmix converts the item and uses the result before validation.
 - tegra210_ahub reads e->values[item] before validation.

HyeongJun An (4):
  ASoC: codecs: hdac_hdmi: Validate written enum value
  ASoC: meson: aiu: Validate written enum values
  ASoC: fsl: fsl_audmix: Validate written enum values
  ASoC: tegra: tegra210_ahub: Validate written enum value

 sound/soc/codecs/hdac_hdmi.c      | 4 +++-
 sound/soc/fsl/fsl_audmix.c        | 6 ++++++
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 sound/soc/tegra/tegra210_ahub.c   | 4 +++-
 5 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.43.0
