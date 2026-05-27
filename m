Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4A4218B5
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889329; cv=none; b=kcTSLvJu4MKtsjvr9prtP1OEO0AFELZI/633FegAGSx4ckVxDO134GrhpSQhb++L309913XE/kOk615B3zCWwkaG4BDyBOUzpkIEK8j5A6HXMkIm94rIOcs1m7yvYtAjNbo4iQ/PYZdxQ/1D61gsXYWnq5RObTF3lTnIxK39ffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889329; c=relaxed/simple;
	bh=2Q7+zlygQDiWGfxx9oKNM/G5wMI/KwIzH9dxAE1Eg+8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nvjfToe2lKqFeMW5C8HyTAKxFSch/sC4PGhzwTXPRH1QqXdbOgnp4x0pC6D6GiLmpCT+E8BPtApi82T0dUETaGLenb7F19LHRoYrJONL+B0zxwHLSCZ4aoTowkbABTBD6esblRi4M4KkG8Wl0Ea2NGhq14VKqiQkrSh+9sF8cNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIuJ110U; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIuJ110U"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso5086311eec.0
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889327; x=1780494127; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=;
        b=qIuJ110U0FgQ/UemqwDsvuky+Bi/ttQfZuEyvByVQrWHyOlay4P++QB/XDThNO0Ikf
         d02wGTRHx8qZO7zPB3oAGppp86ryOcJKVUbfCsZ9vfuxvTJnD4L4CZ2WVL1z7ElB+z0Z
         ZVspVNe5DdXTbOpXWtRrG29SpHB5pJ5j/ZBLSegfbv7MnzqViWjD90DCwnT1WXpOouV4
         Rj/5uG0xSy8kLbVgrEaPEa0TtBRAjbk9QK0bbxbwwI3Vt01MZjJEg9czvk5BVoHR7ITK
         jJGVCiDpRpO8fhjYasVAThrLzhX1j2np4sLODtWG3e+bixa5hlr9BJqA8E0+1w+F2E80
         /U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889327; x=1780494127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=;
        b=TAHynMspb4KpVPoJDK+zai4Xi1/0T+QJ0gWB9FQZ4NANKGXi99YrfsepijGQ0wbVd5
         hHjfK24DkqBGILhgma/307VzFFQZ6NTHL3V2jeSyXMq6a25p5ubKJ2X9iqqrmEtUDkD+
         lexLAMG0Don4OAdpSn5aOBpVxIvzXuQlWjfbw5dpJygciaGr+XgG0kzRrOuV21GsSBor
         J5ZaYQIb8XV+H9vjpJK+g08Bnx5U5O/Nl4XShXuVguef559u9NA3rLxrZ8knepq1aFf7
         QlzmyNHTAJfnF26uxTHWRHdjc5FfGM+GPe9kpksEYX4Ow4F4mD0LdVjukz2segyssqVG
         KWQw==
X-Gm-Message-State: AOJu0YyGU9IUKZeh4hahUvQwkE0n4lIY540tbCAfp20O8Drw/0GsPv7M
	iK7v4lUfW4pvZliLeRbcUlI14OUCgastUxbLMY9paOo96R+roE7CBEF+
X-Gm-Gg: Acq92OGKQwvJSNlIn0tySiUZE9z5PD1BkXwf9fbcsSU6tm32ahBhX5peCxWHcbos5zO
	fO73olwQ5UQ1NMtFIocZYex7yOLWhDEsZFLyYahdXr2b1GaJynhWCvkFpP/0lb1ZqEzG6GxtyII
	W+SrmNWkxYewhHydltBGRODhsqR04/Ol2FvFdVnzkyZRSlqQFRQR8QFdiLqGUM5FPfNsh3f2T9D
	e/ib+0Va0HFLkVhFfU8huqg5izMM1ckeIRVZpl2Zfi+YGSd+ASmFiEeSwA+WuIX7kBbyBV7C3+c
	w6LKVemDNyDWk65NKUNMukFkRriHrogN2sCgexDA0EMCrwBdttDuQZytIO3GBOHSyZQzH3FeEI6
	K9WyCUG8eCWLkn06AGpXy7Iep/P/vC/lesEvzwY2MSNQjJwe5E7u3Xwr324oUgkohKHXEdS5aLE
	711HFY9tWDidzqqhx7qz4k1ILcbkr4Ur+fP/VuDwF+qOo1d9305AqR7vUFR3I1Csbip7MhlNYfS
	Vs3yam54xAo
X-Received: by 2002:a05:7300:1489:b0:2dd:6937:79d1 with SMTP id 5a478bee46e88-304490c3717mr11002170eec.15.1779889326738;
        Wed, 27 May 2026 06:42:06 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:06 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: mt8183: Fix probe resource cleanup
Date: Wed, 27 May 2026 10:41:47 -0300
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTvQRKPBq0gX6XSiI5qETCtC6
 d2NunyL/1dQrsIK526Fyi9RyanB7DqgW0hXRpmawfb22DvrMGgmfM7e+D2WmkdGenBIS0GO0Xm
 y0+FkHLS+VI7y/r0vw9+6jHem+TuEbfsAiwD/V30AAAA=
X-Change-ID: 20260525-asoc-mt8183-probe-cleanup-eff58c2d4715
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=2Q7+zlygQDiWGfxx9oKNM/G5wMI/KwIzH9dxAE1Eg+8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1Zej3nUwndl6QHG3JC4CezSWbm7z/btUjCI//CyX
 HrFjumLO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi/7cyMqxtUwvPNtl567XI
 6ta1Anf9/LUY8tZdY1tqY/5/vYzfxxOMDL3B1oeixFaZbl5TmlPlpepdl3T8//N1M6P8cmQf/Hz
 CwQEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8183 AFE probe has two cleanup gaps that match issues
recently fixed in newer MediaTek AFE drivers.

First, reserved memory assigned with of_reserved_mem_device_init()
is never released on driver removal or later probe failures.

Second, the probe-time runtime PM resume used before reinitializing
the regmap cache is unchecked, and a regmap_reinit_cache() failure
skips the temporary PM put.

Fix both issues with a devm reserved-memory release action and
checked runtime PM resume handling.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ASoC: mediatek: mt8183: Release reserved memory on cleanup
      ASoC: mediatek: mt8183: Check runtime resume during probe

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 8cd773d4f8235aaf0b04927b3c9d2d0326def09b
change-id: 20260525-asoc-mt8183-probe-cleanup-eff58c2d4715

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

