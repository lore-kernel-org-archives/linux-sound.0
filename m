Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553717;
	b=aJQPgusfuUsoY/Jw40vAWoOKg7sliFjjfd6uiTtfn3v2/lP1KKAI0gwHgCSyySSp/Tr0
	 VLnGBf+ONqfYPnh7lUdRBdbdPFJnL53lzoQTcpDRcM0nNobpNHpqaXDqdilSMRBujQQtL
	 uKQuI7B8+8Rs+dzftGXORGJ9us1MGLFjQnnPgCWwZoyKZ18PxK6NVZ44oBBrCZ73ENY3n
	 CAMdXDdRBGPbcVe8NAinjlOTHdsfzDjpBd6AGWmfmM9/6jawZUaTK7iRRJJiCTNFnbEfG
	 ghUljRp6YTA1cs4s3r00roLRsP+JR4s7E5uOAHyeyf/VB53Xrl462A4bpRfb8WmfRdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XwQq4VnLXbeP8zDqe6ljK7RGgnNSD2hLCp0cnoXnZkY=;
	b=4p+D1CqRA20eJkUcGrk6SQWp7Kmflp7ESm3yqlwMvlQmxyFCDBuITB0UkJGAZ3e1Z07N
	 4h+IK9kddRwWtUIG1kHZJGZ1/XdoqDM4/sn4iMFC4PkT4KgCKO2HRTvgQxDgc5IQTPJU8
	 GcR7990GDEQZ4enrDj+W07Ts3DDG/3CSKEKGOvyRBGQuArBdU+y/8lmm+GyJiUdQu8Jzm
	 vI65U19HND8LUlXKcgZ54NGA7+JjJv9W4RUPUzKeHYgrBqu2pLJP6Ll4FMd5zgd29r7dD
	 dHGlOJz0HHCP6rj+43izzwoADTifMUXRNNUkqSQlycTtVNDZZxI6VsZ4SOTUiDKQChw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lNAliZbR;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6F60A2602
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E6F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lNAliZbR
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab395abf79so19036907b3.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553712; x=1794158512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwQq4VnLXbeP8zDqe6ljK7RGgnNSD2hLCp0cnoXnZkY=;
        b=lNAliZbRZepolAFL5w1/QzHVy1Hhc9QMo3Swv1kkIP5kH6VbR1UQyQOiTDRbp4nMVv
         hqdn1Z3Pz3Upf8Sku8O36Wx0l8NoZSIUQvQyBSodxisxbBYQk8ZQ9WhdlGhtZrV7deis
         XgkWHuIhVWXN9SLQFREMoGPVw/pxsPppgBUoUORl1uPw54YClUxBXjN30g8MrFwaBUkj
         6hPTS8Baj0NOEnMnPDzDSpUFyuhwiecTjzhX42XeQyfxTKWIckn3NdliXEKzN4bL6TnR
         Zr8YlEZKrHW2pt5ihR15c2//cwtPd3h8MW1yMl3TWa1+TAFXAIB6BQZcQnfM9po65yhR
         x0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553712; x=1794158512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwQq4VnLXbeP8zDqe6ljK7RGgnNSD2hLCp0cnoXnZkY=;
        b=u4/Ry8RS00tzZEn31ZI7mP7FdKSvawYkoZehfq7BNGGHR3MPyn7yDjA/hKOLbyE0Va
         RJ4bg4zAnXuwJB1QrkAfqUxRFbP/SU1LC00U1RDwtQ6gzT+7wT0S2fqpVwXuGYWO/FY/
         QfYaOdZ/4+/e5wYW/13fTy1wWMBY71cEO/ZaGt59OAWrHU9oFhZ0m30O3gwYDwVHj8Tw
         /L7O8TUFMeTZX8Hc+nN7YDoDOPUxp1FT9Fps/CH/BLLwhaSAuQlYdz1iktSZF4pCeyfM
         My8wxn6UsBeLc4tHCrCRN7TkdWOHgRAWUathh/3nFiZ48KVCY6h7wQD/yVzzWGpstY25
         GzcA==
X-Gm-Message-State: APuU4Z+0Fypk6CO7SXbFMsx21HP8NTR2PNXcN7lhmjCd/rLbQWiSHA/b
	49poNC7AMHeOnBSMrIyWn2vR8ooXIaEn7mfyLm25ZSgO1woBjnZh/uc+jPZ7ClW9yA==
X-Gm-Gg: AYBFou0DVg+Xip9hJNGQfAyX/H/tdkPCzyvXqN+/AlUpZGWwkN9lfEJSZ4/1f6Rkgou
	GLAvEgHLDEZ+zwWeLtutiinaChDbwpgF7I/nRnKfnda8bWQQiSFmYr4OpYaoP2oFS5ctwpmz5E6
	L4gban2V2LBcibKU6jvIV18g9VUQYUuYFYeiBdZ2B420PRcpRnLedvT3QqbGCXk6kHSGBgK8xt9
	nR2BiA3PxIj4eCozO9hml9XCzCcLsjMY9mls/4bGruYXXWa34ixMeNkMuQx5kND3IIrbfTrPGuy
	PEb4/UAsKpJtVtAciB01V8FpI21U61hajplhL5papVA0Pjlx+h2WnpeYDV60e5xcq91MwF7C9Uz
	oFShQ99kqQHBb7lKntlnas9qKQYh5+OQR1xWmw3MvpSN4YGkgUIzz01RK52Ed9jZu9MUl4+98ij
	95x2bYvBmeCDoyHCkkxWJ2s16toNrhAKBKOuEZt6ltWknkdLMtAiJxIKPUhNUVB+YSVPysKr4Vr
	nWi1CnSf5JtS4huqt+S2j+vCDIgXKW4rDg7HexubOZIsnIZkWChRyecgC8fAXnuY/4kIGk=
X-Received: by 2002:a05:690c:9d:b0:8ab:485b:9be4 with SMTP id 00721157ae682-8b2b6431e64mr58964837b3.0.1793553712575;
        Sun, 01 Nov 2026 09:21:52 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:51 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 4/5] ALSA: vx222: Make put_xilinx_data() return void
Date: Mon,  2 Nov 2026 02:21:33 +0900
Message-Id: <20261101172134.3451066-5-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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

put_xilinx_data() always returns 0, so the error check on its return
value in vx2_load_xilinx_binary() never triggers.

Change the function's return type to void and remove the dead check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/pci/vx222/vx222_ops.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index 40f3716c478f4..348666b422f5c 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -321,7 +321,8 @@ static void vx2_dma_read(struct vx_core *chip, struct snd_pcm_runtime *runtime,
 /*
  * transfer counts bits to PLX
  */
-static int put_xilinx_data(struct vx_core *chip, unsigned int port, unsigned int counts, unsigned char data)
+static void put_xilinx_data(struct vx_core *chip, unsigned int port,
+			    unsigned int counts, unsigned char data)
 {
 	unsigned int i;
 
@@ -347,7 +348,6 @@ static int put_xilinx_data(struct vx_core *chip, unsigned int port, unsigned int
 		vx2_inl(chip, port);
 		udelay(1);
 	}
-	return 0;
 }
 
 /*
@@ -374,8 +374,7 @@ static int vx2_load_xilinx_binary(struct vx_core *chip, const struct firmware *x
 
 	image = xilinx->data;
 	for (i = 0; i < xilinx->size; i++, image++) {
-		if (put_xilinx_data(chip, port, 8, *image) < 0)
-			return -EINVAL;
+		put_xilinx_data(chip, port, 8, *image);
 		/* don't take too much time in this loop... */
 		cond_resched();
 	}
-- 
2.34.1

