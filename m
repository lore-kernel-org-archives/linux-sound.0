Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A964B2CD3
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404852; cv=none; b=OghBPQ0965WR9JKLjDiO9+qfct6DEvqzpLnDHLbPi+0kXXtv2QoCAyclKzIxI/IVFnzK2M6GISPws01SduYofNaXgKEJLFja9t6+hjVcemn+A4UbOpI2duB2bZCPJByI8LNiy2FaajLIFCuYV8zmtkpJ7ZHrNAnCeqiHNTq8P9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404852; c=relaxed/simple;
	bh=JxVH/U0EKuR4YXqDHVYox10gj/DArPqHrhBKFVk0k9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8B3pnKFWbWDWhRwbNBbNIK2HEav7zpujSuEoQDDhUcg49PTI5FTtxMMli4zZsQPv/9tqxNtpzBe82ESb2nvACG4TDdlRanzS638fClO8fXeGCxIJSKYmLiHDmX7Gi8at3tKtjWhsABsmPa8aMfHHyk5ugCuOfqdzjh4hMonfpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qg8a7DvK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qg8a7DvK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1631512f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404850; x=1793009650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vP4YGQ5Le5HIuJGSzxUdWfPQia5YJdsjfkTeNwdpcT0=;
        b=qg8a7DvKscBqaq85yMueyii7IiW5EzgfR4nL48Nq8xjGVJ8If6aoNmgbTcSBCpZmk9
         5toJiUezr2iMOyx8jygc5JkedC2eUdpA2Q/iN6HoebB98Un2YAnSv793RAhBJdsqrrmy
         vAt8jpx4y+ohjOxlNYtrVzJKBL78ymeP8Bs/j/a1P2T8bycyUYZdCQ/mBfIey/JngAuZ
         nasCCXDTHwBxlLwYEqp7+fTvv+MbvhMXvteSKqqJM4xbPif7Uj1Y78s0/tOgPf2kZ5j4
         pvUCaU9ciFS6fcB1K/5CDK0z2DWd+AnVlWrXVwk/m6aGORcq7gG+3pI8s0fpBHDZADW7
         jj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404850; x=1793009650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP4YGQ5Le5HIuJGSzxUdWfPQia5YJdsjfkTeNwdpcT0=;
        b=Lf3Szk4SErAz5Gr+K6Uwwk0jQjdNalZ2fNZI+RE6w5ynR8m3TkkpZNEG6TZz31b0t2
         j1mXU+oRuqC/x5cj0/Tw0v2hE2mt7UIagTasJDojRqLELSlAIOYOZBBnBRFFuLymz8yc
         ahw0r85oBbLNvVkWUys0LW58Ou5r4E8JcOhu8P4TmVgaHw9pfTGSHDvE6TdLztCvtyHs
         n7B0eiWBHfaWEy0VnB8SsgLtzqE56Ma25/jgrmYbPpIfSLuDA/TKkQMEB8t3FhofwGAD
         ke+CG1GBdSRSfrKA5adW7X89Eex7Y6FchEBjYGVTIRLwoJ4E91re07qd2X/CZBACrxtm
         dZhg==
X-Gm-Message-State: AFq9FYLOJAlplzzHRQYCWFYJUq6vzBiR9LVaaZgj6NZXSVU1psmFtp9J
	9nnI3IhJmFNbcl8rlGk8KJpfEgxwUdbZIH8FALS2AqCxJhLH0Grn73BC
X-Gm-Gg: AYBFou3IYrhgvpfFwcf2ZHj1oj3DOFp+8dyJdvkRgzaWMKSYsQjJkilBgZWjKyQJWTU
	foTB364xLiD6vL3OzMAzCKZPBtIwjJ/epujPK1W4AFjEelYCWd8XsChoNa0fAkUd6UUOI2yzSyv
	WPsCRGdAI1a0o5r38NwyDId6sEHcdhvqkLpSsIBZaEuS0UdC2U05FA/1AFkm5p102FtCXWetBxi
	NjxIKzi45NrIl1SYBBTleo7xakrrrcrKCpvbq6U2OU2N/yB0NqHyiWAagd3rMhiuo+oH/HEXKSf
	2DjaWTehN2DXM8kg1HUEeSTmeQt4CSsvgysyW9GAv4+/tBGkW6Izd0SrYyv9+GmN5gU94C8Utlt
	PZkxpzvh3r1WriOru2ujciRryKe1SMF0Rk23j0nB8hcOnFJYjQwJS1E3D4dQ8G7cVtrEsUKAEAf
	qN7CLPJ4TeC+XxeU0Wl9+POyZq+UX2oFqzj4jjuCtyhCI0WP9jWGS/UEXOmyjv7XHyjiKBq/SDB
	21rN5gx67v1AG0qgT4=
X-Received: by 2002:a05:6000:4021:b0:48e:cd3:b3ec with SMTP id ffacd0b85a97d-48e0cd3b575mr11780776f8f.28.1792404849518;
        Mon, 19 Oct 2026 03:14:09 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm21822041f8f.30.2026.10.19.03.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:14:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Mon, 19 Oct 2026 13:13:54 +0300
Message-ID: <20261019101357.117462-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   77 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  390 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1511 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

