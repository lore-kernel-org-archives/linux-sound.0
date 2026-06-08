Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9234AB0B
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925984; cv=none; b=lKVshn4JBT4GQY1pbL5GyECpYzJz0KlssRDbfPGNfzO8Ag5ETEVarZzHDDT9lZsbQ3oH8bFbfzPfQBbGTmLSQ3+dVyVvUVzkZJO64vBuOJghmjipp2H2x7A/oEYtc4dw8MVr7Djd2PSVjDZEvCOHQ6/YfrugPMVuqJ9t7AO64JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925984; c=relaxed/simple;
	bh=C7dxKdcgfrcYjsHEoKJuUHkSmi5vz3fglU2QYjaF3mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gKbgqneOSvozGINOrzgKu47t1dJuFEkd/FTHEXpN91nGj50ThylN06Yj+wCe29MG2GiOwWBTWtkBEapnFL2dstzs+B1YJXXegv2Hm/DPfqN51+Q3ndH2Td6BG4EJOBz1w1YPFrUhh3DegEB/Mjrb/LX2FY12FpnELcxROYzYHkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Hhfx+5; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Hhfx+5"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30749947917so762608eec.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925982; x=1781530782; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=;
        b=i/Hhfx+5RnNHlTRYf2EW5qjCH77f3dxchZZ8PDi449of7KDyD+BYCjJshJhpvo5UtT
         Obwf/y0CtWUKwcMnQme0oWwyxsSSa2kUvMV+qcOTPTijMD4XQ7HTMPKh0vOMWqBQphBK
         7jyjlxJwrhxiSbI5/YNVUhC4gLe/fU6YKqD9/0lONrBaG+DwvQMTrDzEjoTqvsy8mPeS
         3GKyuIHVJyIhnL5GzXnwT1I2kV6gvXJrdpTOzw23ZPesKka1eNSIg6dZNpMTL5q3z7Bk
         SsnSw8KRXqXSZTLT4WQQLwxfRutxkPBvWLS6/JAt7nOBp21/RgMWG/D2UKKyJ2PknAzm
         9Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925982; x=1781530782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=;
        b=LEFOwuATBOoeLqgHqhVBiwuj98YI+NLFkITpPZjm6qJ3s9qDBfhi+EaABr08OFaCMn
         i/PkLk9/srC3JsE5s+H494MLjtprP84v+8FRt0Ip0Jx3Ufsv7PLniPFaIOsDg9wsZ4fG
         gBHTi0tpLO86plEG7m2AiyMfVgUbJhf6fjEHRH6hsen/YxNS060Mp9F0oO/54K2O/etv
         aXuNhuPBuY+RUmsO27Dg/wYEZxSQfzZa6l6OrbF7YDq7FMtTRxf8bkSvg1APV9a2CtcL
         e+ibsRtQIIwCGGg1teSALGVisR9xLgBQIdjYbzB/Ne5z+PRhpte3AfIpCb/5CeX1tuB/
         syTw==
X-Gm-Message-State: AOJu0Ywv1L2vcGGVgbdi6UuAOalBlJnLu43d4AldwhNsOACUI3st5JsY
	VUgt8VoEvSVAxq/Jvcwos027dyVm20uM/zBMMOp4R2ngyD+340AVx4CQ
X-Gm-Gg: Acq92OG1GO/tLFkIbGAdpXW00IBk+FD1aZ98Qkjo3GUf7YgpDuSZQ89DtpxC0aH+nM5
	hZgRKij7s6aZ7YkAyvIEQp9hUypGAoYCf4eSCbZuLCcZyynp9NgIvsCcitetcPXJl5KE8ytW/Fu
	HgcX3MeSZQd7HLKxJqfy1XW6E264TOKSk6IuKD94Jxkn2iFdl8zoYY7OSsRJufxXgwjKudk5axL
	cueSrJ4eJ3e3FHtF1B5rxcY8KcWI0WxYa0jPXWcH9ZqE2JX6GVpzRZittRC8BlFHZAADhP6oR7y
	d7exL4lkuMVDWOYZvN/X/2nLL4cxy99FUlK97EN5i/R/1aM8IKPN0duB3xfPrfDphRhacxjT1vd
	61j5b8Ea9pKHp/XHcAD+wnRbC0VI8zWresiLQsXAhdb8d3bh202qi/WUQt4AVjTggzQtXpL/LYr
	WtRMFG5C1f1FFUVjIKQiLCwlvDCHOT993J0ndbSCiwHFbTTYmTwHV92Z/hPooBm750wxywlzyJ7
	gdG6RW92GUbJ7fzd2LyKtE=
X-Received: by 2002:a05:7300:134a:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-3077b357e08mr8719405eec.7.1780925982244;
        Mon, 08 Jun 2026 06:39:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/3] ASoC: use scoped OF node handling in manual cleanup
 paths
Date: Mon, 08 Jun 2026 10:39:10 -0300
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTuQphLRq4iLdPKrEUlCxkqh9
 O6Nunybt5KiRihdupUqPlFjTg39oSN5+HQHx9BM1lhnnOnZaxbOE6ccwCq5ILC84NNcOAwjhnC
 2J7gjtaFUTHH57dfb3zqPT8j7W9K27fe7jI5/AAAA
X-Change-ID: 20260601-asoc-of-node-scoped-cleanup-d3be3d927e64
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=C7dxKdcgfrcYjsHEoKJuUHkSmi5vz3fglU2QYjaF3mU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxwQnzt4WfWDffoev+vtuCZqdWzUp9H6gV9CW54d/7
 FH14zsU2FHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQATufyH4b9jiF7l3Ih1zPta
 2D3jXs60qw3Yw7HjVMCsY3eufWo4pa7H8M9g56/tC5oEE5myWILa59V1Oebwxm7e8PT34faaH0u
 MtjAAAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Some ASoC drivers still manually release child OF nodes
when leaving child-node iteration loops early.

Convert these focused cases to scoped OF node cleanup
so early returns and normal loop exits keep the same node
lifetime handling without explicit of_node_put() calls.

- Patch 1 updates qcom_snd_parse_of() to use
  for_each_available_child_of_node_scoped() for link nodes and
  __free(device_node) for temporary cpu/platform/codec child nodes.
- Patch 2 updates fsl_qmc_audio to use
  for_each_available_child_of_node_scoped() for DAI child-node parsing.
- Patch 3 updates cygnus-ssp to use
  for_each_available_child_of_node_scoped() for SSP child-node parsing.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (3):
      ASoC: qcom: common: use scoped OF node handling
      ASoC: fsl: fsl_qmc_audio: use scoped child node loop
      ASoC: bcm: cygnus: use scoped child node loop

 sound/soc/bcm/cygnus-ssp.c    | 10 ++++-----
 sound/soc/fsl/fsl_qmc_audio.c |  7 ++-----
 sound/soc/qcom/common.c       | 47 ++++++++++++++-----------------------------
 3 files changed, 21 insertions(+), 43 deletions(-)

---
base-commit: 112b3b39550d94f94eb7e44fd865716835d9aab2

Best regards,
--
Cássio Gabriel <cassiogabrielcontato@gmail.com>

