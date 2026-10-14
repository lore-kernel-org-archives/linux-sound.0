Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01141F375
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959581; cv=none; b=a12OCilx8PE1KX8ORtE55D96SHfH55tmn11TTlwx2Etnxm7MeEnNqqHd3NzAezCytJErQkYzh4tTALSshTHNFvTexUVWfZgU2vypjHlDm+bs7HdXi8uR5exWgcwaGUuO2MdskLVWXsPELnZyPWolJTutE033tw5FW426Kb/qrrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959581; c=relaxed/simple;
	bh=vEN/UMx1zrNjObbZCoyXanSLOqnUY3l8miD5NqL+GXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6THhZDSbMNIuAuHEmTZF3LiT6P+OTqZlbqM2mWvrr93IIOVUzOamIkVobD4nEXSkFGJYGM0li2akAH1NMMbCCmWqpAIB7FrHa7J4NbEqsgwYJoCzszYmon/i6KsQVY2kbrfzBTJ964nmUE5kMkr57ChMbTjDc1q8PHgeLNWeqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+tG6Ntb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+tG6Ntb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1377778a12.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959569; x=1792564369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trefKx5Yq0uo+Qdmy9TW5HcZPt2sVHZtYHhu/AZ7XXE=;
        b=Z+tG6NtbFv720808LKrj+zmPHf1yEndI7wBv1asTJCpCQSqAZkL8Aj7TTaRNAhGzhC
         ZaDTFGLt7WUrOHo5WCN4izH4Cyy9HX97W9VZ7ECbz2M9EWb0sWvUIfdl8r+PKX4k0PeB
         Y+wR+kEVH4eu8bQMrZyjcTxuPXriwZUdpkSFaOjmwxpcDVFo4/gQmBtOGAufIugpsa6l
         OzoAVwW8AkqzswvtgOE/DrsjbTExktvsGXIsiYRtmaVvHjnezAMG3/hJe4A2n3x+DQHf
         jUjdlUa70i89H9WF/OO3sNHeGZWZG7mPhLv//UwefljHEfT7uUks11xH7fgIw6JHNDBp
         OILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959569; x=1792564369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trefKx5Yq0uo+Qdmy9TW5HcZPt2sVHZtYHhu/AZ7XXE=;
        b=CBRIlVOLLEwuQQ4tJv9gtYvGd+rWHbjzGX89CNtUPlqjidsCyWOVSJo9lp5Lnmlgcx
         R+PvmNFnUPpQYsA83ZsLxEeat/hC9R2G+f+FdEwCDQe4P8pJjkgvPscml0SYeSB5Xp4N
         ulyu3K1LonEyTuRifLQJ19KplIwui2wsfoW8NaYy0VYf7fbCBcVBhT8CceuAVLLPgp1D
         kQrzEo3vYMreedXpZpBPSTB0ieu31sGW6qAI3B3GVq6m8zz177IRP1+xJb7NzjHZIE4A
         4I7UaFSMSH+WIKaVpzGO+hvdSo+jS/5Qb5ksBfCn6g3KeLNR+m9U0Tn6HYyAJWAbdBdf
         OVuw==
X-Forwarded-Encrypted: i=1; AKwUvBx9PQTKUYJhmTIu++pQU2N7rWsq/FjVX1PgHJXFkC8Vcy1vr/J2VFIEcJaY5ZbUR9C1IjzMAVpsE/oSvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBMSndBJA/c6t7fqcghgn9JV6dhTLGbnebA3OHUebDTFYyD21V
	d4FUFfkI7yjuVRKVfQuviJ0Luuz1ltDUV0mne60it2i9szJzCHhVNjmV
X-Gm-Gg: AYBFou3wVi9GxcarpOlvbcyX/837+pDp6+IiOlwsN9ozUnhOz4CgbNXp/Gdt+YImJmO
	bq47vca9rumyJ0HJMYrdsvwoTbYjsAbFp/noedIt+ut/08yd09gz0N8CYgjPV6PvkS1RG+HNhpT
	qhwl49Y0enOeVWiRsPtmZW7KqPgWh056VzGgDXdz81tZo3j9JH8inzIQgyC2ZlRHHE5yjVal/fi
	JwxHy9XgQOtF+BJxk+W/taRx0rgdwbr5nQA+sOMpVp9q3fnKmcEB9VepoBVXVT0u6q1AylCPMXD
	cqJb+y+SgoHBy8AZ4936MocEMGINdPmz0WLW5m0Qg5JIW1fdGuE+0eY72IUDuA0xTd8yb6lI5ZB
	7IlvcMKPbGRpeZA+yyPsPAojJLEqT6C6/Vzp3Bn7KqMBr89Hfi27jAGQO4USZ6QpMUpZW7JVVok
	LoXN31CqLSU2NXYNo03CylTr69nvDAQKrpLyv/2n4Okdh9sPepfQtLnIF6Jp3s4qA5T9ooi7TUj
	AWnUzi5nPrDybQRbGSvVZ21WSA3QahdI+Le0KNH9w4Y1vth7kwtjuHve2YCD+H6B1CaRElFe0k=
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr11437513a91.20.1791959568855;
        Tue, 13 Oct 2026 23:32:48 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:48 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] ASoC: codecs: wm8990: Fix definition of right input PGA controls
Date: Wed, 14 Oct 2026 15:32:28 +0900
Message-ID: <818cf8d7ae81fa46c67cd5b4d01291a63f44c9a1.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The right input PGA boost (R12MNBST, R34MNBST) and routing (R12MNB,
R34MNB) bits are in Input Mixer4 (R42), not in Input Mixer3 (R41),
where these controls write the left channel bits.

Fixes: f10485e79882 ("[ALSA] ASoC: Add WM8990 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8990.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 11dfbbbdcd92..a3843094866b 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -97,8 +97,8 @@ static const struct snd_kcontrol_new wm8990_snd_controls[] = {
 SOC_SINGLE("LIN12 PGA Boost", WM8990_INPUT_MIXER3, WM8990_L12MNBST_BIT, 1, 0),
 SOC_SINGLE("LIN34 PGA Boost", WM8990_INPUT_MIXER3, WM8990_L34MNBST_BIT, 1, 0),
 /* INMIXR */
-SOC_SINGLE("RIN12 PGA Boost", WM8990_INPUT_MIXER3, WM8990_R12MNBST_BIT, 1, 0),
-SOC_SINGLE("RIN34 PGA Boost", WM8990_INPUT_MIXER3, WM8990_R34MNBST_BIT, 1, 0),
+SOC_SINGLE("RIN12 PGA Boost", WM8990_INPUT_MIXER4, WM8990_R12MNBST_BIT, 1, 0),
+SOC_SINGLE("RIN34 PGA Boost", WM8990_INPUT_MIXER4, WM8990_R34MNBST_BIT, 1, 0),
 
 /* LOMIX */
 SOC_SINGLE_TLV("LOMIX LIN3 Bypass Volume", WM8990_OUTPUT_MIXER3,
@@ -377,9 +377,9 @@ SOC_DAPM_SINGLE_TLV("Record Right Volume", WM8990_INPUT_MIXER4,
 	WM8990_RDBVOL_SHIFT, WM8990_RDBVOL_MASK, 0, in_mix_tlv),
 SOC_DAPM_SINGLE_TLV("RIN2 Volume", WM8990_INPUT_MIXER6, WM8990_RI2BVOL_SHIFT,
 	7, 0, in_mix_tlv),
-SOC_DAPM_SINGLE("RINPGA12 Switch", WM8990_INPUT_MIXER3, WM8990_L12MNB_BIT,
+SOC_DAPM_SINGLE("RINPGA12 Switch", WM8990_INPUT_MIXER4, WM8990_R12MNB_BIT,
 	1, 0),
-SOC_DAPM_SINGLE("RINPGA34 Switch", WM8990_INPUT_MIXER3, WM8990_L34MNB_BIT,
+SOC_DAPM_SINGLE("RINPGA34 Switch", WM8990_INPUT_MIXER4, WM8990_R34MNB_BIT,
 	1, 0),
 };
 
-- 
2.43.0

