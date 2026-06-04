Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64C2BE7DB
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 04:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780548511; cv=none; b=Bf9CNva5wUjOSNLo+HOJRmvYoRfXtzmgdeG3ovrmKPrQIbHXVmaa7xC96T0uCLM6rVUnOiKp/yWBmtaQl+VXv4L/RjvM//6ygYLembPhvk4X+xguosmwChaIHxTkfk4x0sAGRxin9PSz4RljIG2VXP0xgkvlKac0ZC2guTdVsrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780548511; c=relaxed/simple;
	bh=llAd1H8lyiZEnfJoXn0EXE+R7fXji2BgraHZcmUnMIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S981byWs2oLWK2iKm6uk9bmon+6d7w2n1uoNFCG0eESrC2SZcTrR/0g4UPJk8MTQA3f9vKNKA2gXJKbEJmkMk742kBUEy97+Nka+9Ke+4vt/cfZsm71ChNJIEKgW0FWoizkiDuueUB2O4c2g3fCN2ggon5XeMjHlSxM53UhT4Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deqmpZKM; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deqmpZKM"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137eed84fc6so843662c88.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780548508; x=1781153308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3aI7dPhrsV3TCFil94rscE+g7R0gHJfHuEHtpUiLfw=;
        b=deqmpZKM3nRsD1BL1UZnGBspbAuHJ+ZA/3e+8Hgd/wSXwo0Dnsb5BppjBT00LcJjQW
         23soZcBrxFxjD3wfbeV5Nqe7kajit2Ep3DVJ9vpcIi56TS4pjXVRJbbBc1gtruiwyjJm
         Xd7gwiLtoh2EDqt6P7n1/Ut7/2omxLUKosFh98VkkKOwgaFQ5wN4yput4N2R1Xm2JqBy
         jmWMrNxZMbVLDiGj8C7IemgnhC+4NwSR5eYe92zkMGiAIwov0248AryBjTi52+67/LJf
         1zisUhpbYFR33lzDhMv34gpFVopuOg71DNMTZQ/pmdWfnv1cItt22onKs0A1hpmRzmQq
         y8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780548508; x=1781153308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3aI7dPhrsV3TCFil94rscE+g7R0gHJfHuEHtpUiLfw=;
        b=muaTNYd/JjvTV9Qf/fGeCnFEt0+Cna9yVmMrZkrT77pbDZbXArE9YeyrpFVL2CsUGB
         EsXWCILJwMo/bWi83Xii0PZqq3TxuFmrKm/tMu70kxUNqDfOY9vXtrGYQDrM+5pd1C0u
         xWJL1ZExzn+7E+spSn5ODH76605B42yi8T+XgUM1f15jLiWcmZIUKOwtPPNIFnkExL87
         yzHJi5eEMPt3exxFuEcCga7zxoWf03zXSgAoOCVjs3AxHjDs0dJaqV1exhTPXTiL3ObK
         csyfmfpH9qMVoVENeHz+RX/pkuZ3hJQhd9su0LqXy+4PM05orFnrrsh5k0BNBYeSO02s
         zi5Q==
X-Gm-Message-State: AOJu0Yww9mEfwz4lbBwYMYJAbTTXbVluEU/l4W/8AwJfZySHOpim1bA1
	OUaRanQvB2pdIb+S2jLExJQpVpd2vx/HEEOep5kD3DemMvKk9fvo+S/J
X-Gm-Gg: Acq92OElRTTOGGqFNat+lysh9B1QX57MXsAAlQWBbJ+ekJfE5QiSdYytQ8MCc3jlBaz
	D8OxmPW/uIcNrryqClnC0i25ExodCiVcBudS4D/BmI/nxSHKPfenIPsFkQWsDH00HN3Q8U/s04R
	aUGpQYAQUhgXHWUAFrEh6kZ8kURsnJV5RQKhMYVq2FnbcqcfOiX47ZWItsrrMFy9QX+bmFtF1YL
	MV5VD3QrMV7SY3wmwoZZm+01Dh5U/N1CTf4lK+VrjVuHeYE7A3PXdXTVFav+hVbYeMGEIfjUKUE
	tOrrG9gk8gzhzJUM+q91Fs8+v8voqpaErc7kDQxmS4mrlw6YBL/YhFxAcVyw19cn+d+3fyAfTaT
	YCzV7CITx0Xa6NI21p981FRspDr0HUa6HNFS/rnpSLuh0glu8q1V9Bpe4c9x0H7r0SFjqSla33H
	Xk6+IYBld8zl9VjdD+L8BgIBxVGdQsTEtMeh1yATxuCm+EpOS5pcs7dq+3pzQXNW1u509VO9f65
	sAqxOm1YN+a
X-Received: by 2002:a05:7300:5722:b0:304:5bee:f59d with SMTP id 5a478bee46e88-3074fc38dbbmr3389750eec.29.1780548507800;
        Wed, 03 Jun 2026 21:48:27 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm3815039eec.10.2026.06.03.21.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:48:27 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/3] ALSA: scoped cleanup improvements for ALSA core
Date: Thu, 04 Jun 2026 01:48:11 -0300
Message-Id: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtoAw71VcYOaZtpZHSlcSKMv
 budHr/D/29gUlUMbt0GVd5quuQGf+ogPjjfBTU1AznqXe888myMFpciCeMsnNdiSIHoer4kDp6
 gpaXKpJ/fdhj/tjU8Jb6OF+z7FzDwSKt4AAAA
X-Change-ID: 20260601-alsa-scoped-cleanups-2b22958dab12
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=llAd1H8lyiZEnfJoXn0EXE+R7fXji2BgraHZcmUnMIQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmKzDMMWW/8fNcctU8j9YpQQsGRo8u+OGvFrBaU+brle
 Vh39eYfHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjARYRGGvxJOU3/PVhZiYX7X
 UCbyw7+cI8oz6NLps6x3V72b/nnH1qOMDJtEtrkm/9b103XrL9ufeTdV9lXTm38nqxTexPPc82k
 oZAAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This series converts a few local ALSA ownership patterns
to scoped cleanup helpers.

- The first patch uses __free(kvfree) for temporary user control buffers
in the ALSA control core.
- The second patch promotes the existing local snd_card_unref cleanup
helper to the common ALSA core header and uses it for temporary card
references in the control layer.
- The third patch applies the same idea to the temporary OSS sequencer
MIDI use-lock reference added for embedded SysEx event lifetime handling.

These are cleanup/hardening changes only. No functional change is intended.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (3):
      ALSA: control: Use scoped cleanup for user control buffers
      ALSA: core: Add scoped cleanup helper for card references
      ALSA: seq: oss: Use scoped cleanup for temporary MIDI use lock

 include/sound/core.h               |  2 ++
 sound/core/control.c               | 36 +++++++++++++++++-------------------
 sound/core/control_led.c           | 11 ++++-------
 sound/core/seq/oss/seq_oss_event.h |  1 +
 sound/core/seq/oss/seq_oss_ioctl.c | 10 ++++------
 sound/core/seq/oss/seq_oss_rw.c    |  5 ++---
 6 files changed, 30 insertions(+), 35 deletions(-)
---
base-commit: 10a5707d968cf679d3ceb849eae5317b45c80c60
change-id: 20260601-alsa-scoped-cleanups-2b22958dab12

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

