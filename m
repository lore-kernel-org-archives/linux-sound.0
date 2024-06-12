Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F89D1822C7
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211462; cv=none; b=dfMgMPZ2XOzj/ACT8ZJmnWMxK/JjhR6HsZVoS1bCW7DTZO53zHh34iqiTWeM4DctszjwJpsgKYSeO5zR20wYLUP+8BbhlNDAXFz8A+Hm5rE62oKIHMZvyEcGApesKgq3pyrTlys7BVeyosZDweC4c/X/z1CRbe9d6lQ3nIbeOCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211462; c=relaxed/simple;
	bh=wN0d/8ELr/wL1/Cpgz+AM71Z3Ev6/U/uMM5xUQsA7zg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nVo2de/ddGURRMiuRnrdCzA6hDW2c9Rl5EMJZ/iJdt8iZF5o2dHfkkCHuGLPwuWWafIv9WsuR7u4mKXVxG17osQw/9pq/PIJfa6qY49Ka4G5cZNcZ1qeYVOt0P/6Idxh5LORX3PIpEx8sfhmS0XY5OJvpER/A5tuclr1a7ynkgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kp1Z86ah; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kp1Z86ah"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63947so3596204a12.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211459; x=1718816259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++OGzFVcBm4uEhH5yU1JqM6E2MpRXisSlLqZSmtECO8=;
        b=kp1Z86ah6ErKtLpl6aWPqF201ry4AQeS8gtA7FAEMX0GX4jlaDQJdT9fpMu6Wdk1lI
         1chBo/KPM1//lBi+rcSSH/fFp+jd9KH8rGMlPNciZBuhHqJO7564qHWa2b6qU0y+Ocmz
         KLe2UfPr+/IcezEySdtfXPECohYJpGxcXmMKesH2TsOCTbuOWGw8KbBndsHQMcobjl/u
         iM6CqPE/nk2IR4OcvrU4uACOyU1lT+orR9TEqXHBPs6B+iNfGa4GJDAmBGJFDdaEJ3wG
         Wg0vZu+xuLzJYnVR3188Dex6nv6O9SR0aWszYWqXw0Ld2WrLWEkUjMNPFTWrSE4vrEpd
         N2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211459; x=1718816259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++OGzFVcBm4uEhH5yU1JqM6E2MpRXisSlLqZSmtECO8=;
        b=HYghf9c2wPlh+bG2NEMhxc2YLVSpIv3hY8vhB8/Jo+SwKp/4rm75OroSSRtvpYVcjZ
         GWFp2C79lMTDQre7hCQvp1BsGDiqkj2okGhFBV+1AgOoaaIVC+mN1kmVY/r9kTACfA3Z
         kvTwspGzY4j6zEY+by44Gs6lShySyALLcqxEgnduGBB2pFZTNRpGepyYdTxR+ESiyT/G
         Xx62J2PgGMb+1BGlt0L+QqEBpjFHP8lB5KpBm4edg1djhr15ls0u24AWR8z7GTODuARW
         eDCeV1kZJcipiNPb2BqEnBblpBqcwFJnzjhnwOwvNp2up2vIy27N3FJ3eBRmBUm+A8A6
         Sbdg==
X-Forwarded-Encrypted: i=1; AJvYcCWRhOKyKAbWwIC1dpoFoc338F0cUFrhVZHGotihEj/NWSaUCK0x80rqkQHar39f30VNG2PtNeGo2edBbhv4E6p++RWX69O7ptkOUgY=
X-Gm-Message-State: AOJu0Yzm474Vk45+LsCd7dsUe0qNVkWZh2moy0sSroZ7Es1YxosXPx6c
	l2VUmkEJZtd9bp/uqKU41qyaoZuXXmnMreqCTvV62FcLVhMx9elUWOUzQy8/v4k=
X-Google-Smtp-Source: AGHT+IF836A5i+me8GLcRRQJaRgp0OVmTJirfPxSvaoJYHrk64DZsC+Tv1+4VFubuAyRndBPcsBGRg==
X-Received: by 2002:a50:d6dc:0:b0:57c:748e:8c57 with SMTP id 4fb4d7f45d1cf-57caaae5c4fmr1629719a12.37.1718211459331;
        Wed, 12 Jun 2024 09:57:39 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57ca8caed84sm1564048a12.43.2024.06.12.09.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:57:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/3] ASoC: codecs: lpass: add support for v2.5 rx macro
Date: Wed, 12 Jun 2024 17:57:20 +0100
Message-Id: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDTaWYC/x2N0QrCMAwAf2Xk2UBbZ0F/RXxI28wFtBuJFGHs3
 +18PI7jNjBWYYPbsIFyE5OldvCnAfJM9ckopTMEF0YXfcDXSmaYl8IZW7jgyNfoKJUY/QS9SmS
 MSanm+ejeZB/WQ6zKk3z/qzu0Mzz2/QfybOppfgAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=wN0d/8ELr/wL1/Cpgz+AM71Z3Ev6/U/uMM5xUQsA7zg=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmadOCosZkrFenGj0f4v6e63uCrImo/xB0NSFBy
 7MarRKB6YSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmnTggAKCRB6of1ZxzRV
 N2ELB/425bmlrp+cAozeGyMGB7MzypQjhkcZfef10UJpMmk9KWUX9JXme1UsbIhEZQtPEd5lpkr
 UgTyqxnVH/ustTMcPyWH/HbBx6/5SLHpT0d39gxe4yuurbggrKwl0y2XRfeMsRqgpzOribmyl8g
 ZLRm+T/zMe944k4Hu5RtAZMW0G0EmodGZExlt69yl56iG2Zz/TMI2Ty3GuFEhRgrAw6ZZWXizPA
 0oCOUfIfkMewz5nl7HgV2oHhtGF/2XSUSWNMvwKcUOki8PepLl8T6OV52XgJo6N7GgHUAJQXu1J
 3Bx5zJDJlTeYe6bsPgbt8MB3irCMst43fiF6gAKgaxJcvpDV
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

This patchset adds support to reading codec version and also adds
support for v2.5 codec version in rx macro. 

LPASS 2.5 and up versions have changes in some of the rx blocks which
are required to get headset functional correctly.

Tested this on SM8450, X13s and x1e80100 crd.

This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.

@Neil Armstrong  can you pl test it on sm8650

@Krzysztof Kozlowski can you pl test it on sm8550

Thanks,
Srini

Changes since v2:
	- added some locking around version variable.
	- split 2.5 changes to a new patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (3):
      ASoC: codecs: lpass-macro: add helpers to get codec version
      ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
      ASoC: codec: lpass-rx-macro: add support for 2.5 codec version

 sound/soc/codecs/lpass-macro-common.c |  23 ++
 sound/soc/codecs/lpass-macro-common.h |  35 +++
 sound/soc/codecs/lpass-rx-macro.c     | 555 ++++++++++++++++++++++++----------
 sound/soc/codecs/lpass-va-macro.c     |  29 ++
 4 files changed, 490 insertions(+), 152 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240612-lpass-codec-v25-4e960abd661f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

