Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304606;
	b=OS86hn+73HKGaYOa36EfPbR2ovVghrhBY6Gh7QetG05GPNHsHZKZxweADx3+7/BUMPnY
	 OSDDp9JhVFbP8sgDnwlkGUwN0JSQtY5bhO+GFm30p392d2P8g+UILQyACFOO2e4fZJQh3
	 HdRh5t6h88Oph34jAWNVe9+tOjcZC2f/1ZTphmsXCFUf/5NknJx42XWinfzP7GgKapIe3
	 hIwKH+OqpbGwgQ89V1pg9nUrRQ1reRz9nLa5WwUz1LggkJinY6autnB1l8CJ15iL84RZp
	 RpcAJMe7LymZH9oOEI/WvlC0nqcatFZLE1AwwKNjMiAKzWGnNTRdPecYKcCWKa/GtaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
	b=CCPL8cyL9YuVVR5yUo4v3vyYxnKY1kdViYgjk/XQclOikzM+1bfMvy1V56OvcvBOUZiv
	 MCFAwYbd0WZvM7bY/AGg/V4dVIERi9P8L9EYCizDQbsm/6x+Rl8TJ288cr0ReYTQNo363
	 yTtTwDFeJLVVsnqtKt0WEiNrY+6sLKcCbMgRXrZZ/0Q0dcP65jLqiQhs1OeKXRqiGLtHW
	 XFtElx8HxelxNmcnPHQijIE21dIK72GtTwQFEcks/HL9RM0WvvDX2IxQxgKBMEMQncQDP
	 JHu6dRFYuvmGgxxVHHz7KYbyCWw8sM1e3VfTL2shsZhOSyObyTMjfyBJCiUZPemmiCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iel46GNZ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655AB606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iel46GNZ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso1062184c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304605; x=1794909405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=Iel46GNZB4kiY8ZR6SAMa/C5HB+QeFYiIp5tH8vQEE3/n3TkHiV0HwpYCxjIVVSuLK
         GCRIDfS8I7plld3r7z2fkijPDvVOWf6SiueyoGSdLTmwf1y+1falsyY9aC0X3lAbJjxA
         ccxa/NXEzfPu4C6M+oqABLZrTTNkK8dLas5sptMm+CAVatYtIqfVgJV2lMaFmyghLofB
         3wvekCjhYEWO5qYKB5BbfjkdkodnLevGScviEHwi/+hVB7h3xcrj5f8egeM+otNH4Lw7
         aKZrQ5kZWxOue9EH9tk4iFCSAgi+pFS6TVZbaxpO9wy3yzM+FBzFm6YeaLOiw9CvOgqR
         8MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304605; x=1794909405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=FjIYBglpvDnVSRFzSImrd1PylJggvmA1XIOy9CRbrF0LAA/3nGHEtikf2cPVEyjwQM
         bUluCQti5WZsqHbgVt4DFTPLvhjMjxHtRnojXYVdWBu8QrjWijaFxvemLBn1HPYvZD0/
         ts6z7mT40I0xXbsTRTKQ0/Mp8bORN2WuNGAGPGbf8VKG1ltdi6HDmfPpt3KDW9POztOm
         Zm/trUSxLk2E6bRTTVYf/xtmLF77psYMER1H8Y621WeAA02h6qNWNT545Ym8sLDhV45k
         vwwUvc0LBtz7xzqcuKu8IbOOSE4mwQaCJA1uabUCm5c8PycvZDUKPTHVXhrFFjgpX/6k
         fr+w==
X-Forwarded-Encrypted: i=1; AL+hErEF9pUARjAT/88KwP5vAjUSXC39ZbHCJpy6/eL3N2cqVIdiJ7B7euJp+OEbnGsvhqSaspdoSvKxfqKTqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nx9dqNmZ6DPzb33erBbvH5dq2px0HyxFbOFDsYewO7rkqreMf
	T7+DIj5wGQEpZGIVW+bHf4SzzaLya6JNKdMxr+WcuZt9ITyWf9/o15Zg
X-Gm-Gg: AYBFou3NkXQWtynnD2v9lveAv2Na4o/ljGTdh3mlnuAZyZticsZ1Zj53QN0UE5WQF/5
	nH6lqcV4d0tJ++bjL0pBzVD6ycGGdozo7BHs0KBJnqlmlYUdz5NdLm5/TFQcRRTS3oG8Kg21S6j
	g+TzDUiw8N1NW/bqCgulWc4XI7SC1v3Kj5H2uodnMac7iS1fW9yLRImWx5RHyybm+eD9x6vOd83
	lN5WwXicVlwzUbNT5Imy1mx/LExPg9fVnBdDDA4/GU8AArCi7t931fcwdDwK8iJF7Ho3LQReVRn
	iydn1C+UGy0KKHpeiyyhjN2ldg+0XFXWG4OP6pgH1UrL2kpCyqW0/vD3HHaGD2TTirV62uckOnO
	weqx1eBlv6cMkMx8N6IJo1UDO6o4fhdAgU8eK7EtUaPslhruGyaqdFY/94IkEHs+T7uFJvBH8D4
	uJAque0tTm5N17tY824YGL4ftV6cL6ldSZRgg2F45SZaZ2+gT4/dbhQL9NWcRKTGoFAK3NsRqbP
	z692l4ktHwRG26/8Rl1qLjmlkZT5NdVyUh5sI1tWNeVQ28FbzzwVgIk3SHA9qx8ByVLPwgw9hyz
	wq9Gjh2UXMEgVZqkHLYupPfeySPDUmA1dX1nLXItrMVsbLoaTc4lDKcp0PlCVvp75XULplwxB1o
	GEuVBaqVgvix0Uo/3rOHF26xK9aX9mHB4bBBqycN4nij4
X-Received: by 2002:a05:701b:454c:10b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b3b605b619mr2801727c88.12.1794304605260;
        Tue, 10 Nov 2026 01:56:45 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:56:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
Date: Tue, 10 Nov 2026 16:55:21 +0700
Message-ID: <20261110095525.504660-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

Return early when an unsupported clock provider format is
encountered, preventing the function from updating frame_offset
before returning an error.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the typo fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1f4d06a82333..6a25d2a69ea7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -390,29 +390,19 @@ static int dw_i2s_trigger(struct snd_pcm_substream *substream,
 static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
-	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BC_FC:
-		if (dev->capability & DW_I2S_SLAVE)
-			ret = 0;
-		else
-			ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_SLAVE))
+			return -EINVAL;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
-		if (dev->capability & DW_I2S_MASTER)
-			ret = 0;
-		else
-			ret = -EINVAL;
-		break;
-	case SND_SOC_DAIFMT_BC_FP:
-	case SND_SOC_DAIFMT_BP_FC:
-		ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_MASTER))
+			return -EINVAL;
 		break;
 	default:
 		dev_dbg(dev->dev, "dwc : Invalid clock provider format\n");
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -431,7 +421,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask,
-- 
2.43.0

