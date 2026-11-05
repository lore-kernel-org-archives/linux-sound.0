Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875440;
	b=aizGHztZpm85bJntaH8yfzxHk0ChWqF06Xfnn+DAAdgPq/PwNaRNe0vJ18pfyUfJ01SX
	 EjTeK1DUUjvW0Xzz6fKaV5W1LiM5HnPDgQ9tEUlsmN15PZvMN7asfB3UNrRKLbOfcxw3i
	 WiHw3imQRlPQUIrY0vEySVyy/hONwXqt3dKclqDATYBdIM3Hi8V2Yb5RWmssyycg/HPFN
	 amq+KKjLUUv3CxkWfVU2+c/hg+XMvPCC9JrXcg8sczcRKOUNl6lLgnWIvRLdlUl8YQJFH
	 90gk98r89mitc0GUNpZH9i7MTM1xQuy2MI8PVzMif2zO4Qj/yK5pViGwenzBIKYSJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7a61XdNC711TnCfpf1e3aFAgR5XmE4l8ifMaRZC1SQM=;
	b=K3qoWAfKoOD62+QrWQJGrNG8h1ylCwQKhRa3NFHPjHHgaAP4mNK0Rb6eBQqj+GbViQMu
	 0m+pURHh3SeM9qz4QMq/IObr9hTBfTRZa0VMauq2vyg0qi47e/FdfzseO7eb2S93GEdv8
	 lsFJAsnkYKvP/Xx5GYiWvDoYKb7hPrCyNG+/skqR0greKsD66+3HV6qStWlN848kMGyX0
	 g8rkqtBvPphww2qfY++UDC2RDKsITbWBoiM1tpSZX/l/J34vtKwjo46he12+pt412+hMo
	 18ua2zGfkNES0FXYqClDIggIr4tlWE6L7v+g1AimYKM6EcoKf0m/Y/2KWNOFV8JPgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZWXlL4F;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790C6082BD5
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3790C6082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZWXlL4F
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18818daa3e7so78191c88.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875439; x=1794480239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a61XdNC711TnCfpf1e3aFAgR5XmE4l8ifMaRZC1SQM=;
        b=QZWXlL4F3ldbBvcVGjrzKYSmMFj5/3+qnrpEgFHEI8GNngFMxQELZVTpu9D1aXF6s+
         clm6MQ3Gb0OSD5ZM0nBn6dcekqm4qhwodhPVAQnIjN4bjT/EouDKI/TjI2hKj3N4Ow8t
         HzfExS/JK1eLIMhAcGYkkOLaWEZ9LX1XNDln/uk5UVHeQjgj/sMB3KjKmy6h8HnpX1yI
         fjYZKH14XyzssDBRBBBVAo2obwHLn7KwroPAGEfTmQlNEX/2qIivhcOkj2aEmrcCfzYH
         4TNicEvxGxVXQiEkcTWROQgqosinB1dv8J8qOCexgiKW1Cuw+3BN+nZNm4mswhta0Eeu
         DS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875439; x=1794480239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7a61XdNC711TnCfpf1e3aFAgR5XmE4l8ifMaRZC1SQM=;
        b=vT2aVFPbp5GSdt57a2WciO+7ZhduJbl2D5q0bxFT6+1q4JY4Fr3mdfnKwWkH662Mzw
         kWaZoqnVNn9A9AQR7bmNfLCMm6dUSyB924EnJjcQIk0LiCpNOw9JzydBM9xGGwMEcF1p
         sIH9fecnMBi5rVThztvLldQAitp0VvHqRM3kI3CtwR3Kyss0qoOujvn3e8XDFAgiZHdV
         7XcMtR2DnCyTKQZtSVV9RTlPR2yI4Ne2YAkR9I52ME5qdEXR2Wf33gd+cexRSTdDrXZq
         TIib9V3uQkSuk+1YgIjdJv0IfXccLo4K/FORb/Mt9FceM/O9YenXM1LMtCzBkZBlb+Mh
         Nrsg==
X-Forwarded-Encrypted: i=1; AKwUvBy4QJ0fm+ZzskgVNaq9p5PRcy0gbjZ9nerMDW/V6hwgdMZbwdWb+AZb3H4K1w5b+PPn/R96q/zYyMyIXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9O/DUATgCbEGKG4z4UK2KQ4Ck8PQUvjZqqfKkECvO+/8jx+ATz
	gvt9GyirmbDg1LtioiIaCS5Fwn1WYZvrlo4uRN4AExkyK42qynJP8E2F
X-Gm-Gg: AYBFou26tlrqdR7KC9VpvGIkgoUob2jRs5ncc8H4VXeIzvKUesAmyyk0R9DBaoKBiAj
	u7dAL5Z4njZCFDGJqsnCHdQ+9uaMuZe0PM0JRKR8XT5J574dXR1fhVWF8TRsHRlGWdI8fvW2CNR
	AuWYj5XZleQ0ITEytPDNCZ6sOFy6m2iVIBlsfgBxaOsr0yu+cyZyaJGPsfjuZk3F3S8rimEQMcX
	yYpjEUSQ7iY9sDBpiT4tQrupStXbwqtVhRPV501fe28J2wwWPRH012mHPNEMnbZIdtt7blTxoRy
	0224XF6FdkznB9kw+cEw0ex3vRz00+0WyTsuGuU8ABUzmwvs6WofdxQaCd6CZMghvamtq4EIsV1
	h7Eqb/GGk09p2CxH/jBYGlZp8eYo48z17zBoTTBadgvZYD/r42ofGNsz++HZLV2Hei0wYqqmxRb
	WL7vTCKGZPnNClvJ+l5CylkZ01rYzkZOXLvV+zKB+GQCQHCuQvI/pK+KWLreCILH9l/PSVS1t0t
	Vv5lW4LMvNGEtJOSEJ6J+Unr1Obz4jqmWPMJa2BCrD/pnPvP6ECuy0pK4S3xK+8sNO7S7BBXqOp
	PoEBTB0aXygFNAUs2VGim8NWQ0KJBMKlXDg7c9sktc+eR+FI6Ac4hQ/ygVXTA10Ok+56DGP6Ahz
	vPDl1bpnsLspP5KzU5Lclq0k8XPbJZE3P7xIjaPzWU4qJsC/Zg7WcbvIq7gU9iCYmNg==
X-Received: by 2002:a05:701b:4591:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1b24f45f23dmr2950238c88.17.1793875438944;
        Thu, 05 Nov 2026 02:43:58 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:58 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/10] ASoC: fsl_sai: Reject bclk ratio smaller than slot width
Date: Thu,  5 Nov 2026 17:42:36 +0700
Message-ID: <20261105104237.38542-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

In hw_params(), when a bclk ratio is set, the number of slots is
computed as bclk_ratio / slot_width. If the ratio is smaller than
the slot width, slots becomes zero and the following
DIV_ROUND_UP(channels, slots) divides by zero.

Return -EINVAL in this case.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5c50ed7c2258..c61703ddb6f8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -632,8 +632,14 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (sai->slots[tx])
 		slots = sai->slots[tx];
-	else if (sai->bclk_ratio)
+	else if (sai->bclk_ratio) {
+		if (sai->bclk_ratio < slot_width) {
+			dev_err(cpu_dai->dev, "bclk ratio %u < slot width %u\n",
+				sai->bclk_ratio, slot_width);
+			return -EINVAL;
+		}
 		slots = sai->bclk_ratio / slot_width;
+	}
 
 	pins = DIV_ROUND_UP(channels, slots);
 
-- 
2.43.0

