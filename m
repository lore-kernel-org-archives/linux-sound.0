Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712367;
	b=MGMNfxhrDKc0xh0cpVYaaQZyckB3XVqU10Joi4Nnubg0vC/N6+bhBuPZEFtSSxhzFDOI
	 alWgyRKUM+5c1SDR+0cDr2Eqs2sz14ZwYVp/xUNrJ73K1qnQQ7er/pQu4Ayehb4qgRKsB
	 sTWAN8W7WHeSLvX/dV0uattRtMixE6Am+TCjv+204dSIju4HiN330Vd9JleGOuQCyLItF
	 Yw3w/zsH+c30U0Z1L6bNweBeQWx97iCpHdFg6TDw1ym14wprMkJ6CrSSh3uSdTH4R5hpw
	 vd96zPUvf4HXZEm00W1gL1xS/Rn4FAoDFxKutKX82HMJ8q3e8QLpL9JAHonb/isSrOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
	b=cqfjMmyQJNPAPRl26w69+q6QFGX0i8S7N9YONhsspznc5C9tnxIRUTVXIU7JGvugxGSE
	 NdEFJ8yHeN2thNG1sb3rc9xIJZ4dL9gXz+D7J1lZt0sHB8RH3ljy8OJRSZvYrvk1pjMZ/
	 7cqHQdpZWM+JgCq+xIA9PqEgWxkAgovq+W+N8Sdu88X/EhW40iZHDUEnVhgKdUvhNvTON
	 Uc42NT8fuveC5UQnQKUEW+w3W8J31bwCsri21yFx+AURCv4YQGNiLBS+HuFsjfpXsRT52
	 812EQDu3iS/I/Or2IwrztMHFrhYVvsjFCm8FsNQJsq/WqvWU+OaR5kcB/pHDRxz2CjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ppfNWBg;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B70606D81F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B70606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ppfNWBg
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so32036915e9.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712365; x=1794317165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
        b=0ppfNWBgtVoZKQtiorYg6NHu32WEIfRaz0+evkZdspVB25CLb70MHVYJ+MKxZub6j7
         8hTQrl1mE9zk56VAIQ6bJH7T1Lhrf07zPopW1mBuOrgg5cMf8Ba9YkauMCHj5EKYuAzg
         JUScLBeYdcHBRHgSHiCaDRR9FL33m0swJJoEiFtuxcvGBuZ+oz9Wdzymv1Zp4PUbgO7I
         8QqiWE5jCWga24OqFBmpLrah0YyyrUR+GAJZHwtpwkun7vp/PjQcjrePtlytLjkyhi/5
         Z+WjCMjc7cAsTmIW5HPFFiH7MpvkELElJ2yJlNDrSzx5Km1rLBNhiJIx8Jw8t+5EVjYy
         HNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712365; x=1794317165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
        b=pPmAV5d346hTQv14VTa3lkK628el5zLGZk+MZ6gmGjfcfp92JvKs/oHm2rReUbhsBI
         JNRuSjW1mK25oR67h/5/r5d08o+OQ8znAbaHuds2qKQF8SIrEXbNquSMkRktBOndztyX
         t4/fafRNodKtc7X8EyNVZLhnxF2UGrF38FBu9M2LGwuHE+bG/+uPt5s5Z5IGVn57ujUV
         NS6awQUCYgmPnf0TVXMYjsFK/KAYa5ILPqaLUNVS4vTa+ndnxnT2P3YT4/65MVzGm27o
         5f84g8sG73Hd2uDBP2WEdPHzKFs3HnfPlhhPdgFyANc4OUdU+Yj5WF8NcMLxrcDMYZfK
         wHgQ==
X-Gm-Message-State: APuU4Z8TCVRasms/qpdBzEf4lu+iQ5n5m7zKjmGQhus1G/BQuEQMsFaQ
	GDChmcinpZIasDYXjVGVZ3YuTpcph1dXZwYAWZcrTdBme3DEVpEZ1sqU
X-Gm-Gg: AYBFou2DO5Uw2sdga+6A1d0DVhDDxOmrrZJOGNdtqTVf8apo/kZ0UBpOoaL3sFUARbI
	ak+2mXagKoJB6xOQbMOivvsoQiHfNszNKnpjqKKZUpkaZt3o917eMtdJiSRs0zfOtSynRHphNlQ
	Hgc1foWFyuUHP+qkPyuPDvtgzOHAIIfMD3j/gmDCFJLbDFJwHtiqErdFUH3YItS/BjJAf5jDd75
	bk0QzZkswBGQZnj9fNZRSf4c5H75UPHxbW5J09ovbRWy5pc1Dm2FEXg8DQkSPeetxzeuhIbXnF3
	J3Vuz26qvhSQ2biFvZBhObnRRBTCHuGsOHPERzri9/+me5+0fPp6fa8mG88yvAHxjdfGLA4JWoU
	flJhzNuJ7vLiFwTduxwW+pvFkGAta4KotJ9IuzhnmkisTX5oR6Dnhdklh/NTcu3HFRX1BJZf1rI
	ITJtVQ2IjP2mElGroPtyi0TJ2ijK+uauBeCdbP1GDkdjQMVW8oNaNT+wk9/FzCNmabXl0zGEHNT
	l9TuKP6lsgcUKrGEo3R+dnEVJLNIrqZpo/pzKMk/6qmgrm5BxZDfTWD3QjZ8VF7SDgbKdkHeeiY
	N6KDZ11C1KSoNM2TbBljllft2ff0ozpIV7SCRsde1gcslr/50F2QruStFzjUm7f8riiShP2ppll
	N4ozDWmnwyG0OXveSZYJC9JY=
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr200645385e9.24.1793712365149;
        Tue, 03 Nov 2026 05:26:05 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:04 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 4/5] ASoC: rockchip_sai: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:36 +0100
Message-ID: <20261103132537.3717496-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
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

rockchip_sai calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_sai.c:1424:(.text+0x153060): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_SAI unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_SAI=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index e0ded1fa4da5..aba9a518d3b2 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_ROCKCHIP_PDM
 
 config SND_SOC_ROCKCHIP_SAI
 	tristate "Rockchip SAI Controller Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the Rockchip Serial Audio
-- 
2.43.0

