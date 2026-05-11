Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C87A3FFAB2
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517734; cv=none; b=XnoCjqFVVa2Avc4NXnBRG8bAYDClMOtiLHZ5R1fFnjaMhjtQktujKRhLxLdYk1xrYF0a4DzZf1UoMPA3nqt45dzHfUkga/w9ZFrHMLld/KEqimzplQQqZozELGqw/rMY2B3DzmqtVxJ/fazv7ojmKa5e6rgCShkce0mC4KwJVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517734; c=relaxed/simple;
	bh=Z4Eg+1wZW+YhfJjhKCtqxBMh1iW5Hf3SO+g9BfSdFxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W0mcOYdBH+2KG0RkbIxzntqinf2+Bcg+05gEcxzF0aEJWycTSHU/XtgQq4HsgerZHXDlV/IXIHqbNmWrOx99PKPGgPQgsyuzQsPMjIQcpj6USnXPabmc7mFFjeQj7m/urmY+QUxh7SA6VwyvgR1RvXpGh4/eRcc1XRWrteHz5AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evmfBpoz; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evmfBpoz"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso4399237eec.0
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778517732; x=1779122532; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2w5CvJDRNz9gD8edH36LDfD3QBbVxdVLhU6PUPP1w/U=;
        b=evmfBpozyDqmQnplf1KdBdUtGY95JD1DwW/gKNqf1xFGZWbhryCcBtnF0D/sAiPaPt
         ZJGKTQSFBwzoMPpzZoY35o5lZkW14Jx2XJoU/4niinxxnguOcyIGJ7dWXtjUDGgzAfld
         AO1Y6yGW7qR5V5liMO44KojcNl5/mgXqnq8HMDoCFnK13gfrkUeRJMJKag8zKv1qyKyv
         4X8wn5AGrywCNj//hOKDncHHxtSvPVotuqXZmeoRN6INj4uSzrM1RpDhNJQyIavJ3ZGm
         hzhMWFMY5aU8Hd44oL+UazpZ7qTHEqH4X5MJnlMOAaOxccUErDvdjQbZ6RE9sJmw32+D
         ymkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778517732; x=1779122532;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w5CvJDRNz9gD8edH36LDfD3QBbVxdVLhU6PUPP1w/U=;
        b=MFLFpYFdsfo/gEhHgtK/loNG/CKqhuLk8h5QykQaEW3MNBQgDcDk7FlcVcxOjsg8VG
         UwvEeGUv/fn7LzXvSwfgTwS02bNUIx6J0Znwkg+B6aKjaE1+VFg2fvbG/ZzHAkwdsdyi
         fzFPqO8kGedcuaHnd73fsE/eApzF27IjekwFRa78qV9v6WagTC4+efNT4WPyd0YCEvLL
         k6rlwWCcllcKyFUnyk7YK8q56B7ZdydXGioDOD3xS0AcD4KLngB2AbghMbR47M2475Rm
         QLnm3JNq0A4n5pYbQqjGxq5QTtDmO1oSgfuKNtnD1iFHuK+N6byFX6b6j45J2N56/cP/
         ab2Q==
X-Gm-Message-State: AOJu0Yxv0svWtyVL3ZxT/vwdtXiFleKxeUZVn7b7Tol+VFc12NVqVLja
	8uSSbkO+qCelmZoQsk4AvjlimQ7MyZdssRVXk6rZ/Hqr1QOKPS98nbwB
X-Gm-Gg: Acq92OFbcvrZjy7h/Q0M2T802kvEHstMxUEYeOA2+X2LrQ+43Abc/wm6Dc39HZEGCc6
	4+w/ZVILN1NnN8ajjvFRPhla58sc8bx1Y1PQ/eAWwseJPMutd55MxsB9WVZa6FLBaiVYtz5Ddl/
	xpH7DuimfmAjgOTts3HDaqX0/OWBRENA23pOtwQyUxh5z/Dy+EGK/6Ww5H1IHv+QSYBbQIPPrUA
	O29/eGw/yD3R2a1YjovLfMXOkTOgjQ/OgbspGdXYayX0STJ1IPCfV3xDR+N8966l3Ok1GN2VsSo
	pxLZwtEI21U3dNmpZr7PCKmnh5vcjqTERkK3uSGtntI8g3IgdxzKntv3WOHkmhPJcH08gqQueD3
	SflwzbnGVWd2+6IWP7Su7I8b/6EvZZbwDLzcJ4THnFKUzA3MeCUZfPQkfVCimObkk3cm+S8gnCX
	8dj39J7ytBwuvO6klatHLcG43Ui+nS5qiZTTuBFKhjtS4Ay+iWCLFge5xrAGqjquaBvF9zjMTCw
	w==
X-Received: by 2002:a05:7301:9f0a:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-2fb4d68f9dbmr5092185eec.17.1778517732046;
        Mon, 11 May 2026 09:42:12 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm14249595eec.25.2026.05.11.09.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:42:11 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 11 May 2026 13:42:02 -0300
Subject: [PATCH] ASoC: amd: acp-sdw-legacy: check CPU DAI name before
 logging
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-asoc-amd-acp-sdw-legacy-dai-name-null-v1-1-dc6151b6da8a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQ6CQAxA4auQrm0yMxElXsW4qNOCNcNAKPgTw
 t0ddflt3lvBZFIxOFUrTPJQ0yEX+F0F8Ua5E1QuhuDCwdWuQbIhIvWMFEc0fmKSjuIbmRQz9YJ
 5SQlpf6ybIK1n9lBa4yStvn6f8+VvW653ifM3Dtv2AYHNkEOJAAAA
X-Change-ID: 20260508-asoc-amd-acp-sdw-legacy-dai-name-null-a47582ef1dd1
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Z4Eg+1wZW+YhfJjhKCtqxBMh1iW5Hf3SO+g9BfSdFxM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlMbA9cVPVmbRV7c13vzoKaiQIKDZt+SvoLRvFXF16Me
 KHIaba5o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACbS6cHIcGuXz0u1KsO9bLNP
 /9l4/lu75tv/1qdbfnI+X3HryWSfCUsY/nAVXYnb1hZ69LfYKpNa7eed7++Giy13OC9zXHDekmM
 duZwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

devm_kasprintf() can fail and return NULL. The legacy AMD SoundWire
machine driver logs cpus->dai_name before checking the allocation result.

Move the debug print after the NULL check, matching the ordering used by
the SOF AMD SoundWire path after commit 5726b68473f7 ("ASoC: amd/sdw_utils:
avoid NULL deref when devm_kasprintf() fails").

Fixes: 2981d9b0789c ("ASoC: amd: acp: add soundwire machine driver for legacy stack")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 0f21e5f64531..09b475c83c49 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -260,9 +260,9 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
 							"SDW%d Pin%d",
 							link_num, cpu_pin_id);
-			dev_dbg(dev, "cpu->dai_name:%s\n", cpus->dai_name);
 			if (!cpus->dai_name)
 				return -ENOMEM;
+			dev_dbg(dev, "cpu->dai_name:%s\n", cpus->dai_name);
 
 			codec_maps[j].cpu = 0;
 			codec_maps[j].codec = j;

---
base-commit: 812fa09e67e198a7001e3b2c963be312c18fe3ad
change-id: 20260508-asoc-amd-acp-sdw-legacy-dai-name-null-a47582ef1dd1

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

