Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514194;
	b=Ip8uJUwE7s57nfoG7q0IaqQODwGbZlaVH+pDcYwHChOYk1YKW1/zznvN6wwuYSbcEi70
	 DFmpGvB0gNuR6b8bFl8GeGHUKrB0VAKm+drT4ZMVSTCJ8+EP6zNSVKQuEsHJI6AFML1RB
	 76B55fcqYI1D72AX0kWrqeNdOqDdpwWcHYlxxYxIFd9Q5dlZ4haogzhZoJ8RwaWnhJtQ9
	 LFcq0XWAC3i4lk5w+rNKqWf5QASSucE99fR3qpLF2A74QP3LzAtzv1BLji/rmuzQXhsBF
	 q1UliFrZofhAQwGW4CfKfn4XQ+gABNLDEAzZddZ/IUPW/h8Ze4aEjJrsxwJ4ZSbQTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xmnB05OFBqRK5KT7n/FEDBwbB7ml+xB+YEvxP4wnFjw=;
	b=wTdmiFJKoUSoFv1TdNuNmg+YRsB86zqZbFNIrfQT0aHbSkiDuhyprCqkv97H7JyRf4+Q
	 ftq0AsIF/6Jf4CAfiuwvCykzFg1LAh+EuO6yDKBOIKcqpxpTtyDbjWm431+87F1aFmJi7
	 AVBwaHx/rQzW0Z7Kfp7mIB+vtXLJGvx8mGHeyvKN8bhfI/5nuiAGR/y4mEEkSp2Zi0Haa
	 eIFz7Ud3Rdp8GNl1cINQNawYi2Y4+LSErLbZXB3CiXsSnNxd+RgWL6UDU+N9UsuTogdLu
	 UtHORGHqdOc5haiurTRv6unNX1IL+2teMw8GVqtiUz7TVJDwzTHg/mYBzUC9wAsmbGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fHI+3cV/";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655C606A32A
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C655C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHI+3cV/
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so2062475b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 01:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514193; x=1796118993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xmnB05OFBqRK5KT7n/FEDBwbB7ml+xB+YEvxP4wnFjw=;
        b=fHI+3cV/a0MWUI5HgdFWOzmhhVmUTFbNwxJbUBcxZ4xzVit/U8y7tMl9Kf9FDe2UBT
         wBvrKWbRSCzpTYrls+E7NsW0CYX8ljva+T1cx+xahKywPS9oxC1Jm0lLgJuCZ2STQLOB
         Ni5DQEmmgM4pCjopIF1vQfJWy5N9jqWFGnDmvAfVSbxUSU0Vt7Tp18Y6x291e+JbVclN
         3M9OTFe73sluKCdmyEimeI80uXtkmizi9jgoOKcQ6vkpa2kfsAJFJ9gsTxbdv+SZ3gH/
         IZnpl2knzm7IAXs/PDutvtWpgtDvRdV1RbO8gEwIskpYPJqZhySePA8aJHJ8j6VulQ9z
         1x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514193; x=1796118993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmnB05OFBqRK5KT7n/FEDBwbB7ml+xB+YEvxP4wnFjw=;
        b=23wdI/w3VZRc8qjNzt7v0rK1MAeBR9qj2TbuUotZUVMfAfDLFw6rp/THj1nynkaZNB
         1Q00+NBedUVX0PcLa6ud5Dok3V/zone/5fxHSPTn+SjjZnHS25GZMnWVoquOJIeW6VAl
         pCcRvHmMoVqLgWMMSMG4JU5q1hsIAxtfzB1TXrfpcWMYt71SBL5XnqDLzdcbSKtvoq+7
         TelqiIhTfMYLQso40xjpL+73wJ1nVLCFm3+g86Mo1+6GdYY718Sl6G6dN7obkWmoYHKV
         loc+02Yq2QD3aKcn5Sfu9vmgBqFmA0RkvckhOK0XJ/lqEovfNLz25gTnRigYBOA4BlXs
         DX/g==
X-Forwarded-Encrypted: i=1; AL+hErFiFTCa/76WctW9oo/pybRSptEjKMyp31wZ8ISKRSLF2QJ1F6oixHF1xUkuwKoIOW/0y+WkI7k5+eUPpw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xpyu2ruCZKHi4HhEISBrfDG8Gk6xAri51rtuK7ychPbxEH6FS
	eSW7KzuQtsSi+Tdp6ReKQ95y7QHd36iVKEBKESOyxT/NqfZ0596nN1U=
X-Gm-Gg: AZFdTZeMWVefk7djdI/reZQmtOtgmdEktojpXheIlV9fucP27j2ivsH7uPd589M6TcE
	GI+YBaRnMhdxJZPaADIPwB9ArSx31XqFHDClMCQhC3B3rTprc2O+HtgheLIFwF2r9fnRbaBvaye
	UsosI6G8s/g4d5WQuFd3Es0E4FZQkg0mLQHAaooVeRZ3FSbpTq2J92qAU3GhpFtrweHXxZbEul9
	IfH+7UEv/Obu/K0uIvjF+4urofDeXfHXgxRyZFXTFIKfLnaHB4qDLRMGzXFcIUaJL9jy/NO3maQ
	5pJc+C/E6cM8KrWcaNxdWBd+sVtd4fcaCoH4u0ikWgBYZWzBdds8I4FvehiDo5/xXZRGUCnelkw
	JQcTrrp05tQqpKgm6VVmXxbDypb30Ns8MT4v/7oQyiE569hB2J3M/ff3NIhBe9IpDKxuh85Rec9
	gtXovQo6eyJODlZK3DPtu2V1LFObHrld7vBMwbuYjWc49d8So1DsMEoPk79ehE/cwiw39X7GSm4
	JuZmXpySpwgUpCFLcIqlFOHVMZQ1vgLS2ruCgTg24RjYc1PPdHqdQP9X3MqlPHFES7eiipjVRVF
	hH6OY4vF4gD7jcDWNKFjKA5Sc/EHR0/D97eSq6VRniZ2NrLVR/P2H5KUZ6Lw3aF9HtI1
X-Received: by 2002:a05:6a00:4207:b0:886:77eb:38fb with SMTP id d2e1a72fcca58-8c87c480419mr11371810b3a.25.1795514193146;
        Tue, 24 Nov 2026 01:56:33 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm7075747b3a.19.2026.11.24.01.56.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:56:32 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: samsung: snow: Fix private data and node cleanup on remove
Date: Tue, 24 Nov 2026 17:56:26 +0800
Message-ID: <confirmed-20261105-21-73b8787ecede@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The ASoC core stores the snd_soc_card pointer in the platform device's
driver data. snow_remove() treats that pointer as a snow_priv instead,
so the accesses to the DAI link and clock use the wrong object. Obtain
the private data through snd_soc_card_get_drvdata(), as the other card
callbacks do.

Also remove the explicit put of link->codecs->of_node. After the modern
DAI-link conversion it is the same node that
snd_soc_of_put_dai_link_codecs() releases. Keeping both puts would cause
an extra reference drop once the private-data lookup is corrected. The
helper alone releases the codec references for both supported bindings.

Fixes: aff8d2bed9e5 ("ASoC: samsung: Add HDMI audio support for Snow")
Fixes: db1623faa432 ("ASoC: samsung: snow: use modern dai_link style")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, sound/soc/samsung/snow.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 sound/soc/samsung/snow.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 66ef49dff1ba37de3285cbaaf1293937d6bb0b77..64b3e2e41c2142117cb7d782b59302804d33dda7 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -220,11 +220,11 @@ static int snow_probe(struct platform_device *pdev)
 
 static void snow_remove(struct platform_device *pdev)
 {
-	struct snow_priv *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct snow_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = &priv->dai_link;
 
 	of_node_put(link->cpus->of_node);
-	of_node_put(link->codecs->of_node);
 	snd_soc_of_put_dai_link_codecs(link);
 
 	clk_put(priv->clk_i2s_bus);

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
