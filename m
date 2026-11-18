Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997899;
	b=fq7Jy5bGbuafpao5Fb7mTUyeLCHYzpezPcgq4kLeFvqMcFaUJd66uPhR8cTgJH73tRh/
	 t1tdwk5nwDtm6AhXQkQEJhltRqElpNsKO2a42kIZ+vJEvoSCZLotVM1Rb+IBdx75KRdmV
	 8uYXvQrHY2yiLOE/D2heNT74Y66ASKHhr/4ebjPN9PTXJ0vBdBdWqQ25k4y8C8aUIE7mZ
	 DwljUTrijl7zgCU+CZaW3JH6yymc4VqPPI609/Sjvn9FGGd+JU5KZRBhBxC+YgJCmUV8F
	 YR73eJGm7aXyquIiQEwn1qL2bo0qeVMylv3bRYskj/MxMdHgCEse8Iyqw9aaWFWQU1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bnztXEWVlq0WgNonumco/L8/aGkUW12SZEgErtiCgMU=;
	b=r3jK4ZNT2soDRAlzAS71vi5QHEAYihOVM+JtDihtr68StAmigAsBe3IY93/0uIjr2A0A
	 JIlsSEEOJkxF/tN9FzSX6xONamNkMhUmM6OsCuDKuJ7e5kynj4UdoNSUSdFYv0UCgOrJV
	 OLCc/yDgtV45w4QPTsylctORY7R+xvc6poNggXGPxCCYe5no1N8/qpu9kIWLjOLmtuaTz
	 pSO5iivp1pWQ6zlzIehht0Ze3XrRYop+SYUSa88qe3PaoETg6r2b2KQDNSrcEhEM+yv3F
	 ez0i8QCYuZQk9+dy91eOHFQw5piWNG2pS3u0cNykJB6RSYXI7gI4+lE9jttn5/yAR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNs4ryqq;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10C606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 10:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B10C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNs4ryqq
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso442263eec.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997898; x=1795602698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnztXEWVlq0WgNonumco/L8/aGkUW12SZEgErtiCgMU=;
        b=GNs4ryqq9Fh0bDczmFrsxEM2JwcDs8PglmVanfJqBX3ZMpBAFo4DBKHdXqmVQsO2bh
         paQaIv9vUu69JBYgYJIvtt+gmiWHLdTyz2IJChL571JIRzIxAdTlz+mq8o1Sa3lrAjWI
         fmZN5yrQdzPtJOfbqPFKBVCW3VuQx34YyBMTknIC+nHS7x+mqOTtlcYRxl6AaCssol7P
         ubYp2wUy83Vnj+X/r1C6uIThyDoiTZeEisAH4BTBE/XXFzqBShUwPZyyNY4y75dNJh7c
         UEd5xCg3VspLk3KisY6FKtNSuP/1SuFlQKgHCfwPJ2zuvBVjhSUbOUc8QlNYeDLIgKxF
         qevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997898; x=1795602698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnztXEWVlq0WgNonumco/L8/aGkUW12SZEgErtiCgMU=;
        b=KWxDe+XneDT115z9+2jnAhZZFHaI7lP4WiZvS3K9JWEfBsIsRAijiOF/FwI7RRR8RF
         g08InBk0BgZHo822E4sS2XjZjnQuEI07BIKxGGlBuUQwbryrmXmfoSvgV/1HHU7j+r9F
         r0t6LzR0t60q0dWQ6Bz8RtF1RkkLZIhipx2HCSmFfKLhjLOfnV1TRVIFq7TaUPywo772
         595H/PoEEo6se5XyO+4V4rr4NQnpSZWiXteRWRocpT0BjFQdpH5BUlu+82bkYDWSeyMC
         crxbF9qs8xeHVSuZAnk/PGZD7m2LEmoJSLcOa2GvWT/ffK8InYxdXF5xI9QLOnfFffxk
         FY2g==
X-Forwarded-Encrypted: i=1; AL+hErHL1G5NyUpGryBYlarswtNAOXPXmHxcvOFGS7XrfTBwAdsXgDpA2hlz8w87gngXX/iKngCVjjHL5N2o2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jxOOThuZwijWcicf3gNjhUyFo1QfZuFYymzDKZpMImjlpseqh
	EfUfRhmXesnaFFyK13fHr8uTGNOac6JKY6cSKe2HybysLSPhbO4Q5HHE
X-Gm-Gg: AZFdTZcgxvdhVUkIscvWvLGe2acAwU1Yww1eD5T0WRzvz1UQmv3sCb7c8HwMTSZexYe
	axICtUCzBfnBwfgBO1Xx9b2NekXul3vcD08AUPMpQnDB71eOyrt0E8NSobps1tCUF5+K5YkqXOh
	S7YQqC5ssnwdGW4NxHU3dGNBW8VoJr8yVdrRSOCG5mod5mnLlZuRP7glOuTaW1C2b3AHozUofXI
	vwyT0Av9jT3Bg5gSre2HrE3exo+K+WNEb9yYc8kceMD5QlbXCn2EjLiHvKo1dglU4n91/J6WWh5
	vtcz75B4FtkA2AvXXPPtFK1WH8PdOSTsvYgK2S2fheLLv6LcIUeKz7ysGUcKSqK2SEWOWXOV+07
	zkNkEM+Tdapl6AgJ+gwE1MrpPbuE0YOedks8k/LawS73s5xPn0tgjV6MNPD9AUeS4+b73BovWAz
	HzKPs9LCpWv0kcHVoEUfdYRoILOrPvNvpgMKWZmiSF9dvFB0irLkA0iboamZLfqyyiCLkeCtUet
	KEmLesp2NMLFHsFnksyT1rXwHam1w0emAn/Fdg6AATd8olApGz39POHPaHxvqCBV/bo9ALvECaN
	ekM0fM7n3KXBDxi1nSFT5dlLcsUnVWvPRPtF4oV/JYzT8Nx5RY+a5BOPjEtGxFEk2ujMZY+uyyg
	gFnfxfTC7mmZ13u/3ySlWXte/NA6B8s5/PwIFNv7wpnLVwM7WcwA+XcFX8aXky91grx2FosK9if
	xokXa/BA43VPGhqWMg2AFKCvBBeIY+XEx/xlP/FHDDkw==
X-Received: by 2002:a05:7300:8283:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3828161e0bfmr1974309eec.11.1794997898243;
        Wed, 18 Nov 2026 02:31:38 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11457702eec.3.2026.11.18.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:31:37 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] ASoC: SOF: control: reject out-of-range enum values
Date: Wed, 18 Nov 2026 16:01:27 +0530
Message-ID: <20261118103129.113970-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_sof_enum_put() passes the item indexes from user space to the IPC
enum_put() op unchecked, and the IPC3 and IPC4 ops store them as they
are and send them to the DSP. With the IPC4 sof-hda-generic-2ch.tplg on
a Tiger Lake laptop, "Dmic0 Capture TDFB angle set enum" has 13 items
but accepts 13 and 0xffffffff, and reads them back. The ALSA mixer-test
selftest reports this as a write_invalid failure.

Reject indexes past the last item, as snd_soc_put_enum_double() does.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Only this patch (patch 4 of v1) is left.
- Drop the volume and switch range checks (v1 patches 1 and 2), which
  HyeongJun An's series covers:
  https://lore.kernel.org/all/20261118093840.3514408-1-sammiee5311@gmail.com/
  This patch doesn't depend on that series.
- Drop "report volume changes in mixer steps" (v1 patch 3). Its commit
  message was wrong: the mixer-test event_spurious failures come from
  the out-of-range writes the test makes being accepted, so the range
  checks fix them. Writing back a volume right after the driver loads
  doesn't generate an event on this laptop with IPC3 or IPC4, so I have
  no case that needs that patch. Thanks to Mark for the review.

v1: https://lore.kernel.org/all/20261117105953.188645-1-kapoorarnav43@gmail.com/

Tested on a Lenovo V14 G2 ITL (Tiger Lake, 7.0.14 kernel, IPC4
sof-hda-generic-2ch.tplg): "Dmic0 Capture TDFB angle set enum" now
rejects 13 and 0xffffffff with -EINVAL, and its mixer-test write_invalid
failure is gone.

 sound/soc/sof/control.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..625a17624f41 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -120,6 +120,11 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++)
+		if (ucontrol->value.enumerated.item[i] >= se->items)
+			return -EINVAL;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->enum_put)
 		return tplg_ops->control->enum_put(scontrol, ucontrol);

base-commit: fcfcd6db32adbdfe81c1ded257200e3ea6815d9a
-- 
2.53.0

