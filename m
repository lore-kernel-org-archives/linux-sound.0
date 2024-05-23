Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0A14A604
	for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716453788; cv=none; b=L6LFf5GrAW1K+jsvlvWuHHcNPybT/Wq50aFg8e8DEVx/dsaiTj3SrOAXD4IQ9DbtXaGnzQyAp7vyEtQhm6iAJUuQa0NOjGhn1gEFTA5h6JB73Fh1L/IMXU6Bfb03Hj7aYhJeB2y80gu4It3Va1rnfwZDUmg/akeHV3q04u3wV5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716453788; c=relaxed/simple;
	bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkUUOQH2p4z3gpRNmkHiSRHSnFtNsradDWtIFfSRE7OQoDqpxz77xXPRJQyu0gbf2fRu4G8hTiPsRhY7R5CyLns1yuYU06kX9bqSgvc4FrUghMbAjzUHIHO4DvS1PRvF76idHk+9ARoZ/qIcyhcxTpFrwE5t9vTIo1Vp7H2qcqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ReafNCjx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ReafNCjx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4202ca70287so10916155e9.3
        for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453783; x=1717058583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=ReafNCjxbElWBnIKRFCy4FzNdPRiEUSWOR7dDT6QudQk/fJu/jos6NMXfl7fUcSK0p
         kSp5YhPMUtyrGakgk9GNJdAIfH15hCBFI0/OwZ7S6yN3/w2DudU4Jta+HiWgYgzZv5vu
         eYE9UGR2/1nOgjrIgUnPM7TJDYaZYbDLIyh+5ZpoWr2iz9WxYfYRU/Ulda7R4qIoevqj
         S11pztRrsoGW7zntYTnjdGxky6nvmWbG15W0u1KVX+UJ3yMavrCcPGVbIUSqn80/JkpP
         6lOCmTh3zD9FgphrpR66L6lX75nuZCQqVRoUn2rQQ5oymDZpSxzF8i5GZNWV0YJVwx7a
         DdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453783; x=1717058583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=AIoe4SDuxSJnihg6ME+hXDsB05ECmgjKsVIHc+YEIPDZYAF3nN9XZcrvMSP/bcOwcr
         fJgmJsm6/dKn0V9M1eLxD6wXYnvqfduADkYnRFBY5qboqDETbS2nVNSr1p9EkvmnwM/u
         2r9JMERtj7luEW1A1MHGyKZMgx0ez6aGW71dHpXWlGbMsKc+14H/m0gYt5GLAX5bXTDl
         WrmoQ8u8kGqok7ColnmVxsP6n8qViDUjeWw/pHB5Ul/UVEPm2LLDLkJmSBl2mVCWKbIQ
         4Fygc5DZoFowJ0JpoymOmmtbIfL3RjXrCnCDm8rtpjvj+dcwnhrUEyNhWB+KrhPAxwP0
         7L6g==
X-Gm-Message-State: AOJu0YxVBbKR6K8xNgoOyuW2a5db3mFHNgyBHfSUqPsIiadwaNAsiHYT
	W1HRoLileBPbQIXeCC6AWEwgyCSEHP1eUDPwNHQFSHctnzSMTcuQPAahKIpIxxg=
X-Google-Smtp-Source: AGHT+IE5dWWG0c+IBofIOp8cWtoF1B7/E7D/A21kRQoggWPdd9XsJ9tvAA/f0S1hFeauicqTR49bNQ==
X-Received: by 2002:a05:600c:584c:b0:419:f241:633b with SMTP id 5b1f17b1804b1-420fd2d9c58mr41521705e9.8.1716453783652;
        Thu, 23 May 2024 01:43:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:43 +0200
Subject: [PATCH v5 14/16] arm64: defconfig: enable mt8365 sound
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-14-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGAeMm2VFcZN9GkMdr0FJVSFotJGXjeMK3NF9UB
 xvqSGZeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURe4IEA
 CkXwc+T+JuKpcUw+OsWLG9DvOuFqqn/iOv1GslfVfBGE6DL4pz/yxJgiZXsX+cikVBDluG3JA+JmBb
 wpcA31/8vLfnF1WWPrYxDVCdpYTZ/c42oSzdIfplNHVfMo2G0X9d2/twDo8s+ysw0bc+Cyv3oV46nP
 o1RSldWqsfuTeiGc2LLcB/tPXMbELn+CUPZwftVZ3aIali3oPFBxsJb2FIOVvjHgrdy7z44Id2f3jU
 nXXZaRQdF92D9xc6I0hPa/v0Taw4WOCtXa6A/+6oOZoj9szE05YQa9lBGzE4n7rkYMxgEutEiWiSty
 HWFiHboRiHtG0UCIPVxhjeLvybUbm/ekx5vYQkfx3UhlZmA8wIM5nchGLWQCzKeKFCjMVviNfyBMlw
 peAtkMaty1KguTMN8JotgxErvRmAC6ilS0NAzc39MNWnGt3ZbbNBXjAzdKAeu3u5VcmffTT44bNuKc
 ZUOdpJr1OntOq63IDoeMxYQwgn2lvCZiYq2PC4RIMQ2qS8Xp+wfcjyilDpPq+SdLuRZ35MvxmQKQdn
 0+9QLEIR2/qMhoOyAmu91+kdY77bY5mOK95Bd/oepQr4fT0QfzijsRIbS6auBKOd3IgGerun/vMZ/B
 H/8vhcqTw8OD912Wj5hbU6fMbjD047QOdf8pBEMVvGXnC5irCDI9m84q6ugw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..24b4d1a4992f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1

